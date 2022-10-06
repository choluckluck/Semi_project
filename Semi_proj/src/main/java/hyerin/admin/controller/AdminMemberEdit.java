package hyerin.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import hyerin.member.model.InterMemberDAO;
import hyerin.member.model.MemberDAO;
import hyerin.member.model.MemberVO;

public class AdminMemberEdit extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		String userid = request.getParameter("userid");
		
		InterMemberDAO mdao = new MemberDAO();
		
		//회원정보를 조회하기
		MemberVO mvo = mdao.selectEditUserInfo(userid);
		
		
		
		request.setAttribute("mvo", mvo);
		
		
		super.setViewPage("/WEB-INF/hyerin/admin/adminMemberEdit.jsp");
	}

}
