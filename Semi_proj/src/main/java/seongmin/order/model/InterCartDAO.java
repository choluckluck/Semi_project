package seongmin.order.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterCartDAO {

	int goCart(Map<String, String> paraMap) throws SQLException;

}
