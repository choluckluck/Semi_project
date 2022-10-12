package hasol.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminQnaAnswer extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String prod_code = request.getParameter("prod_code");
		
		super.setViewPage("/WEB-INF/hyerin/admin/adminQnaAnswer.jsp");
	}

}
