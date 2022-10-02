package heajun.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.board.model.InterQnaDAO;
import heajun.board.model.QnaDAO;
import heajun.board.model.QnaVO;

public class QnaList extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		  super.getQnaList(request);
			
			String qna_code = request.getParameter("qna_code"); // 공지사항 글번호 
			
			// *** 공지사항에 해당하는 글들을 페이징 처리하여 보여주기 *** //
			String currentShowPageNo = request.getParameter("currentShowPageNo");
		   
		    if(currentShowPageNo == null) {
			    currentShowPageNo = "1";
		    }
		   
		    try {
			      if(Integer.parseInt(currentShowPageNo) < 1) {
			    	 currentShowPageNo = "1";
			     }
			   
		    } catch(NumberFormatException e) {
			   currentShowPageNo = "1";
		    }
		    
		    Map<String, String> paraMap = new HashMap<>();
		    
			paraMap.put("qna_code", qna_code);
			paraMap.put("currentShowPageNo", currentShowPageNo);
			
			InterQnaDAO qdao = new QnaDAO();
			
		    // 페이지바를 만들기 위해서 특정카테고리의 글개수에 대한 총페이지수 알아오기
			int totalPage = qdao.getTotalPage(qna_code);
			
			 if( Integer.parseInt(currentShowPageNo) > totalPage ) {
			     currentShowPageNo = "1";
				 paraMap.put("currentShowPageNo", currentShowPageNo);
			 }
		  
			 
			 List<QnaVO> qnaList = qdao.selectPagingQnaList(paraMap);
			   
			
			 
			 request.setAttribute("qnaList", qnaList);
			 
			
			   String pageBar = "";
			   
			   int blockSize = 10;
			   
			   int loop = 1;
			   
			   int pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
			   
			   
			   if(pageNo != 1) {
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaList.sue?currentShowPageNo=1&qna_code="+qna_code+"'>[맨처음]</a></li>"; 
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaList.sue?currentShowPageNo="+(pageNo-1)+"&notice_code="+qna_code+"'>[이전]</a></li>";
			   }
			   			   
			   while( !(loop > blockSize || pageNo > totalPage) ) {
				   
				   if( pageNo == Integer.parseInt(currentShowPageNo) ) {
					   pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
				   }
				   else {
					   pageBar += "<li class='page-item'><a class='page-link' href='qnaList.sue?currentShowPageNo="+pageNo+"&notice_code="+qna_code+"'>"+pageNo+"</a></li>";   
				   }
				   loop++;   
				   
				   pageNo++;    
				   
			   }// end of while--------------------
			   
			   
			   if( pageNo <= totalPage ) {
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaList.sue?currentShowPageNo="+pageNo+"&qna_code="+qna_code+"'>[다음]</a></li>"; 
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaList.sue?currentShowPageNo="+totalPage+"&qna_code="+qna_code+"'>[마지막]</a></li>"; 
			   }
			   
			   
			   request.setAttribute("pageBar", pageBar);
			   
			 
			
		
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/qnaList.jsp");
	}

}
