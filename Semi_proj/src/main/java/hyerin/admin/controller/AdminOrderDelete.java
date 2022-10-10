package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.order.model.InterOrderDAO;
import hyerin.order.model.OrderDAO;

public class AdminOrderDelete extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String order_code = request.getParameter("order_code");
		
		InterOrderDAO odao = new OrderDAO();
		
		//받아온 order_code로 주문을 삭제해준다
		int n = odao.deleteOneOrder(order_code);
		
		String message= "";
		if(n==1) {
			message = "주문코드 '" + order_code + "'가 삭제되었습니다.";
		}
		else {
			message = "주문 삭제가 실패되었습니다.";
		}
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("message", message);
		
		String json = jsonobj.toString();
		
		request.setAttribute("json", json);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		
	}

}
