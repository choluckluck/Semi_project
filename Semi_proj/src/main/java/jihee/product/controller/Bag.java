package jihee.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.community.model.NoticeVO;
import heajun.member.model.MemberVO;
import heajun.product.model.CartVO_HJ;
import heajun.product.model.InterProductDetailDAO;
import heajun.product.model.ProductDetailDAO;

public class Bag extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		boolean isLogin = super.checkLogin(request);
			
			if(!isLogin) { // 로그인을 하지 않은 상태이라면 
				
				
				request.setAttribute("message", "주문하려면 먼저 로그인 부터 하세요!!"); 
				request.setAttribute("loc", "javascript:history.back()");
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return;
			}
			
			else { // 로그인을 한 상태이라면
				   // 장바구니 테이블(tbl_cart)에 해당 제품을 담아야 한다.
				   // 장바구니 테이블에 해당 제품이 존재하지 않는 경우에는 tbl_cart 테이블에 insert 를 해야하고, 
				   // 장바구니 테이블에 해당 제품이 존재하는 경우에는 또 그 제품을 추가해서 장바구니 담기를 한다라면 tbl_cart 테이블에 update 를 해야한다. 
				
				   String method = request.getMethod();
				    
				   if("POST".equals(method)) {
					   // POST 방식이라면 
					   String prod_code = request.getParameter("prod_code");
					   String prod_color = request.getParameter("prod_color");
						String prod_size = request.getParameter("prod_size");
						String qnty= request.getParameter("qnty");
					   
						   
						   HttpSession session = request.getSession();
						   MemberVO loginuser = (MemberVO) session.getAttribute("loginuser"); 
						   
					   
					   InterProductDetailDAO cdao = new ProductDetailDAO();
					   
					  
					   int n =  cdao.addCart(loginuser.getUserid(), prod_code , prod_color,  prod_size,  qnty); 
						
						  if(n==1) { request.setAttribute("message", "주문하러 가기 성공!!");
						  request.setAttribute("loc", "bag.sue"); // 장바구니 목록보여주기 페이지 이동 } else {
						  request.setAttribute("message", "주문하러 가기 실패!!"); request.setAttribute("loc",
						  "javascript:history.back()"); }
						 
					   
					// super.setRedirect(false);
					   super.setViewPage("/WEB-INF/msg.jsp");
				   }
				   
				   else {
					   // GET 방식이라면
					   String message = "비정상적인 경로로 들어왔습니다";
					   String loc = "javascript:history.back()";
						
					   request.setAttribute("message", message);
					   request.setAttribute("loc", loc);
						
					// super.setRedirect(false);
					   super.setViewPage("/WEB-INF/msg.jsp");
				   }
				
			
	 }

  }

}