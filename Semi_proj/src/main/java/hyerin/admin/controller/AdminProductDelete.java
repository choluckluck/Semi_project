package hyerin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import seongmin.login.model.MemberVO;

public class AdminProductDelete extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
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
		
				String method = request.getMethod();
				// get방식이라면 => 상품 1개만 삭제해준다
				if("get".equalsIgnoreCase(method)) {
					String prod_code = request.getParameter("prod_code");
					InterProductDAO pdao = new ProductDAO();
					
					//한 상품을 삭제하기
					int deleteResult = pdao.deleteOneProduct(prod_code);
					
					String message = "";
					if(deleteResult == 1) {
						message = "상품번호 " + prod_code + "가 삭제되었습니다.";
					}
					else { //뜨면 안됨
						message = "상품번호 "+ prod_code + "의 삭제가 실패되었습니다.";
					}
					
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("message",message);
					
					String json = jsonObj.toString();
					
					request.setAttribute("json", json);
					super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
				}
				//post방식이라면 => 체크된 여러 상품을 삭제해준다
				else {
					String prod_codeJoin = request.getParameter("prod_codeJoin");
					String[] prod_codeArr = prod_codeJoin.split("\\,");
					
					InterProductDAO pdao = new ProductDAO();
					Map<String, String[]> paraMap = new HashMap<>();
					paraMap.put("prod_codeArr", prod_codeArr);
					
					//해당하는 상품들을 삭제해준다
					int deleteMultiResult = pdao.deleteMultiProduct(paraMap);
					
					String message = "";
					if(deleteMultiResult==1) {
						message = "선택한 상품이 모두 삭제되었습니다.";
					}
					else {
						message = "선택한 상품의 삭제가 실패되었습니다.";
					}
					
					JSONObject jsonObj = new JSONObject();
					jsonObj.put("message",message);
					
					String json = jsonObj.toString();
					
					request.setAttribute("json2", json);
					super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
				}
			}
		}
	}

}
