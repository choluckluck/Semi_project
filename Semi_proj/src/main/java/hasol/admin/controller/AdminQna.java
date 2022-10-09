package hasol.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.controller.AbstractController;
import hasol.admin.model.J_InterQnaDAO;
import hasol.admin.model.J_QnaDAO;
import hasol.admin.model.J_QnaVO;
import hasol.member.model.J_MemberVO;

public class AdminQna extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("왔당!");
		
		/*		
		// == 로그인하지 않았다면 조회가 불가능 ==
		if(!super.checkLogin(request)){
			
			String message = "로그인을 하세요.";
            String loc = "javascript:history.back()";
            
            request.setAttribute("message", message);
            request.setAttribute("loc", loc);
            
         //   super.setRedirect(false);
            super.setViewPage("/WEB-INF/error/msg.jsp");
            
		}
		
		// == 로그인 한 상태 ==
		else {
			
			HttpSession session = request.getSession();
			J_MemberVO loginuser = (J_MemberVO)session.getAttribute("loginuser");
		
			if(!"admin".equals(loginuser.getUserid())) { // 관리자가 아닌 일반 사용자가 로그인한 경우
				
				String message = "관리자 이외에는 접근이 불가능합니다.";
	            String loc = "javascript:history.back()";
	            
	            request.setAttribute("message", message);
	            request.setAttribute("loc", loc);
	            
	         //   super.setRedirect(false);
	            super.setViewPage("/WEB-INF/error/msg.jsp");
				
			}
			else { // 관리자로 로그인한 경우
				
				
		
		}
		*/
		super.setViewPage("/WEB-INF/hyerin/admin/adminQna.jsp");
	}

}
