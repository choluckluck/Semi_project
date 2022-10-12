package hasol.member.model;

import java.sql.SQLException;

public interface J_InterMemberDAO {

	// 회원가입
	int registerMember(J_MemberVO member) throws SQLException;

}
