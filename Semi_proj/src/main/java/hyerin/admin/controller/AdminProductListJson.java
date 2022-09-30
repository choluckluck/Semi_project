package hyerin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductVO;

public class AdminProductListJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		
		// select 박스의 상품종류대로 상품정보를 가져온다
		String byKind = request.getParameter("byKind");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("byKind", byKind);
		
		
		
		//페이징 처리 시작
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		try {
			if(Integer.parseInt(currentShowPageNo)<1) {
				currentShowPageNo = "1";
			}
		} catch(NumberFormatException e) {
			currentShowPageNo = "1";
		}
		
		paraMap.put("currentShowPageNo", currentShowPageNo);
		
		
		// 총페이지 알아오기
		int totalPage = pdao.getTotalPage(paraMap);
		
		
		// 첫 화면일때는 모든 상품정보를, 셀렉트박스를 변경했을때는 선택한 종류의 상품정보를 조회(select)
		List<ProductVO> productList = pdao.selectProductByKind(paraMap);
		
		request.setAttribute("productList", productList);
		
		// 페이지바 만들기
		String pageBar = "";
		int blockSize = 10;
		int loop = 1;
		
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
		/*
		 * <li class="page-item"> <a class="page-link" href="#" aria-label="Previous">
		 * <span aria-hidden="true">&laquo;</span> </a> </li> <li class="page-item"><a
		 * class="page-link" href="#">1</a></li> <li class="page-item"><a
		 * class="page-link" href="#">2</a></li> <li class="page-item"><a
		 * class="page-link" href="#">3</a></li> <li class="page-item"> <a
		 * class="page-link" href="#" aria-label="Next"> <span
		 * aria-hidden="true">&raquo;</span> </a> </li>
		 */
		
		// **** [맨처음][이전] 만들기 **** //
		if(pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo=1&prod_kind="+byKind+"'>" + "<<</a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+(pageNo-1)+"&prod_kind="+byKind+"'>" + "<</a></li>";
		}
		// **** [맨처음][이전] 만들기 끝 **** //
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+pageNo+"&prod_kind="+byKind+"'>" + pageNo + "</a></li>";
			}
			loop++; 
			pageNo++; 
		}//end of while
		
		// **** [다음][마지막] 만들기 **** //
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+pageNo+"&prod_kind="+byKind+"'>" + "[다음]</a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+totalPage+"&prod_kind="+byKind+"'>" + "[마지막]</a></li>";
		}
		// **** [다음][마지막] 만들기 끝**** //
		
		
		
		
		request.setAttribute("pageBar", pageBar);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/admin/adminJson.jsp");
	}

}
