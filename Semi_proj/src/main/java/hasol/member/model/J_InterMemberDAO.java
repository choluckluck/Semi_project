package hasol.member.model;

import java.sql.SQLException;

public interface J_InterMemberDAO {

	// 회원가입
	int registerMember(J_MemberVO member) throws SQLException;

	// 아이디 중복 체크
	boolean idDuplicateCheck(String userid) throws SQLException;

	// 이메일 중복 체크
	boolean emailDuplicateCheck(String email) throws SQLException;

}
