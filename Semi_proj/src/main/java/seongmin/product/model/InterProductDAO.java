package seongmin.product.model;

import java.sql.SQLException;
import java.util.*;

import seongmin.order.model.OrderVO;

public interface InterProductDAO {
	
	List<ProductVO> interestList(Map<String, String> paraMap) throws SQLException;

	List<ProductVO> orderDetailList(String order_code) throws SQLException;


	List<String> getprod_info(Map<String, String> paraMap) throws SQLException;

	

}
