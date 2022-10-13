package heajun.community.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jihee.product.model.*;
import seongmin.login.model.MemberVO;

public class NoticeUpdate extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	String method = request.getMethod();
	
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");		
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);


		if(userid.equals("admin") && method.equalsIgnoreCase("post")) {
			
			String subject = request.getParameter("subject");
			String board_content = request.getParameter("board_content");
			
			System.out.println("subject:" +subject);
			
			InterProductDAO pdao = new ProductDAO(); //지희 dao import 했음
			
			int n = pdao.updateNotice(subject, board_content,userid); 
			
			if (n==1) {
				
				String message = "글 작성이 완료 되었습니다.";
				String loc = request.getContextPath()+"/heajun/community/notice.sue";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				//super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			
			}		
			
			else {
				request.setAttribute("message", "글 작성을 실패했습니다.");
				request.setAttribute("loc", "javascript:history.back()");
			}
			
			
		}
		
		else {
			 // GET 방식이라면
			   String message = "비정상적인 경로로 들어왔습니다";
			   String loc = "javascript:history.back()";
				
			   request.setAttribute("message", message);
			   request.setAttribute("loc", loc);
				
			// super.setRedirect(false);
			   super.setViewPage("/WEB-INF/msg.jsp");
			
			
		}

	}

}
