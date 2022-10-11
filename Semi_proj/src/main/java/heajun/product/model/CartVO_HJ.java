package heajun.product.model;

public class CartVO_HJ {

	
	 private String cart_code; 
	 private String fk_userid;    
	 private String fk_prod_code; 
	 private int qnty;
	 private String fk_prod_color; 
	 private int fk_prod_size; 

	 
	 public CartVO_HJ() {}
	 
	 
	
	 
	 
	 
	public CartVO_HJ(String cart_code, String fk_userid, String fk_prod_code, int qnty, String fk_prod_color,
			int fk_prod_size) {
		super();
		this.cart_code = cart_code;
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.qnty = qnty;
		this.fk_prod_color = fk_prod_color;
		this.fk_prod_size = fk_prod_size;
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






	public String getFk_prod_color() {
		return fk_prod_color;
	}






	public void setFk_prod_color(String fk_prod_color) {
		this.fk_prod_color = fk_prod_color;
	}






	public int getFk_prod_size() {
		return fk_prod_size;
	}






	public void setFk_prod_size(int fk_prod_size) {
		this.fk_prod_size = fk_prod_size;
	}
	 
	 
	 
	 
	 
	
}
