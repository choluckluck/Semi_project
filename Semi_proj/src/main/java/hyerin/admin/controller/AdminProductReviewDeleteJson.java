package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.review.model.InterReviewDAO;
import hyerin.review.model.ReviewDAO;

public class AdminProductReviewDeleteJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String review_code = request.getParameter("review_code");
		InterReviewDAO rdao = new ReviewDAO();
		
		//reviewcode에 해당하는 행을 삭제하기
		int deleteReviewResult = rdao.deleteUserReview(review_code);
		
		String message = "";
		if(deleteReviewResult == 1) {
			message = "리뷰번호 " + review_code + "를 삭제하였습니다.";
		}
		else {
			message = "리뷰번호 " + review_code + "의 삭제를 실패하였습니다.";
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("message",message);
		
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		super.setViewPage("/WEB-INF/hyerin/admin/adminProductReviewDeleteJson.jsp");
		
	}

}
