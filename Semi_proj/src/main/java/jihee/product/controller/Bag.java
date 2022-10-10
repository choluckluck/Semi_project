package jihee.product.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import jihee.product.model.*;
import seongmin.login.model.MemberVO;


public class Bag extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");		
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);
		

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
	

		 
		   InterProductDAO pdao = new ProductDAO();
		   


		   
		   List<ProductVO> cartList = new ArrayList<>();
		   cartList = pdao.selectCartList(paraMap);		   

		   request.setAttribute("cartList", cartList);
		   
		   
		 
			
			
			
	
		
		
		//super.setRedirect(false);
	    super.setViewPage("/WEB-INF/jihee/bag/bag.jsp");

	}

}
