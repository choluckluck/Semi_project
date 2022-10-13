package common.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;
import hyerin.member.model.MemberVOhr;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductVO;
import seongmin.login.model.MemberVO;

public class Main extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
	
		
		if( super.checkLogin(request) ) { // 로그인을 했으면
		
			InterProductDAO pdao = new ProductDAO();
			
//			HttpSession session = request.getSession();
//			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
//			String userid = loginuser.getUserid();
			
			//Best => 주문순 많은 순으로 상품을 불러온다
			List<ProductVO> best_pvoList = pdao.selectBestProduct();
			
			//New arrival => 새로운 등록순으로 상품을 불러온다
			List<ProductVO> new_pvoList = pdao.selectNewProduct();
			
			//MD Pick => 노출여부 Y인 것만 랜덤으로 4개를 불러온다
			List<ProductVO> md_pvoList = pdao.selectMDProduct();
			
			
			//하트 클릭시 위시 처리 => 해당 유저의 위시상품을 불러온다
			
//			String wish_check = request.getParameter("wish_check");
//			boolean wish_check_result = mdao.selectLikeProduct("jinhr40", wish_check);
//			
//			String heart_result = "N";
//			if(wish_check_result) {
//				heart_result = "Y";
//			}
			
			
			request.setAttribute("best_pvoList", best_pvoList);
			request.setAttribute("new_pvoList", new_pvoList);
			request.setAttribute("md_pvoList", md_pvoList);
//			request.setAttribute("heart_result", heart_result);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/main.jsp");
			
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");		
			String userid = loginuser.getUserid();		
			session.setAttribute("loginuser", loginuser);
			

		
			
			int QlikeProdCount = pdao.likeProdCount(userid);
			
			request.setAttribute("QlikeProdCount", QlikeProdCount);
			
			//System.out.println("QlikeProdCount :" + QlikeProdCount);
			

		
		}
		
		else { // 로그인 안했으면
			

			InterProductDAO pdao = new ProductDAO();
			
//			HttpSession session = request.getSession();
//			MemberVO loginuser = (MemberVO)session.getAttribute("loginuser");
//			String userid = loginuser.getUserid();
			
			//Best => 주문순 많은 순으로 상품을 불러온다
			List<ProductVO> best_pvoList = pdao.selectBestProduct();
			
			//New arrival => 새로운 등록순으로 상품을 불러온다
			List<ProductVO> new_pvoList = pdao.selectNewProduct();
			
			//MD Pick => 노출여부 Y인 것만 랜덤으로 4개를 불러온다
			List<ProductVO> md_pvoList = pdao.selectMDProduct();
			
			
			//하트 클릭시 위시 처리 => 해당 유저의 위시상품을 불러온다
			
//			String wish_check = request.getParameter("wish_check");
//			boolean wish_check_result = mdao.selectLikeProduct("jinhr40", wish_check);
//			
//			String heart_result = "N";
//			if(wish_check_result) {
//				heart_result = "Y";
//			}
			
			
			request.setAttribute("best_pvoList", best_pvoList);
			request.setAttribute("new_pvoList", new_pvoList);
			request.setAttribute("md_pvoList", md_pvoList);
//			request.setAttribute("heart_result", heart_result);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/main.jsp");
			
			
		}
		
		
	}

}
