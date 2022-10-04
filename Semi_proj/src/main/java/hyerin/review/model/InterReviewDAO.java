package hyerin.review.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterReviewDAO {
	// *** 관리자 페이지 *** //
	
	
	// * 상품 리뷰 * 
	
	//리뷰목록의 총페이지수 구해오기
	int getToTalReviewPage(Map<String, String> paraMap) throws SQLException;
	
	//페이징한 검색이 있는, 또는 없는 리뷰목록 조회(select)
	List<ReviewVO> selectPagingReview(Map<String, String> paraMap) throws SQLException;

	
}
