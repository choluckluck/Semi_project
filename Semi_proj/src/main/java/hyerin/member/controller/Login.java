package hyerin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import seongmin.login.model.InterMemberDAO;
import seongmin.login.model.MemberDAO;
import seongmin.login.model.MemberVO;

public class Login extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod(); // "GET" 또는 "POST"
		
		if("GET".equalsIgnoreCase(method)) {
		      super.setRedirect(false);
		      super.setViewPage("/WEB-INF/hyerin/login/login.jsp");
		}
		
		if("POST".equalsIgnoreCase(method)) {
			String userid = request.getParameter("userid");
			String pwd = request.getParameter("pwd");
			
			String clientip = request.getRemoteAddr();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("userid", userid);
			paraMap.put("pwd", pwd);
			paraMap.put("clientip", clientip);

			InterMemberDAO mdao = new MemberDAO();
			MemberVO loginuser = mdao.selectOneMember(paraMap);

			if(loginuser != null) {
				
				if(loginuser.getIdle() == 1) {
					String message = "로그인을 한지 1년이 지나서 휴면상태로 되었습니다. 관리자에게 문의 바랍니다."; 
					String loc = request.getContextPath()+"/hyerin/login/login.sue";
					// 원래는 위와같이 index.up 이 아니라 휴면인 계정을 풀어주는 페이지로 잡아주어야 한다. 
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
					super.setRedirect(false);
					super.setViewPage("/WEB-INF/msg.jsp");
					
					return; // 메소드 종료
				} //end of if(loginuser.getIdle() == 1) 
				
				  HttpSession session = request.getSession(); 
				  // 메모리에 생성되어져 있는 session 을 불러오는 것이다.
				  
				  session.setAttribute("loginuser", loginuser);
				  // session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.
				  
				  if(loginuser.isRequirePwdChange() == true) {
					  String message = "비밀번호를 변경하신지 3개월이 지났습니다. 비밀번호를 변경하세요!!"; 
					  String loc = request.getContextPath()+"/hyerin/login/login.sue";
					  // 원래는 위와같이 index.up 이 아니라 사용자의 암호를 변경해주는 페이지로 잡아주어야 한다. 
					
					  request.setAttribute("message", message);
					  request.setAttribute("loc", loc);
					
					  super.setRedirect(false);
					  super.setViewPage("/WEB-INF/msg.jsp");
					
					  return; // 메소드 종료
				  } //end of  if(loginuser.isRequirePwdChange() 
				  
				  else {
					  // 비밀번호를 변경한지 3개월 미만인 경우 
					  super.setRedirect(true); // sendRedirect 방식으로 페이지 이동

						// 로그인을 하면 시작페이지(index.up)로 가는 것이 아니라 로그인을 시도하려고 머물렀던 그 페이지로 가기 위한 것이다.
						String goBackURL = (String) session.getAttribute("goBackURL"); // null 또는 경로

						if (goBackURL != null) {
							System.out.println("성공");
							super.setViewPage(request.getContextPath() + goBackURL); // 이전페이지로 이동

						} else {
							System.out.println("성공");
							super.setViewPage(request.getContextPath() + "/main.sue"); // 시작홈페이지로 이동
						}					  
				  }
				
			} //end of if
			
			else {
				String message = "로그인 실패. 아이디와 비밀번호를 확인하세요.";
				String loc = "javascript:history.back()";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
			}				

			
			
			}//end of if
		
		
		
	}

}
