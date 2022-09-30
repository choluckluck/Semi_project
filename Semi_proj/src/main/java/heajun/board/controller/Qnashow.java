package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.board.model.InterQnaDAO;
import heajun.board.model.QnaDAO;
import heajun.board.model.QnaVO;
import heajun.member.model.MemberVO;

public class Qnashow extends AbstractController {

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
				
				String qna_code = request.getParameter("qna_code");
				
				// 해당글의 내용을 select 해와야 하는데 조건절은 where = ?
				// 위치홀더에 qna_code 넣기
				
				InterQnaDAO qdao = new QnaDAO();
				QnaVO qvo = qdao.qnaOneDetail(qna_code);
				
				request.setAttribute("qvo", qvo);
				request.setAttribute("qna_code", qna_code);
				request.setAttribute("userid", userid);
			// *** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 *** // 
				String goBackURL = request.getParameter("goBackURL");
			
				request.setAttribute("goBackURL", goBackURL);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/board/qnaShow.jsp");

			
			} else {
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");	
		}
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/qnashow.jsp");
	}

}
