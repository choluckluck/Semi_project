package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class AdminProductListStockJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String p_code = request.getParameter("p_code");
		String p_color = request.getParameter("p_color");
		String p_size = request.getParameter("p_size");
		
		InterProductDAO pdao = new ProductDAO();
		
		//재고량을 조회하기
		String p_stock = pdao.getStock(p_code, p_color, p_size);
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("p_stock", p_stock);
		
		String json3 = jsonObj.toString();
		request.setAttribute("json3", json3);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/admin/adminProductListStockJson.jsp");

		
	}

}
