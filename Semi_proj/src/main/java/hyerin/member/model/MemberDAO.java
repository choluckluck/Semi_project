package hyerin.member.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hyerin.product.model.ProductVO;

public class MemberDAO implements InterMemberDAO {
	private DataSource ds;	//DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public MemberDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	//사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if(rs != null) { rs.close(); rs = null;}
			if(pstmt != null) { pstmt.close(); pstmt = null;}
			if(conn != null) { conn.close(); conn = null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	//하트 클릭시 위시 처리 => 해당 유저의 위시상품을 불러온다
	@Override
	public boolean selectLikeProduct(String userid, String wish_check) throws SQLException {
		
		boolean wish_check_result = false;
		
		try {
			conn = ds.getConnection();
			String sql = "select fk_prod_code\n"+
						"from tbl_like\n"+
						"where fk_userid = ? and fk_prod_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, wish_check);
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				wish_check_result = true;
			}
			
			
		} finally {
		     close();
		}
		
		return wish_check_result;
		
	}//end of selectLikeProduct
}
