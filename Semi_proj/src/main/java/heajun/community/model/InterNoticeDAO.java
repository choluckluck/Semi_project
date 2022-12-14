package heajun.community.model;


import java.util.List;
import java.util.Map;

public interface InterNoticeDAO {

	

	// notice_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select) 
	NoticeVO noticeOneDetail(String notice_code)throws Exception;

	// 글 클릭했을때 조회수 받아오는 메소드
	void noticeCnt(String notice_code)throws Exception;

	// 페이지바를 만들기 위해서 공지글에 대한 총페이지수 알아오기
	int getTotalPage(Map<String, String> paraMap)throws Exception;

	//공지사항에 속하는 글들을 페이지바를 사용해 페이징 처리하여 조회(select)해오기
	List<NoticeVO> selectPagingNoticeList(Map<String, String> paraMap)throws Exception;

	// 공지사항 글 작성시키는 메소드
	void  noticeWrite(NoticeVO nvo)throws Exception;

	

	
	

	
	
	
}
