package hasol.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;
import util.security.Sha256;

public class J_MemberDAO implements J_InterMemberDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public J_MemberDAO() {
		
		 try {
	         Context initContext = new InitialContext();
	          Context envContext  = (Context)initContext.lookup("java:/comp/env");
	          ds = (DataSource)envContext.lookup("jdbc/semi");
	          
	          aes = new AES256(SecretMyKey.KEY);
	          // SecretMyKey.KEY 은 우리가 만든 비밀키이다.
	          
	      } catch(NamingException e) {
	         e.printStackTrace();
	      } catch(UnsupportedEncodingException e) {
	         e.printStackTrace();
	      }
	}
	
   // 사용한 자원을 반납하는 close() 메소드 생성하기 
   private void close() {
      try {
         if(rs != null)    {rs.close();    rs=null;}
         if(pstmt != null) {pstmt.close(); pstmt=null;}
         if(conn != null)  {conn.close();  conn=null;}
      } catch(SQLException e) {
         e.printStackTrace();
      }
   }

   
   // 
   @Override
   public int registerMember(J_MemberVO member) throws SQLException {
		
	   int result = 0;
	   
	   try {
		   
		   conn = ds.getConnection();
		   
		   String sql = " insert into tbl_member(userid, pwd, name, postcode, address, detailaddress, mobile, email, gender, birthday)" +
				   		" values (?,?,?,?,?,?,?,?,?,?)";
		   
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setString(1, member.getUserid());
		   pstmt.setString(2, Sha256.encrypt( member.getPwd()) );
		   pstmt.setString(3, member.getName() );
		   pstmt.setString(4, member.getPostcode() );
		   pstmt.setString(5, member.getAddress());
		   pstmt.setString(6, member.getUserid());
		   pstmt.setString(7, aes.encrypt(member.getMobile()) );
		   pstmt.setString(8, aes.encrypt(member.getEmail()) );
		   // pstmt.setString(9, member.getMarketing_yn());
		   pstmt.setString(9, member.getGender());
		   pstmt.setString(10, member.getBirthday());

		   result = pstmt.executeUpdate();
		   
	   } catch(GeneralSecurityException | UnsupportedEncodingException e) {
	         e.printStackTrace();
       } finally {
          close();
       }
       
       return result;
   }   
}
