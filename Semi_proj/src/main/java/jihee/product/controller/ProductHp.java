package jihee.product.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import jihee.product.model.*;


public class ProductHp extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO mdao = new ProductDAO();
		
		List<ProductVO> productList = mdao.selectProductAll();
		
		request.setAttribute("productList", productList);
		
		/*
		
		if( productList.size() > 0) {
			for(ProductVO pvo : productList) { 
				System.out.println( pvo.getProd_color() + "  " + pvo.getProd_code());
			}
		}
		*/
		
		
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/jihee/prodouct/4.productHpSide.jsp");
		
		

	}

}
