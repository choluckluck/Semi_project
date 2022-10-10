package seongmin.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.order.model.InterOrderDAO;
import seongmin.order.model.OrderDAO;
import seongmin.order.model.OrderVO;
import seongmin.product.model.InterProductDAO;
import seongmin.product.model.ProductDAO;
import seongmin.product.model.ProductVO;

public class orderDetail extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();

		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		session.setAttribute("loginuser", loginuser);//
		String order_code = request.getParameter("ord_code");
		
		InterOrderDAO odao = new OrderDAO();
		
		List<OrderVO> oList = new ArrayList<>();
		oList = odao.oderDetailList(order_code);		
		request.setAttribute("oList", oList);
		
		InterProductDAO pdao = new ProductDAO();
		
		
		List<ProductVO> detailList = new ArrayList<>();
		detailList = pdao.orderDetailList(order_code);
		System.out.println(detailList.get(0));
		
/////////////////////////////////////////////
		
		
		

		super.setViewPage("/WEB-INF/seongmin/orderDetail.jsp");
	}

}
