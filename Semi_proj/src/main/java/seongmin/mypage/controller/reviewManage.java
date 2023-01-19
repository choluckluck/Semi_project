package seongmin.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.review.model.InterReviewDAO;
import seongmin.review.model.ReviewDAO;
import seongmin.review.model.ReviewVO;


public class reviewManage extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		InterReviewDAO rdao = new ReviewDAO();

		
		String sizePerPage = "10";
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		

		if(currentShowPageNo == null ) {
			   currentShowPageNo = "1";
		}
		
//		System.out.println(currentShowPageNo );

		   try {
			     if(Integer.parseInt(currentShowPageNo) < 1) {
			    	 currentShowPageNo = "1";
			     }
			   
		   } catch(NumberFormatException e) {
			   currentShowPageNo = "1";
		   }
		   
		   paraMap.put("sizePerPage", sizePerPage);
		   paraMap.put("currentShowPageNo", currentShowPageNo);
		
		   int totalPage = rdao.getTotalPage(paraMap);
		
		   if( Integer.parseInt(currentShowPageNo) > totalPage ) {
			   currentShowPageNo = "1";
		   }
		   
					
			List<ReviewVO> reviewList = new ArrayList();		
			reviewList = rdao.geReviewList(paraMap);
			request.setAttribute("reviewList", reviewList);		   
		
		
		   String pageBar = "";
		   int blockSize = 10; // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다. 
		   int loop = 1; // loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다. 

			int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
			   if(pageNo != 1) {
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaManage.sue?sizePerPage="+sizePerPage+"&currentShowPageNo=1'>[맨처음]</a></li>"; 
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaManage.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"'>[이전]</a></li>";
			   }
		
			   while( !(loop > blockSize || pageNo > totalPage) ) {
				   
				   if( pageNo == Integer.parseInt(currentShowPageNo) ) {
					   pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
				   }
				   else {
					   pageBar += "<li class='page-item'><a class='page-link' href='qnaManage.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";   
				   }
				   loop++;   
				   
				   pageNo++; 


			   }// end of while--------------------

			   if( pageNo <= totalPage ) {
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaManage.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>"; 
				   pageBar += "<li class='page-item'><a class='page-link' href='qnaManage.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+"'>[마지막]</a></li>";
			   }
			   request.setAttribute("pageBar1", pageBar);		   
			   			   
			   
			   
		super.setViewPage("/WEB-INF/seongmin/reviewManage.jsp");
	}

}
