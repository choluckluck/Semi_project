package hasol.purchase.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.MemberVO;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductVO;

public class Purchase extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		boolean isLogin = super.checkLogin(request);
		
		if(!isLogin) {
			
			String loc = request.getContextPath()+"/hyerin/login/login.sue";
			request.setAttribute("message", "주문을 하시려면 먼저 로그인을 해주세요!");
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			
			return; //종료
			
		}
		else {
			//장바구니 또는 주문정보를 불러와준다
			// 임의로 userid, prodList를 정해준다
			HttpSession session = request.getSession();
			MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
			
			
			
			String userid = loginuser.getUserid();
			String cart_codeJoin = request.getParameter("cart_codeJoin");
			String prod_codeJoin = request.getParameter("prodCodeJoin");
			String colorJoin = request.getParameter("colorJoin");
			String sizeJoin = request.getParameter("sizeJoin");
			String countJoin = request.getParameter("countjoin");
			String priceJoin = request.getParameter("priceJoin");
			String salepriceJoin = request.getParameter("salepriceJoin");
			String totalOnePriceJoin = request.getParameter("totalOnePriceJoin");
			String deliveryfee = request.getParameter("deliveryfee");
			String pointJoin = request.getParameter("pointJoin");
			String totalorderprice = request.getParameter("totalorderprice");
			
			if(Integer.parseInt(totalorderprice) < 70000 ) {
				deliveryfee = "2500";
			}
			
			int int_totalprice = Integer.parseInt(totalorderprice) + Integer.parseInt(deliveryfee);
			String totalprice = String.valueOf(int_totalprice);
	//		String totalprice = request.getParameter("totalPrice");
			
			System.out.println(prod_codeJoin);
			
			String[] prod_codeArr = prod_codeJoin.split("\\,");
			String[] colorArr = colorJoin.split("\\,");
			String[] sizeArr = sizeJoin.split("\\,");
			String[] countArr = countJoin.split("\\,");
			String[] salepriceArr = salepriceJoin.split("\\,");
			String[] totalOnePriceArr = totalOnePriceJoin.split("\\,");
			String[] pointArr = pointJoin.split("\\,");
			
			Map<String, Object> paraMap = new HashMap<>();
			
			paraMap.put("userid", userid);
			paraMap.put("prod_codeArr", prod_codeArr);
			paraMap.put("prod_colorArr", colorArr);
			paraMap.put("prod_sizeArr", sizeArr);
			paraMap.put("countArr", countArr);
			paraMap.put("salepriceArr", salepriceArr);
			paraMap.put("pointArr", pointArr);
			paraMap.put("totalorderprice", totalorderprice);
			paraMap.put("totalprice", totalprice);
			
			// 주문하려는 상품정보 불러오기
			InterProductDAO pdao = new ProductDAO();
			List<ProductVO> pvoList = pdao.getOrderProductsInfo(paraMap);
			
			//맵에 정보들 넘겨주기
			Map<String, Object> viewMap = new HashMap<>();
			viewMap.put("cart_codeJoin", cart_codeJoin);
			viewMap.put("prod_codeJoin", prod_codeJoin);
			viewMap.put("colorJoin", colorJoin);
			viewMap.put("sizeJoin", sizeJoin);
			viewMap.put("countJoin", countJoin);
			viewMap.put("totalOnePriceJoin", totalOnePriceJoin);
			
			viewMap.put("countArr", countArr);
			viewMap.put("salepriceArr", salepriceArr);
			viewMap.put("totalOnePriceArr", totalOnePriceArr);
			viewMap.put("deliveryfee", deliveryfee);
			viewMap.put("pointArr", pointArr);
			viewMap.put("totalorderprice", totalorderprice);
			viewMap.put("totalprice", totalprice);
			viewMap.put("pointJoin", pointJoin);
			viewMap.put("priceJoin", priceJoin);
			viewMap.put("salepriceJoin", salepriceJoin);
			
			
			request.setAttribute("loginuser", loginuser);
			request.setAttribute("pvoList", pvoList);
			request.setAttribute("viewMap", viewMap);
			
			super.setViewPage("/WEB-INF/hasol/purchase/purchase.jsp");
		}
	}

}
