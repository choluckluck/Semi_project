package hasol.purchase.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyerin.order.model.InterOrderDAO;
import hyerin.order.model.OrderDAO;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class PurchaseEndAfterInsertOrder extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		//post 방식일때 => 구매해준다 (주문테이블에 insert)
		if("post".equalsIgnoreCase(method)) {
			
			
//			frm.totalUserpoint.value = totalUserpoint;
//			frm.totalRealamount.value = real_amount;
//			frm.totalOrderamount.value = order_amount;
//			frm.pointUseamount.value = point_use_amount;
//			frm.discountamount.value = discountamount;
//			frm.deliveryfee.value = deliveryfee;
//			frm.prod_code.value = prod_codeJoin;
//			frm.order_buy_count.value = countJoin;
//			frm.order_price.value = priceJoin;
//			frm.prod_color.value = colorJoin;
//			frm.prod_size.value = sizeJoin;
			
			//tbl_order에 insert해야할 정보
			// 오더코드 채번
			InterOrderDAO odao = new OrderDAO();
			String order_code = odao.getOrderCode();
			String userid = request.getParameter("userid");
			
			String totalUserpoint = request.getParameter("totalUserpoint");
			String totalRealamount = request.getParameter("totalRealamount");
			String totalOrderamount = request.getParameter("totalOrderamount");
			String pointUseamount = request.getParameter("pointUseamount");
			String discountamount = request.getParameter("discountamount");
			String deliveryfee = request.getParameter("deliveryfee");
			
			//tbl_order_detail에 insert 해야할 정보
			String prod_codeJoin = request.getParameter("prod_code");
			String order_buy_countJoin = request.getParameter("order_buy_count");
			String order_priceJoin = request.getParameter("order_price");
			String prod_colorJoin = request.getParameter("prod_color");
			String prod_sizeJoin = request.getParameter("prod_size");
			
			String[] prod_codeArr = prod_codeJoin.split("\\,");
			String[] order_buy_countArr = order_buy_countJoin.split("\\,");
			String[] order_priceArr = order_priceJoin.split("\\,");
			String[] prod_colorArr = prod_colorJoin.split("\\,");
			String[] prod_sizeArr = prod_sizeJoin.split("\\,");
			
			//지워야 할 cart code
			String cart_codeJoin = request.getParameter("cart_codeJoin");
			
			
			Map<String, Object> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("totalUserpoint", totalUserpoint);
			paraMap.put("totalRealamount", totalRealamount);
			paraMap.put("totalOrderamount", totalOrderamount);
			paraMap.put("pointUseamount", pointUseamount);
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
			
			
			
		}//end of post
		
		
		
	}

}
