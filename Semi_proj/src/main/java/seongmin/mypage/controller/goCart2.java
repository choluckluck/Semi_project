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

public class goCart2 extends AbstractController {

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
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
			String userid = loginuser.getUserid();
			
			String fk_prod_codejoin = request.getParameter("fk_prod_codejoin");
			String prod_namejoin = request.getParameter("prod_namejoin");
			String fk_prod_colorjoin = request.getParameter("fk_prod_colorjoin");
			String fk_prod_sizejoin = request.getParameter("fk_prod_sizejoin");

			String[] fk_prod_codeArr = fk_prod_codejoin.split("\\,");
			String[] prod_nameArr = prod_namejoin.split("\\,");
			String[] fk_prod_colorArr = fk_prod_colorjoin.split("\\,");
			String[] fk_prod_sizeArr = fk_prod_sizejoin.split("\\,");

						
			Map<String, Object> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("fk_prod_codeArr", fk_prod_codeArr);
			paraMap.put("prod_nameArr", prod_nameArr);
			paraMap.put("fk_prod_colorArr", fk_prod_colorArr);
			paraMap.put("fk_prod_sizeArr", fk_prod_sizeArr);
						
			InterCartDAO cdao = new CartDAO();

			//관심상품 테이블에 특정 제품이 존재하는지
//			int n = cdao.isExist2(paraMap);
//			System.out.println(n);

			
			
			int n = cdao.goCart2(paraMap);

			
			JSONObject jsobj = new JSONObject();
			jsobj.put("n", n);

			String json = jsobj.toString();
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}//end of else if

		
		
		

	}
	
}
