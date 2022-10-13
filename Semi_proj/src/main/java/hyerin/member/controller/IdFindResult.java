package hyerin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberDAO;

public class IdFindResult extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) { 
			String name = request.getParameter("idfind_name");
			String email = request.getParameter("idfind_email");
			
			
			J_InterMemberDAO mdao = new J_MemberDAO();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("name", name);
			paraMap.put("email", email);
			
			if (paraMap.get("email") != null) {	
				String userid = mdao.idFind(paraMap);
			}
			
		
			if(userid != null) {
				request.setAttribute("userid", userid);
			}
			else {
				request.setAttribute("userid", "존재하지 않습니다.");
			}
			
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			
		}//end of if post
		
		request.setAttribute("method", method);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/login/idFindResult.jsp");
	}
		

}
