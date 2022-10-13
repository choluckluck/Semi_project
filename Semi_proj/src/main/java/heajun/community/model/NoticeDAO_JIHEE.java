package heajun.community.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class NoticeDAO_JIHEE implements InterNoticeDAO_JIHEE {
	
	 private DataSource ds;// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	    private Connection conn;
	    private PreparedStatement pstmt;
	    private ResultSet rs;
	   
	    private AES256 aes;
	    
	    // 기본생성자
	    public NoticeDAO_JIHEE() {
	       try {
	          Context initContext = new InitialContext();
	           Context envContext  = (Context)initContext.lookup("java:/comp/env");
	           ds = (DataSource)envContext.lookup("jdbc/semi"); //web.xml => ref에 값과 동일해야한다.
	           
	           aes = new AES256(SecretMyKey.KEY);
	           // SecretMyKey.KEY 는 우리가 만든 비밀키이다.
	       } catch (NamingException e) { //NamingException
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

	//공지사항 상세보기 메소드
	@Override
	public NoticeVO noticeOneDetail(String notice_code) throws Exception {
		
		NoticeVO nvo = null;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select notice_code, fk_userid, notice_subject, notice_contents, notice_count, to_char(notice_registerday, 'yyyy-mm-dd') as notice_registerday, notice_file_1, notice_file_2, notice_file_3 "
	                  	+ " from tbl_notice " 
	                    + " where notice_code = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	           pstmt.setString(1, notice_code);
	                     
	           rs = pstmt.executeQuery();
	            
	           if(rs.next()) {  
	                  
	               nvo = new NoticeVO();
	               
	               nvo.setNotice_code(rs.getInt(1));
	               nvo.setFk_userid(rs.getString(2));
	               nvo.setNotice_subject(rs.getString(3));
	               nvo.setNotice_contents(rs.getString(4));
	               nvo.setNotice_count(rs.getInt(5));
	               nvo.setNotice_registerday(rs.getString(6));

	           }
	         
	      } catch(SQLException e) {   
	            e.printStackTrace();
	       } finally {
	         close();
	      }
		return nvo;
	}
	
	 // 글 클릭했을때 조회수 받아오는 메소드
	   @Override
	   public void noticeCnt(String notice_code) throws Exception {
	      int noticeCnt = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select notice_count " +
	                   " from tbl_notice " +
	                   " where notice_code = ? " ;
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, notice_code);
	         
	         rs = pstmt.executeQuery();
	         
	         if(rs.next()) {
	            noticeCnt = rs.getInt(1);
	         }
	         ////////////////////////////////////////////////////// select문 여러개 나오면 헷갈리니까 주석치기
	         sql = " update tbl_notice set notice_count = ? "
	            + " where notice_code = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setString(1, (noticeCnt+1)+"");
	         pstmt.setString(2, notice_code);
	         
	      
	         pstmt.executeUpdate();
	         
	         
	      } catch(SQLException e) {   
	            e.printStackTrace();
	       } finally {
	         close();
	      }
	   }

}
