package heajun.community.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface InterNoticeDAO {

	// 공지사항 글 작성시키는 메소드
	void register(String fk_userid, String notice_subject, String notice_contents)throws Exception;

	// notice_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select) 
	NoticeVO noticeOneDetail(String notice_code)throws Exception;

	// 글 클릭했을때 조회수 받아오는 메소드
	void noticeCnt(String notice_code)throws Exception;

	// 페이지바를 만들기 위해서 공지글에 대한 총페이지수 알아오기
	int getTotalPage(String notice_code)throws Exception;

	
	//VO 를 사용하지 않고 Map으로 처리 => 한 번만 실행하려고 abstract에서 실행
	//tbl_notice 테이블에서 글번호(notice_code), id(fk_userid), 제목(notice_subject), 조회수(notice_count) , 날짜(notice_registerday) 을 조회해오기
	List<HashMap<String, String>> getNotice()throws Exception;

	//공지사항에 속하는 글들을 페이지바를 사용해 페이징 처리하여 조회(select)해오기
	List<NoticeVO> selectPagingNoticeList(Map<String, String> paraMap)throws Exception;

	
	
	
}
