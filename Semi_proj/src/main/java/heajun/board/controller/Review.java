package heajun.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.board.model.InterReviewDAO_HJ;
import heajun.board.model.ReviewDAO_HJ;
import heajun.board.model.ReviewVO_HJ;
import heajun.util.MyUtil;

public class Review extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		InterReviewDAO_HJ rdao = new ReviewDAO_HJ();

		String review_sortType = request.getParameter("review_sortType");

		String review_searchWord = request.getParameter("review_searchWord");
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("review_sortType", review_sortType);
		paraMap.put("review_searchWord", review_searchWord);
		
		
		String sizePerPage = "4";
		
		
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		
		try {
			if(Integer.parseInt(currentShowPageNo) < 1) {
				currentShowPageNo = "1";
			}
			
		} catch(NumberFormatException e) {
			currentShowPageNo = "1"; //숫자가 아닌 문자를 get방식으로 입력했을 때 무조건 1로 바꾸어준다
		}
		
		
		paraMap.put("sizePerPage", sizePerPage);
		paraMap.put("currentShowPageNo", currentShowPageNo);
		
		//리뷰목록의 총페이지수 구해오기
		int totalPage = rdao.getToTalReviewPage(paraMap);
		
		
		if ( Integer.parseInt(currentShowPageNo) > totalPage ) {
			currentShowPageNo = "1";
		}
		
		
		//페이징한 검색이 있는, 또는 없는 리뷰목록 조회(select)
		List<ReviewVO_HJ> rvoList = rdao.selectPagingReview(paraMap);
		
		
		request.setAttribute("sizePerPage", sizePerPage);
		request.setAttribute("rvoList", rvoList);
		
		
		
		String pageBar = "";
		
		int blockSize = 10; //blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수
		int loop = 1; //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개) 까지만 증가하는 용도
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
		/////////////////////////////////////////////////////////////////////
		
		if(review_sortType == null) {
			review_sortType = "";
		}
		
		if(review_searchWord == null) {
			review_searchWord = "";
		}
		
		request.setAttribute("review_sortType", review_sortType);
		request.setAttribute("review_searchWord", review_searchWord);
		
		/////////////////////////////////////////////////////////////////////
		
		
		if(pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='review.sue?sizePerPage="+sizePerPage+"&currentShowPageNo=1&review_sortType="+review_sortType+"&review_searchWord="+review_searchWord+"'><i class='fas fa-angle-double-left'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='review.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"&review_sortType="+review_sortType+"&review_searchWord="+review_searchWord+"'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='review.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&review_sortType="+review_sortType+"&review_searchWord="+review_searchWord+"'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
			
		}//end of while
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='review.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&review_sortType="+review_sortType+"&review_searchWord="+review_searchWord+"'><i class='fas fa-angle-right'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='review.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"&review_sortType="+review_sortType+"&review_searchWord="+review_searchWord+"'><i class='fas fa-angle-double-right'></i></a></li>";
		}
						
		request.setAttribute("pageBar", pageBar);
		
		
		String currentURL = MyUtil.getCurrentURL(request);
		currentURL = currentURL.replaceAll("&", " ");
		
		request.setAttribute("currentURL", currentURL);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/review.jsp");
		
	}

}
