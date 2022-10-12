package seongmin.mypage.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.product.model.InterLikeDAO;
import seongmin.product.model.LikeDAO;

public class LikeListDel2 extends AbstractController {

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
			
			String like_codejoin = request.getParameter("like_codejoin");
			
			InterLikeDAO ldao = new LikeDAO();			

			String[] like_codeArr = like_codejoin.split("\\,");

			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");			
			
			// 관심상품 테이블에서 특정 제품 비우기
			

			Map<String, Object> paraMap = new HashMap<>();			
			paraMap.put("like_codeArr", like_codeArr);

			int n = ldao.delLikeList(paraMap);

			
			JSONObject jsobj = new JSONObject();
			jsobj.put("n", n);

			String json = jsobj.toString();
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}//end of else if

		
		
		

	}
	
}
