package seongmin.qna.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import seongmin.product.model.InterProductDAO;
import seongmin.product.model.ProductDAO;

public class QnaRegister extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String userid = loginuser.getUserid();				
		String prod_code = request.getParameter("fk_prod_code");
	
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("prod_code", prod_code);
		InterProductDAO pdao = new ProductDAO();
		
		List<String> prod_info = new ArrayList<>();
		prod_info = pdao.getprod_info2(paraMap);
		String prod_name = prod_info.get(0);
		String prod_image = prod_info.get(1);

		request.setAttribute("prod_code", prod_code);
		request.setAttribute("prod_name", prod_name);
		request.setAttribute("prod_image", prod_image);
		request.setAttribute("userid", userid);

		
		
		super.setViewPage("/WEB-INF/heajun/board/qna_write.jsp");
	}

}
