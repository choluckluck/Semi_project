package heajun.product.controller;



import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.product.model.InterProductDetailDAO;
import heajun.product.model.ProductDetailDAO;
import heajun.product.model.ProductVO_HJ;
import heajun.product.model.Product_imageVO;
import seongmin.qna.model.InterQnaDAO;
import seongmin.qna.model.QnaDAO;
import seongmin.qna.model.QnaVO;
import seongmin.review.model.InterReviewDAO;
import seongmin.review.model.ReviewDAO;
import seongmin.review.model.ReviewVO;

public class Productdetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			     
		super.goBackURL(request);
		
		String method = request.getContextPath();
		
			
			String prod_code = request.getParameter("prod_code"); // 상품번호
			
			//리뷰개수 조인
			hyerin.review.model.InterReviewDAO rdaoH = new hyerin.review.model.ReviewDAO();
			String reviewCount = rdaoH.getReviewCount(prod_code);
			request.setAttribute("reviewCount", reviewCount);
			
			
			String sizePerPage1 = "10";
			String sizePerPage2 = "10";
			
			String currentShowPageNo1 = request.getParameter("currentShowPageNo");
			String currentShowPageNo2 = request.getParameter("currentShowPageNo");
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("prod_code", prod_code);

			InterReviewDAO rdao = new ReviewDAO();
			InterQnaDAO qdao = new QnaDAO();
			
			if(currentShowPageNo1 == null ) {
				   currentShowPageNo1 = "1";
			}
			if(currentShowPageNo2 == null ) {
				   currentShowPageNo2 = "1";
			}
			
			   try {
				     if(Integer.parseInt(currentShowPageNo1) < 1) {
				    	 currentShowPageNo1 = "1";
				     }
				   
			   } catch(NumberFormatException e) {
				   currentShowPageNo1 = "1";
			   }			
			   paraMap.put("sizePerPage1", sizePerPage1);
			   paraMap.put("currentShowPageNo1", currentShowPageNo1);
		
			   //////////////////////////////////////////////////
			   try {
				     if(Integer.parseInt(currentShowPageNo2) < 1) {
				    	 currentShowPageNo2 = "1";
				     }
				   
			   } catch(NumberFormatException e) {
				   currentShowPageNo2 = "1";
			   }			
			   paraMap.put("sizePerPage2", sizePerPage2);
			   paraMap.put("currentShowPageNo2", currentShowPageNo2);
		   
			   
			   int totalPage1 = rdao.getTotalPage_review(paraMap);
			   int totalPage2 = qdao.getTotalPage_qna(paraMap);

			   
			   if( Integer.parseInt(currentShowPageNo1) > totalPage1 ) {
				   currentShowPageNo1 = "1";
			   }
			   if( Integer.parseInt(currentShowPageNo2) > totalPage2 ) {
				   currentShowPageNo2 = "1";
			   }
			   
			   
			   
				List<ReviewVO> reviewList = new ArrayList();		
				reviewList = rdao.geReviewList_proddetail(paraMap);
				request.setAttribute("reviewList", reviewList);		   
	   
				   if( Integer.parseInt(currentShowPageNo1) > totalPage1 ) {
					   currentShowPageNo1 = "1";
				   }
				  ///////////////////////////////////////////
				   
				List<QnaVO> qnaList = new ArrayList();		
				qnaList = qdao.getqnaList_proddetail(paraMap);
				request.setAttribute("qnaList", qnaList);		   

				if( Integer.parseInt(currentShowPageNo2) > totalPage2 ) {
					   currentShowPageNo2 = "1";
				   }
				  ///////////////////////////////////////////

				
				
				
				
				
			
			InterProductDetailDAO pdao = new ProductDetailDAO();
			
			
						
						try {
							// 제품번호를 가지고서 해당 제품의 정보를 조회해오기
							ProductVO_HJ pvo = pdao.selectProduct(prod_code);// 상품정보 가져오기
						
							ProductVO_HJ pvo2 = pdao.selectProductOption(prod_code);   
							
							Product_imageVO ivo = pdao.selectImage(prod_code);
							
							if(pvo == null) {
								// GET 방식이므로 사용자가 웹브라우저 주소창에서 장난쳐서 존재하지 않는 제품번호를 입력한 경우
								String message = "검색하신 제품은 존재하지 않습니다.";
								String loc = "javascript:history.back()";
								
								request.setAttribute("message", message);
								request.setAttribute("loc", loc);
								
								//	super.setRedirect(false);
								super.setViewPage("/WEB-INF/msg.jsp");
								
							return;
								
							}
							else {
								// 제품이 있는 경우 
								//request.setAttribute("prod_code", prod_code);
								request.setAttribute("pvo", pvo);  // 제품의 정보
								request.setAttribute("pvo2",pvo2); // 옵션가져오기
								request.setAttribute("ivo", ivo);//이미지 가져오기
								//super.setRedirect(false);
								super.setViewPage("/WEB-INF/heajun/product/productdetail.jsp");
							
							}
							
							
						}catch(Exception e) {
							e.printStackTrace();
							System.out.println("exception 오류남");
							
						}
						
						   String pageBar1 = "";
						   int blockSize = 10; // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다. 
						   int loop = 1; // loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다. 

							int pageNo = ( (Integer.parseInt(currentShowPageNo1) - 1)/blockSize ) * blockSize + 1;
						
							   if(pageNo != 1) {
								   pageBar1 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo1=1'>[맨처음]</a></li>"; 
								   pageBar1 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo1="+(pageNo-1)+"'>[이전]</a></li>";
							   }
						
							   while( !(loop > blockSize || pageNo > totalPage1) ) {
								   
								   if( pageNo == Integer.parseInt(currentShowPageNo1) ) {
									   pageBar1 += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
								   }
								   else {
									   pageBar1 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo="+pageNo+"'>"+pageNo+"</a></li>";   
								   }
								   loop++;   
								   
								   pageNo++; 


							   }// end of while--------------------

							   if( pageNo <= totalPage1 ) {
								   pageBar1 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo="+pageNo+"'>[다음]</a></li>"; 
								   pageBar1 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo="+"'>[마지막]</a></li>";
							   }
							   request.setAttribute("pageBar1", pageBar1);						
		///////////////////////////////////////////////////////////////////////////
							   
							   String pageBar2= "";
							   int blockSize2 = 10; // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다. 
							   int loop2 = 1; // loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다. 

								int pageNo2 = ( (Integer.parseInt(currentShowPageNo2) - 1)/blockSize2 ) * blockSize2 + 1;
							
								   if(pageNo2 != 1) {
									   pageBar2 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo2=1'>[맨처음]</a></li>"; 
									   pageBar2 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo2="+(pageNo2-1)+"'>[이전]</a></li>";
								   }
							
								   while( !(loop2 > blockSize2 || pageNo2 > totalPage2) ) {
									   
									   if( pageNo2 == Integer.parseInt(currentShowPageNo2) ) {
										   pageBar2 += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo2+"</a></li>"; 
									   }
									   else {
										   pageBar2 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo2="+pageNo2+"'>"+pageNo2+"</a></li>";   
									   }
									   loop2++;   
									   
									   pageNo2++; 


								   }// end of while--------------------

								   if( pageNo2 <= totalPage2 ) {
									   pageBar2 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo2="+pageNo2+"'>[다음]</a></li>"; 
									   pageBar2 += "<li class='page-item'><a class='page-link' href='productdetail.sue?prod_code="+prod_code +"&sizePerPage1="+sizePerPage1+"&sizePerPage2="+sizePerPage2+"&currentShowPageNo2="+"'>[마지막]</a></li>";
								   }
								   request.setAttribute("pageBar2", pageBar2);						
									   		
				
		     super.setViewPage("/WEB-INF/heajun/product/productdetail.jsp");
				
	}

}
