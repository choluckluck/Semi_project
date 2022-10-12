package heajun.product.model;

import java.sql.SQLException;

public interface InterProductDetailDAO {

	
	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기 
	ProductVO_HJ selectProduct(String prod_code)throws SQLException;

	// 옵션 선택을 위한 해당 상품의 옵션 정보가져오기 
	ProductVO_HJ selectProductOption(String prod_code)throws SQLException;

	Product_imageVO selectImage(String prod_code) throws SQLException;
	
	
	

}
