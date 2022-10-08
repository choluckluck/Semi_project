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
               
               String fk_userid = request.getParameter("fk_userid");
               String notice_subject = request.getParameter("notice_subject");
               String notice_contents = request.getParameter("notice_contents");
               if(fk_userid != null && notice_subject != null && notice_contents != null) {
                  ndao.register(fk_userid,notice_subject,notice_contents);
               
               }
            
             Map<String, String> paraMap = new HashMap<>();
             
          // ** 페이징 처리를 한 모든 글 또는 페이지 목록 보여주기 ** //
              
             
             String sizePerPage = request.getParameter("sizePerPage"); // 몇명씩 볼지

            if(sizePerPage == null ){
               sizePerPage = "10";
            }
            
            String currentShowPageNo = request.getParameter("currentShowPageNo"); // 현재 보고있는 페이지
            if(currentShowPageNo == null) {
               currentShowPageNo = "1";
            }
            paraMap.put("sizePerPage", sizePerPage);
            paraMap.put("currentShowPageNo", currentShowPageNo);
            
            
            
             // 페이지바를 만들기 위해서 notice table 글개수에 대한 총페이지수 알아오기
            int totalPage = ndao.getTotalPage(paraMap);
            
             if( Integer.parseInt(currentShowPageNo) > totalPage ) {
                 currentShowPageNo = "1";
             }
           
             
             List<NoticeVO> noticeList = ndao.selectPagingNoticeList(paraMap);
               
            
             request.setAttribute("sizePerPage", sizePerPage);
             request.setAttribute("noticeList", noticeList);
             
            
               String pageBar = "";
               
               int blockSize = 10;
               
               int loop = 1;
               
               int pageNo = ( ( Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
               
               
               if(pageNo != 1) {
                  pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo=1&sizePerPage="+sizePerPage+"'>[맨처음]</a></li>"; 
                  pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+(pageNo-1)+"&sizePerPage="+sizePerPage+"'>[이전]</a></li>";
               }
                           
               while( !(loop > blockSize || pageNo > totalPage) ) {
                  
                  if( pageNo == Integer.parseInt(currentShowPageNo) ) {
                     pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
                  }
                  else {
                     pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>"+pageNo+"</a></li>";   
                  }
                  loop++;   
                  
                  pageNo++;    
                  
               }// end of while--------------------
               
               
               if( pageNo <= totalPage ) {
                  pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+pageNo+"&sizePerPage="+sizePerPage+"'>[다음]</a></li>"; 
                  pageBar += "<li class='page-item'><a class='page-link' href='notice.sue?currentShowPageNo="+totalPage+"&sizePerPage="+sizePerPage+"'>[마지막]</a></li>"; 
               }
               
               
               request.setAttribute("pageBar", pageBar);
               
             
            
           //   super.setRedirect(false);
            super.setViewPage("/WEB-INF/heajun/community/notice.jsp");   
            
   
      
   }

}