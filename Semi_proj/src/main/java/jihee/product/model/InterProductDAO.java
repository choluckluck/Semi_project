package jihee.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	
	//총 페이지바 페이지수 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	//상품 카드 목록 가져오기
	List<ProductVO> selectProductAll(Map<String, String> paraMap) throws SQLException;

	

	//BEST 상품 알아오기 
	List<ProductVO> selectBestProduct(Map<String, String> paraMap) throws SQLException;

	// 장바구니 목록 가져오기
	List<cartVO> selectCartList(Map<String, String> paraMap) throws SQLException;

	//장바구니에서 수량변경 
	int updateCart(String cartno, int qnty) throws SQLException;

	//장바구니에서 삭제
	int delCart(String cartno)throws SQLException;
	
	//총합계 알아오기
	Map<String, String> selectCartSumPrice(String userid) throws SQLException;

	//장바구니 모달창 목록 가져오기
	List<cartVO> selectCartListOne(Map<String, String> paraMap)throws SQLException;

	//공지사항 글 작성하기
	int updateNotice(String subject, String board_content, String userid) throws SQLException;



}