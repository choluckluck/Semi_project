package hyerin.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Agreement extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("GET".equalsIgnoreCase(method)) {
			super.setViewPage("/WEB-INF/hyerin/member/agreement.jsp");
		}
		else {
			String agree1 = request.getParameter("agree_chx1");
			String agree2 = request.getParameter("agree_chx2");
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/member/agreement.jsp");
			
			
			// 이용약관 저장할 필요 없나...? 안 넘겨도 되나....?
		}
	
	}

}
