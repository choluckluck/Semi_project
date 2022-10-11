package heajun.product.model;

public class CartVO_HJ {

	
	 private String cart_code; 
	 private String fk_userid;    
	 private String fk_prod_code; 
	 private int qnty;
	 
	 
	 public CartVO_HJ() {}
	 
	 
	public CartVO_HJ(String cart_code, String fk_userid, String fk_prod_code, int qnty) {
		this.cart_code = cart_code;
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.qnty = qnty;
	}
	public String getCart_code() {
		return cart_code;
	}
	public void setCart_code(String cart_code) {
		this.cart_code = cart_code;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getFk_prod_code() {
		return fk_prod_code;
	}
	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}
	public int getQnty() {
		return qnty;
	}
	public void setQnty(int qnty) {
		this.qnty = qnty;
	}
	 
	 
	 
	 
	 
	
}
