package jihee.product.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import jihee.product.model.InterProductDAO;
import jihee.product.model.ProductDAO;

public class BagDel extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if(!"post".equalsIgnoreCase(method)) { //get방식은 허용하지 않음
			String message = "비정상적인 경로로 접근하셨습니다.";
			String loc = "javascript:history.back()";
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			    
			 //   super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
		}
		
		
		else {
			//post 방식이고 로그인을 했다면(로그인처리아직안함)
			
			String cartno = request.getParameter("cartno");

			
			InterProductDAO pdao = new ProductDAO();
			
			//장바구니 테이블에서 특정제품을 장바구니에서 지우기
			int n = pdao.delCart(cartno);
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("n", n); //{n:1}
			
			String json = jsonObj.toString(); // "{n:1}"
			
			request.setAttribute("json", json);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
			
		}//end of else

	}

}
