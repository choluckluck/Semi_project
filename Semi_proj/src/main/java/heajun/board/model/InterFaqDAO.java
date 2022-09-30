package heajun.board.model;

import java.sql.SQLException;
import java.util.List;



public interface InterFaqDAO {

	// faq_code 값을 입력받아서 하나의 faq글에 대한 상세정보를 알아오기(select) 
	FaqVO faqOneDetail(String faq_code) throws Exception;
	
	// faq 글 작성시키는 메소드
	void register(String fk_member_code, String faq_category, String faq_subject, String faq_contents)throws Exception;
	
	// faq 게시판 글 목록 보여주기
	List<FaqVO> selectPagingfaq()throws Exception;

	
	
	

}
