package seongmin.product.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import common.controller.AbstractController;
import seongmin.order.model.InterOrderDAO;
import seongmin.order.model.OrderDAO;

public class IsRegistered extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();
		
		//post 방식이라면
		if("POST".equalsIgnoreCase(method)) {

			/*
			 * String message = "먼저 로그인을 하세요!!"; String loc = "javascript:history.back()";
			 * 
			 * request.setAttribute("message", message); request.setAttribute("loc", loc);
			 * 
			 * // super.setRedirect(false);
			 */
			super.setViewPage("/WEB-INF/seongmin/myPage_Main.jsp");
	
		}//end of if
		
		//get 방식이라면
		else  {
			boolean isRegistered = false;
			
			String fk_userid = request.getParameter("fk_userid");
			String fk_prod_code = request.getParameter("fk_prod_code");
						
			/*
			 * HttpSession session = request.getSession(); MemberVO loginuser =
			 * (MemberVO)session.getAttribute("loginuser"); String userid =
			 * loginuser.getUserid();
			 */			
			
			
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("fk_userid", fk_userid);
			paraMap.put("fk_prod_code", fk_prod_code);
		
			InterOrderDAO odao = new OrderDAO();
			
			int n = odao.isRegistered(paraMap);
			
			
			
			if(n == 2) { // 리뷰 작성이 가능한 경우
				

				isRegistered = true;
				
				JSONObject jsobj = new JSONObject();
				jsobj.put("isRegistered", isRegistered);
				
				String json1 = jsobj.toString();
				request.setAttribute("json1", json1);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
			}
			
			else {
				
				JSONObject jsobj = new JSONObject();
				jsobj.put("isRegistered", isRegistered);
				
				String json1 = jsobj.toString();
				request.setAttribute("json1", json1);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
				
			}
			
			
		}//end of else if	
		
	}

}
