package seongmin.mypage.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.order.model.InterOrderDAO;
import seongmin.order.model.OrderDAO;
import seongmin.order.model.OrderVO;
import my.util.MyUtil;

public class orderView extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);

		
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String order_state = request.getParameter("order_state");
		
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
		
		/*
		 * if(startDate == null ) { startDate = "1"; }
		 * 
		 * if(endDate == null ) { endDate = "1"; }
		 */
				
		
		paraMap.put("startDate", startDate);
		paraMap.put("endDate", endDate);
		paraMap.put("order_state", order_state);
		
		String sizePerPage = "5";
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

		   InterOrderDAO odao = new OrderDAO();
	   
		   // 페이징 처리를 위해 검색이 있거나 없는 전체 주문에 대한 총 페이지 알아오기
		   int totalPage = odao.getTotalPage(paraMap);
		   System.out.println(totalPage);
	   
		   if( Integer.parseInt(currentShowPageNo) > totalPage ) {
			   currentShowPageNo = "1";
		   }
		     
	
		   List<OrderVO> recentOrderList = odao.recentOrderList(paraMap);
		   
		   List<OrderVO> rowspan = odao.rowspan(paraMap);
		   System.out.println("하하");
		
		
		
		// 타입 : OrderVO
		
		request.setAttribute("rowspan", rowspan);
		request.setAttribute("recentOrderList", recentOrderList);
		request.setAttribute("sizePerPage", sizePerPage);

		List<Integer> totalOrderList = new ArrayList<>();
		totalOrderList = odao.totalOrderList(paraMap);		
		int total_amount = totalOrderList.get(0);
		int total_count = totalOrderList.get(1);

		request.setAttribute("total_amount", total_amount);
		request.setAttribute("total_count", total_count);
		
		
		
		// 페이지바 만들기
		
		   String pageBar = "";
		   
		   int blockSize = 10; // blockSize 는 블럭(토막)당 보여지는 페이지 번호의 개수이다. 
		   int loop = 1; // loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개)까지만 증가하는 용도이다. 
		   
//		   System.out.println(currentShowPageNo);
		   
		   // !!!! 다음은 pageNo 를 구하는 공식이다. !!!! //
			int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		   // pageNo 는 페이지바에서 보여지는 첫번째 번호이다.
		   
//			System.out.println(pageNo);
		   ///////////////////////////////////////////////
		   

		   if(startDate == null) {
			   startDate = ""; 
		   }
		   
		   if(endDate == null) {
			   endDate = "";
		   }
		   
		   if("all".equalsIgnoreCase(order_state) || order_state == null) {
			   order_state = "";
		   }
		   
		   request.setAttribute("startDate", startDate);
		   request.setAttribute("endDate", endDate);
		   request.setAttribute("order_state", order_state);
		   
		   // **** [맨처음][이전] 만들기 **** //
		   if(pageNo != 1) {
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo=1&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[맨처음]</a></li>"; 
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[이전]</a></li>";
		   }
		   System.out.println(pageBar);
	   
		   while( !(loop > blockSize || pageNo > totalPage) ) {
			   
			   if( pageNo == Integer.parseInt(currentShowPageNo) ) {
				   pageBar += "<li class='page-item active'><a class='page-link' href='#'>"+pageNo+"</a></li>"; 
			   }
			   else {
				   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>"+pageNo+"</a></li>";   
			   }
			   loop++;   //    1 2 3 4 5 6 7 8 9 10
			   
			   pageNo++; //    1  2  3  4  5  6  7  8  9 10
			             //   11 12 13 14 15 16 17 18 19 20
			             //   21 
			             //   위의 것은 sizePerPage 가 10 일때 페이지바이다.    
			   
		   }// end of while--------------------
		   
		   // **** [다음][마지막] 만들기 **** //
		   // 첫번째 블럭(1  2  3  4  5  6  7  8  9 10) 인 경우 pageNo 11 이고
		   // 두번째 블럭(11 12 13 14 15 16 17 18 19 20) 인 경우 pageNo 21 이고
		   // 세번째 블럭(21) 인 경우 pageNo 22 가 된다.
		   
		   if( pageNo <= totalPage ) {
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[다음]</a></li>"; 
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[마지막]</a></li>";
		   }
		     
		   request.setAttribute("pageBar", pageBar);		   
		   
			/*
			 * String currentURL = MyUtil.getCurrentURL(request);
			 * 
			 * currentURL = currentURL.replaceAll("&", " ");
			 * 
			 * request.setAttribute("goBackURL", currentURL);
			 */

		super.setRedirect(false);			
		super.setViewPage("/WEB-INF/seongmin/orderView.jsp");
		
	}

}
