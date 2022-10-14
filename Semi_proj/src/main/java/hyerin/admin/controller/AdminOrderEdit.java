package hyerin.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyerin.order.model.InterOrderDAO;
import hyerin.order.model.OrderDAO;
import hyerin.order.model.OrderDetailVO;
import hyerin.order.model.OrderVO;
import seongmin.login.model.MemberVO;

public class AdminOrderEdit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String method = request.getMethod();
		
		if(!super.checkLogin(request)) { //로그인되지 않은 상태라면
			
			String message = "로그인 해주세요.";
	        String loc = request.getContextPath() + "/hyerin/login/login.sue";
	        
	        request.setAttribute("message", message);
	        request.setAttribute("loc", loc);
	        
	     //   super.setRedirect(false);
	        super.setViewPage("/WEB-INF/msg.jsp");
	        
		}
		else {
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			if(!"admin".equals(loginuser.getUserid()) ) {
				 // == 관리자(admin)가 아닌 일반사용자로 로그인했을 때는 조회가 불가능하도록 한다.
				String message = "관리자 이외는 접근이 불가능합니다.";
				String loc = request.getContextPath() + "/main.sue";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	         //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/msg.jsp");
			}
			else {
			
				//GET방식인 경우 => 주문정보를 불러온다
				if("GET".equalsIgnoreCase(method)) {
					String order_code = request.getParameter("order_code");
					InterOrderDAO odao = new OrderDAO();
					
					//오더코드로 주문정보 불러오기
					OrderVO ovo = odao.getOneOrder(order_code);
					
					//오더코드로 주문상세정보 불러오기
					List<OrderDetailVO> odvoList = odao.getOneOrderDetail(order_code); 
					
					request.setAttribute("ovo", ovo);
					request.setAttribute("odvoList", odvoList);
					super.setViewPage("/WEB-INF/hyerin/admin/adminOrderEdit.jsp");
					
				}
				//POST 방식이라면 => 주문상태를 업데이트해준다
				else {
					
					request.setCharacterEncoding("EUC-KR");
					
					String order_code = request.getParameter("order_code");
					String fk_order_state_name = request.getParameter("fk_order_state_name");
					
					if("1".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="입금전";}
					if("2".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="결제확인";}
					if("3".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="상품준비중";}
					if("4".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="배송중";}
					if("5".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="배송완료";}
					if("6".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="취소";}
					if("7".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="교환";}
					if("8".equalsIgnoreCase(fk_order_state_name)) {fk_order_state_name="반품";}
					
					
					InterOrderDAO odao = new OrderDAO();
					
					//주문상태를 변경해준다
					int n = odao.updateOrderstate(order_code, fk_order_state_name);
					
					String message= "";
					String loc = "";
							
					if(n==1) {
						message = "주문 상태가 변경되었습니다.";
						loc = "adminOrderEdit.sue?order_code="+order_code;
					}
					else {
						message = "주문 상태를 변경하지 못했습니다.";
						loc = "adminOrderEdit.sue?order_code="+order_code;
					}
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					super.setViewPage("/WEB-INF/hyerin/admin/adminMsg.jsp");
					
				}//end of else
			}
		}
	}

}
