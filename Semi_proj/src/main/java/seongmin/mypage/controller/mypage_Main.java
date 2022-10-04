package seongmin.mypage.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.order.model.InterOrderDAO;
import seongmin.order.model.OrderDAO;
import seongmin.order.model.OrderVO;

public class mypage_Main extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(); 
		  
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		
		String userid = loginuser.getUserid();

		
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
		InterOrderDAO odao = new OrderDAO();
		List<OrderVO> recentOrderList = odao.recentOrderList(paraMap);
		
		
		request.setAttribute("recentOrderList", recentOrderList);
		session.setAttribute("loginuser", loginuser);
		
		super.setViewPage("/WEB-INF/seongmin/mypage_Main.jsp");
		
	}

}
