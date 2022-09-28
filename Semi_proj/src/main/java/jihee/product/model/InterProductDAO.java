package jihee.product.model;

import java.sql.SQLException;
import java.util.List;

public interface InterProductDAO {

	//상품 카드 목록 가져오기
	List<ProductVO> selectProductAll() throws SQLException;

}
