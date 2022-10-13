package hyerin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class PwdUpdateEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = request.getParameter("userid");
		
		request.setAttribute("userid", userid);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/login/pwdUpdateEnd.jsp");
	}

}
