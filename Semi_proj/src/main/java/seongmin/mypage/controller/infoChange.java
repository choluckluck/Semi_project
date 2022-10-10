package seongmin.mypage.controller;

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

public class infoChange extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	
		/*
		 * HttpSession session = request.getSession();
		 * 
		 * MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		 * session.setAttribute("loginuser", loginuser);
		 * 
		 * String userid = loginuser.getUserid();
		 * 
		 * Map<String, String> paraMap = new HashMap<>(); paraMap.put("userid", userid);
		 * 
		 * InterOrderDAO odao = new OrderDAO(); List<OrderVO> recentOrderList =
		 * odao.recentOrderList(paraMap);
		 * 
		 * request.setAttribute("recentOrderList", recentOrderList);
		 * 
		 * int total_amount = (int) request.getAttribute("total_amount"); int
		 * total_count = (int) request.getAttribute("total_count");
		 * 
		 * request.setAttribute("total_amount", total_amount);
		 * request.setAttribute("total_count", total_count);
		 * 
		 */			
			
			
            //	super.setRedirect(false);
				super.setViewPage("/WEB-INF/seongmin/infoChange.jsp");	
	
		
	}

}
