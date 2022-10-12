package heajun.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import heajun.product.model.InterProductDAO;
import heajun.product.model.ProductDAO;
import seongmin.login.model.MemberVO;

public class DirectOrder extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// == 로그인 유무 검사하기 == //
		boolean isLogin = super.checkLogin(request);
		
		if(!isLogin) {
			
			String loc = request.getContextPath()+"/hyerin/login/login.sue";
			request.setAttribute("message", "바로 구매하기를 하려면 먼저 로그인부터 하세요!");
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return; //종료
		}
		else {

			String method = request.getMethod();
			
			if("POST".equalsIgnoreCase(method)) {
				
				String prod_codeJoin = request.getParameter("prod_code");
			    String colorJoin = request.getParameter("prod_color");
			    String sizeJoin = request.getParameter("prod_size");
			    String countJoin = request.getParameter("qnty");
			    String priceJoin = request.getParameter("price"); //정상가
			    String salepriceJoin = request.getParameter("saleprice"); //판매가
			    String totalOnePriceJoin = request.getParameter("totalPrice"); // 판매가*수량
			    String deliveryfee = "0";
			    String pointJoin = request.getParameter("sumtotalpoint");
			    String totalorderprice = totalOnePriceJoin; //배송비 제외(판매가*수량과 같음)
			    String totalprice = String.valueOf(Integer.parseInt(totalOnePriceJoin) + Integer.parseInt(deliveryfee)); //배송비 합쳐서
			    
		      	HttpSession session = request.getSession();				
				MemberVO loginuser =  (MemberVO) session.getAttribute("loginuser");
				
				Map<String, String> DO_paraMap = new HashMap<>();
				
				DO_paraMap.put("prod_codeJoin", prod_codeJoin);
				DO_paraMap.put("colorJoin", colorJoin);
				DO_paraMap.put("sizeJoin", sizeJoin);
				DO_paraMap.put("countJoin", countJoin);
				DO_paraMap.put("priceJoin", priceJoin);
				DO_paraMap.put("salepriceJoin", salepriceJoin);
				DO_paraMap.put("totalOnePriceJoin", totalOnePriceJoin);
				// DO_paraMap.put("deliveryfee", deliveryfee); 멀겟네...
				DO_paraMap.put("pointJoin", pointJoin);
				DO_paraMap.put("totalorderprice", totalorderprice);
				DO_paraMap.put("totalprice", totalprice);
				
				System.out.println("DO_paraMap:"+DO_paraMap);
				
				request.setAttribute("DO_paraMap", DO_paraMap);
				super.setViewPage("/WEB-INF/hasol/purchase/purchase.jsp");
				
			}
			else { //GET 방식이라면 
				String message = "비정상적인 경로로 접근하셨습니다.";
				String loc = "javascript:history.back()";
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				    
				 //   super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}
			
		}
	}

}
