package hyerin.member.model;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

public interface InterMemberDAO {
	
	// *** 메인페이지 *** //
	
	//하트 클릭시 위시 처리 => 해당 유저의 위시상품을 불러온다
	boolean selectLikeProduct(String userid, String wish_check) throws SQLException;


	
	
	// *** 관리자페이지 *** //
	
	// * 회원관리 *
	
	//조회해올 회원의 총 페이지수 구하기
	int getTotalMemberPage(Map<String, String> paraMap) throws SQLException;


	// 페이징 처리한 검색이 있는, 또는 없는 회원목록 조회(select)
	List<MemberVOhr> selectPaginMember(Map<String, String> paraMap) throws SQLException;
	
	
	
	
	// * 회원정보조회/수정 *

	
	//회원정보를 조회하기
	MemberVOhr selectEditUserInfo(String userid) throws SQLException;

	//userid에 해당하는 회원을 탈퇴처리하기 (update)
	int upateUserStatus(String userid) throws SQLException;
	
	//체크된 회원들을 탈퇴처리하기(update)
	int updateCheckedMember(String[] useridArr) throws SQLException;

	
	
	// * 구매하기 * //
	
	
	// 유저정보 불러오기
	MemberVOhr getMemberDetail(String userid) throws SQLException;



	//세션에 저장되어있는 loginuser의 grade_code를 업데이트해준다
	MemberVOhr getUserGrade_code(String userid) throws SQLException;
	
	
}
