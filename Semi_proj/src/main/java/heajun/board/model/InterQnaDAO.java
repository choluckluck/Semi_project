package heajun.board.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InterQnaDAO {

	// qna_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select)
	QnaVO qnaOneDetail(String qna_code) throws Exception;

	// 글 정보 수정하기
	int updateBoard(String fk_member_code, String category, String subject, String contents, String qna_code
			)throws Exception;

	// 수정한 글 보여주기
	QnaVO updateEnd(String fk_member_code, String category, String subject, String contents, String qna_code,
			String registerday)throws Exception;

	// 페이지바를 만들기 위해서 문의글 대한 총페이지수 알아오기
	int getTotalPage(String qna_code)throws Exception;

	//문의글에 속하는 글들을 페이지바를 사용해 페이징 처리하여 조회(select)해오기
	List<QnaVO> selectPagingQnaList(Map<String, String> paraMap)throws Exception;

	//VO 를 사용하지 않고 Map으로 처리 => 한 번만 실행하려고 abstract에서 실행
	//tbl_notice 테이블에서 글번호(qna_code), id(fk_member_code), 제목(subject),날짜(registerday) 을 조회해오기
	List<HashMap<String, String>> getQnaList()throws Exception;

}
