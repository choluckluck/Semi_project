package hasol.member.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberDAO;

public class IdDuplicateCheck extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			String userid = request.getParameter("userid");
			
			J_InterMemberDAO mdao = new J_MemberDAO();
			boolean isExists = mdao.idDuplicateCheck(userid);
			
			JSONObject jsonObj = new JSONObject();
			
			// {"isExists":true} 또는 {"isExists":false}로 만들어주기
			jsonObj.put("isExists", isExists); 
			String json = jsonObj.toString(); 
			
			request.setAttribute("json", json);
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/jsonview.jsp");
		}
		
	}

}
