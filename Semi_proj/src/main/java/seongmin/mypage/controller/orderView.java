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
	   
		   // ????????? ????????? ?????? ????????? ????????? ?????? ?????? ????????? ?????? ??? ????????? ????????????
		   int totalPage = odao.getTotalPage(paraMap);
		   System.out.println(totalPage);
	   
		   if( Integer.parseInt(currentShowPageNo) > totalPage ) {
			   currentShowPageNo = "1";
		   }
		     
	
		   List<OrderVO> recentOrderList = odao.recentOrderList(paraMap);
		   
		   List<OrderVO> rowspan = odao.rowspan(paraMap);
		   System.out.println("??????");
		
		
		
		// ?????? : OrderVO
		
		request.setAttribute("rowspan", rowspan);
		request.setAttribute("recentOrderList", recentOrderList);
		request.setAttribute("sizePerPage", sizePerPage);

		List<Integer> totalOrderList = new ArrayList<>();
		totalOrderList = odao.totalOrderList(paraMap);		
		int total_amount = totalOrderList.get(0);
		int total_count = totalOrderList.get(1);

		request.setAttribute("total_amount", total_amount);
		request.setAttribute("total_count", total_count);
		
		
		
		// ???????????? ?????????
		
		   String pageBar = "";
		   
		   int blockSize = 10; // blockSize ??? ??????(??????)??? ???????????? ????????? ????????? ????????????. 
		   int loop = 1; // loop??? 1?????? ???????????? 1??? ????????? ????????? ?????????????????? ??????(????????? 10???)????????? ???????????? ????????????. 
		   
//		   System.out.println(currentShowPageNo);
		   
		   // !!!! ????????? pageNo ??? ????????? ????????????. !!!! //
			int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		   // pageNo ??? ?????????????????? ???????????? ????????? ????????????.
		   
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
		   
		   // **** [?????????][??????] ????????? **** //
		   if(pageNo != 1) {
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo=1&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[?????????]</a></li>"; 
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[??????]</a></li>";
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
			             //   ?????? ?????? sizePerPage ??? 10 ?????? ??????????????????.    
			   
		   }// end of while--------------------
		   
		   // **** [??????][?????????] ????????? **** //
		   // ????????? ??????(1  2  3  4  5  6  7  8  9 10) ??? ?????? pageNo 11 ??????
		   // ????????? ??????(11 12 13 14 15 16 17 18 19 20) ??? ?????? pageNo 21 ??????
		   // ????????? ??????(21) ??? ?????? pageNo 22 ??? ??????.
		   
		   if( pageNo <= totalPage ) {
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[??????]</a></li>"; 
			   pageBar += "<li class='page-item'><a class='page-link' href='orderView.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"&startDate="+startDate+"&endDate="+endDate+"&order_state="+order_state+"'>[?????????]</a></li>";
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
