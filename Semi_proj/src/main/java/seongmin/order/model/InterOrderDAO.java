package seongmin.order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import seongmin.product.model.ProductVO;

public interface InterOrderDAO {

	List<OrderVO> recentOrderList(Map<String, String> paraMap) throws SQLException;

	List<Integer> totalOrderList(Map<String, String> paraMap) throws SQLException;

	List<ProductVO> likeList(Map<String, String> paraMap) throws SQLException;

	int getTotalPage(Map<String, String> paraMap) throws SQLException;

	List<OrderVO> recentOrderList1(Map<String, String> paraMap) throws SQLException;

	List<OrderVO> rowspan(Map<String, String> paraMap) throws SQLException;

	int getTotalPage1(Map<String, String> paraMap) throws SQLException;

	List<ProductVO> likeList1(Map<String, String> paraMap)  throws SQLException;

	List<OrderVO> oderDetailList(String order_code) throws SQLException;

	List<OrderVO> totalOrderList(String order_code) throws SQLException;

	int isOrder(Map<String, String> paraMap) throws SQLException;

	int isRegistered(Map<String, String> paraMap) throws SQLException;
	
	
}
