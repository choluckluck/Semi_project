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
import seongmin.product.model.ProductVO;

public class QnaRegister2 extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String userid = loginuser.getUserid();				
		String fk_prod_code = request.getParameter("fk_prod_code");
	
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("fk_prod_code", fk_prod_code);
		paraMap.put("userid", userid);
		InterProductDAO pdao = new ProductDAO();
		
		List<ProductVO> prod_infoList2 = new ArrayList<>();
		prod_infoList2 = pdao.getprod_info3(paraMap);
//		String prod_name = prod_info.get(0);
//		String prod_image = prod_info.get(1);

		request.setAttribute("prod_infoList2", prod_infoList2);
//		request.setAttribute("prod_name", prod_name);
//		request.setAttribute("prod_image", prod_image);
//		request.setAttribute("userid", userid);

		
		
		super.setViewPage("/WEB-INF/heajun/board/qna_write2.jsp");
	}

}
