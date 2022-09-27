package hyerin.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {

	//new Arrival => 최신 등록일자 순으로 상품정보 정렬
	List<ProductVO> selectNewProduct() throws SQLException;

}
