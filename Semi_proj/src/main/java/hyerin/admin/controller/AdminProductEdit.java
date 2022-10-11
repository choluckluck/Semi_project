package hyerin.admin.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductDetailVO;
import hyerin.product.model.ProductVO;

public class AdminProductEdit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		//get방식일 경우 => 기존의 상품 정보를 불러옴
		if("get".equalsIgnoreCase(method)) {
			InterProductDAO pdao = new ProductDAO();
			String prod_code = request.getParameter("prod_code");
			String currPageNo = request.getParameter("currPageNo");
			if(currPageNo == null || currPageNo == "") {currPageNo = "1";}
			
			//상품종류 리스트를 조회하기
			List<String> prodKindList = pdao.selectProdKindList();
			
			String prodKind = String.join(",", prodKindList);
			request.setAttribute("prodKind", prodKind);
			
			
			//해당 prod_code의 상품정보를 보여주기(select) 
			ProductVO pvo = pdao.getOneEditProduct(prod_code);
			
			//해당 prod_code의 상품상세정보를 보여주기 (select)
			List<ProductDetailVO> pdvo = pdao.getOneProductDetail(prod_code);
			
			
			int pdvosize = pdvo.size();
			
			request.setAttribute("currPageNo", currPageNo);
			request.setAttribute("pvo", pvo);
			request.setAttribute("pdvo", pdvo);
			request.setAttribute("pdvosize", pdvosize);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/admin/adminProductEdit.jsp");
			
		}
		//post 방식일 경우 => 수정사항을 update
		else {
			HttpSession session = request.getSession();
			MultipartRequest mtrequest = null;
			
			ServletContext svlCtx = session.getServletContext();
			
			
			try { //파일을 업로드해준다
				
				String uploadFileDir = svlCtx.getRealPath("/images/product");
				
				mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
				
			
			} catch(IOException e) {
				
			    request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
			    request.setAttribute("loc", request.getContextPath()+"/hyerin/admin/adminProduct.sue"); 
		  
			    super.setViewPage("/WEB-INF/hyerin/admin/adminMsg.jsp");
			    return; // 종료
			    
			}
			String currPageNo = mtrequest.getParameter("currPageNo"); //보고있던 페이지로 돌아가기 위함
			InterProductDAO pdao = new ProductDAO();
			
			String prod_code = mtrequest.getParameter("prod_code");
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

			//이미지 => null이 아닐 경우에만 업데이트 해줌
			String prod_image = mtrequest.getOriginalFileName("prod_image"); //없으면 null
			
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
			try {
				// 1. 폼의 내용을 받아서 update해주기
				int n = pdao.updateProduct(pvo);
				
				if(n == 1) { //제품테이블 insert를 성공하면
					
					// 2. 상품상세이미지가 null이 아닐 경우에만 update 해줌
					String product_image_file = mtrequest.getOriginalFileName("product_image_file");
					if(product_image_file != null) {
						int n2 = pdao.updateProductImage(prod_code, product_image_file);
						if(n2 == 1) {
							message = "상세 이미지가 등록되었습니다.";
						}
						else {
							message =  "상세 이미지를 등록하는데 실패하였습니다.";
						}
						
					}
					
					// 3. 옵션이 있다면 기존에 있던 옵션을 지우고, 옵션개수만큼 insert해주기
					int optionCnt = 0;
					
					String str_optionCnt = mtrequest.getParameter("optionCnt");
					
					if(!"".equals(str_optionCnt)) {
						optionCnt = Integer.parseInt(str_optionCnt);
					}
					
					// 기존에 있던 옵션 모두 지워주기
					int n3 = pdao.deleteProductDetailAll(prod_code);
					
					if(optionCnt != 0) {
						for(int i=0; i<optionCnt; i++) {
							String prod_color = mtrequest.getParameter("prod_color"+i);
							String prod_size = mtrequest.getParameter("prod_size"+i);
							String prod_stock = mtrequest.getParameter("prod_stock"+i);
							
							ProductDetailVO pdvo = new ProductDetailVO();
							
							pdvo.setFk_prod_code(prod_code);
							pdvo.setProd_color(prod_color);
							pdvo.setProd_size(prod_size);
							pdvo.setProd_stock(prod_stock);
							
							int n4 = pdao.insertProductDetail(pdvo);
							
							if(n4 == 1) {
								message = "상품 정보가 수정되었습니다.";
							}
							else {
								message = "상품 색상, 사이즈, 재고량을 수정하는데 실패하였습니다.";
							}
							
						}//end of for
					}
					else {
						message = "상품의 색상, 사이즈, 재고에 대한 정보를 모두 삭제하였습니다.";
					}
						
				}
				else {
					message = "상품 정보를 수정하는 데 실패하였습니다.";
				}
				
				
			} catch(SQLException e) {
				
				request.setAttribute("message", "상품등록실패, sql오류");
			    request.setAttribute("loc", request.getContextPath()+"/hyerin/admin/adminProductRegister.sue"); 
			}
			
			request.setAttribute("message", message);
			request.setAttribute("loc", "javascript:window.close()");
			super.setViewPage("/WEB-INF/hyerin/admin/adminMsg.jsp");
			
			
			
			
		}//end of else(POST)
		
		
		
		
		
		
	}

}
