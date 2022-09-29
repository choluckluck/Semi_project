package heajun.board.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.controller.AbstractController;
import heajun.board.model.FaqDAO;
import heajun.board.model.FaqVO;
import heajun.board.model.InterFaqDAO;

public class Faqlist extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 InterFaqDAO fdao = new FaqDAO();
			
		 String fk_member_code = request.getParameter("fk_member_code");
		 String faq_category = request.getParameter("faq_category");
		 String faq_subject = request.getParameter("faq_subject");
		 String faq_contents = request.getParameter("faq_contents");
		 
		 if(fk_member_code != null && faq_category != null && faq_subject != null && faq_contents != null ) {
			fdao.register(fk_member_code,faq_category,faq_subject,faq_contents);
		
		}
	
		
		List<FaqVO> faqList =  fdao.selectPagingfaq();
		
		
		/////////////////////////////////////////////////////
		
		request.setAttribute("faqList", faqList);
		
  
		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/heajun/board/faqlist.jsp");
		
		return;	
	}

}
