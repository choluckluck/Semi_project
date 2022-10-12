package heajun.product.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.product.model.InterProductDetailDAO;
import heajun.product.model.ProductDetailDAO;
import heajun.product.model.ProductVO_HJ;
import heajun.product.model.Product_imageVO;

public class Productdetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			     
		super.goBackURL(request);
		
		String method = request.getContextPath();
		
			
			String prod_code = request.getParameter("prod_code"); // 상품번호
			
			
			
			
			InterProductDetailDAO pdao = new ProductDetailDAO();
			
			
						
						try {
							// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
							ProductVO_HJ pvo = pdao.selectProduct(prod_code);// 상품정보 가져오기
						
							ProductVO_HJ pvo2 = pdao.selectProductOption(prod_code);   
							
							Product_imageVO ivo = pdao.selectImage(prod_code);
							
							if(pvo == null) {
								// GET 방식이므로 사용자가 웹브라우저 주소창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
								String message = "검색하신 제품은 존재하지 않습니다.";
								String loc = "javascript:history.back()";
								
								request.setAttribute("message", message);
								request.setAttribute("loc", loc);
								
								//	super.setRedirect(false);
								super.setViewPage("/WEB-INF/msg.jsp");
								
							return;
								
							}
							else {
								// 제품이 있는 경우 
								//request.setAttribute("prod_code", prod_code);
								request.setAttribute("pvo", pvo);  // 제품의 정보
								request.setAttribute("pvo2",pvo2); // 옵션가져오기
								request.setAttribute("ivo", ivo);//이미지 가져오기
								//super.setRedirect(false);
								super.setViewPage("/WEB-INF/heajun/product/productdetail.jsp");
							
							}
							
							
						}catch(Exception e) {
							e.printStackTrace();
							System.out.println("exception 오류남");
							
						}
						
		
				
		     super.setViewPage("/WEB-INF/heajun/product/productdetail.jsp");
				
	}

}
