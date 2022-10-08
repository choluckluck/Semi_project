package hyerin.product.model;

public class ProductDetailVO {
	private String prod_detail_code;
	private String fk_prod_code;
	private String prod_color;
	private String prod_size;
	private String prod_stock;
	
	private String prod_stockresult;
	
	
	public String getProd_stockresult() {
		return prod_stockresult;
	}
	public void setProd_stockresult(String prod_stockresult) {
		this.prod_stockresult = prod_stockresult;
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
	public String getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(String prod_stock) {
		this.prod_stock = prod_stock;
	}
	
	
}
