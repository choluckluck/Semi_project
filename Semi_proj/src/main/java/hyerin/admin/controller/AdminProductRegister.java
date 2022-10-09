package hyerin.admin.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.*;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import hyerin.product.model.*;

public class AdminProductRegister extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String method = request.getMethod();
		HttpSession session = request.getSession();
		
		//get방식이라면 => 상품종류 목록을 가져오기
		if("GET".equalsIgnoreCase(method)) {
			InterProductDAO pdao = new ProductDAO();
			//상품종류 목록을 가져오기
			List<String> prodKindList = pdao.selectProdKindList();
			
			String prodKind = String.join(",", prodKindList);
			request.setAttribute("prodKind", prodKind);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/admin/adminProductRegister.jsp");
		}
		
		//post방식이라면 => 폼전송
		else {
			
			MultipartRequest mtrequest = null;
			
			ServletContext svlCtx = session.getServletContext();
			
			
			try { //파일을 업로드해준다
				
				String uploadFileDir = svlCtx.getRealPath("/images/product");
				
				mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
				
			
			} catch(IOException e) {
				
			    request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
			    request.setAttribute("loc", request.getContextPath()+"/hyerin/admin/adminProductRegister.sue"); 
		  
			    super.setViewPage("/WEB-INF/msg.jsp");
			    return; // 종료
			    
			}
			
			// 폼의 내용을 받아서 insert해주기
			String prod_kind = mtrequest.getParameter("prod_kind");
			String prod_name = mtrequest.getParameter("prod_name");
			String prod_description = mtrequest.getParameter("prod_description");
			String prod_high = mtrequest.getParameter("prod_high");
			String prod_price = mtrequest.getParameter("prod_price");
			String prod_saleprice = mtrequest.getParameter("prod_saleprice");
			String md_pick_yn = mtrequest.getParameter("md_pick_yn_check"); // Y 또는 N
			String prod_point = mtrequest.getParameter("prod_point");
			
			//스크립트 공격 대응
			prod_description = prod_description.replaceAll("<", "&lt;"); 
			prod_description = prod_description.replaceAll(">", "&gt;");
			prod_description = prod_description.replaceAll("\r\n", "<br>");
			
			//이미지
			String prod_image = mtrequest.getOriginalFileName("prod_image");
			
			InterProductDAO pdao = new ProductDAO();
			//상품코드를 채번해오기
			String prod_code = pdao.getProdCode();
			
			
			ProductVO pvo = new ProductVO();
			pvo.setProd_code(prod_code);
			pvo.setProd_name(prod_name);
			pvo.setProd_kind(prod_kind);
			pvo.setProd_high(prod_high);
			pvo.setProd_description(prod_description);
			pvo.setProd_price(prod_price);
			pvo.setProd_saleprice(prod_saleprice);
			pvo.setMd_pick_yn(md_pick_yn);
			pvo.setProd_point(prod_point);
			pvo.setProd_image(prod_image);
			
			String message = "";
			String loc = "";
			
			try {
				// 1. tbl_product 테이블에 제품 insert하기
				int n = pdao.insertProduct(pvo);
				
				if(n == 1) { //제품테이블 insert를 성공하면
					
					// 2. 상품상세 이미지를 tbl_product_image에  insert 해주기
					String product_image_file = mtrequest.getOriginalFileName("product_image_file");
					int n2 = pdao.insertProductImage(prod_code, product_image_file);
					
					if(n2 == 1) { //상품상세이미지 insert를 성공하면
						// 3. 옵션 정보가 있을 때 tbl_prod_detail에 insert 해주기
						int attachCount = 0;
						
						String str_attachCount = mtrequest.getParameter("attachCount");
						
						if(!"".equals(str_attachCount)) {
							attachCount = Integer.parseInt(str_attachCount);
						}
						
						System.out.println(str_attachCount);
						System.out.println(attachCount);
						
						
						for(int i=0; i<attachCount; i++) {
							String prod_color = mtrequest.getParameter("prod_color"+i);
							String prod_size = mtrequest.getParameter("prod_size"+i);
							String prod_stock = mtrequest.getParameter("prod_stock"+i);
							
							ProductDetailVO pdvo = new ProductDetailVO();
							
							pdvo.setFk_prod_code(prod_code);
							pdvo.setProd_color(prod_color);
							pdvo.setProd_size(prod_size);
							pdvo.setProd_stock(prod_stock);
							
							int n3 = pdao.insertProductDetail(pdvo);
							
							if(n3 == 1) {
								message = "상품 등록 모두 성공!";
								loc = request.getContextPath()+"/hyerin/admin/adminProductList.sue";
							}
							else {
								message = "상품 디테일은 인서트 실패";
								loc = request.getContextPath()+"/hyerin/admin/adminProductList.sue";
							}
							
						}//end of for
						
					}
					else {
						message =  "상품상세 이미지 인서트 실패";
					    loc = request.getContextPath()+"/hyerin/admin/adminProductRegister.sue";
					}
				}
				else {
					message = "상품 insert 실패";
				    loc = request.getContextPath()+"/hyerin/admin/adminProductRegister.sue";
				}
				
				
			} catch(SQLException e) {
				
				request.setAttribute("message", "상품등록실패, sql오류");
			    request.setAttribute("loc", request.getContextPath()+"/hyerin/admin/adminProductRegister.sue"); 
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			
			
			
			
			
			
		}//end of else POST
		
	}
	
}
