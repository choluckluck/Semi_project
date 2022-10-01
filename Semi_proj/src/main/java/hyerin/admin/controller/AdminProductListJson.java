package hyerin.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class AdminProductListJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String byRegisterdayOrders = request.getParameter("byRegisterdayOrders");
		
		InterProductDAO pdao = new ProductDAO();
		
		
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("byRegisterdayOrders", byRegisterdayOrders);
		
		
		
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
		
		
		
		
		
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/admin/adminJson.jsp");
	}

}
