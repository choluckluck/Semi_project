package heajun.board.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;


public interface InterReviewDAO_HJ {

	//리뷰목록의 총페이지수 구해오기
	int getToTalReviewPage(Map<String, String> paraMap)throws SQLException;

	//페이징한 검색이 있는, 또는 없는 리뷰목록 조회(select)
	List<ReviewVO_HJ> selectPagingReview(Map<String, String> paraMap)throws SQLException;

	//select 한 글내용 불러오기 
	ReviewVO_HJ reviewOneDetail(String review_code)throws SQLException;

	//리뷰작성
	void write(String fk_userid, String review_subject, String review_contents)throws SQLException;
	
	

}
