package jihee.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class GetMordaloptionColor extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String pcode = request.getParameter("pcode");
		InterProductDAO pdao = new ProductDAO();
		
		//pcode에 해당하는 제품의 컬러를 알아온다
		List<String> prodColorList = pdao.getProductColor(pcode);
		
		JSONArray jsonarr = new JSONArray();
		if(prodColorList.size()>0) {
			for(String prodColor : prodColorList) {
				JSONObject jsonobj = new JSONObject();
				jsonobj.put("pcolor", prodColor);
				jsonarr.put(jsonobj);
			}
		}
		
		String json = jsonarr.toString();
		request.setAttribute("json", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		
	}

}
