package hyerin.admin.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hyerin.product.model.*;

public class AdminProductList extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		
		//첫번째 셀렉트 박스 (최신순, 주문순)의 값
		String byRegisterdayOrders = request.getParameter("byRegisterdayOrders");
		
		//두번째 셀렉트 박스 (상품종류별) 의 값
		String byKind = request.getParameter("byKind");
		
		// 검색의 값
		String searchName = request.getParameter("searchName");
		
		//System.out.println(byRegisterdayOrders + byKind);
		//nullnull		order_quantityproduct_kind
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("byRegisterdayOrders", byRegisterdayOrders);
		paraMap.put("byKind", byKind);
		paraMap.put("searchName", searchName);
		
		
		//페이징 처리 시작
		String sizePerPage = "10";
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
		
		
		if(Integer.parseInt(currentShowPageNo) > totalPage) {
			currentShowPageNo = "1";
		}
		
		
		
		
		
		
		
		//request.setAttribute("productList", productList);

		// 두번째 셀렉트 박스 (상품종류별) 로 상품을 정렬해온다
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/admin/adminProductList.jsp");
	}

}
