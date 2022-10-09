package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import common.controller.AbstractController;
import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;

public class AdminMemberCheckedResign extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String useridJoin = request.getParameter("useridJoin");
		String[] useridArr = useridJoin.split("\\,");
		
		InterMemberDAO mdao = new MemberDAO();
		
		//체크된 회원들을 탈퇴처리하기(update)
		int n = mdao.updateCheckedMember(useridArr);
		
		String message= "";
		if(n==1) {
			message = "선택된 회원들을 탈퇴처리하였습니다.";
		}
		else {
			message = "선택된 회원들을 탈퇴처리하는데 실패하였습니다.";
		}
		
		JSONObject jsonobj = new JSONObject();
		jsonobj.put("message", message);
		
		String json = jsonobj.toString();
		
		request.setAttribute("json", json);
		super.setViewPage("/WEB-INF/hyerin/jsonView.jsp");
		
		
	}

}
