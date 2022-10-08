package jihee.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Bag extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prod_color = request.getParameter("prod_color");
		String prod_size = request.getParameter("prod_size");
		String count = request.getParameter("count");
		
		System.out.println(prod_color+", "+prod_size+", "+count);
		
		//super.setRedirect(false);
	    super.setViewPage("/WEB-INF/jihee/bag/bag.jsp");

	}

}
