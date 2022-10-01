package hyerin.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;
import hyerin.product.model.ProductVO;

public class AdminProductListJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		InterProductDAO pdao = new ProductDAO();
		
		// select 박스의 상품종류대로 상품정보를 가져온다
		String byKind = request.getParameter("byKind");
		
		Map<String,String> paraMap = new HashMap<>();
		paraMap.put("byKind", byKind);
		
		
		//페이징 처리 시작
		String currentShowPageNo = request.getParameter("currentShowPageNo");
		
		if(currentShowPageNo == null) {
			currentShowPageNo = "1";
		}
		try {
			if(Integer.parseInt(currentShowPageNo)<1) {
				currentShowPageNo = "1";
			}
		} catch(NumberFormatException e) {
			currentShowPageNo = "1";
		}
		
		paraMap.put("currentShowPageNo", currentShowPageNo);
		
		
		// 총페이지 알아오기
		int totalPage = pdao.getTotalPage(paraMap);
		//System.out.println(totalPage);
		
		// 페이지바 만들기
		String pageBar = "";
		int blockSize = 10;
		int loop = 1;
		
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		
		// **** [맨처음][이전] 만들기 **** //
		if(pageNo != 1) {
			if("all".equals(byKind) || "prodduct_kind".equals(byKind)) {
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo=1'>" + "[맨처음]</a></li>";
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+(pageNo-1)+"'>" + "[이전]</a></li>";
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo=1'>" + "[맨처음]</a></li>";
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+(pageNo-1)+"'>" + "[이전]</a></li>";
			}
		}
		// **** [맨처음][이전] 만들기 끝 **** //
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href='#'>" + pageNo + "</a></li>";
				
			}
			else {
				if("all".equals(byKind) || "prodduct_kind".equals(byKind)) {
					pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+pageNo+"'>" + pageNo + "</a></li>";
				}
				else {
					pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+pageNo+"&prod_kind="+byKind+"'>" + pageNo + "</a></li>";
				}
			}
			loop++; 
			pageNo++; 
		}//end of while
		
		// **** [다음][마지막] 만들기 **** //
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)
			if("all".equals(byKind) || "prodduct_kind".equals(byKind)) {
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+pageNo+"'>" + "[다음]</a></li>";
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+totalPage+"'>" + "[마지막]</a></li>";
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+pageNo+"&prod_kind="+byKind+"'>" + "[다음]</a></li>";
				pageBar += "<li class='page-item'><a class='page-link' href='adminProductList.up?currentShowPageNo="+totalPage+"&prod_kind="+byKind+"'>" + "[마지막]</a></li>";
			}
		}
		// **** [다음][마지막] 만들기 끝**** //
		
		
		/*
		 * <li class="page-item"> <a class="page-link" href="#" aria-label="Previous">
		 * <span aria-hidden="true">&laquo;</span> </a> </li> <li class="page-item"><a
		 * class="page-link" href="#">1</a></li> <li class="page-item"><a
		 * class="page-link" href="#">2</a></li> <li class="page-item"><a
		 * class="page-link" href="#">3</a></li> <li class="page-item"> <a
		 * class="page-link" href="#" aria-label="Next"> <span
		 * aria-hidden="true">&raquo;</span> </a> </li>
		 */
		
		
		// 첫 화면일때는 모든 상품정보를, 셀렉트박스를 변경했을때는 선택한 종류의 상품정보를 조회(select)
		List<ProductVO> productList = pdao.selectProductByKind(paraMap);
		
		
		JSONArray jsonArr = new JSONArray();
		JSONObject jsonObj2 = new JSONObject();
		//jsonObj2.put("pageBar", pageBar);
		//jsonObj2.put("currentShowPageNo", currentShowPageNo);
		jsonObj2.put("totalPage", totalPage);
		jsonArr.put(jsonObj2);
		
		if(productList.size() > 0) {
			
			for(ProductVO pvo : productList) {
				JSONObject jsonObj = new JSONObject();
				
				jsonObj.put("prod_code", pvo.getProd_code());
				jsonObj.put("prod_name", pvo.getProd_name());
				jsonObj.put("prod_kind", pvo.getProd_kind());
				jsonObj.put("prod_image", pvo.getProd_image());
				jsonObj.put("prod_high", pvo.getProd_high());
				jsonObj.put("prod_price", pvo.getProd_price());
				jsonObj.put("prod_saleprice", pvo.getProd_saleprice());
				jsonObj.put("prod_color", pvo.getProd_color());
				jsonObj.put("prod_registerday", pvo.getProd_registerday());
				jsonObj.put("md_pick_yn", pvo.getMd_pick_yn());
				
				jsonArr.put(jsonObj);
				
			}//end of for
			
			
			String json = jsonArr.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/admin/adminJson.jsp");
			
		}//end of if
		else {
			
			String json = jsonArr.toString();
			
			request.setAttribute("json", json);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/hyerin/admin/adminJson.jsp");
			
		}//end of else
		
		
		
	}

}
