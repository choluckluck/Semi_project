package heajun.community.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.community.model.*;



public class Notice extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
				

				InterNoticeDAO ndao = new NoticeDAO();
				
				// ** 페이징 처리를 한 모든 글 또는 페이지 목록 보여주기 ** //
				String notice_code = request.getParameter("notice_code");
				String currentShowPageNo = request.getParameter("currentShowPageNo");
					
			    
			    Map<String, String> paraMap = new HashMap<>();
			    
				paraMap.put("notice_code", notice_code);
				paraMap.put("currentShowPageNo", currentShowPageNo);
				
				
				
			    // 페이지바를 만들기 위해서 notice table 글개수에 대한 총페이지수 알아오기
				int totalPage = ndao.getTotalPage(notice_code);
				
				 if( Integer.parseInt(currentShowPageNo) > totalPage ) {
				     currentShowPageNo = "1";
					 paraMap.put("currentShowPageNo", currentShowPageNo);
				 }
			  
				 
				 List<NoticeVO> Notice = ndao.selectPagingNoticeList(paraMap);
				   
				
				 
				 request.setAttribute("Notice", Notice);
				 
				
				   String pageBar = "";
				   
				   int blockSize = 10;
				   
				   int loop = 1;
				   
				   int pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
				   
				   
				   if(pageNo != 1) {
					   pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo=1&notice_code="+notice_code+"'>[맨처음]</a></li>"; 
					   pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+(pageNo-1)+"&notice_code="+notice_code+"'>[이전]</a></li>";
				   }
				   			   
				   while( !(loop > blockSize || pageNo > totalPage) ) {
					   
					   if( pageNo == Integer.parseInt(currentShowPageNo) ) {
						   pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
					   }
					   else {
						   pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+pageNo+"&notice_code="+notice_code+"'>"+pageNo+"</a></li>";   
					   }
					   loop++;   
					   
					   pageNo++;    
					   
				   }// end of while--------------------
				   
				   
				   if( pageNo <= totalPage ) {
					   pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+pageNo+"&notice_code="+notice_code+"'>[다음]</a></li>"; 
					   pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+totalPage+"&notice_code="+notice_code+"'>[마지막]</a></li>"; 
				   }
				   
				   
				   request.setAttribute("pageBar", pageBar);
				   
				 
				
		     //	super.setRedirect(false);
				super.setViewPage("/WEB-INF/heajun/community/notice.jsp");	
				
	
		
	}

}
