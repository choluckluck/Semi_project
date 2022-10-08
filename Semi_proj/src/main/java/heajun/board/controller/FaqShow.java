package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.board.model.FaqDAO;
import heajun.board.model.FaqVO;
import heajun.board.model.InterFaqDAO;
import heajun.member.model.MemberVO;

public class FaqShow extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String userid = "";
		   
		   try {
			   HttpSession session = request.getSession();
			   MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			   userid = loginuser.getUserid();
		   }catch(NullPointerException e) {
			   userid = "no";
		   }
			
			
			   String method = request.getMethod();
			
				if("GET".equalsIgnoreCase(method)) {
					
					String faq_code = request.getParameter("faq_code");
					
					// 해당글의 내용을 select 해와야 하는데 조건절은 where = ?
					// 위치홀더에 faq_code 넣기
					
					InterFaqDAO fdao = new FaqDAO();
					FaqVO fvo = fdao.faqOneDetail(faq_code);
					
					
					request.setAttribute("fvo", fvo);
					request.setAttribute("faq_code", faq_code);
					request.setAttribute("userid", userid);
					
					
				// *** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 *** // 
					String goBackURL = request.getParameter("goBackURL");
				
					request.setAttribute("goBackURL", goBackURL);
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/heajun/board/faqShow.jsp");

				
				} else {
				// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
				String message = "관리자만 접근이 가능합니다.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/faqShow.jsp");
	  }
	}
}
