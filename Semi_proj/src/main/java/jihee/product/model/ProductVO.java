package jihee.product.model;

public class ProductVO {

	
	 private String prod_code; //상품코드
	 private String prod_name; //상품명
	 private String prod_kind; //상품종류      
	 private String prod_image; //이미지명
	 private String prod_high;  //상품 굽높이
	 private String prod_color;  //상품 색상
	 private String prod_size;   //상품 사이즈
	 private int prod_price;	 // 상품 가격    
	 private String prod_stock; // 상품 재고
	 private String prod_registerday; // 상품
	 private int prod_review_count; //제품 리뷰 개수
	 private int prod_order_count; // 상품 주문수
	 private int prod_saleprice; // 상품 할인가격
	 private int prod_point; // 상품 포인트
	 
	 private int totalPrice;         // 판매당시의 제품판매가 * 주문량
	 private int totalPoint;         // 판매당시의 포인트점수 * 주문량 


	 //////////////////////////
	 
	
	 
	 

	public String getProd_code() {
		return prod_code;
	}
	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}
	
	
	public String getProd_name() {
		return prod_name;
	}
	public void setProd_name(String prod_name) {
		this.prod_name = prod_name;
	}
	
	
	public String getProd_kind() {
		
		return prod_kind;
	}
	public void setProd_kind(String prod_kind) {
		this.prod_kind = prod_kind;
	}
	
	
	public String getProd_image() {
		return prod_image;
	}
	public void setProd_image(String prod_image) {
		this.prod_image = prod_image;
	}
	
	
	public String getProd_high() {
		return prod_high;
	}
	public void setProd_high(String prod_high) {
		this.prod_high = prod_high;
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
	
	
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	
	
	public String getProd_stock() {
		return prod_stock;
	}
	public void setProd_stock(String prod_stock) {
		this.prod_stock = prod_stock;
	}
	
	
	public String getProd_registerday() {
		return prod_registerday;
	}
	public void setProd_registerday(String prod_registerday) {
		this.prod_registerday = prod_registerday;
	}
	
	
	public int getProd_review_count() {
		return prod_review_count;
	}
	public void setProd_review_count(int prod_review_count) {
		this.prod_review_count = prod_review_count;
	}
	
	
	public int getProd_order_count() {
		return prod_order_count;
	}
	public void setProd_order_count(int prod_order_count) {
		this.prod_order_count = prod_order_count;
	}
	
	
	public int getProd_saleprice() {
		return prod_saleprice;
	}
	public void setProd_saleprice(int prod_saleprice) {
		this.prod_saleprice = prod_saleprice;
	}
	
	 
	public int getProd_point() {
		return prod_point;
	}
	public void setProd_point(int prod_point) {
		this.prod_point = prod_point;
	}
	

	
	

	public int getDiscountPercent() {
		// 정가   :  판매가 = 100 : x
		
		// 5000 : 3800 = 100 : x
		// x = (3800*100)/5000 
		// x = 76
		// 100 - 76 ==> 24% 할인
		
		// 할인률 = 100 - (판매가 * 100) / 정가
		return 100 - (prod_saleprice * 100)/prod_price;
	}
	
	public int getDiscountPercentBest() {
		// 정가   :  판매가 = 100 : x
		
		// 5000 : 3800 = 100 : x
		// x = (3800*100)/5000 
		// x = 76
		// 100 - 76 ==> 24% 할인
		
		// 할인률 = 100 - (판매가 * 100) / 정가
		return -(100 - (prod_saleprice * 100)/prod_price);
	}
	
	
	/////////////////////////////////////////////////
	// *** 제품의 총판매가(실제판매가 * 주문량) 구해오기 ***
	public void setTotalPriceTotalPoint(int Qnty) {   
	// int oqty 이 주문량이다.
	
	totalPrice = prod_saleprice * Qnty; // 판매당시의 제품판매가 * 주문량
	totalPoint = prod_point * Qnty;     // 판매당시의 포인트점수 * 주문량 
	}
	
	public int getTotalPrice() {
	return totalPrice;
	}
	
	public int getTotalPoint() {
	return totalPoint;
	
	
}

	 
	   
	
}