package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminOrder extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		super.setViewPage("/WEB-INF/hyerin/admin/adminOrder.jsp");
	}

}
