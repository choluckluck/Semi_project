package hasol.purchase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.member.model.J_MemberVO;



public class PurchaseEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String prod_name = request.getParameter("prod_name");
		String userid = request.getParameter("userid");
		String real_amount = request.getParameter("real_amount");
		
		request.setAttribute("userid", userid);
		request.setAttribute("prod_name", prod_name);
		request.setAttribute("real_amount", real_amount);
		request.setAttribute("email", "hyerin25@gmail.com" );
		request.setAttribute("name", "찐혜린" );
		request.setAttribute("mobile", "01088284730");
//		request.setAttribute("email", loginuser.getEmail() );
//		request.setAttribute("name", loginuser.getName() );
//		request.setAttribute("mobile", loginuser.getMobile());
		
		super.setViewPage("/WEB-INF/hasol/purchase/paymentGateway.jsp");
		
		
		
//		// 아임포트 결제창을 사용하기 위한 전제조건은 먼저 로그인을 해야한다
//		if(super.checkLogin(request)) { // 로그인을 한 경우
//			String userid = request.getParameter("userid");
//			
//			HttpSession session = request.getSession();
//			
//			J_MemberVO loginuser = (J_MemberVO)session.getAttribute("loginuser");
//			
//			if( loginuser.getUserid().equals(userid) ) { 
//				
//				
//				
//				
//			}
//			else { // 로그인한 사용자가 다른 사용자의 코인을 충전하려고 시도하는 경우 
//				
//	            String message = "다른 사용자의 결제 시도는 불가합니다.!!";
//	            String loc = "javascript:history.back()";
//	            
//	            request.setAttribute("message", message);
//	            request.setAttribute("loc", loc);
//	            
//	         //   super.setRedirect(false);
//	            super.setViewPage("/WEB-INF/error/msg.jsp");
//	            return;
//			}
//			
//			
//		}
//		else { // 로그인을 안한 경우
//			String message = "결제를 하기 위해서는 먼저 로그인을 하세요!!";
//			String loc = "javascript:history.back()";
//			
//			request.setAttribute("message", message);
//			request.setAttribute("loc", loc);
//			
//			// super.setRedirect(false);
//			super.setViewPage("/WEB-INF/error/msg.jsp");
//		}

	}

}
