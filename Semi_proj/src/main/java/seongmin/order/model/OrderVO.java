package seongmin.order.model;

import seongmin.login.model.MemberVO;
import seongmin.product.model.ProductVO;
import seongmin.product.model.ThumbVO;

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
	private int row_count;
	private MemberVO mvo;
	private String total;
	private String shipfee;
	
	
	public String getTotal() {
		return total;
	}
	public void setTotal(String total) {
		this.total = total;
	}
	public String getShipfee() {
		return shipfee;
	}
	public void setShipfee(String shipfee) {
		this.shipfee = shipfee;
	}
	public MemberVO getMvo() {
		return mvo;
	}
	public void setMvo(MemberVO mvo) {
		this.mvo = mvo;
	}
	public int getRow_count() {
		return row_count;
	}
	public void setRow_count(int row_count) {
		this.row_count = row_count;
	}
	private ProductVO pvo;
	private OrderVO ovo;
	private OrderDetailVO odvo;
	private ThumbVO tvo;
	
	
	public ThumbVO getTvo() {
		return tvo;
	}
	public void setTvo(ThumbVO tvo) {
		this.tvo = tvo;
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
	public OrderVO getOvo() {
		return ovo;
	}
	public void setOvo(OrderVO ovo) {
		this.ovo = ovo;
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
