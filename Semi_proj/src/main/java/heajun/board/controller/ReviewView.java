package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.board.model.InterReviewDAO_HJ;
import heajun.board.model.ReviewDAO_HJ;
import heajun.board.model.ReviewVO_HJ;
import heajun.member.model.MemberVO;

public class ReviewView extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String fk_userid = "";
		   
		   try {
			   HttpSession session = request.getSession();
			   MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			   fk_userid = loginuser.getUserid();
		   }catch(NullPointerException e) {
			   fk_userid = "no";
		   }
		   
		   String method = request.getMethod();
			
			if("GET".equalsIgnoreCase(method)) {
				
				String review_code = request.getParameter("review_code");
				request.setAttribute("review_code", review_code);

				
				 InterReviewDAO_HJ rdao = new ReviewDAO_HJ();
				 
				 ReviewVO_HJ rvo = rdao.reviewOneDetail(review_code);
				 				 

			        request.setAttribute("rvo", rvo);
					request.setAttribute("fk_userid", fk_userid);
					
				
				
				// *** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 *** // 
				String goBackURL = request.getParameter("goBackURL");
			
				request.setAttribute("goBackURL", goBackURL);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/heajun/board/reviewView.jsp");

			
			} else {
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			}
		
			//super.setRedirect(false);
			super.setViewPage("/WEB-INF/heajun/board/reviewView.jsp");
	}

}
