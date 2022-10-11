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
		
		//장바구니 또는 주문정보를 불러와준다
		// 임의로 userid, prodList를 정해준다
		HttpSession session = request.getSession();
		MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
		String userid = loginuser.getUserid();
		String cart_codeJoin = request.getParameter("cart_codeJoin");
		String prod_codeJoin = request.getParameter("prodCodeJoin");
		String colorJoin = request.getParameter("colorJoin");
		String sizeJoin = request.getParameter("sizeJoin");
		String countJoin = request.getParameter("countJoin");
		String priceJoin = request.getParameter("priceJoin");
		String salepriceJoin = request.getParameter("salepriceJoin");
		String totalOnePriceJoin = request.getParameter("totalOnePriceJoin");
		String deliveryfee = request.getParameter("deliveryfee");
		String pointJoin = request.getParameter("pointJoin");
		String totalorderprice = request.getParameter("totalorderprice");
		String totalprice = request.getParameter("totalPrice");
//		String cart_codeJoin = "cart-0900,cart-0901,cart-0902";
//		String prod_codeJoin = "prod-0022,prod-0057,prod-0088";
//		String colorJoin = "green,red,brown";
//		String sizeJoin = "240,240,240";
//		String countJoin = "1,2,2";
//		String priceJoin = "59800,99800,59800"; //정상가
//		String salepriceJoin = "50000,79800,59800"; //판매가
//		String totalOnePriceJoin = "50000,159600,119600"; //판매가x수량
//		String deliveryfee = "0";
//		String pointJoin = "590,990,590";
//		String totalorderprice = "329200"; //배송비 제외
//		String totalprice = "329200"; //배송비 합쳐서
//		
		
		
		System.out.println(cart_codeJoin + prod_codeJoin);
		
		
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
		paraMap.put("colorArr", colorArr);
		paraMap.put("sizeArr", sizeArr);
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
		
		viewMap.put("countArr", countArr);
		viewMap.put("salepriceArr", salepriceArr);
		viewMap.put("totalOnePriceArr", totalOnePriceArr);
		viewMap.put("deliveryfee", deliveryfee);
		viewMap.put("pointArr", pointArr);
		viewMap.put("totalorderprice", totalorderprice);
		viewMap.put("totalprice", totalprice);
		viewMap.put("pointJoin", pointJoin);
		viewMap.put("priceJoin", priceJoin);
		
		
		request.setAttribute("loginuser", loginuser);
		request.setAttribute("pvoList", pvoList);
		request.setAttribute("viewMap", viewMap);
			
		super.setViewPage("/WEB-INF/hasol/purchase/purchase.jsp");

	}

}
