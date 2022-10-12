package hyerin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.member.model.MemberVO;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductDetailVO;
import hyerin.product.model.ProductVO;
import hyerin.util.HyerinUtil;

public class AdminProductListJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		String gobackUrl = HyerinUtil.getCurrentURL(request);
		
				
		InterProductDAO pdao = new ProductDAO();
		
		// select 박스의 상품종류대로 상품정보를 가져온다
		String prodSortbyKind = request.getParameter("prodSortbyKind");
		String searchword = request.getParameter("searchword");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("prodSortbyKind", prodSortbyKind);
		paraMap.put("searchword", searchword);
		
		//페이징 처리 정보
		String sizePerPage = "5";
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
		
		
		paraMap.put("sizePerPage", sizePerPage);
		paraMap.put("currentShowPageNo", currentShowPageNo);
		
		
		// 총페이지 알아오기
		int totalPage = pdao.getTotalPage(paraMap);
		
		if ( Integer.parseInt(currentShowPageNo) > totalPage ) {
			currentShowPageNo = "1";
		}
		
		// 첫 화면일때는 모든 상품정보를, 셀렉트박스를 변경했을때는 선택한 종류의 상품정보를, 검색어가 있으면 검색어를 입력해서 조회(select)
		List<ProductVO> productList = pdao.selectPagingProductByKind(paraMap);
		
		
		//페이지바
		String pageBar = "";
		
		int blockSize = 10; //blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수
		int loop = 1; //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개) 까지만 증가하는 용도
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
		//System.out.println(pageNo);
		
		/////////////////////////////////////////////////////////////////////
		
		if(prodSortbyKind == null) {
			prodSortbyKind = "";
		}
		
		if(searchword == null) {
			searchword = "";
		}
		
		/////////////////////////////////////////////////////////////////////
		
		if(pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectProduct(1)'><i class='fas fa-angle-double-left'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectProduct("+(pageNo-1)+")'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectProduct("+pageNo+")'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
			
		}//end of while
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectProduct("+pageNo+")'><i class='fas fa-angle-right'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:selectProduct("+totalPage+")'><i class='fas fa-angle-double-right'></i></a></li>";
		}
		
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj2 = new JSONObject();
		
		jsonObj2.put("sizePerPage", sizePerPage);
		jsonObj2.put("prodSortbyKind", prodSortbyKind);
		jsonObj2.put("searchword", searchword);
		jsonObj2.put("pageBar", pageBar);
		jsonObj2.put("currentShowPageNo", currentShowPageNo);
		
		jsonArr.put(jsonObj2);
		
		if(productList.size() > 0) {
			
			for(ProductVO pvo : productList) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("prod_code", pvo.getProd_code());
				jsonObj.put("prod_name", pvo.getProd_name());
				jsonObj.put("prod_kind", pvo.getProd_kind());
				jsonObj.put("prod_image", pvo.getProd_image());
				jsonObj.put("prod_high", pvo.getProd_high());
				jsonObj.put("prod_price", pvo.getProd_price());
				jsonObj.put("prod_saleprice", pvo.getProd_saleprice());
				jsonObj.put("prod_color", pvo.getPdvo().getProd_color());
				jsonObj.put("prod_registerday", pvo.getProd_registerday());
				jsonObj.put("md_pick_yn", pvo.getMd_pick_yn());
				
				jsonArr.put(jsonObj);
				
			}//end of for
			
			String json = jsonArr.toString();
			request.setAttribute("json", json);
			
		}//end of if
		else {
			
			String json = jsonArr.toString();
			request.setAttribute("json", json);
			
		}//end of else
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
				
		
	}

}
