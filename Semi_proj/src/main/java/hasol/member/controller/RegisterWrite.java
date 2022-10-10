package hasol.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;


public class RegisterWrite extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	

		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/member/registerWrite.jsp");
	}

}
