package hasol.purchase.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.purchase.model.J_MemberVO;

public class PurchaseEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 아임포트 결제창을 사용하기 위한 전제조건은 먼저 로그인을 해야한다
		
				if(super.checkLogin(request)) { // 로그인을 한 경우
					String userid = request.getParameter("userid");
					
					HttpSession session = request.getSession();
					
					J_MemberVO loginuser = (J_MemberVO)session.getAttribute("loginuser");
					
					if( loginuser.getUserid().equals(userid) ) { 
						
						String productName = "결제테스트(코인충전|주문명) 코인충전";
						// String productName = request.getParameter("product");
						String ordermoney = request.getParameter("ordermoney");
						
						request.setAttribute("userid", userid);
						request.setAttribute("productName", productName);
						request.setAttribute("ordermoney", ordermoney);
						request.setAttribute("email", loginuser.getEmail() );
						request.setAttribute("name", loginuser.getName() );
						request.setAttribute("mobile", loginuser.getMobile());
						
						
						// super.setRedirect(false);
						super.setViewPage("/WEB-INF/hasol/purchase/paymentGateway.jsp");
						
						
					}
					else { // 로그인한 사용자가 다른 사용자의 코인을 충전하려고 시도하는 경우 
						
			            String message = "다른 사용자의 결제 시도는 불가합니다.!!";
			            String loc = "javascript:history.back()";
			            
			            request.setAttribute("message", message);
			            request.setAttribute("loc", loc);
			            
			         //   super.setRedirect(false);
			            super.setViewPage("/WEB-INF/error/msg.jsp");
			            return;
					}
					
					
				}
				else { // 로그인을 안한 경우
					String message = "결제를 하기 위해서는 먼저 로그인을 하세요!!";
					String loc = "javascript:history.back()";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					// super.setRedirect(false);
					super.setViewPage("/WEB-INF/error/msg.jsp");
				}

	}

}
