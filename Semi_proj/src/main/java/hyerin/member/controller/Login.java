package hyerin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;
import hyerin.member.model.MemberVO;

public class Login extends AbstractController {



	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

			super.setViewPage("/WEB-INF/hyerin/login/login.jsp");
			
	}
}

