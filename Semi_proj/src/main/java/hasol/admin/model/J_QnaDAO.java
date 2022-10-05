package hasol.admin.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class J_QnaDAO implements J_InterQnaDAO {
	
	 private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	   private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   
	   private AES256 aes;
	   
	   // 생성자
	   public J_QnaDAO() {
	      
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
	   
	   
	
	// QnA 문의글이 있는 총 페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws Exception {
		
		int totalPage = 0;
		
		try {
			
			conn = ds.getConnection();
			
	          String sql = " select ceil(count(*)/?)  "
	                   + "from tbl_qna "
	                   + " where fk_userid != 'admin' "
	                   + " and to_char(registerday,'yyyy-mm-dd') between '?' and '?' ";
	          
	          String answer_yn = paraMap.get("searchType");
	          
	          if(!"ALL".equals(answer_yn)) {
                  sql += " and answer_yn = '?' ";
	          }
	          
	          pstmt = conn.prepareStatement(sql);
	          
	          pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) );
	          pstmt.setString(2, paraMap.get("qna_search_min"));
	          pstmt.setString(3, paraMap.get("qna_search_max"));
	          
	          if(!"ALL".equals(answer_yn)) {
	        	  pstmt.setString(4, answer_yn);
	          }
	          
	          rs = pstmt.executeQuery();
	          rs.next();
	          
	          totalPage = rs.getInt(1);
			
		 }finally {
	          close();
	     }
		
		return totalPage;
	}

	@Override
	public List<J_QnaVO> pagingQna(Map<String, String> paraMap) throws Exception {
		List<J_QnaVO> QnaList = new ArrayList<>();
		
		try {
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}

}
