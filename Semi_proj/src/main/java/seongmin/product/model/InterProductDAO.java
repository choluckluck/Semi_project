package seongmin.product.model;

import java.sql.SQLException;
import java.util.*;

public interface InterProductDAO {
	
	List<ProductVO> interestList(Map<String, String> paraMap) throws SQLException;
	

}
