package heajun.product.model;



public class ProductVO_HJ {
	
	
	 private String prod_code; //상품코드
	 private String prod_name; //상품명
	 private String prod_kind; //상품종류      
	 private String prod_image; //이미지명
	 private String prod_high;  //상품 굽높이
	 private int prod_price;	 // 상품 가격 
	 private String prod_registerday; // 상품
	 private String md_pick_yn; // 상품
	 private int prod_saleprice; // 상품 할인가격
	 private String prod_description; // 상품 설명
	 private int prod_point; // 상품 포인트
	 private ProductDetailVO pvo;        // 상품VO 
	 
	 public ProductVO_HJ() {}
	 
	 
	public ProductVO_HJ(String prod_code, String prod_name, String prod_kind, String prod_image, String prod_high,
			int prod_price, String prod_registerday, String md_pick_yn, int prod_saleprice, String prod_description,
			int prod_point) {
		
		this.prod_code = prod_code;
		this.prod_name = prod_name;
		this.prod_kind = prod_kind;
		this.prod_image = prod_image;
		this.prod_high = prod_high;
		this.prod_price = prod_price;
		this.prod_registerday = prod_registerday;
		this.md_pick_yn = md_pick_yn;
		this.prod_saleprice = prod_saleprice;
		this.prod_description = prod_description;
		this.prod_point = prod_point;
	}
	
	
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
	public int getProd_price() {
		return prod_price;
	}
	public void setProd_price(int prod_price) {
		this.prod_price = prod_price;
	}
	public String getProd_registerday() {
		return prod_registerday;
	}
	public void setProd_registerday(String prod_registerday) {
		this.prod_registerday = prod_registerday;
	}
	public String getMd_pick_yn() {
		return md_pick_yn;
	}
	public void setMd_pick_yn(String md_pick_yn) {
		this.md_pick_yn = md_pick_yn;
	}
	public int getProd_saleprice() {
		return prod_saleprice;
	}
	public void setProd_saleprice(int prod_saleprice) {
		this.prod_saleprice = prod_saleprice;
	}
	public String getProd_description() {
		return prod_description;
	}
	public void setProd_description(String prod_description) {
		this.prod_description = prod_description;
	}
	public int getProd_point() {
		return prod_point;
	}
	public void setProd_point(int prod_point) {
		this.prod_point = prod_point;
	}


	public ProductDetailVO getPvo() {
		return pvo;
	}


	public void setPvo(ProductDetailVO pvo) {
		this.pvo = pvo;
	}
	
	 

	 //////////////////////////
	 
	
	 
	

	 
	   
}
