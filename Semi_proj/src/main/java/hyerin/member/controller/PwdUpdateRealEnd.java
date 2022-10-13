package hyerin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberDAO;

public class PwdUpdateRealEnd extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  
		  String userid = request.getParameter("userid");
		  String pwd = request.getParameter("pwd");
	      
	      String message = "";
	      String loc = "";

	      Map<String, String> paraMap = new HashMap<>();
	      paraMap.put("userid", userid);
	      paraMap.put("pwd", pwd);
	      
	      J_InterMemberDAO mdao = new J_MemberDAO();
	      int n = mdao.pwdUpdate(paraMap);

	      System.out.println("userid1: " +userid);
	      System.out.println("pwd1: " +pwd);
	      System.out.println("n:" +n);
	      
	      if(n==1) {
	         message = "비밀번호가 정상적으로 변경되었습니다. 다시 로그인 해주세요.";
	         loc = request.getContextPath() + "/hyerin/login/login.sue";
	      }
	      else {
	         message = "비밀번호가 변경되지 않았습니다.";
	         loc =  "javascript:history.back()";
	      }

	      
	      request.setAttribute("message", message);
	      request.setAttribute("loc", loc);
	      
	      super.setRedirect(false);
	      super.setViewPage("/WEB-INF/msg.jsp");

	   }

}
