package hyerin.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;
import hyerin.member.model.MemberVO;

public class Login extends AbstractController {


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if(!"POST".equalsIgnoreCase(method)) { //"GET"방식인 경우
			String message = "비정상적인 경로로 들어왔습니다.";
			String loc = "javscript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
			return; //execute 메소드를 종료
		}
		
		//"POST"방식인 경우
		String userid = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		String clientip = request.getRemoteAddr();
	
		Map<String, String> paraMap = new HashMap<>();
		paraMap.put("userid", userid);
		paraMap.put("pwd", pwd);
		paraMap.put("clientip", clientip);
		
		InterMemberDAO mdao = new MemberDAO();

		MemberVO loginuser =  mdao.selectOneMember(paraMap);

		if(loginuser != null) { 
			
			if(loginuser.getIdle() == 1) { //idle값이 1일 경우
				String message = "로그인을 한 지 1년이 지나서 휴면상태로 되었습니다.";
				String loc = request.getContextPath() + "/hyerin/member/register.sue"; //원래는 위와같이 index.up이 아니라 휴면인 계정을 풀어주는 페이지로 잡아주어야 한다.
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return; //메소드 종료
			}
		
			HttpSession session = request.getSession();
			//메모리에 생성되어져 있는 session을 불러옴
			
			
			session.setAttribute("loginuser", loginuser);
			// session(세션)에 로그인 되어진 사용자 정보인 loginuser 을 키이름을 "loginuser" 으로 저장시켜두는 것이다.
			
			if(loginuser.isRequirePwdChange()) { //암호변경 갭이 3개월이 이상인 경우
				String message = "비밀번호를 변경하신지 3개월이 지났습니다. 비밀번호를 변경하세요.";
				String loc = request.getContextPath() + "/hyerin/member/register.sue"; //원래는 위와같이 index.up이 아니라 사용자의 암호를 변경해주는 페이지로 잡아주어야 한다.
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
				super.setRedirect(false);
				super.setViewPage("/WEB-INF/msg.jsp");
				
				return; //메소드 종료
			}
			else { //암호변경 갭이 3개월 미만인 경우
				
				super.setRedirect(true); //sendRedirect 방식으로 페이지 이동
				super.setViewPage(request.getContextPath() + "/main.sue");
				
			}
			
		}
		else { // 셀렉트된 유저가 없을 경우
			String message = "로그인 실패";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
			super.setRedirect(false);
			super.setViewPage("/WEB-INF/msg.jsp");
		}
	}
}

