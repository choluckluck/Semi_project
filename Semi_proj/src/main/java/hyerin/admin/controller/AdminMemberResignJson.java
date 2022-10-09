package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;

public class AdminMemberResignJson extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String userid = request.getParameter("userid");
		InterMemberDAO mdao = new MemberDAO();
		
		//userid에 해당하는 회원을 탈퇴처리하기 (update)
		int updateStatusResult = mdao.upateUserStatus(userid);
		
		String message = "";
		if(updateStatusResult == 1) {
			message = userid + "님이 회원탈퇴되었습니다.";
		}
		else { //뜨면 안됨
			message = userid + "님의 회원탈퇴 처리가 실패되었습니다.";
		}
		
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("message",message);
		
		String json = jsonObj.toString();
		
		request.setAttribute("json", json);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
	}

}
