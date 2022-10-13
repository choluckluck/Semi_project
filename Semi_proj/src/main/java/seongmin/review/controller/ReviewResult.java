package seongmin.review.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.review.model.InterReviewDAO;
import seongmin.review.model.ReviewDAO;

public class ReviewResult extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
		
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");		
			String userid = loginuser.getUserid();		
			String review_grade = request.getParameter("review_grade");
			String prod_code = request.getParameter("prod_code");
			String order_detail_code = request.getParameter("order_detail_code");
			String review_contents = request.getParameter("review_contents");
			String review_subject = request.getParameter("review_subject");
			
			
			
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("review_grade", review_grade);
			paraMap.put("prod_code", prod_code);
			paraMap.put("order_detail_code", order_detail_code);
			paraMap.put("review_contents", review_contents);
			paraMap.put("review_subject", review_subject);
	
			InterReviewDAO rdao = new ReviewDAO();	
	//		System.out.println(review_grade);
	//		int n = rdao.checkReview(paraMap);
					
	
			int n = rdao.reviewRegister(paraMap);
			
			
			if(n == 1 ) {
				super.setViewPage("/heajun/product/productdetail.sue?prod_code="+prod_code);
			}
			
		
		}
	}

}
