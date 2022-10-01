package seongmin.mypage.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;

public class mypage_Main extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  HttpSession session = request.getSession(); 

		  
		 MemberVO member  = (MemberVO) session.getAttribute("loginuser");
		  
		
		super.setViewPage("/WEB-INF/seongmin/mypage_Main.jsp");
		
	}

}
