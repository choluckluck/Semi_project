package hyerin.member.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.member.model.J_InterMemberDAO;
import hasol.member.model.J_MemberDAO;

public class PwdFindResult extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String method = request.getMethod();
		if("POST".equalsIgnoreCase(method)) {
			//비밀번호 찾기 모달창에서 찾기 버튼을 클릭했을 경우
			
			String userid = request.getParameter("userid");
			System.out.println("userid:" + userid);
			String name = request.getParameter("name");
			System.out.println("name:" +name);
			String email = request.getParameter("email");
			
			J_InterMemberDAO mdao = new J_MemberDAO();
			
			Map<String, String> paraMap = new HashMap<>();
			
			paraMap.put("userid", userid);
			paraMap.put("email", email);
			paraMap.put("name", name);
			
			boolean isUserExist = mdao.isUserExist(paraMap);
			System.out.println("isUserExist: " + isUserExist);
			
			if (isUserExist) {
				
				boolean sendMailSuccess = false; //메일이 정상적으로 전송되었는지 유무를 알아오기위한 용도
				
				if(isUserExist) { //회원으로 존재하는 경우
					//인증키를 랜덤으로 생성
					Random rnd = new Random();
					//인증키는 영문소문자 5글자 + 숫자 7글자 (예> certificationCode => dngrn4745003 ... )
					String certificationCode = "";
					
					char randchar = ' ';
					for(int i=0; i<5; i++) {
						/*
							min 부터 max 사이의 값으로 랜덤한 정수를 얻으려면 
							int rndnum = rnd.nextInt(max - min + 1) + min;
						*/
						// 영문소문자 'a' 부터 'z'까지 랜덤하게 1개를 만든다
						randchar = (char)(rnd.nextInt('z' - 'a' + 1) + 'a');
						certificationCode += randchar;
					}//end of for
					
					int randnum = 0;
					for(int i=0; i<5; i++) {
						randnum = rnd.nextInt(9 - 0 + 1) + 0;
						certificationCode += randnum;
					}//end of for
					
					System.out.println("~~~~ 확인용 certificationCode => " + certificationCode);
					
					//랜덤하게 생성한 인증코드를 비밀번호찾기를 하고자 하는 사용자의 email로 전송
					GoogleMail mail = new GoogleMail();
					
					try {
						mail.sendmail(email, certificationCode);
						sendMailSuccess = true; //메일전송 성공했음을 기록함
						
						
						// 세션(session) 불러오기
						// 세션 영역에 저장되어진 정보는 모든 클래스 파일 및 모든 .jsp파일에서 사용가능
						// 그런데 request 영역에 저장되어진 정보는 forward 되어지는 특정 .jsp 파일에서만 사용가능하다
						HttpSession session = request.getSession();
						session.setAttribute("certificationCode", certificationCode); //발급한 인증코드를 세션에 저장시킴							
						
					} catch(Exception e) { //메일전송이 실패한 경우
						e.printStackTrace();
						sendMailSuccess = false; //메일전송 실패했음을 기록함
					}
					
					
				}//end of if(isUserExist)
				
				request.setAttribute("isUserExist", isUserExist);
				request.setAttribute("userid", userid);
				request.setAttribute("email", email);
				request.setAttribute("name", name);
				request.setAttribute("sendMailSuccess", sendMailSuccess);
				
				System.out.println("여기오냐");
				System.out.println("userid:" + userid);
			}//end of if
			
			else {
				request.setAttribute("isUserExist", isUserExist);
				request.setAttribute("userid", userid);
				request.setAttribute("name", name);
				request.setAttribute("email", email);
				System.out.println("여기오냐2");
				System.out.println("userid2:" + userid);
			}
			
		}//end of if (POST)
			
		request.setAttribute("method", method);
		
		super.setRedirect(false);
		super.setViewPage("/WEB-INF/hyerin/login/pwdFindResult.jsp");
	}

}
