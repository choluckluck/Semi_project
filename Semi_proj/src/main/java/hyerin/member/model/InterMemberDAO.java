package hyerin.member.model;

import java.sql.SQLException;
import java.util.List;

public interface InterMemberDAO {
	
	//하트 클릭시 위시 처리 => 해당 유저의 위시상품을 불러온다
	boolean selectLikeProduct(String userid, String wish_check) throws SQLException;

}
