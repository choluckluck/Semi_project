package hasol.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class AdminQnaAnswer extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String qna_code = request.getParameter("qna_code");
		
		// InterQnacommentDAO qcdao = new Qna
		
		super.setViewPage("/WEB-INF/hyerin/admin/adminQnaAnswer.jsp");
	}

}
