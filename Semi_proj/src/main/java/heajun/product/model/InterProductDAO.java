package heajun.product.model;


public interface InterProductDAO {

	// 관심상품에 물건 담기
	int addWish(String userid, String prod_code, String prod_color, String prod_size) throws Exception;

	// 장바구니에 물건 담기
	int addCart(String userid, String prod_code, String qnty, String prod_color,String prod_size) throws Exception;
	
}
