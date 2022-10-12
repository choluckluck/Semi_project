package seongmin.order.model;

public class CartVO {
	private String cart_code;
	private String fk_userid;
	private String fk_prod_code;
	private String qnty;
	private String fk_prod_color;
	private String fk_prod_size;
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
	public String getQnty() {
		return qnty;
	}
	public void setQnty(String qnty) {
		this.qnty = qnty;
	}
	public String getFk_prod_color() {
		return fk_prod_color;
	}
	public void setFk_prod_color(String fk_prod_color) {
		this.fk_prod_color = fk_prod_color;
	}
	public String getFk_prod_size() {
		return fk_prod_size;
	}
	public void setFk_prod_size(String fk_prod_size) {
		this.fk_prod_size = fk_prod_size;
	}
	
}
