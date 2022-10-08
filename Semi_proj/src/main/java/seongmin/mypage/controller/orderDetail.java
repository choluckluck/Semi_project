package seongmin.mypage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.order.model.OrderVO;

public class orderDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String userid = loginuser.getUserid();		
		session.setAttribute("loginuser", loginuser);
		
		List<OrderVO> recentOrderList = (List<OrderVO>) session.getAttribute("recentOrderList");
		

		

		super.setViewPage("/WEB-INF/seongmin/orderDetail.jsp");
	}

}
