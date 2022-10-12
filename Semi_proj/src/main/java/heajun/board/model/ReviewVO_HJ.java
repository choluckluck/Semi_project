package heajun.board.model;

import heajun.product.model.ProductVO_HJ;

public class ReviewVO_HJ {

	private String review_code;
	private String fk_userid;
	private String fk_prod_code;
	private String review_subject;
	private String review_contents;
	private String review_registerday;
	private String review_file_1;
	private String review_file_2;
	private String review_file_3;
	private String review_grade;
	private String Fk_order_detail_code;
	private ProductVO_HJ pvo;

	
	public ReviewVO_HJ() {}
		
	public ReviewVO_HJ(String review_code, String fk_userid, String fk_prod_code, String review_subject,
			String review_contents, String review_registerday, String review_file_1, String review_file_2,
			String review_file_3, String review_grade, String fk_order_detail_code, ProductVO_HJ pvo) {

		this.review_code = review_code;
		this.fk_userid = fk_userid;
		this.fk_prod_code = fk_prod_code;
		this.review_subject = review_subject;
		this.review_contents = review_contents;
		this.review_registerday = review_registerday;
		this.review_file_1 = review_file_1;
		this.review_file_2 = review_file_2;
		this.review_file_3 = review_file_3;
		this.review_grade = review_grade;
		Fk_order_detail_code = fk_order_detail_code;
		this.pvo = pvo;
	}
	
	public String getReview_code() {
		return review_code;
	}
	public void setReview_code(String review_code) {
		this.review_code = review_code;
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
	public String getReview_subject() {
		return review_subject;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}
	public String getReview_registerday() {
		return review_registerday;
	}
	public void setReview_registerday(String review_registerday) {
		this.review_registerday = review_registerday;
	}
	public String getReview_file_1() {
		return review_file_1;
	}
	public void setReview_file_1(String review_file_1) {
		this.review_file_1 = review_file_1;
	}
	public String getReview_file_2() {
		return review_file_2;
	}
	public void setReview_file_2(String review_file_2) {
		this.review_file_2 = review_file_2;
	}
	public String getReview_file_3() {
		return review_file_3;
	}
	public void setReview_file_3(String review_file_3) {
		this.review_file_3 = review_file_3;
	}
	public String getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(String review_grade) {
		this.review_grade = review_grade;
	}
	public String getFk_order_detail_code() {
		return Fk_order_detail_code;
	}
	public void setFk_order_detail_code(String fk_order_detail_code) {
		this.Fk_order_detail_code = fk_order_detail_code;
	}
	public ProductVO_HJ getPvo() {
		return pvo;
	}
	public void setPvo(ProductVO_HJ pvo) {
		this.pvo = pvo;
	}
	
	
	
	
}
