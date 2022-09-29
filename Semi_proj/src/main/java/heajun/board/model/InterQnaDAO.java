package heajun.board.model;

public interface InterQnaDAO {

	// qna_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select)
	QnaVO qnaOneDetail(String qna_code) throws Exception;

	// 글 정보 수정하기
	int updateBoard(String fk_member_code, String category, String subject, String contents, String qna_code
			)throws Exception;

	// 수정한 글 보여주기
	QnaVO updateEnd(String fk_member_code, String category, String subject, String contents, String qna_code,
			String registerday)throws Exception;

}
