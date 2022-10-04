package seongmin.order.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterOrderDAO {

	List<OrderVO> recentOrderList(Map<String, String> paraMap) throws SQLException;

	List<Integer> totalOrderList(Map<String, String> paraMap) throws SQLException;

}
