package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.board.model.InterQnaDAO;
import heajun.board.model.QnaDAO;
import heajun.board.model.QnaVO;

public class QnaEditEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  String method = request.getMethod();
	         
	         if("post".equalsIgnoreCase(method)) { // 수정할 글내용과 제목등을 적고 수정하기버튼을 눌러야 POST로 들어올 수 있다.
	            
	        	 String qna_code = request.getParameter("qna_code");
	             String fk_member_code = request.getParameter("fk_member_code");
	             String category = request.getParameter("category");
	             String subject = request.getParameter("subject");
	             String contents = request.getParameter("contents");
	             String registerday = request.getParameter("registerday");
		        
	            InterQnaDAO qdao = new QnaDAO();
	           	int n = qdao.updateBoard(fk_member_code, category , subject, contents, qna_code );
	           	
	            request.setAttribute("qna_code",qna_code); 
	            request.setAttribute("fk_member_code",fk_member_code); 
	            request.setAttribute("category",category); 
	            request.setAttribute("subject",subject); 
	            request.setAttribute("contents", contents);
	            request.setAttribute("registerday", registerday);
		         
	           	String message = "";
		        String loc = "";
	            

		            if(n==1) {// update 성공
		            	
		            	QnaVO qvo = qdao.updateEnd(fk_member_code, category , subject, contents, qna_code ,registerday);
		            	
		            	message = "글 수정 성공!!";
		            	request.setAttribute("qvo", qvo);
		            	
		            	super.setViewPage("/WEB-INF/heajun/board/qnaEditEnd.jsp");
		                
		            }
		            else {// update 실패
		               message = "글 수정 실패!!";
		               loc = "javascript:history.back()";
		               
		               request.setAttribute("message", message);
				       request.setAttribute("loc", loc);
				        
				       super.setViewPage("/WEB-INF/msg.jsp");
		            }
	            
		            
		         }
	         
	 			else {
	 				
	 			// **** POST 방식으로 넘어온 것이 아니라면 **** //
	 			
	 			String message = "비정상적인 경로를 통해 들어왔습니다.!!";
	 	        String loc = "javascript:history.back()";
	 	         
	 	        request.setAttribute("message", message);
	 	        request.setAttribute("loc", loc);
	 	         
	 	        super.setViewPage("/WEB-INF/msg.jsp");
	 	         
	            
	         }
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/qnaEditEnd.jsp");
		
	}

}
