package heajun.board.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;

public class Review_write extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/review_write.jsp");
		
	}

}
