package heajun.board.model;

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

public class QnaDAO implements InterQnaDAO {
	
	private DataSource ds;// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
	
    private AES256 aes;
    
    // 기본생성자
    public QnaDAO() {
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
            String sql = ("SELECT QNA_CODE.NEXTVAL FROM TBL_QNA");
            
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
    } // end getSeq()---------------------------------------------
    
    
	// qna_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select)
	@Override
	public QnaDAO qnaOneDetail(String qna_code) throws Exception {
       
		QnaVO qvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select qna_code, fk_member_code, category, subject, contents, registerday "
					   + " from tbl_qna " 
                       + " where qna_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, qna_code);
	                  
	        rs = pstmt.executeQuery();
	         
	        if(rs.next()) {  
	               
	            qvo = new QnaVO();
	            qvo.setQna_code(rs.getInt(1));
	            qvo.setFk_member_code(rs.getString(2));
	            qvo.setCategory(rs.getString(3));
	            qvo.setSubject(rs.getString(4));
	            qvo.setContents(rs.getString(5));
	            qvo.setRegisterday(rs.getDate(6));

	        }
			
		} catch(SQLException e) {   
	         e.printStackTrace();
	    } finally {
			close();
		}
		
		return qvo;
		
	}//public QnaDAO qnaOneDetail(String qna_code) throws Exception 

	// 글 정보 수정하기
	@Override
	public int updateBoard(String fk_member_code, String category, String subject, String contents, String qna_code
			) throws Exception {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_qna "+
						 " set fk_member_code = ?, category = ?, subject = ?, contents = ? "+
						 " where fk_member_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fk_member_code);
			pstmt.setString(2, category);
			pstmt.setString(3, subject);
			pstmt.setString(4, contents);
			pstmt.setString(4, qna_code);

			n = pstmt.executeUpdate();		
			

         } finally {
            close();
         }
		
		return n;
	}

	// 수정한 글 보여주기
	@Override
	public QnaVO updateEnd(String fk_member_code, String category, String subject, String contents, String qna_code,
			String registerday) throws Exception {
		QnaVO qvo = null;
		
		try {
 	        conn = ds.getConnection();
 	         
 	        String sql = " select qna_code, fk_member_code, category , subject, contents, registerday "
 	        		   + " from tbl_qna " ; 
	         
	            
	            pstmt = conn.prepareStatement(sql);

	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	               
	            	qvo = new QnaVO();
	            	qvo.setQna_code(rs.getInt(1));
	            	qvo.setFk_member_code(rs.getString(2));
	            	qvo.setCategory(rs.getString(3));
	            	qvo.setSubject(rs.getString(4));
	            	qvo.setContents(rs.getString(5));
	            	qvo.setRegisterday(rs.getDate(6));
	               
	            }// end of while---------------------------
	            
	      } catch(SQLException e) {   
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	return qvo;
	}


}//public class QnaDAO implements InterQnaDAO
