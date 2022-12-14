package seongmin.review.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterReviewDAO {

	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	List<ReviewVO> geReviewList(Map<String, String> paraMap) throws SQLException;

	int getTotalPage_review(Map<String, String> paraMap) throws SQLException;

	List<ReviewVO> geReviewList_proddetail(Map<String, String> paraMap) throws SQLException;

	int reviewRegister(Map<String, String> paraMap) throws SQLException;

	int checkReview(Map<String, String> paraMap) throws SQLException;


}
