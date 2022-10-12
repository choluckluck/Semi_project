package seongmin.order.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterCartDAO {

	int goCart(Map<String, String> paraMap) throws SQLException;

	int goCart2(Map<String, Object> paraMap) throws SQLException;

	// 장바구니에 같은 상품이 존재하는지
	int isExist(Map<String, String> paraMap) throws SQLException;

	int updateCart(Map<String, String> paraMap) throws SQLException;

	int isExist2(Map<String, Object> paraMap) throws SQLException;

}
