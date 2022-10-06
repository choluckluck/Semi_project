package hyerin.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.product.model.*;

public class AdminProductListSizeJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pcode = request.getParameter("pcode"); 
		String pcolor = request.getParameter("pcolor"); 
		
		InterProductDAO pdao = new ProductDAO();
		
		//사이즈를 선택하지 않은 경우
		//해당 상품코드, 상품컬러에 대한 사이즈를 조회하기
		List<ProductDetailVO> psizeList = pdao.getProductSize(pcode, pcolor);

		JSONArray jsonArr = new JSONArray();
		if(psizeList.size() > 0) {
			for(ProductDetailVO size : psizeList) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("psize", size.getProd_size());
				jsonArr.put(jsonObj);
				
			}//end of for
			String json2 = jsonArr.toString();
			request.setAttribute("json2", json2);
		}
		else {
			String json2 = jsonArr.toString();
			request.setAttribute("json2", json2);
		}//end of else
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/admin/adminProductListSizeJson.jsp");
		
		
	}

}
