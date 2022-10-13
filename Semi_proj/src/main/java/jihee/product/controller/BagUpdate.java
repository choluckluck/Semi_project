package jihee.product.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.simple.JSONObject;

import common.controller.AbstractController;
import jihee.product.model.*;

import seongmin.login.model.MemberVO;

public class BagUpdate extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");		
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);
		

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
		String method = request.getMethod(); //"GET" 또는 "POST"
		
		System.out.println("method :" + method);
		if("POST".equalsIgnoreCase(method) ) {
			
			String cart_code = request.getParameter("cart_codeJoin");
			
			System.out.println("cart_code : " + cart_code);
			
			
			
			InterProductDAO pdao = new ProductDAO();
			
			
			paraMap.put("cart_code", cart_code);  
			
			
			
			List<cartVO> cartModalList = pdao.selectCartListOne(paraMap);
			
			request.setAttribute("cartModalList", cartModalList);
			
			
			//List<ProductVO> bestProductList = pdao.selectBestProduct(paraMap);
			
			
		
			 for(cartVO cvo : cartModalList) {
			 
			  
			  
			 
			 System.out.println(cvo.getFk_prod_size());
			  
			  }// end of for----------------------------
			
				
			
			//request.setAttribute("bestProductList", bestProductList);
			
			/*List<cartVO> prodList = pdao.selectCartListOne(paraMap);
			
			JSONArray jsonArr = new JSONArray(); 

			if( prodList.size() > 0 ) {
				
				for(cartVO cvo : prodList) {
					
					JSONObject jsonObj = new JSONObject(); // {}  {}  {}
					 
					jsonObj.put("cart_code", cvo.getCart_code());// {"pnum":36, "pname":"노트북30", "code":"100000", ..... }
					jsonObj.put("prod_code", cvo.getFk_prod_code());
					jsonObj.put("prod_color", cvo.getFk_prod_color());
					jsonObj.put("prod_size", cvo.getFk_prod_size());
					jsonObj.put("prod_size", cvo.getProd().getProd_code());
					jsonObj.put("prod_size", cvo.getProd().getProd_code());
					
					
					jsonArr.put(jsonObj); // [{},{},{}]
				}// end of for----------------------------
				
				String json = jsonArr.toString(); //  문자열로 변환 
				                                  // "[{},{},{}]"
				System.out.println("~~~ 확인용 json => " + json);
			
			
			
          
            request.setAttribute("json", json);
            */
            
            super.setRedirect(false);
            super.setViewPage("/WEB-INF/jihee/bag/bag.jsp");

			
			}
	   
		else {
			
		
		}
		
		}// END OF IF

  }

