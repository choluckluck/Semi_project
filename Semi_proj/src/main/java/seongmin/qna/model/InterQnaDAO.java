package seongmin.qna.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterQnaDAO {

	List<QnaVO> getQnaList(Map<String, String> paraMap) throws SQLException;

	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	List<QnaVO> getqnaList_proddetail(Map<String, String> paraMap) throws SQLException;

	int getTotalPage_qna(Map<String, String> paraMap) throws SQLException;

	int qnaRegister(Map<String, String> paraMap) throws SQLException;

	int qnaRegister2(Map<String, String> paraMap) throws SQLException;
	

}
