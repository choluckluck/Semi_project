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
		   


		   
		   List<cartVO> cartList = new ArrayList<>();
		   //장바구니 목록 알아오기
		   cartList = pdao.selectCartList(paraMap);		   

		   request.setAttribute("cartList", cartList);
		   
		 //로그인한 사용자의 장바구니에 담긴 주문총액합계 및 총포인트합계 알아오기
			Map<String, String> sumMap = pdao.selectCartSumPrice(loginuser.getUserid());
			
			request.setAttribute("sumMap", sumMap);
			
			
			
			
			int totalSumPrice = Integer.parseInt(sumMap.get("SUMTOTALPRICE") );
			
			int deliveryfee = 0;
			//System.out.println("totalSumprice:" + totalSumPrice);
			

			if (totalSumPrice <= 70000) {
				
				totalSumPrice = totalSumPrice + 2500;
				deliveryfee = 2500;
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
