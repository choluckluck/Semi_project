package hasol.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminQnaAnswerEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			
			super.setViewPage("/WEB-INF/hyerin/admin/adminProductReview.jsp");
		}
		
		else {
			
			/*		
			// == 로그인하지 않았다면 조회가 불가능 ==
			if(!super.checkLogin(request)){
				
				String message = "로그인을 하세요.";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	         //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/error/msg.jsp");
	            
			}
			
			// == 로그인 한 상태 ==
			else {
				
				HttpSession session = request.getSession();
				J_MemberVO loginuser = (J_MemberVO)session.getAttribute("loginuser");
			
				if(!"admin".equals(loginuser.getUserid())) { // 관리자가 아닌 일반 사용자가 로그인한 경우
					
					String message = "관리자 이외에는 접근이 불가능합니다.";
		            String loc = "javascript:history.back()";
		            
		            request.setAttribute("message", message);
		            request.setAttribute("loc", loc);
		            
		         //   super.setRedirect(false);
		            super.setViewPage("/WEB-INF/error/msg.jsp");
					
				}
				else { // 관리자로 로그인한 경우
			
			}
			*/
			
			
			
			// 관리자로 로그인한 경우에 들어가야함.
			String subject = request.getParameter("subject");
			String contents = request.getParameter("contents");
			
			J_QnaVO qvo = 
			super.setViewPage("/WEB-INF/hyerin/admin/adminQna.jsp");
			
		}
		
	}

}
