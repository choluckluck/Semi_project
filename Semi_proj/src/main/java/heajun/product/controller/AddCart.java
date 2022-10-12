package heajun.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.product.model.InterProductDAO;
import heajun.product.model.ProductDAO;
import seongmin.login.model.MemberVO;

public class AddCart extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// == 로그인 유무 검사하기 == //
		boolean isLogin = super.checkLogin(request);
		
		if(!isLogin) {
			
			/*
		        사용자가 로그인을 하지 않은 상태에서 특정제품을 장바구니에 담고자 하는 경우 
		        사용자가 로그인을 하면 장바구니에 담고자 했던 그 특정제품 페이지로 이동하도록 해야 한다.
		        이와 같이 하려고 ProdViewAction 클래스에서 super.goBackURL(request); 을 해두었음.   
		     */
			
			
			String loc = request.getContextPath()+"/hyerin/login/login.sue";
			request.setAttribute("message", "장바구니에 상품을 담으려면 먼저 로그인부터 하세요!");
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return; //종료
		}
		else {
			// 장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
	        // 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
	        // 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다.
			
			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)) {
				
				String prod_code = request.getParameter("prod_code");
				String qnty = request.getParameter("qnty");
				String prod_color = request.getParameter("prod_color");
				String prod_size = request.getParameter("prod_size");
				
				HttpSession session = request.getSession();				
				MemberVO loginuser =  (MemberVO) session.getAttribute("loginuser");
				
				InterProductDAO pdao = new ProductDAO();
				
				int n = pdao.addCart(loginuser.getUserid(), prod_code, qnty, prod_color, prod_size);
				
				
				if(n==1) {
					String loc = request.getContextPath()+"/seongmin/member/goCart.sue";
					request.setAttribute("message", "장바구니 담기 성공!");
					request.setAttribute("loc", loc); //상대경로 (마지막만 바뀜) => 장바구니 보여주기 페이지로 이동
				}
				else {
					request.setAttribute("message", "장바구니 담기 실패!");
					request.setAttribute("loc", "javascript:history.back()"); //상대경로 (마지막만 바뀜) => 이전페이지로 이동
				}
				
				super.setViewPage("/WEB-INF/msg.jsp");
				
			}
			else { //GET 방식이라면 
				String message = "비정상적인 경로로 접근하셨습니다.";
				String loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				    
				 //   super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
	}

}
