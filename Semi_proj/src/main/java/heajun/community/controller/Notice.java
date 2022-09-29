package heajun.community.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.community.model.InterNoticeDAO;
import heajun.community.model.NoticeDAO;
import heajun.community.model.NoticeVO;
import heajun.member.model.MemberVO;

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
		
				
				 Map<String, String> paraMap = new HashMap<>(); // DAO에 보낼 파라미터들을 담아줄 해쉬맵입니다.
		         
		         String searchType = request.getParameter("searchType"); // 아이디, 제목 , 내용 

		         paraMap.put("searchType", searchType);

		         
		         String currentShowPageNo = request.getParameter("currentShowPageNo"); // 현재 보고있는 페이지
		         String sizePerPage = request.getParameter("sizePerPage"); // 몇명씩 볼지
		         
		         
		         if( currentShowPageNo == null ) { // 현재보고있는 페이지가 null이면 1을 기본값으로 준다 // null인 경우는 처음으로 회원목록 페이지에 들어온 경우이다.
		            currentShowPageNo = "1";
		         }
		         
		         if ( sizePerPage == null || !( "3".equals(sizePerPage)  ) ) {sizePerPage = "10";}
		            
		         
		         
		         try { // 무언가를 검색하고 들어왔다면 정상적인 int 범위의 숫자이다. 허나 사용자가 GET방식을 이용하여 악의적으로 들어왔다면 걸러야한다.
		            Integer.parseInt(currentShowPageNo);
		         } catch (NumberFormatException e) {
		            currentShowPageNo = "1";
		         }
		         
		         paraMap.put("currentShowPageNo", currentShowPageNo);
		         paraMap.put("sizePerPage", sizePerPage);

		         
		       
		      

				
		     //	super.setRedirect(false);
				super.setViewPage("/WEB-INF/hyerin/community/notice.jsp");	
				
				return;

	}

}
