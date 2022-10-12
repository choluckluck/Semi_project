package seongmin.qna.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterQnaDAO {

	List<QnaVO> getQnaList(Map<String, String> paraMap) throws SQLException;

	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	

}
