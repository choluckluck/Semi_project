package hyerin.product.model;

import java.sql.SQLException;
import java.util.*;

public interface InterProductDAO {
	
	// 메인 페이지
	//Best => 주문 많은 순으로 상품을 불러온다
	List<ProductVO> selectBestProduct() throws SQLException;

	//new Arrival => 최신 등록일자 순으로 상품정보 정렬
	List<ProductVO> selectNewProduct() throws SQLException;
	
	//MD Pick => 노출여부 Y인 것만 랜덤으로 4개를 불러온다
	List<ProductVO> selectMDProduct() throws SQLException;
	
	
	
	
	///////////////////////////////////////////////////////////////
	// ** 관리자 페이지 ** //
	
	
	// * 상품 목록 *
	
	// 검색이 있거나 없는, 두번째 셀렉트박스의 조건이 있거나 없는 상품에 대한 총페이지 알아오기
	int getTotalPage(Map<String, String> paraMap) throws SQLException;
	
	// 첫 화면일때는 모든 상품정보를, 셀렉트박스를 변경했을때는 선택한 종류의 상품정보를 조회(select)
	List<ProductVO> selectPagingProductByKind(Map<String, String> paraMap) throws SQLException;
	
	
	//해당 상품코드, 상품컬러에 대한 사이즈를 조회하기
	List<ProductDetailVO> getProductSize(String pcode, String pcolor) throws SQLException;
	
	//재고량을 조회하기
	String getStock(String p_code, String p_color, String p_size) throws SQLException;
	
	
	
	
	
	// * 상품 등록 * 
	
	//상품종류 목록을 가져오기
	List<String> selectProdKindList() throws SQLException;
	
	//상품번호를 채굴해오기
	String getProdCode() throws SQLException;
	
	
	//tbl_product 테이블에 제품 insert하기
	int insertProduct(ProductVO pvo) throws SQLException;
	
	
	// tbl_product_image에 상품상세 이미지를 insert 해주기
	int insertProductImage(String prod_code, String product_image_file) throws SQLException;

	//옵션 정보가 있을 때 tbl_prod_detail에 insert 해주기
	int insertProductDetail(ProductDetailVO pdvo) throws SQLException;
	
	
	
	
	// * 상품 수정 *
	
	
	//해당 prod_code의 상품정보를 보여주기(select) 
	ProductVO getOneEditProduct(String prod_code) throws SQLException;
	
	//해당 prod_code의 상품상세정보를 보여주기 (select)
	List<ProductDetailVO> getOneProductDetail(String prod_code) throws SQLException;
	
	// tbl_product에 받아온 상품 정보를 update해주기
	int updateProduct(ProductVO pvo) throws SQLException;
	
	// tbl_product_image에 상품상세 이미지를 update 해주기
	int updateProductImage(String prod_code, String product_image_file) throws SQLException;
	
	// 기존에 있던 옵션 모두 지워주기
	int deleteProductDetailAll(String prod_code) throws SQLException;
	
	//한 상품을 삭제하기
	int deleteOneProduct(String prod_code) throws SQLException;
	
	//해당하는 상품들을 삭제해준다
	int deleteMultiProduct(Map<String, String[]> paraMap) throws SQLException;
	
	// 주문하려는 상품정보 불러오기
	List<ProductVO> getOrderProductsInfo(Map<String, Object> paraMap) throws SQLException;
	
	// transaction 메소드
	int orderAdd(Map<String, Object> paraMap) throws SQLException;
	
	//주문한 제품에 대해 email 보내기시 email 내용에 넣을 주문한 제품번호들에 대한 제품정보를 얻어옴
	List<ProductVO> getOrderedProductList(String[] prod_codeArr) throws SQLException;
	
	//pcode에 해당하는 제품의 컬러를 알아온다
	List<String> getProductColor(String pcode) throws SQLException;
	
	//cart_code에 해당하는 카트의 컬러, 사이즈를 업데이트해줌
	int updateCartOption(String cart_code, String fk_prod_color, String fk_prod_size) throws SQLException;


	//퀵뷰 관심상품 개수 알아오기
	int likeProdCount(String userid) throws SQLException;

	
	
	
	
	

	
	
	
	
	


}
