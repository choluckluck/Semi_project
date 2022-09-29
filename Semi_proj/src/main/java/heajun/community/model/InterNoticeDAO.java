package heajun.community.model;

import java.util.List;
import java.util.Map;

public interface InterNoticeDAO {

	// 공지사항 글 작성시키는 메소드
	void register(String fk_userid, String notice_subject, String notice_contents)throws Exception;

	// 공지사항 게시판 글 목록 보여주기
	List<NoticeVO> selectPagingnotice()throws Exception;

	// notice_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select) 
	NoticeVO noticeOneDetail(String notice_code)throws Exception;

	// 글 클릭했을때 조회수 받아오는 메소드
	void noticeCnt(String notice_code)throws Exception;

	
}
