package jihee.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jihee.product.model.*;
import seongmin.login.model.MemberVO;


public class Bag extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");		
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);
		

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
	

		 
		   InterProductDAO pdao = new ProductDAO();
		   

			String productType_1 = "pumps";
			paraMap.put("productType_1", productType_1);
			
			String productType_2 = "ankle";
			paraMap.put("productType_2", productType_2);
			
			String productType_3 = "mule";
			paraMap.put("productType_3", productType_3);
			
			
			String productHigh_1 ="3.5";
			
			paraMap.put("productHigh_1", productHigh_1);
			
			String productHigh_2 ="7";
			
			paraMap.put("productHigh_2", productHigh_2);
			
			String productHigh_3 ="4";
			
			paraMap.put("productHigh_3", productHigh_3);
			
			String productBest = "Best";
			paraMap.put("Best", productBest);

		   
		   List<cartVO> cartList = new ArrayList<>();
		   //장바구니 목록 알아오기
		   cartList = pdao.selectCartList(paraMap);		   

		   request.setAttribute("cartList", cartList);
		   
		 //로그인한 사용자의 장바구니에 담긴 주문총액합계 및 총포인트합계 알아오기
			Map<String, String> sumMap = pdao.selectCartSumPrice(loginuser.getUserid());
			
			request.setAttribute("sumMap", sumMap);
			
			//캐러셀이미지 불러오기
			
			List<ProductVO> bestProductList = pdao.selectBestProduct(paraMap);

			request.setAttribute("bestProductList", bestProductList);
			
			
			
			int totalSumPrice = Integer.parseInt(sumMap.get("SUMTOTALPRICE") );
			
			int deliveryfee = 0;
			//System.out.println("totalSumprice:" + totalSumPrice);
			

			if (totalSumPrice <= 70000 && !(cartList.isEmpty()) ) {
				
				totalSumPrice = totalSumPrice + 2500;
				deliveryfee = 2500;
			}
			
			if (totalSumPrice <= 70000 && cartList.isEmpty()) {
				totalSumPrice = totalSumPrice + 0;
				deliveryfee = 0;
				System.out.println("cartList:"  + cartList);
				
			}
			
			//System.out.println("totalSumPrice :" + totalSumPrice);
			
			
			request.setAttribute("totalSumPrice", totalSumPrice);
			request.setAttribute("deliveryfee", deliveryfee);
			

			String method = request.getMethod(); //"GET" 또는 "POST"
			
			if("POST".equalsIgnoreCase(method) ) {
				
				String cart_code = request.getParameter("cart_code");
				String quantity = request.getParameter("quantity");

				
			}
		   
			else {
				
				// POST방식이 아니라면 
	            String message = "비정상적인 경로로 접근했습니다.!!";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	         // super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
			}
		   
		 
			
			
			
	
		
		
		//super.setRedirect(false);
	    super.setViewPage("/WEB-INF/jihee/bag/bag.jsp");

	}

}
