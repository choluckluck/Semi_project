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


	// 아이디 찾기 (이메일)
	String idFind(Map<String, String> paraMap) throws SQLException;

}
