package hyerin.product.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterProductDAO {
	
	// 메인 페이지
	//Best => 주문 많은 순으로 상품을 불러온다
	List<ProductVO> selectBestProduct() throws SQLException;

	//new Arrival => 최신 등록일자 순으로 상품정보 정렬
	List<ProductVO> selectNewProduct() throws SQLException;
	
	//MD Pick => 노출여부 Y인 것만 랜덤으로 4개를 불러온다
	List<ProductVO> selectMDProduct() throws SQLException;
	
	
	
	
	///////////////////////////////////////////////////////////////
	// 관리자 페이지
	
	// 검색이 있거나 없는, 두번째 셀렉트박스의 조건이 있거나 없는 상품에 대한 총페이지 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// 첫 화면일때는 모든 상품정보를, 셀렉트박스를 변경했을때는 선택한 종류의 상품정보를 조회(select)
	List<ProductVO> selectProductByKind(Map<String, String> paraMap) throws SQLException;
	
	
	// 셀렉트박스 조건과 검색조건을 실행한 상품 보여주기
	//List<ProductVO> selectProduct(Map<String, String> paraMap) throws SQLException;


}
