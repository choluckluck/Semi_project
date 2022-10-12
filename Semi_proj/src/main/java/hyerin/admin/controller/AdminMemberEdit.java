package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;
import hyerin.member.model.MemberVO;

public class AdminMemberEdit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(!super.checkLogin(request)) { //로그인되지 않은 상태라면
			
			String message = "로그인 해주세요.";
	        String loc = request.getContextPath() + "/hyerin/login/login.sue";
	        
	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	        
	     //   super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");
	        
		}
		else {
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			if(!"admin".equals(loginuser.getUserid()) ) {
				 // == 관리자(admin)가 아닌 일반사용자로 로그인했을 때는 조회가 불가능하도록 한다.
				String message = "관리자 이외는 접근이 불가능합니다.";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	         //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
			}
			else {
				String userid = request.getParameter("userid");
				
				InterMemberDAO mdao = new MemberDAO();
				
				//회원정보를 조회하기
				MemberVO mvo = mdao.selectEditUserInfo(userid);
				
				
				request.setAttribute("mvo", mvo);
				
				
				super.setViewPage("/WEB-INF/hyerin/admin/adminMemberEdit.jsp");
			}
		}
	}

}
