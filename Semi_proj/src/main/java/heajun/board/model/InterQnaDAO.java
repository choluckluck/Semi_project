package heajun.board.model;

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

}
