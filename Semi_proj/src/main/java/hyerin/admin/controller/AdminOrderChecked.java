package hyerin.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.order.model.InterOrderDAO;
import hyerin.order.model.OrderDAO;

public class AdminOrderChecked extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		//get방식 => 주문상태를 일괄로 변경해준다 
		if("get".equalsIgnoreCase(method)) {
			
			String updateOrderstate = request.getParameter("updateOrderstate");
			String order_codeJoin = request.getParameter("order_codeJoin");
			
			if("1".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="입금전";}
			if("2".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="결제확인";}
			if("3".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="상품준비중";}
			if("4".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="배송중";}
			if("5".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="배송완료";}
			if("6".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="취소";}
			if("7".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="교환";}
			if("8".equalsIgnoreCase(updateOrderstate)) {updateOrderstate="반품";}
			
			String[] order_codeArr = order_codeJoin.split("\\,");
			
			Map<String, Object> paraMap = new HashMap<>();
			paraMap.put("order_codeArr", order_codeArr);
			paraMap.put("updateOrderstate", updateOrderstate);
			
			InterOrderDAO odao = new OrderDAO();
			
			
			//체크된 주문들의 주문상태를 변경해준다
			int n = odao.updateOrderStateChecked(paraMap);
			
			String message= "";
			if(n==1) {
				message = "주문 상태가 변경되었습니다.";
			}
			else {
				message = "주문 상태를 변경하지 못했습니다.";
			}
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("message", message);
			
			String json = jsonobj.toString();
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		}
		//post 방식 => 일괄로 삭제해준다
		else {
			String order_codeJoin = request.getParameter("order_codeJoin");
			String[] order_codeArr = order_codeJoin.split("\\,");
			
			InterOrderDAO odao = new OrderDAO();
			
			//체크된 주문들의 주문상태를 변경해준다
			int n = odao.deleteOrderChecked(order_codeArr);
			
			String message= "";
			if(n==1) {
				message = "선택한 주문이 모두 삭제되었습니다.";
			}
			else {
				message = "주문 삭제가 실패되었습니다.";
			}
			
			JSONObject jsonobj = new JSONObject();
			jsonobj.put("message", message);
			
			String json = jsonobj.toString();
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
			
		}//end of post
		
	}

}
