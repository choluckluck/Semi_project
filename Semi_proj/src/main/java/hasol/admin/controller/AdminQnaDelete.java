package hasol.admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hasol.admin.model.J_InterQnaDAO;
import hasol.admin.model.J_QnaDAO;
import hyerin.product.model.InterProductDAO;
import hyerin.product.model.ProductDAO;

public class AdminQnaDelete extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getContextPath();
		
		// get방식이라면 => 상품 1개만 삭제해준다
		if("get".equalsIgnoreCase(method)) {
			String qna_code = request.getParameter("qna_code");
			J_InterQnaDAO qdao = new J_QnaDAO();
			
			//한 상품을 삭제하기
			int deleteResult = qdao.deleteOneQna(qna_code);
			
			String message = "";
			if(deleteResult == 1) {
				message = "상품번호 " + qna_code + "가 삭제되었습니다.";
			}
			else { //뜨면 안됨
				message = "상품번호 "+ qna_code + "의 삭제가 실패되었습니다.";
			}
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("message",message);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		//post방식이라면 => 체크된 여러 상품을 삭제해준다
		else {
			
			String qna_codeJoin = request.getParameter("qna_codeJoin");
			String[] qna_codeArr = qna_codeJoin.split("\\,");
			
			J_InterQnaDAO qdao = new J_QnaDAO();
			Map<String, String[]> paraMap = new HashMap<>();
			paraMap.put("qna_codeArr", qna_codeArr);
			
			//해당하는 상품들을 삭제해준다
			int deleteMultiResult = qdao.deleteMultiQna(paraMap);
			
			String message = "";
			if(deleteMultiResult==1) {
				message = "선택한 상품이 모두 삭제되었습니다.";
			}
			else {
				message = "선택한 상품의 삭제가 실패되었습니다.";
			}
			
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("message",message);
			
			String json = jsonObj.toString();
			
			request.setAttribute("json", json);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		
	}

}
