package hyerin.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class AdminProductRegister extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		InterProductDAO pdao = new ProductDAO();
		
		//상품종류 목록을 가져오기
		List<String> prodKindList = pdao.selectProdKindList();
		
		String prodKind = String.join(",", prodKindList);
		
		request.setAttribute("prodKind", prodKind);
		
		
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/admin/adminProductRegister.jsp");
	}
	
}
