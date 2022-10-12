package hasol.purchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyerin.order.model.InterOrderDAO;
import hyerin.order.model.OrderDAO;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductVO;
import seongmin.login.model.MemberVO;
import hyerin.member.controller.GoogleMail;

public class PurchaseEndAfterInsertOrder extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
//		
//		//post 방식일때 => 구매해준다 (주문테이블에 insert)
		if("post".equalsIgnoreCase(method)) {
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			//tbl_order에 insert해야할 정보
			// 오더코드 채번
			InterOrderDAO odao = new OrderDAO();
			String order_code = odao.getOrderCode();
			String userid = request.getParameter("userid");
			
			String totalOnePriceJoin = request.getParameter("totalOnePriceJoin");
			String totalRealamount = request.getParameter("totalRealamount");
			String totalOrderamount = request.getParameter("totalOrderamount");
			String userusePoint = request.getParameter("userusePoint");
			if(userusePoint == null || "".equals(userusePoint)) {userusePoint = "0";}
			String prodPoint = request.getParameter("prodPoint");
			String discountamount = request.getParameter("discountamount");
			String deliveryfee = request.getParameter("deliveryfee");
			
			//tbl_order_detail에 insert 해야할 정보
			String prod_codeJoin = request.getParameter("prod_code");
			String order_buy_countJoin = request.getParameter("order_buy_count");
			String order_priceJoin = request.getParameter("order_price");
			String prod_colorJoin = request.getParameter("prod_color");
			String prod_sizeJoin = request.getParameter("prod_size");
			
			String[] totalOnePriceArr = totalOnePriceJoin.split("\\,");
			String[] prod_codeArr = prod_codeJoin.split("\\,");
			String[] order_buy_countArr = order_buy_countJoin.split("\\,");
			String[] order_priceArr = order_priceJoin.split("\\,");
			String[] prod_colorArr = prod_colorJoin.split("\\,");
			String[] prod_sizeArr = prod_sizeJoin.split("\\,");
			
			//지워야 할 cart code
			String cart_codeJoin = request.getParameter("cart_codeJoin");
			
			Map<String, Object> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("totalOnePriceArr", totalOnePriceArr);
			paraMap.put("totalRealamount", totalRealamount);
			paraMap.put("totalOrderamount", totalOrderamount);
			paraMap.put("userusePoint", userusePoint);
			paraMap.put("prodPoint", prodPoint);
			paraMap.put("discountamount", discountamount);
			paraMap.put("deliveryfee", deliveryfee);
			paraMap.put("prod_codeArr", prod_codeArr);
			paraMap.put("order_buy_countArr", order_buy_countArr);
			paraMap.put("order_priceArr", order_priceArr);
			paraMap.put("prod_colorArr", prod_colorArr);
			paraMap.put("prod_sizeArr", prod_sizeArr);
			paraMap.put("cart_codeJoin", cart_codeJoin);
			paraMap.put("order_code", order_code);
			
			
			InterProductDAO pdao = new ProductDAO();
			// transaction 메소드
			int nSuccess = pdao.orderAdd(paraMap);
			System.out.println("확인용 nSuccess : " + nSuccess);
			
			if(nSuccess == 1) {
				// 주문 완료 email 보내주기 //
				GoogleMail mail = new GoogleMail();
				
				List<ProductVO> orderedProductList = pdao.getOrderedProductList(prod_codeArr);
				//주문한 제품에 대해 email 보내기시 email 내용에 넣을 주문한 제품번호들에 대한 제품정보를 얻어옴
				
				StringBuilder sb = new StringBuilder();
				sb.append("주문번호 : <span style='color:blue; font-weight:bold;'>"+order_code+"</span><br><br>");
				sb.append("<주문상품><br>");
				
				for(int i=0; i<orderedProductList.size(); i++) {
					sb.append(orderedProductList.get(i).getProd_name() + "&nbsp;" + order_buy_countArr[i] + "개&nbsp;&nbsp;");
					sb.append("<img src='http://127.0.0.1:9090/Semi_proj/images/product/"+ orderedProductList.get(i).getProd_image() +"' />");
					sb.append("<br>");
				}//end of for
				
				sb.append("<br>저희 쇼핑몰을 이용해주셔서 감사합니다.");
				
				String emailContents = sb.toString();
				
				mail.sendmail_OrderFinish(loginuser.getEmail(), loginuser.getName(), emailContents);
				
				
				//세션에 저장되어있는 loginuser의 point를 갱신
				try {
					loginuser.setPoint(loginuser.getPoint() + Integer.parseInt(prodPoint) - Integer.parseInt(userusePoint));
				}
				catch (NumberFormatException e) {
					loginuser.setPoint(loginuser.getPoint() + Integer.parseInt(prodPoint) );
				}
				
				// 주문정보를 불러와서 뿌려주기
				List<ProductVO> pvoList = pdao.getOrderProductsInfo(paraMap);
				
				request.setAttribute("pvoList", pvoList);
				request.setAttribute("paraMap", paraMap);
				super.setViewPage("/WEB-INF/hasol/purchase/orderComplete.jsp");
			}//end of nSuccess
			//실패한경우 => 에러메세지를 띄워서 보내준다
			else {
				request.setAttribute("paraMap", paraMap);
				super.setViewPage("/WEB-INF/hasol/purchase/orderError.jsp");
			}
			
			
		}//end of post
		
		
		
	}

}
