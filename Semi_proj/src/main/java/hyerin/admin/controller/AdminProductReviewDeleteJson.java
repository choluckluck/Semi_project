package hyerin.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.review.model.InterReviewDAO;
import hyerin.review.model.ReviewDAO;
import hyerin.util.HyerinUtil;

public class AdminProductReviewDeleteJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		String gobackUrl = HyerinUtil.getCurrentURL(request);
		
		//GET방식인 경우 => 한 리뷰만을 삭제
		if("GET".equalsIgnoreCase(method)) {
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
			jsonObj.put("gobackUrl",gobackUrl);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		}
		//POST 방식이라면 => 선택된 모든 리뷰를 삭제
		else {
			
			String review_codeJoin = request.getParameter("review_codeJoin");
			String[] review_codeArr = review_codeJoin.split("\\,");
			
			InterReviewDAO rdao = new ReviewDAO();
			Map<String, String[]> paraMap = new HashMap<>();
			paraMap.put("review_codeArr", review_codeArr);
			
			//해당하는 리뷰들을 삭제해준다
			int deleteReviewResult = rdao.deleteMultiReview(paraMap);
			
			
			String message = "";
			if(deleteReviewResult==1) {
				message = "선택한 리뷰가 모두 삭제되었습니다.";
			}
			else {
				message = "선택한 리뷰의 삭제가 실패되었습니다.";
			}
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("message",message);
			jsonObj.put("gobackUrl",gobackUrl);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		}
				
	}

}
