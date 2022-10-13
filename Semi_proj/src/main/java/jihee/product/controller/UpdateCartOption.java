package jihee.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class UpdateCartOption extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String cart_code = request.getParameter("cart_code");
		String fk_prod_color = request.getParameter("fk_prod_color");
		String fk_prod_size = request.getParameter("fk_prod_size");
		
		InterProductDAO pdao = new ProductDAO();
		
		//cart_code에 해당하는 카트의 컬러, 사이즈를 업데이트해줌
		int updateResult = pdao.updateCartOption(cart_code, fk_prod_color, fk_prod_size);
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("updateCartResult", updateResult);
		String json = jsonobj.toString();
		request.setAttribute("json3", json);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
	}

}
