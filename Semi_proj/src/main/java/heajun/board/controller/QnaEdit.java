package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class QnaEdit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
	 	
        if("POST".equalsIgnoreCase(method)) {
         // 기존의 글정보를 먼저 찍어주기위해서 다음과 같이 VO에 넣어준다.
        
    	 String qna_code = request.getParameter("qna_code");
         String fk_userid = request.getParameter("fk_userid");
         String category = request.getParameter("category");
         String subject = request.getParameter("subject");
         String contents = request.getParameter("contents");
         String registerday = request.getParameter("registerday");
         

         request.setAttribute("qna_code",qna_code); 
         request.setAttribute("fk_userid",fk_userid); 
         request.setAttribute("category",category); 
         request.setAttribute("subject",subject); 
         request.setAttribute("contents", contents);
         request.setAttribute("registerday", registerday);
         
         // 글 수정을 위하여 새로운정보를 입력하도록 View 페이지로 이동한다.
         super.setViewPage("/WEB-INF/heajun/board/qnaEdit.jsp");
         
      }
      
      else {
         
         String message = "잘못된 접근입니다.";
         String loc = "javascript:history.back()";
         
         request.setAttribute("message", message);
         request.setAttribute("loc", loc);
         
       //super.setRedirect(false);
			super.setViewPage("/WEB-INF/heajun/board/qnaEdit.jsp");
         
      }
				
	}

}
