package heajun.product.model;

public class ProductDetailVO {
	
	 private String prod_detail_code; //상품코드
	 private String fk_prod_code; //상품명
	 private String prod_color;  //상품 색상
	 private String prod_size;   //상품 사이즈
	 private int prod_stock; // 상품 재고
	 
	 private ProductVO_HJ ovo;        // 상품VO 
	 private CartVO_HJ fK_prod_code;



	 
	 ////////////////////////////////////////////////
	 public ProductDetailVO() {}
	 
	
	public ProductDetailVO(String prod_detail_code, String fk_prod_code, String prod_color, String prod_size,
			int prod_stock,  ProductVO_HJ ovo, CartVO_HJ fK_prod_code) {
		this.prod_detail_code = prod_detail_code;
		this.fk_prod_code = fk_prod_code;
		this.prod_color = prod_color;
		this.prod_size = prod_size;
		this.prod_stock = prod_stock;
		this.ovo = ovo;
		this.setFK_prod_code(fK_prod_code);
	}







	public String getProd_detail_code() {
		return prod_detail_code;
	}
	public void setProd_detail_code(String prod_detail_code) {
		this.prod_detail_code = prod_detail_code;
	}
	public String getFk_prod_code() {
		return fk_prod_code;
	}
	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}
	public String getProd_color() {
		return prod_color;
	}
	public void setProd_color(String prod_color) {
		this.prod_color = prod_color;
	}
	public String getProd_size() {
		return prod_size;
	}
	public void setProd_size(String prod_size) {
		this.prod_size = prod_size;
	}
	public int getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(int prod_stock) {
		this.prod_stock = prod_stock;
	}




	public ProductVO_HJ getOvo() {
		return ovo;
	}


	public void setOvo(ProductVO_HJ ovo) {
		this.ovo = ovo;
	}


	

	public Object getFK_prod_code() {
		return fK_prod_code;
	}



	public void setFK_prod_code( CartVO_HJ fK_prod_code) {
		this.fK_prod_code = fK_prod_code;
	}
	
	
	 //////////////////////////
	 
	
	 
	
	
}
