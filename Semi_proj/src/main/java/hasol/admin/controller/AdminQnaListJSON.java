package hasol.admin.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hasol.admin.model.J_InterQnaDAO;
import hasol.admin.model.J_QnaDAO;
import hasol.admin.model.J_QnaVO;
import oracle.sql.DATE;

public class AdminQnaListJSON extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		J_InterQnaDAO qdao = new J_QnaDAO();
		
		String searchType = request.getParameter("searchType");				// 답변 여부 분류
		String qna_search_min = request.getParameter("qna_search_min");		// 기간 시작
		String qna_search_max = request.getParameter("qna_search_max");		// 기간 끝
		String currentPageNo = request.getParameter("currentPageNo");	// 현재 사용자가 보고있는 페이지
		String sizePerPage = "10";		// 페이지 당 표시될 글 목록 수
		String searchWord = request.getParameter("searchWord");
		String answer_yn = request.getParameter("answer_yn");
		
		System.out.println("searchType:" + searchType);
		System.out.println("searchWord:" + searchWord);
		System.out.println("answer:" + answer_yn);
		
		// currentPage 예외 처리
		if(currentPageNo == null) {
			currentPageNo = "1";
		}
		
		try {
			if(Integer.parseInt(currentPageNo) < 1) {
				currentPageNo ="1";
			}
		} catch (NumberFormatException e ) {
			currentPageNo ="1";
		}
		
		// 날짜 값 예외 처리
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		
		String today = df.format(date);
		if (qna_search_min == "" ) qna_search_min = today;
		if (qna_search_max == "" ) qna_search_max = today;
		
		// 답변 여부 값 예외 처리
		if(answer_yn == null) answer_yn = "All";
		
		/////////// 각 값들 Map ///////////
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("searchType", searchType);
		paraMap.put("qna_search_min", qna_search_min);
		paraMap.put("qna_search_max", qna_search_max);
		paraMap.put("sizePerPage", sizePerPage);
		paraMap.put("currentPageNo", currentPageNo);
		paraMap.put("searchWord", searchWord);
		paraMap.put("answer_yn", answer_yn);
		

		
		// 조회해올 상품의 총 페이지 수 구하기
		int totalPage = qdao.getTotalPage(paraMap);
		System.out.println("totalPage:" +totalPage);
		
		
		
		// 총 페이지 수에 대한 오류 방지
		if ( Integer.parseInt(currentPageNo) > totalPage ) {
			currentPageNo = "1";
		}
		
		
		// 페이징 처리된 전체 상품, 검색 상품 목록 조회 
		List<J_QnaVO> QnaList = qdao.pagingQna(paraMap);

		System.out.println("QnaList:" + QnaList);
		
		// 페이징 바 만들기
		String pageBar = "";
		
		int blockSize = 10; //blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수
		int loop = 1; //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개) 까지만 증가하는 용도
		int pageNo = ( (Integer.parseInt(currentPageNo) - 1)/blockSize ) * blockSize + 1;
		
		System.out.println("pageNo:"+pageNo);
		
		/////////////////////////////////////////////////////////////////////
		
		if(searchType == null) {
			searchType = "";
		}
		
		if(searchWord == null) {
			searchWord = "";
		}
				
		/////////////////////////////////////////////////////////////////////
		
		if(pageNo != 1) {
			System.out.println("페이지넘버 1 공간");
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch(1)'><i class='fas fa-angle-double-left'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch("+(pageNo-1)+")'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentPageNo)) {
				System.out.println("페이지넘버 2 공간");
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
			}
			else {
				System.out.println("페이지넘버 2-1 공간");
				pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch("+pageNo+")'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
			System.out.println("페이지 목록이 10개 넘지 않거나, 페이지가 총 페이지 수보다(3) 크지 않을 때 도는 곳!");
		}//end of while
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			System.out.println("페이지넘버 3 공간");
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch("+pageNo+")'><i class='fas fa-angle-right'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch("+totalPage+")'><i class='fas fa-angle-double-right'></i></a></li>";

		}

		
		// JSON 응답하기(데이터 반환)
		JSONArray jsonArr = new JSONArray();
		
		// 검색 조건에 대한 반환
		JSONObject jsonObj_search = new JSONObject();
		jsonObj_search.put("sizePerPage", sizePerPage);
		jsonObj_search.put("searchType", searchType);
		jsonObj_search.put("qna_search_min", qna_search_min);
		jsonObj_search.put("qna_search_max", qna_search_max);
		jsonObj_search.put("currentPageNo", currentPageNo);
		jsonObj_search.put("searchWord", searchWord);
		jsonObj_search.put("pageBar", pageBar);
		
		jsonArr.put(jsonObj_search);
		
		
		// 문의글에 대한 반환
		if(QnaList.size() > 0) {

			for(J_QnaVO qvo : QnaList) {
				JSONObject jsonObj_qnaList = new JSONObject();

				jsonObj_qnaList.put("qna_code", qvo.getQna_code());
				jsonObj_qnaList.put("category", qvo.getCategory());
				jsonObj_qnaList.put("fk_userid", qvo.getFk_userid());
				jsonObj_qnaList.put("subject", qvo.getSubject());
				jsonObj_qnaList.put("registerday", qvo.getRegisterday());
				// jsonObj_qnaList.put("answer_yn", qvo.getAnswer_yn());
				
				if("Y".equals(qvo.getAnswer_yn())) {
					jsonObj_qnaList.put("answer_yn","답변완료"); }
				else {
					jsonObj_qnaList.put("answer_yn", "답변대기"); }
				
				jsonObj_qnaList.put("prod_code", qvo.getPvo().getProd_code());
				jsonObj_qnaList.put("prod_kind", qvo.getPvo().getProd_kind());
				jsonObj_qnaList.put("prod_name", qvo.getPvo().getProd_name());
				jsonObj_qnaList.put("prod_high", qvo.getPvo().getProd_high());
				jsonObj_qnaList.put("prod_image", qvo.getPvo().getProd_image());
				
				jsonArr.put(jsonObj_qnaList);
			}
			
			String json = jsonArr.toString();
			request.setAttribute("json", json);
			
			System.out.println("json:" + json);
		}
		else {
			String json = jsonArr.toString();
			request.setAttribute("json", json);
			
			
		}
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/jsonview.jsp");
	}

}
