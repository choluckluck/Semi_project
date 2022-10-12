package seongmin.product.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterLikeDAO {

	int delLike(String like_code) throws SQLException;

	int delLikeList(Map<String, Object> paraMap) throws SQLException;

}
