package heajun.community.model;

import java.sql.Date;


public class NoticeVO {
	
	private int notice_code;			// 공지사항 글 번호
	private String fk_userid;		// 공지사항 글 작성자
	private String notice_subject;	// 공지사항 글 제목
	private String notice_contents;	// 공지사항 글 내용
	private int notice_count;		// 공지사항 글 조회수
	private Date notice_registerday;		// 공지사항 글 작성일
	private String notice_file_1;
	private String notice_file_2;
	private String notice_file_3;
	
	public int getNotice_code() {
		return notice_code;
	}
	public void setNotice_code(int notice_code) {
		this.notice_code = notice_code;
	}
	public String getFk_userid() {
		return fk_userid;
	}
	public void setFk_userid(String fk_userid) {
		this.fk_userid = fk_userid;
	}
	public String getNotice_subject() {
		return notice_subject;
	}
	public void setNotice_subject(String notice_subject) {
		this.notice_subject = notice_subject;
	}
	public String getNotice_contents() {
		return notice_contents;
	}
	public void setNotice_contents(String notice_contents) {
		this.notice_contents = notice_contents;
	}
	public int getNotice_count() {
		return notice_count;
	}
	public void setNotice_count(int notice_count) {
		this.notice_count = notice_count;
	}
	public Date getNotice_registerday() {
		return notice_registerday;
	}
	public void setNotice_registerday(Date notice_registerday) {
		this.notice_registerday = notice_registerday;
	}
	public String getNotice_file_1() {
		return notice_file_1;
	}
	public void setNotice_file_1(String notice_file_1) {
		this.notice_file_1 = notice_file_1;
	}
	public String getNotice_file_2() {
		return notice_file_2;
	}
	public void setNotice_file_2(String notice_file_2) {
		this.notice_file_2 = notice_file_2;
	}
	public String getNotice_file_3() {
		return notice_file_3;
	}
	public void setNotice_file_3(String notice_file_3) {
		this.notice_file_3 = notice_file_3;
	}
	
	
	////////////////////////////////////////////////////////////////////////////////////////
}
