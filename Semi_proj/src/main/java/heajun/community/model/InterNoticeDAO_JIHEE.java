package heajun.community.model;

public interface InterNoticeDAO_JIHEE {

	// 공지사항 상세보기 메소드
	NoticeVO noticeOneDetail(String notice_code) throws Exception;

	//조회수 메소드
	public void noticeCnt(String notice_code) throws Exception;
}
