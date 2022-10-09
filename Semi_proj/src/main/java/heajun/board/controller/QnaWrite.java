package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.member.model.MemberVO;

public class QnaWrite extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		   String userid = "";
		   String method = request.getMethod();
		   
		   try {
			   HttpSession session = request.getSession();
			   MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			   userid = loginuser.getUserid();
		   }catch(NullPointerException e) {
			   userid = "no";
		   }
	       
	       
		   if("GET".equalsIgnoreCase(method) && userid != "no") {
			
				request.setAttribute("userid", userid);
				super.setViewPage("/WEB-INF/heajun/board/qnaWrite.jsp");	
			
			} else {
		         String message = "로그인 이후 가능합니다.";            
		         String loc = "javascript:history.back()";            
		           
		         request.setAttribute("message", message);           
		         request.setAttribute("loc", loc);
		                
		
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/qnaWrite.jsp");
     	}
	}

}
