package hasol.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.admin.model.J_InterQnaDAO;
import hasol.admin.model.J_QnaDAO;
import hasol.admin.model.J_QnaVO;
import hasol.member.model.J_MemberVO;

public class AdminQna extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// == 로그인하지 않았다면 조회가 불가능 ==
		if(!super.checkLogin(request)){
			
			String message = "로그인을 하세요.";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
         //   super.setRedirect(false);
            super.setViewPage("/WEB-INF/error/msg.jsp");
            
		}
		
		// == 로그인 한 상태 ==
		else {
			
			HttpSession session = request.getSession();
			J_MemberVO loginuser = (J_MemberVO)session.getAttribute("loginuser");
		
			if(!"admin".equals(loginuser.getUserid())) { // 관리자가 아닌 일반 사용자가 로그인한 경우
				
				String message = "관리자 이외에는 접근이 불가능합니다.";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	         //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/error/msg.jsp");
				
			}
			else { // 관리자로 로그인한 경우
				
				J_InterQnaDAO qdao = new J_QnaDAO();
				
				String searchType = request.getParameter("searchType");				// 답변 여부 분류
				String qna_search_min = request.getParameter("qna_search_min");		// 기간 시작
				String qna_search_max = request.getParameter("qna_search_max");		// 기간 끝
				String sizePerPage = "10";		// 페이지 당 표시될 글 목록 수
				String currentShowPageNo = request.getParameter("currentShowPageNo");	// 현재 사용자가 보고있는 페이지
				
				// 처음 진입 시, 외부 오류 시 페이징 1 처리되도록 처리
				if(currentShowPageNo == null) {
					currentShowPageNo = "1";
				}
				
				try {
					if(Integer.parseInt(currentShowPageNo) < 1) {
						currentShowPageNo ="1";
					}
				} catch (NumberFormatException e ) {
					currentShowPageNo ="1";
				}
				
				
				///////////
				Map<String, String> paraMap = new HashMap<>();
				
				paraMap.put("searchType", searchType);
				paraMap.put("qna_search_min", qna_search_min);
				paraMap.put("qna_search_max", qna_search_max);
				paraMap.put("sizePerPage", sizePerPage);
				paraMap.put("currentShowPageNo", currentShowPageNo);
				
				int totalPage = qdao.getTotalPage(paraMap);
				System.out.println(totalPage);
				
				
				// 총 페이지 수에 대한 오류 방지
				if ( Integer.parseInt(currentShowPageNo) > totalPage ) {
					currentShowPageNo = "1";
				}
				
				List<J_QnaVO> QnaList = qdao.pagingQna(paraMap);
			}
		
		
		}
		
		super.setViewPage("/WEB-INF/hyerin/admin/adminQna.jsp");
	}

}
