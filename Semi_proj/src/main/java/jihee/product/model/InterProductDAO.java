package jihee.product.model;

import java.sql.SQLException;
import java.util.List;
<<<<<<< HEAD

public interface InterProductDAO {

	//상품 카드 목록 가져오기
	List<ProductVO> selectProductAll() throws SQLException;
=======
import java.util.Map;

public interface InterProductDAO {

	//상품 카드 목록 가져오기
	List<ProductVO> selectProductAll(Map<String, String> paraMap) throws SQLException;

	//총 페이지바 페이지수 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
>>>>>>> refs/heads/main

}
