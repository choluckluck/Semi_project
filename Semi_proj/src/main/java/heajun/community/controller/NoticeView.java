package heajun.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.community.model.InterNoticeDAO;
import heajun.community.model.NoticeDAO;
import heajun.community.model.NoticeVO;
import heajun.member.model.MemberVO;

public class NoticeView extends AbstractController {

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
				
				String notice_code = request.getParameter("notice_code");
				
				InterNoticeDAO ndao = new NoticeDAO();
				
				NoticeVO nvo = ndao.noticeOneDetail(notice_code);
				ndao.noticeCnt(notice_code);
				
				request.setAttribute("nvo", nvo);
				request.setAttribute("notice_code", notice_code);
				request.setAttribute("userid", userid);
				
			// *** 현재 페이지를 돌아갈 페이지(goBackURL)로 주소 지정하기 *** // 
				String goBackURL = request.getParameter("goBackURL");
			
				request.setAttribute("goBackURL", goBackURL);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/heajun/community/noticeView.jsp");

			
			} else {
			// 로그인을 안한 경우 또는 일반사용자로 로그인 한 경우 
			String message = "관리자만 접근이 가능합니다.";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			//super.setRedirect(false);
			super.setViewPage("/WEB-INF/heajun/community/noticeView.jsp");
		}
		
	}
		   
		

}
