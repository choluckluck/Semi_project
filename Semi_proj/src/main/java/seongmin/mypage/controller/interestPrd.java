package seongmin.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.order.model.InterOrderDAO;
import seongmin.order.model.OrderDAO;
import seongmin.order.model.OrderVO;
import seongmin.product.model.ProductDAO;
import seongmin.product.model.ProductVO;

public class interestPrd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();
		
		session.setAttribute("loginuser", loginuser);
		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);

		/*
		 * ProductDAO pdao = new ProductDAO(); List<ProductVO> likeList = new
		 * ArrayList<>();
		 * 
		 * likeList = pdao.interestList(paraMap);
		 */

				
		
		super.setViewPage("/WEB-INF/seongmin/interestPrd.jsp");
		
	}

}
