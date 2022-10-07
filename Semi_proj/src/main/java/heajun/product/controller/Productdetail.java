package heajun.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.product.model.InterProductDetailDAO;
import heajun.product.model.ProductDetailDAO;
import heajun.product.model.ProductDetailVO;
import heajun.product.model.ProductVO_HJ;

public class Productdetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		     
				//super.goBackURL(request);
				
				
				
				String prod_code = request.getParameter("prod_code"); // 상품번호
				request.setAttribute("prod_code", prod_code); 
				
				String prod_detail_code = request.getParameter("prod_detail_code"); // 상품번호
				request.setAttribute("prod_detail_code", prod_detail_code); 
				
				
				InterProductDetailDAO pdao = new ProductDetailDAO();
				
				
				try {
				      // 제품번호를 가지고서 해당 제품의 정보를 조회해오기
				       ProductVO_HJ pvo = pdao.selectProduct(prod_code);// 상품정보 가져오기
				       
				       List<ProductDetailVO> option = pdao.selectProductOption(prod_detail_code); // 옵션 선택을 위한 해당 상품의 옵션 정보가져오기 
				     
				
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
					request.setAttribute("pvo", pvo);  // 제품의 정보
					request.setAttribute("option",option); // 옵션가져오기
					 
					//super.setRedirect(false);
					super.setViewPage("/WEB-INF/heajun/product/productdetail.jsp");
				  
				}
				
				
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("exception 오류남");
			
				
				}
				
				
	}

}
