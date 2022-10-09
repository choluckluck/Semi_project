package heajun.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.community.model.InterNoticeDAO;
import heajun.community.model.NoticeDAO;
import heajun.member.model.MemberVO;

public class NoticeWrite extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterNoticeDAO ndao = new NoticeDAO();
		
		String fk_userid = request.getParameter("fk_userid");
		String notice_subject = request.getParameter("notice_subject");
		String notice_contents = request.getParameter("notice_contents");
		if(fk_userid != null && notice_subject != null && notice_contents != null) {
			ndao.register(fk_userid,notice_subject,notice_contents);
		
		}
	    
		   String userid = "admin";
		   String method = request.getMethod();
		
		  // 관리자 로그인 시에만 글 작성이 가능 하도록 한다 //
	      HttpSession session = request.getSession();
	      
	      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");

	      // 관리자로 로그인 되었을 때
	      if( loginuser != null && "admin".equals(loginuser.getUserid())) {
	    	  
	    	  request.setAttribute("userid", userid);
	    	  super.setViewPage("/WEB-INF/heajun/community/noticeWrite.jsp");				
	      }

	      else {
	         String message = "관리자만 접근이 가능합니다.";            
	         String loc = "javascript:history.back()";            
	           
	         request.setAttribute("message", message);           
	         request.setAttribute("loc", loc);
	                
	      
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/community/noticeWrite.jsp");
	   }

	}
}
