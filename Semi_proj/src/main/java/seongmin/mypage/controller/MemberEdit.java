package seongmin.mypage.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberDAO;
import hasol.member.model.J_MemberVO;
import seongmin.login.model.InterMemberDAO;
import seongmin.login.model.MemberDAO;
import seongmin.login.model.MemberVO;

public class MemberEdit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	String method = request.getParameter("method");
		
		if("GET".equalsIgnoreCase(method)) {
			super.setViewPage("javascript:history.back()");
		}
		
		else { // post 방식으로
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
            String birthyyyy = request.getParameter("birthyyyy");  
            String birthmm = request.getParameter("birthmm"); 
            String birthdd = request.getParameter("birthdd");
            
            String mobile = mobile1 + mobile2 + mobile3;
            String birthday = birthyyyy + "-"   + birthmm + "-" + birthdd;
            
            MemberVO member = new MemberVO();
            
            Map<String, String> paraMap = new HashMap<>();
            paraMap.put("userid", userid);
            paraMap.put("pwd", pwd);
            paraMap.put("name", name);
            paraMap.put("postcode", postcode);
            paraMap.put("address", address);
            paraMap.put("detailaddress", detailaddress);
            paraMap.put("mobile", mobile);
            paraMap.put("email", email);
            paraMap.put("birthday", birthday);                        
            
            InterMemberDAO mdao = new MemberDAO();
            
			
			 try { 
				 int n = mdao.registerMember(paraMap);
				 
				 if(n==1) {
						HttpSession session = request.getSession();
						MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
					 
						loginuser.setName(name);
						loginuser.setPwd(pwd);
						loginuser.setEmail(email);
						loginuser.setMobile(mobile);
						loginuser.setPostcode(postcode);
						loginuser.setAddress(address);
						loginuser.setDetailaddress(detailaddress);
						loginuser.setBirthday(birthday);

						
						
						super.setRedirect(false);
						super.setViewPage("/WEB-INF/seongmin/mypage_Main.jsp");
				 }
				 
			 } catch(SQLException e) {
				 e.printStackTrace(); //이걸 써주어야 콘솔에 어떤 부분이 오류인지 나타남
				 super.setRedirect(true);
				 super.setViewPage("javascript:history.back");
				 
			 }
			 
		}
	}
	
}
