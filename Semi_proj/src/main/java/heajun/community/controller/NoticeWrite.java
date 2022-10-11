package heajun.community.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.community.model.InterNoticeDAO;
import heajun.community.model.NoticeDAO;
import heajun.community.model.NoticeVO;
import heajun.member.model.MemberVO;


public class NoticeWrite extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

	    
		 InterNoticeDAO ndao = new NoticeDAO();
		 
		    NoticeVO nvo = new NoticeVO();
		   
	  
	      String userid = "admin";
		  // 관리자 로그인 시에만 글 작성이 가능 하도록 한다 //
	      HttpSession session = request.getSession();
	      MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
	   
		 
		  
	      // 관리자로 로그인 되었을 때
	      if( loginuser != null && "admin".equals(loginuser.getUserid())) {
	    	     
	    	  ndao.noticeWrite(nvo);
	    	   
			  
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
