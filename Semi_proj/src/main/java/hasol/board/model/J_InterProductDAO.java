package hasol.board.model;

import java.sql.SQLException;
import java.util.*;

public interface J_InterProductDAO {

	// 전체 상품 목록 페이지
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	// 상품 리스트 
	List<J_ProductVO> qnaSearchProduct(Map<String, String> paraMap) throws SQLException;



}
