package hasol.admin.model;

import java.util.List;
import java.util.Map;

public interface J_InterQnaDAO {

	// QnA 문의글 모두 조회해 오기
	int getTotalPage(Map<String, String> paraMap) throws Exception;

	// Qna 문의글 페이징 처리 (10개씩 자름)
	List<J_QnaVO> pagingQna(Map<String, String> paraMap) throws Exception;

	// 한 개만 삭제하기
	int deleteOneQna(String qna_code) throws Exception;

	// 선택한 것 모두 삭제하기
	int deleteMultiQna(Map<String, String[]> paraMap) throws Exception;

}
