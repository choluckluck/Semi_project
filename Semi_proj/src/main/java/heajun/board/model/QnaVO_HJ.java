package heajun.board.model;

import java.sql.Date;

public class QnaVO_HJ {

	private int qna_code;			// qna 글 번호
	private String fk_userid;	// qna 글 작성자
	private String category;		// qna 글 카테고리
	private String subject;			// qna 글 제목
	private String contents;		// qna 글 내용
	private Date registerday;		// qna 글 등록 일자
	private String file_1;	    	// file_1
	private String file_2;	    	// file_2
	private String file_3;	        // file_3
	private String answer_yn;	    // 답변여부
	private String prod_code;	    // 상품코드
	
	////////////////////////////////////////////////////////////////////////////////////////
	
	public QnaVO_HJ(){}	
	
	public int getQna_code() {
		return qna_code;
	}
	public QnaVO_HJ(int qna_code, String fk_userid, String category, String subject, String contents, Date registerday,
			String file_1, String file_2, String file_3, String answer_yn, String prod_code) {
		
		this.qna_code = qna_code;
		this.fk_userid = fk_userid;
		this.category = category;
		this.subject = subject;
		this.contents = contents;
		this.registerday = registerday;
		this.file_1 = file_1;
		this.file_2 = file_2;
		this.file_3 = file_3;
		this.answer_yn = answer_yn;
		this.prod_code = prod_code;
	}
	
	public void setQna_code(int qna_code) {
		this.qna_code = qna_code;
	}
	
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getRegisterday() {
		return registerday;
	}
	public void setRegisterday(Date registerday) {
		this.registerday = registerday;
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
	public String getAnswer_yn() {
		return answer_yn;
	}
	public void setAnswer_yn(String answer_yn) {
		this.answer_yn = answer_yn;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getProd_code() {
		return prod_code;
	}
	public void setProd_code(String prod_code) {
		this.prod_code = prod_code;
	}
	
	
}
