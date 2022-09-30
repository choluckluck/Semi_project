package heajun.board.model;

public class FaqVO {

	
	private int faq_code;			// faq 글 번호
	private String fk_member_code;	// faq 글 작성자
	private String faq_subject;		// faq 글 제목
	private String faq_category;	// faq 글 카테고리
	private String faq_contents;	// faq 글 내용
	private String file_1;	    	// file_1
	private String file_2;	    	// file_2
	private String file_3;	        // file_3
	////////////////////////////////////////////////////////////////////////////////////////

	
	public int getFaq_code() {
		return faq_code;
	}
	public void setFaq_code(int faq_code) {
		this.faq_code = faq_code;
	}
	public String getFk_member_code() {
		return fk_member_code;
	}
	public void setFk_member_code(String fk_member_code) {
		this.fk_member_code = fk_member_code;
	}
	public String getFaq_subject() {
		return faq_subject;
	}
	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}
	public String getFaq_category() {
		return faq_category;
	}
	public void setFaq_category(String faq_category) {
		this.faq_category = faq_category;
	}
	public String getFaq_contents() {
		return faq_contents;
	}
	public void setFaq_contents(String faq_contents) {
		this.faq_contents = faq_contents;
	}
	public String getFile_1() {
		return file_1;
	}
	public void setFile_1(String file_1) {
		this.file_1 = file_1;
	}
	public String getFile_2() {
		return file_2;
	}
	public void setFile_2(String file_2) {
		this.file_2 = file_2;
	}
	public String getFile_3() {
		return file_3;
	}
	public void setFile_3(String file_3) {
		this.file_3 = file_3;
	}
	
	////////////////////////////////////////////////////////////////////////////////////////
		
	
}
