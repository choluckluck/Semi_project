package heajun.product.model;

public class Product_imageVO {

	
	 private String prod_image_code; //상품 이미지 코드
	 private String fk_prod_code; //상품 코드
	 private String product_image_file;  //이미지 파일
	 
	 
	 
	 public Product_imageVO() {}
	 
	 
	public Product_imageVO(String prod_image_code, String fk_prod_code, String product_image_file) {
		this.prod_image_code = prod_image_code;
		this.fk_prod_code = fk_prod_code;
		this.product_image_file = product_image_file;
	}
	
	public String getProd_image_code() {
		return prod_image_code;
	}
	public void setProd_image_code(String prod_image_code) {
		this.prod_image_code = prod_image_code;
	}
	public String getFk_prod_code() {
		return fk_prod_code;
	}
	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}
	public String getProduct_image_file() {
		return product_image_file;
	}
	public void setProduct_image_file(String product_image_file) {
		this.product_image_file = product_image_file;
	}
	 
	 
}
