package hyerin.order.model;

public class OrderDetailVO {
	private String order_detail_code;
	private String fk_order_code;
	private String fk_prod_code;
	private int order_buy_count;
	private int order_price;
	private String fk_prod_color;
	private String fk_prod_size;
	
	public String getOrder_detail_code() {
		return order_detail_code;
	}
	public void setOrder_detail_code(String order_detail_code) {
		this.order_detail_code = order_detail_code;
	}
	public String getFk_order_code() {
		return fk_order_code;
	}
	public void setFk_order_code(String fk_order_code) {
		this.fk_order_code = fk_order_code;
	}
	public String getFk_prod_code() {
		return fk_prod_code;
	}
	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}
	public int getOrder_buy_count() {
		return order_buy_count;
	}
	public void setOrder_buy_count(int order_buy_count) {
		this.order_buy_count = order_buy_count;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
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
