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

	//reviewcode에 해당하는 행을 삭제하기
	int deleteUserReview(String review_code) throws SQLException;
	
	//해당하는 리뷰들을 삭제해준다
	int deleteMultiReview(Map<String, String[]> paraMap) throws SQLException;

	//해당 상품의 리뷰개수를 알아온다
	String getReviewCount(String prod_code) throws SQLException;

	
}
