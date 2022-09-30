package heajun.board.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class FaqDAO implements InterFaqDAO  {

	private DataSource ds;// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
	
    private AES256 aes;
    
    // 기본생성자
    public FaqDAO() {
       try {
          Context initContext = new InitialContext();
           Context envContext  = (Context)initContext.lookup("java:/comp/env");
           ds = (DataSource)envContext.lookup("jdbc/semioracle"); //web.xml => ref에 값과 동일해야한다.
           
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
    
    // 시퀀스를 가져온다.
    public int getSeq()
    {
        int result = 1;
        
        try {
        	conn = ds.getConnection();
            
            // 시퀀스 값을 가져온다. 
            String sql = ("SELECT FAQ_CODE.NEXTVAL FROM TBL_FAQ");
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, getSeq());
            
            // 쿼리 실행
            rs = pstmt.executeQuery();
            
            if(rs.next())    result = rs.getInt(1);
 
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;    
    } // end getSeq
    
    
    
	// faq_code 값을 입력받아서 하나의 faq글에 대한 상세정보를 알아오기(select) 
	@Override
	public FaqVO faqOneDetail(String faq_code) throws Exception {
		FaqVO fvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select faq_code, fk_member_code, faq_subject, faq_category, faq_contents "
					   + " from tbl_faq " 
                       + " where faq_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, faq_code);
	      
	                  
	        rs = pstmt.executeQuery();
	         
	        if(rs.next()) {  
	               
	            fvo = new FaqVO();
	            
	            fvo.setFaq_code(rs.getInt(1));
	            fvo.setFk_member_code(rs.getString(2));
	            fvo.setFaq_subject(rs.getString(3));
	            fvo.setFaq_category(rs.getString(4));
	            fvo.setFaq_contents(rs.getString(5));

	        }
			
		} catch(SQLException e) {   
	         e.printStackTrace();
	    } finally {
			close();
		}
		
		return fvo;
	}
	// faq 글 작성시키는 메소드
	@Override
	public void register(String fk_member_code, String faq_category, String faq_subject, String faq_contents)
			throws Exception {
		
		try {
  			conn = ds.getConnection();
  			
  			String sql = " insert into tbl_faq (faq_code, fk_member_code, faq_category, faq_subject, faq_contents) "
  					   + " values(faq_code.nextval, ?, ?, ?, ? ) ";
  			
  			pstmt = conn.prepareStatement(sql);
  			
  			pstmt.setString(1, fk_member_code);
  			pstmt.setString(2, faq_category);
  			pstmt.setString(3, faq_subject);
  			pstmt.setString(4, faq_contents);
  			
  	        pstmt.executeUpdate();
  	        
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} finally {
  			close();
  		}
		
		// TODO Auto-generated method stub
		
	}
	// faq 게시판 글 목록 보여주기
	@Override
	public List<FaqVO> selectPagingfaq() throws Exception {
		List<FaqVO> noticeList = new ArrayList<>();
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select faq_code, fk_member_code, faq_category, faq_subject, faq_contents "
	        		 	+ " from tbl_faq "; 
	         
	            
	            pstmt = conn.prepareStatement(sql);

	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	               
	            	FaqVO nvo = new FaqVO();
	               
	               nvo.setFaq_code(rs.getInt(1));
	               nvo.setFk_member_code(rs.getString(2));
	               nvo.setFaq_category(rs.getString(3));
	               nvo.setFaq_subject(rs.getString(4));
	               nvo.setFaq_contents(rs.getString(5));
	               
	               noticeList.add(nvo);
	               
	            }// end of while---------------------------
	            
	      } catch(SQLException e) {   
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return noticeList;
	}

}
