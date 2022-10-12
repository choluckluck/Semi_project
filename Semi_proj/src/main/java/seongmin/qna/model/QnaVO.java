package seongmin.qna.model;

public class QnaVO {
	private String qna_code;
	private String fk_userid;
	private String category;
	private String subject;
	private String contents;
	private String rnum;
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getQna_code() {
		return qna_code;
	}
	public void setQna_code(String qna_code) {
		this.qna_code = qna_code;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
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
	public String getRegisterday() {
		return registerday;
	}
	public void setRegisterday(String registerday) {
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
	public String getFk_prod_code() {
		return fk_prod_code;
	}
	public void setFk_prod_code(String fk_prod_code) {
		this.fk_prod_code = fk_prod_code;
	}
	private String registerday;
	private String file_1;
	private String file_2;
	private String file_3;
	private String answer_yn;
	private String fk_prod_code;
	 
}
