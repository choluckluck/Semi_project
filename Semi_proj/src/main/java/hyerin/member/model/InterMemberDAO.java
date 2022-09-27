package hyerin.member.model;

import java.sql.SQLException;
import java.util.Map;

public interface InterMemberDAO {
	
	// 로그인 함수
	MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException;

}
