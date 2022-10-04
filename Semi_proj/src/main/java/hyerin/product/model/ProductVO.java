package hyerin.product.model;

public class ProductVO {

	
	 private String prod_code; //상품코드
	 private String prod_name; //상품명
	 private String prod_kind; //상품종류      
	 private String prod_image; //이미지파일명
	 private String prod_high;  //상품 굽높이
	 private String prod_color;  //상품 색상
	 private String prod_size;   //상품 사이즈
	 private String prod_price;	 // 상품 가격    
	 private String prod_saleprice;	 // 상품 판매가격 (할인적용)    
	 private String prod_stock; // 상품 재고
	 private String prod_registerday; // 상품
	 private String prod_review_count; // 리뷰개수
	 private String prod_description; //상품설명
	 private String prod_point; // 상품포인트
	 
	 private String md_pick_yn; //메인노출여부
	 
	 private ProductDetailVO pdvo;
	 
	
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
	
	
	public String getProd_price() {
		return prod_price;
	}
	public void setProd_price(String prod_price) {
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
	
	public String getProd_review_count() {
		return prod_review_count;
	}
	public void setProd_review_count(String prod_review_count) {
		this.prod_review_count = prod_review_count;
	}
	
	public String getProd_saleprice() {
		return prod_saleprice;
	}
	public void setProd_saleprice(String prod_saleprice) {
		this.prod_saleprice = prod_saleprice;
	}
	
	public String getProd_description() {
		return prod_description;
	}
	public void setProd_description(String prod_description) {
		this.prod_description = prod_description;
	}
	public String getProd_point() {
		return prod_point;
	}
	public void setProd_point(String prod_point) {
		this.prod_point = prod_point;
	}
	
	
	
	public String getMd_pick_yn() {
		return md_pick_yn;
	}
	public void setMd_pick_yn(String md_pick_yn) {
		this.md_pick_yn = md_pick_yn;
	}
	
	
	
	public ProductDetailVO getPdvo() {
		return pdvo;
	}
	public void setPdvo(ProductDetailVO pdvo) {
		this.pdvo = pdvo;
	}
	/////////////////////////////////////////////////////////////
	public ProductVO() {}
	
	
	 
	 
	   
	
}

