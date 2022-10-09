package hyerin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.order.model.InterOrderDAO;
import hyerin.order.model.OrderDAO;
import hyerin.order.model.OrderVO;

public class AdminOrderJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterOrderDAO odao = new OrderDAO();
		
		String orderstate = request.getParameter("orderstate"); // all, 입금대기, 결제확인...
		String searchBy = request.getParameter("searchBy"); // all, orderdate, total_order_amount, order_code, fk_userid
		String mindate = request.getParameter("mindate"); // null, 값
		String maxdate = request.getParameter("maxdate"); //null, 값
		String minprice = request.getParameter("minprice"); //null, 값
		String maxprice = request.getParameter("maxprice");  //null, 값
		String searchword = request.getParameter("searchword");  //null, 값
		String updateorderstate = request.getParameter("updateorderstate");  //all, 입금대기, 결제확인...
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if( orderstate == null || "all".equals(orderstate) ) { orderstate = ""; }
		if( searchBy == null || "all".equals(searchBy)) { searchBy = ""; }
		if( mindate == null ) { mindate = ""; }
		if( maxdate == null ) { maxdate = ""; }
		if( minprice == null ) { minprice = ""; }
		if( maxprice == null ) { maxprice = ""; }
		if( searchword == null ) { searchword = ""; }
		if( updateorderstate == null || "all".equals(updateorderstate)) { updateorderstate = ""; }
		
		
		//System.out.println(minprice + maxprice + searchword);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("orderstate", orderstate);
		paraMap.put("searchBy", searchBy);
		paraMap.put("mindate", mindate);
		paraMap.put("maxdate", maxdate);
		paraMap.put("minprice", minprice);
		paraMap.put("maxprice", maxprice);
		paraMap.put("searchword", searchword);
		paraMap.put("updateorderstate", updateorderstate);
		
		//페이징
		String sizePerPage = "3";
		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		
		try {
			if(Integer.parseInt(currentShowPageNo) < 1) {
				currentShowPageNo = "1";
			}
			
		} catch(NumberFormatException e) {
			currentShowPageNo = "1"; //숫자가 아닌 문자를 get방식으로 입력했을 때 무조건 1로 바꾸어준다
		}
		
		
		paraMap.put("sizePerPage", sizePerPage);
		paraMap.put("currentShowPageNo", currentShowPageNo);
		
		
		// 조회해올 주문의 총 페이지수 구하기
		int totalPage = odao.getTotalPage(paraMap);
		
		if ( Integer.parseInt(currentShowPageNo) > totalPage ) {
			currentShowPageNo = "1";
		}
		
		//페이징처리한 검색이 있는, 없는 주문목록 조회(select)
		List<OrderVO> ovoList = odao.selectPagingOrderList(paraMap);
		
		
		// 페이지바 구하기
		String pageBar = "";
		
		int blockSize = 10; //blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수
		int loop = 1; //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개) 까지만 증가하는 용도
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		

		if(pageNo != 1) {
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:orderList(1)'><i class='fas fa-angle-double-left'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:orderList("+(pageNo-1)+")'><i class='fas fa-angle-left'></i></a></li>";
		}
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='javascript:orderList("+pageNo+")'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
			
		}//end of while
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:orderList("+pageNo+")'><i class='fas fa-angle-right'></i></a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='javascript:orderList("+totalPage+")'><i class='fas fa-angle-double-right'></i></a></li>";
		}
		
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj = new JSONObject();
		
		
		jsonObj.put("sizePerPage", sizePerPage);
		jsonObj.put("pageBar", pageBar);
		jsonObj.put("currentShowPageNo", currentShowPageNo);
		jsonArr.put(jsonObj);
		
		if(ovoList.size()>0) {
			
			for(OrderVO ovo : ovoList) {
				JSONObject jsonObj2 = new JSONObject();
				//order_code, fk_userid, orderdate, fk_order_state_name, total_order_amount, real_amount
				jsonObj2.put("order_code", ovo.getOrder_code());
				jsonObj2.put("fk_userid", ovo.getFk_userid());
				jsonObj2.put("orderdate", ovo.getOrderdate());
				jsonObj2.put("fk_order_state_name", ovo.getFk_order_state_name());
				jsonObj2.put("total_order_amount", ovo.getTotal_order_amount());
				jsonObj2.put("real_amount", ovo.getReal_amount());
				
				jsonArr.put(jsonObj2);
			}//end of for
			
			String json = jsonArr.toString();
			request.setAttribute("json", json);
			
		}
		else {
			
			String json = jsonArr.toString();
			request.setAttribute("json", json);
			
		}
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
	}

}
