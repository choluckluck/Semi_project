package hyerin.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hyerin.member.model.MemberVO;
import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class MemberDAO implements InterMemberDAO {
	private DataSource ds;	//DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;

	// 생성자
	public MemberDAO() {
	
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		    
		    aes = new AES256(SecretMyKey.KEY);
		    // SecretMyKey.KEY 은 우리가 만든 비밀키이다.
		    
		} catch(NamingException e) {
			e.printStackTrace();
		} catch(UnsupportedEncodingException e) {
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

	// 입력받은 paraMap 을 가지고 한명의 회원정보를 리턴시켜주는 메소드(로그인 처리) 
	@Override
	public MemberVO selectOneMember(Map<String, String> paraMap) throws SQLException  {
		MemberVO member = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = "SELECT userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender,\n"+
					"birthyyyy, birthmm, birthdd, point, registerday, pwdchangegap, grade_code, account_name, bank_name, account,\n"+
					"nvl(lastlogingap, trunc( months_between(sysdate, registerday) ) ) AS lastlogingap\n"+
					"FROM\n"+
					"(\n"+
					"select userid, name, email, mobile, postcode, address, detailaddress, extraaddress, gender,\n"+
					"substr(birthday,1,4) AS birthyyyy, substr(birthday,6,2) AS birthmm, substr(birthday,9) AS birthdd,\n"+
					"point, to_char(registerday, 'yyyy-mm-dd') AS registerday, grade_code, account_name, bank_name, account,\n"+
					"trunc( months_between(sysdate, LAST_PWD_CHANGE_DATE) ) AS pwdchangegap\n"+
					"from tbl_member\n"+
					"where status = 1 and userid = ? and pwd = ? \n"+
					") M \n"+
					"CROSS JOIN\n"+
					"(\n"+
					"select trunc( months_between(sysdate, max(logindate)) ) as lastlogingap\n"+
					"from tbl_login_history\n"+
					"where fk_userid = ?  \n"+
					") H";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, Sha256.encrypt(paraMap.get("pwd")) );
			pstmt.setString(3, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new MemberVO();
				
				member.setUserid(rs.getString(1));
				member.setName(rs.getString(2));
				member.setEmail( aes.decrypt(rs.getString(3)) );  // 복호화 
				member.setMobile( aes.decrypt(rs.getString(4)) ); // 복호화  
				member.setPostcode(rs.getString(5));
				member.setAddress(rs.getString(6));
				member.setDetailaddress(rs.getString(7));
				member.setExtraaddress(rs.getString(8));
				member.setGender(rs.getString(9));
				member.setBirthday(rs.getString(10) + rs.getString(11) + rs.getString(12));
				member.setPoint(rs.getInt(14));
				member.setRegisterday(rs.getString(15));
				
				if ( rs.getInt(16) >= 3 ) {
					// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지났으면 true
					// 마지막으로 암호를 변경한 날짜가 현재시각으로 부터 3개월이 지나지 않았으면 false 
					
					member.setRequirePwdChange(true); // 로그인시 암호를 변경해라는 alert 를 띄우도록 할때 사용한다.
				}
				
				member.setGrade_code(rs.getString(17));
				member.setAccount_name(rs.getString(18));
				member.setBank_name(rs.getString(19));
				member.setAccount(rs.getString(20));								
				
				if ( rs.getInt(21) >= 12 ) {
					// 마지막으로 로그인 한 날짜시간이 현재시각으로 부터 1년이 지났으면 휴면으로 지정 
					member.setIdle(1);
					
					// === tbl_member 테이블의 idle 컬럼의 값을 1 로 변경하기 === //
					sql = " update tbl_member set idle = 1 "
						+ " where userid = ? "; 
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					
					pstmt.executeUpdate();
				}
				
				// === tbl_login_history(로그인기록) 테이블에 insert 하기 === //
				if(member.getIdle() != 1) {
					sql = " insert into tbl_login_history(fk_userid, clientip) "
						+ " values(?, ?) ";
					
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, paraMap.get("userid"));
					pstmt.setString(2, paraMap.get("clientip"));
					
					pstmt.executeUpdate();
				}
				
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return member;
		
	}
}
