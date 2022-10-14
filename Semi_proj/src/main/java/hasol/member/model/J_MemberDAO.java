package hasol.member.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.Map;

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

   
   // 회원가입
   @Override
   public int registerMember(J_MemberVO member) throws SQLException {
		
	   int result = 0;
	   
	   try {
		   
		   conn = ds.getConnection();
		   
		   String sql = " insert into tbl_member(userid, pwd, name, postcode, address, detailaddress, mobile, email, marketing_yn, gender, birthday)" +
				   		" values (?,?,?,?,?,?,?,?,?,?,?)";
		   
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setString(1, member.getUserid());
		   pstmt.setString(2, Sha256.encrypt( member.getPwd()) );
		   pstmt.setString(3, member.getName() );
		   pstmt.setString(4, member.getPostcode() );
		   pstmt.setString(5, member.getAddress());
		   pstmt.setString(6, member.getDetailaddress());
		   pstmt.setString(7, aes.encrypt(member.getMobile()) );
		   pstmt.setString(8, aes.encrypt(member.getEmail()) );
		   pstmt.setString(9, member.getMarketing_yn());
		   pstmt.setString(10, member.getGender());
		   pstmt.setString(11, member.getBirthday());

		   result = pstmt.executeUpdate();
		   
	   } catch(GeneralSecurityException | UnsupportedEncodingException e) {
	         e.printStackTrace();
       } finally {
          close();
       }
       
       return result;
   }

   
   // 아이디 중복 검사
   @Override
   public boolean idDuplicateCheck(String userid) throws SQLException {
	      boolean isExists = false;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select userid "
	                  + " from tbl_member "
	                  + " where userid = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userid);
	         
	         rs = pstmt.executeQuery();
	         
	         isExists = rs.next(); // 행이 있으면(중복된 userid) true ,
	                               // 행이 없으면(사용가능한 userid) false 
	         
	      } finally {
	         close();
	      }
	      
	      return isExists;
   }

   
   // 이메일 중복 검사
	@Override
	public boolean emailDuplicateCheck(String email) throws SQLException {
	   boolean isExists = false;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select email "
	                  + " from tbl_member "
	                  + " where email = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, aes.encrypt(email));
	         
	         rs = pstmt.executeQuery();
	         
	         isExists = rs.next(); 

	      } catch(GeneralSecurityException | UnsupportedEncodingException e) {
	          e.printStackTrace();
	      } finally {
	         close();
	      }
	      return isExists;
	}

	
	// ID 찾기
	@Override
	public String idFind(Map<String, String> paraMap) throws SQLException{
		String userid = null;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select userid"
	                  + " from tbl_member "
	                  + " where status = 1 and name = ? and email = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, paraMap.get("name") );
	         pstmt.setString(2, aes.encrypt(paraMap.get("email") ));
	         
	         String check = aes.encrypt(paraMap.get("email"));
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	        	userid = rs.getString(1);
	         }
	         
	      } catch(GeneralSecurityException | UnsupportedEncodingException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return userid;
	}

	// 사용자 존재하는지 조회
	@Override
	public boolean isUserExist(Map<String, String> paraMap) throws SQLException {
		boolean isUserExist = false;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select userid "
	                  + " from tbl_member "
	                  + " where status = 1 and userid = ? and email = ? and name= ?";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, paraMap.get("userid") );
	         pstmt.setString(2, aes.encrypt(paraMap.get("email") ));
	         pstmt.setString(3, paraMap.get("name"));
	         
	         rs = pstmt.executeQuery();
	         
	         isUserExist = rs.next();
	         
	      } catch(GeneralSecurityException | UnsupportedEncodingException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return isUserExist;
	}

	
	// 비밀번호 변경
	@Override
	public int pwdUpdate(Map<String, String> paraMap) throws SQLException {
		int result = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " update tbl_member set pwd = ?, LAST_PWD_CHANGE_DATE = sysdate "
	                  + " where userid = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, Sha256.encrypt(paraMap.get("pwd")) ); // 암호를 SHA256 알고리즘으로 단방향 암호화 시켜서 갱신해준다.
	         pstmt.setString(2, paraMap.get("userid") );
	         
		      
	         result = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return result;
	}


}
