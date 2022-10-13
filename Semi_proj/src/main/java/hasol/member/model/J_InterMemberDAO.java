package hasol.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface J_InterMemberDAO {

	// 회원가입
	int registerMember(J_MemberVO member) throws SQLException;
	
	// 이메일 중복 찾기 검사
	boolean emailDuplicateCheck(String email) throws SQLException;

	// 아이디 중복 찾기 검사
	boolean idDuplicateCheck(String userid) throws SQLException;

	// 아이디 찾기
	String idFind(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 찾기 전 유저 검사
	boolean isUserExist(Map<String, String> paraMap) throws SQLException;

	// 비밀번호 변경
	int pwdUpdate(Map<String, String> paraMap) throws SQLException;

}
