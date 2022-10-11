package hasol.member.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberDAO;
import hasol.member.model.J_MemberVO;

public class RegisterResult extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String method = request.getParameter("method");
		
		if("GET".equalsIgnoreCase(method)) {
			super.setViewPage("/WEB-INF/hyerin/member/registerWrite.jsp");
		}
		else {
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			String name = request.getParameter("name");
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address");
			String detailaddress = request.getParameter("detailaddress");
			String mobile1 = request.getParameter("mobile1");
			String mobile2 = request.getParameter("mobile2");
			String mobile3 = request.getParameter("mobile3");			
			String email = request.getParameter("email");
			String marketing_yn = request.getParameter("marketing_yn");
			String gender = request.getParameter("gender");		
            String birthyyyy = request.getParameter("birthyyyy");  
            String birthmm = request.getParameter("birthmm"); 
            String birthdd = request.getParameter("birthdd");
            
            String mobile = mobile1 + mobile2 + mobile3;
            String birthday = birthyyyy + "-"   + birthmm + "-" + birthdd;
            
            J_MemberVO member = new J_MemberVO(userid, pwd, name, postcode, address, detailaddress, mobile, email, marketing_yn, gender, birthday);
            J_InterMemberDAO mdao = new J_MemberDAO();
            
			
			 try { int n = mdao.registerMember(member);
			 
			 if(n==1) { request.setAttribute("userid", userid);
			 request.setAttribute("pwd", pwd); super.setRedirect(false);
			 super.setViewPage("/WEB-INF/hasol/login/registerAfterAutoLogin.jsp"); }
			 
			 } catch(SQLException e) { e.printStackTrace(); //이걸 써주어야 콘솔에 어떤 부분이 오류인지 나타남
			 super.setRedirect(true); super.setViewPage(request.getContextPath() +
			 "/error.sue"); }
			 
		}
		
	}

}
