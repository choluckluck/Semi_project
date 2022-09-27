package common.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductVO;

public class Main extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		
		InterProductDAO pdao = new ProductDAO();
		
		//New arrival => 새로운 등록순으로 상품을 불러온다
		List<ProductVO> new_pvo = pdao.selectNewProduct();
		
		
		
		request.setAttribute("new_pvo", new_pvo);
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/main.jsp");
		
		
		
		
	}

}
