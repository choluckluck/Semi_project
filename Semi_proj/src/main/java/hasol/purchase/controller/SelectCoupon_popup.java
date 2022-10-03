package hasol.purchase.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberVO;
import member.model.InterMemberDAO;
import member.model.MemberDAO;
import member.model.MemberVO;

public class SelectCoupon_popup extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
String method = request.getMethod();
		
		if("POST".equalsIgnoreCase(method)) {
			String name = request.getParameter("name"); 
			String userid = request.getParameter("userid"); 
			String pwd = request.getParameter("pwd"); 
			String email = request.getParameter("email"); 
			String hp1 = request.getParameter("hp1"); 
			String hp2 = request.getParameter("hp2"); 
			String hp3 = request.getParameter("hp3"); 
			String postcode = request.getParameter("postcode");
			String address = request.getParameter("address"); 
			String detailAddress = request.getParameter("detailAddress"); 
			String extraAddress = request.getParameter("extraAddress"); 
			String gender = request.getParameter("gender"); 
			String birthyyyy = request.getParameter("birthyyyy"); 
			String birthmm = request.getParameter("birthmm"); 
			String birthdd = request.getParameter("birthdd");
			
			String mobile = hp1 + hp2 + hp3; //"01023456789"
			String birthday = birthyyyy + "-" + birthmm + "-" + birthdd; //"1997-05-12"
			
			
			MemberVO member = new MemberVO(userid, pwd, name, email, mobile, postcode, address, detailAddress, extraAddress, gender, birthday);
			
			InterMemberDAO mdao = new MemberDAO();
			int n = mdao.updateMember(member);
			
			String message = "";
			
			if(n==1) {
				// !!! session에 저장된 loginuser를 변경된 사용자의 정보값으로 변경해주어야 한다.
				HttpSession session = request.getSession();
				MemberVO loginuser = (MemberVO) session.getAttribute("loginuser");
				
				loginuser.setName(name);
				loginuser.setPwd(pwd);
				loginuser.setEmail(email);
				loginuser.setMobile(mobile);
				loginuser.setPostcode(postcode);
				loginuser.setAddress(address);
				loginuser.setDetailaddress(detailAddress);
				loginuser.setExtraaddress(extraAddress);
				
				message = "회원정보 수정 성공!!";
			}
			else {
				message = "회원정보 수정 실패!";
			}
			
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			// super.setRedirect(false);
			super.setViewPage("/WEB-INF/error/msg.jsp");
			
		}
		else {
			String message = "비정상적인 경로로 접근했습니다!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			//super.setRedirect(false);
			super.setViewPage("/WEB-INF/hasol/purchase/selectCoupon_popup.jsp");
		}
		
	}
		



}
