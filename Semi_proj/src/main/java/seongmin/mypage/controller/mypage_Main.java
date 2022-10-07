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
import seongmin.product.model.ProductVO;

public class mypage_Main extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession(); 
		  
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		session.setAttribute("loginuser", loginuser);

		String userid = loginuser.getUserid();

		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		
		InterOrderDAO odao = new OrderDAO();
		List<OrderVO> recentOrderList = odao.recentOrderList1(paraMap);
		request.setAttribute("recentOrderList", recentOrderList);
		////////////////////////////////////////////////////////
		
		List<Integer> totalOrderList = new ArrayList<>();
		totalOrderList = odao.totalOrderList(paraMap);		
		int total_amount = totalOrderList.get(0);
		int total_count = totalOrderList.get(1);
		
		request.setAttribute("total_amount", total_amount);
		request.setAttribute("total_count", total_count);
		///////////////////////////////////////////
		
		List<ProductVO> likeList = new ArrayList<>();
		likeList = odao.likeList(paraMap);
		
		request.setAttribute("likeList", likeList);
		
		
		super.setViewPage("/WEB-INF/seongmin/mypage_Main.jsp");
		
	}

}
