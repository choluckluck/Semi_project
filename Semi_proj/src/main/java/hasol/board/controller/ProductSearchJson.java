package hasol.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hasol.board.model.J_InterProductDAO;
import hasol.board.model.J_ProductDAO;
import hasol.board.model.J_ProductVO;

public class ProductSearchJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		J_InterProductDAO pdao = new J_ProductDAO();
		
		String searchWord = request.getParameter("searchWord");
		String sizePerPage = request.getParameter("sizePerPage");
		String currentPageNo = request.getParameter("currentPageNo");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("searchWord", searchWord);
		
		
		// sizePerPage 예외처리
		if(sizePerPage == null || !("5".equals(sizePerPage) || 
									"10".equals(sizePerPage) || 
									"20".equals(sizePerPage)) )
			sizePerPage ="5";
		
		
		// currentPageNo 예외처리
		if(currentPageNo == null) currentPageNo ="1";
		
		try {
			if(Integer.parseInt(currentPageNo) < 1) currentPageNo = "1";
		} catch (NumberFormatException e) {
			currentPageNo = "1";
		}
		
		paraMap.put("sizePerPage", sizePerPage);
		paraMap.put("currentPageNo", currentPageNo);

		
		// 총 페이지 수
		int totalPage = pdao.getTotalPage(paraMap);
		
		if(Integer.parseInt(currentPageNo) > totalPage) {
			currentPageNo="1";
		}
		
		
		// 검색한 상품 리스트
		List<J_ProductVO> qnaProductList = pdao.qnaSearchProduct(paraMap);
		
		//request.setAttribute("sizePerPage", sizePerPage);
		//request.setAttribute("qnaProductList", qnaProductList);

		
		// 페이징 바
		String pageBar = "";
		
		int blockSize = 5;
		int loop = 1;
		int pageNo = ( (Integer.parseInt(currentPageNo) -1)/blockSize * blockSize + 1 );
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		// request.setAttribute("searchWord", searchWord);

		if(pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch(1)'><i class='fas fa-angle-double-left'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:goSearch("+(pageNo-1)+")'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+pageNo+")'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
			
		}//end of while
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+pageNo+")'><i class='fas fa-angle-right'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectMember("+totalPage+")'><i class='fas fa-angle-double-right'></i></a></li>";
		}
		
	}
}
