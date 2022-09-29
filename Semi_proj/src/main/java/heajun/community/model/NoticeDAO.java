package heajun.community.model;

import java.io.UnsupportedEncodingException;
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

public class NoticeDAO  implements InterNoticeDAO{

	private DataSource ds;// DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
	
    private AES256 aes;
    
    // 기본생성자
    public NoticeDAO() {
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
            String sql = ("SELECT NOTICE_NUM.NEXTVAL FROM TBL_NOTICE");
            
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
    
    
    // 공지사항 글 작성시키는 메소드
	@Override
	public void register(String fk_userid, String notice_subject, String notice_contents) throws Exception {
		try {
  			conn = ds.getConnection();
  			
  			String sql = " insert into tbl_notice(notice_code, fk_userid, notice_subject, notice_contents, notice_count, notice_date) "
  					   + " values(notice_code.nextval, ?, ?, ?, ?, default, default) ";
  			
  			pstmt = conn.prepareStatement(sql);
  			
  			pstmt.setString(1, fk_userid);
  			pstmt.setString(2, notice_subject);
  			pstmt.setString(3, notice_contents);
  			
  	        pstmt.executeUpdate();
  	        
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} finally {
  			close();
  		}
		
	}
	// 공지 게시판 글 목록 보여주기
	@Override
	public List<NoticeVO> selectPagingnotice() throws Exception {
		List<NoticeVO> notice = new ArrayList<>();
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select notice_code, fk_userid, notice_subject, notice_contents, notice_count, notice_registerday "
	        		 	+ " from tbl_notice "; 
	         
	            
	            pstmt = conn.prepareStatement(sql);

	            rs = pstmt.executeQuery();
	            
	            while(rs.next()) {
	               
	               NoticeVO nvo = new NoticeVO();
	               
	               nvo.setNotice_code(rs.getInt(1));
	               nvo.setFk_userid(rs.getString(2));
	               nvo.setNotice_subject(rs.getString(3));
	               nvo.setNotice_contents(rs.getString(4));
	               nvo.setNotice_count(rs.getInt(5));
	               nvo.setNotice_registerday(rs.getDate(6));
	               
	               notice.add(nvo);
	               
	            }// end of while---------------------------
	            
	      } catch(SQLException e) {   
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return notice;
	}
	// notice_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select) 
	@Override
	public NoticeVO noticeOneDetail(String notice_code) throws Exception {
     NoticeVO nvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select notice_code, fk_userid, notice_subject, notice_contents, notice_count, notice_registerday "
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
	            nvo.setNotice_registerday(rs.getDate(6));

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
			
			String sql = " select notice_count "+
						 " from tbl_notice "+
						 " where notice_code = ? ";
			
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

	// 전체 게시물에 대한 총페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws Exception {
		int totalPage = 0;
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select ceil(count(*)/?) " + 
	                      " from tbl_notice " + 
	                      " where notice_code != 'null' ";
	         
	         String colname = paraMap.get("searchType");
	         
	         
	         pstmt = conn.prepareStatement(sql);

	         pstmt.setString(1, paraMap.get("sizePerPage"));
	         
	         
	         rs = pstmt.executeQuery();
	         
	         rs.next();
	         
	         totalPage = rs.getInt(1);
	         
	      finally {
	         close();
	      }
	      
	      return totalPage;
	}

    //  페이징 처리를 한 글목록 보여주기
	@Override
	public List<NoticeVO> selectPagingNoticeList(Map<String, String> paraMap) {
		 List<NoticeVO> notice = new ArrayList<>();
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = " select notice_code, notice_subject, notice_contents " + 
	        		 	" from " + 
	        		 	" ( " + 
	        		 	" select rownum AS rno, notice_code, notice_subject, notice_contents " + 
	        		 	" from " + 
	        		 	" ( " + 
	        		 	" select notice_code, notice_subject, notice_contents " + 
	        		 	" from tbl_notice " + 
	        		 	" where notice_code != 'null' ";
	         
	         String colname = paraMap.get("searchType");
	         
	         if( searchWord != null && !searchWord.trim().isEmpty() ) {
		            
		            sql +=  " and "+colname+" like '%'|| ? ||'%' ";
		         
		         }
		         
		            sql +=    "     order by board_date desc " + 
		               "    ) V " + 
		               " ) T " + 
		               " where rno between ? and ?";
		            
		            pstmt = conn.prepareStatement(sql);
		            
		            int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
		            int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
		            
		            if( searchWord != null && !searchWord.trim().isEmpty() ) {
		               pstmt.setString(1, searchWord);
		               pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 공식 
		               pstmt.setInt(3, (currentShowPageNo * sizePerPage)); // 공식
		            }
		            else {
		               pstmt.setInt(1, (currentShowPageNo * sizePerPage) - (sizePerPage - 1)); // 공식 
		               pstmt.setInt(2, (currentShowPageNo * sizePerPage)); // 공식
		            }
		            
		            rs = pstmt.executeQuery();
	            
	            
	            while(rs.next()) {
	               
	               NoticeVO nvo = new NoticeVO();
	               nvo.setNotice_code(rs.getInt(1));
	               nvo.setNotice_subject(rs.getString(2));
	               nvo.setNotice_contents(rs.getString(3));
	               notice.add(nvo);

	            }// end of while---------------------------
	            
	      } catch(SQLException e) {   
	         e.printStackTrace();
	      } finally {
	         close();
	      }
	      
	      return notice;
	}

	
	

}
