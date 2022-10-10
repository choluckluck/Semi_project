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

		String method = request.getMethod();

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		session.setAttribute("loginuser", loginuser);//
		String order_code = request.getParameter("ord_code");
		System.out.println(order_code);

		super.setViewPage("/WEB-INF/seongmin/orderDetail.jsp");
	}

}
