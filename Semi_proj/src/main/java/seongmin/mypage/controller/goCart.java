package seongmin.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.order.model.CartDAO;
import seongmin.order.model.InterCartDAO;
import seongmin.product.model.InterLikeDAO;
import seongmin.product.model.LikeDAO;

public class goCart extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		//get 방식이라면
		if(!"POST".equalsIgnoreCase(method)) {

			/*
			 * String message = "먼저 로그인을 하세요!!"; String loc = "javascript:history.back()";
			 * 
			 * request.setAttribute("message", message); request.setAttribute("loc", loc);
			 * 
			 * // super.setRedirect(false);
			 */
			super.setViewPage("/WEB-INF/seongmin/myPage_Main.jsp");
	
		}//end of if
		
		//post 방식이라면
		else  {
			
			String fk_prod_code = request.getParameter("fk_prod_code");
			String prod_name = request.getParameter("prod_name");
			String fk_prod_color = request.getParameter("fk_prod_color");
			String fk_prod_size = request.getParameter("fk_prod_size");
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			String userid = loginuser.getUserid();
			
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("fk_prod_code", fk_prod_code);
			paraMap.put("prod_name", prod_name);
			paraMap.put("fk_prod_color", fk_prod_color);
			paraMap.put("fk_prod_size", fk_prod_size);
			paraMap.put("userid", userid);
			
			InterCartDAO cdao = new CartDAO();
			
			//관심상품 테이블에 특정 제품이 존재하는지
			int n = cdao.isExist(paraMap);
			System.out.println(n);
			
			if(n == 2) {
				// 관심상품 테이블에서 특정 제품 장바구니 추가하기
				int n1 = cdao.goCart(paraMap);
				
				JSONObject jsobj = new JSONObject();
				jsobj.put("n", n1);
				
				String json = jsobj.toString();
				request.setAttribute("json", json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
			}
			
			// 관심상품 테이블에서 장바구니에 있는 데이터를 또 넣어주면 수량 + 1
			else if ( n == 1) {
				int n2 = cdao.updateCart(paraMap);
				
				JSONObject jsobj = new JSONObject();
				jsobj.put("n", n2);
				
				String json = jsobj.toString();
				request.setAttribute("json", json);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/jsonview.jsp");
				
			}
			
		}//end of else if	
		
	}

}
