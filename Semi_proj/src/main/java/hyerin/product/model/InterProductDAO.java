package hyerin.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	
	//Best => 주문 많은 순으로 상품을 불러온다
	List<ProductVO> selectBestProduct() throws SQLException;

	//new Arrival => 최신 등록일자 순으로 상품정보 정렬
	List<ProductVO> selectNewProduct() throws SQLException;
	
	//MD Pick => 노출여부 Y인 것만 랜덤으로 4개를 불러온다
	List<ProductVO> selectMDProduct() throws SQLException;

}
