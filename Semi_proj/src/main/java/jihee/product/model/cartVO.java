package jihee.product.model;


public class cartVO {

	
	 private String cart_code; //상품코드
	 private String fk_userid; //상품명
	 private String fk_prod_code; //상품종류      
	 private int qnty; //이미지명
	 private ProductVO prod;
	 private String fk_prod_color;  //색상
	 private String fk_prod_size;	//사이즈
	 
	 public cartVO() {}
		
	public cartVO(String cart_code, String fk_userid, String fk_prod_code, int qnty, ProductVO prod) {
		this. cart_code =  cart_code;
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.qnty = qnty;
		this.prod = prod;
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

	public ProductVO getProd() {
		return prod;
	}
	public void setProd(ProductVO prod) {
		this.prod = prod;
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
