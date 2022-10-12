package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.board.model.InterReviewDAO_HJ;
import heajun.board.model.ReviewDAO_HJ;
import heajun.member.model.MemberVO;

public class Review_write extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		InterReviewDAO_HJ rdao = new ReviewDAO_HJ();
		
		String fk_userid = request.getParameter("fk_userid");
		String review_subject = request.getParameter("review_subject");
		String review_contents = request.getParameter("review_contents");
		if(fk_userid != null && review_subject != null && review_contents != null) {
			rdao.write(fk_userid,review_subject,review_contents);
		
		}
		
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
				super.setViewPage("/WEB-INF/board/review_write.jsp");	
			
			} else {
		         String message = "로그인 이후 가능합니다.";            
		         String loc = "javascript:history.back()";            
		           
		         request.setAttribute("message", message);           
		         request.setAttribute("loc", loc);
		super.setViewPage("/WEB-INF/heajun/board/review_write.jsp");
		
	   }

	}
}
