package hyerin.order.model;

import hyerin.member.model.MemberVOhr;
import hyerin.product.model.ProductVO;

public class OrderVO {
	private String order_code;
	private String fk_userid;
	private String orderdate;
	private String expectdate;
	private int total_order_amount;
	private String order_state;
	private int point_use_amount;
	private int discount_amount;
	private int real_amount;
	private String fk_order_state_name;
	private int delivery_fee;
	private int total_price; //총 정상가주문
	
	private ProductVO pvo;
	private OrderDetailVO odvo;
	private MemberVOhr mvo;
	
	
	
	
	public int getTotal_price() {
		return total_price;
	}
	public void setTotal_price(int total_price) {
		this.total_price = total_price;
	}
	public int getDelivery_fee() {
		return delivery_fee;
	}
	public void setDelivery_fee(int delivery_fee) {
		this.delivery_fee = delivery_fee;
	}
	public MemberVOhr getMvo() {
		return mvo;
	}
	public void setMvo(MemberVOhr mvo) {
		this.mvo = mvo;
	}
	public String getFk_order_state_name() {
		return fk_order_state_name;
	}
	public void setFk_order_state_name(String fk_order_state_name) {
		this.fk_order_state_name = fk_order_state_name;
	}
	public OrderDetailVO getOdvo() {
		return odvo;
	}
	public void setOdvo(OrderDetailVO odvo) {
		this.odvo = odvo;
	}
	
	public ProductVO getPvo() {
		return pvo;
	}
	public void setPvo(ProductVO pvo) {
		this.pvo = pvo;
	}
	public String getOrder_code() {
		return order_code;
	}
	public void setOrder_code(String order_code) {
		this.order_code = order_code;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getOrderdate() {
		return orderdate;
	}
	public void setOrderdate(String orderdate) {
		this.orderdate = orderdate;
	}
	public String getExpectdate() {
		return expectdate;
	}
	public void setExpectdate(String expectdate) {
		this.expectdate = expectdate;
	}
	public int getTotal_order_amount() {
		return total_order_amount;
	}
	public void setTotal_order_amount(int total_order_amount) {
		this.total_order_amount = total_order_amount;
	}
	public String getOrder_state() {
		return order_state;
	}
	public void setOrder_state(String order_state) {
		this.order_state = order_state;
	}
	public int getPoint_use_amount() {
		return point_use_amount;
	}
	public void setPoint_use_amount(int point_use_amount) {
		this.point_use_amount = point_use_amount;
	}
	public int getDiscount_amount() {
		return discount_amount;
	}
	public void setDiscount_amount(int discount_amount) {
		this.discount_amount = discount_amount;
	}
	public int getReal_amount() {
		return real_amount;
	}
	public void setReal_amount(int real_amount) {
		this.real_amount = real_amount;
	}
		
		
		
}
