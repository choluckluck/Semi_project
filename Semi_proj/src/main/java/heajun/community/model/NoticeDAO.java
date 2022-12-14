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
    
    // 시퀀스를 가져온다.
    public int getSeq()
    {
        int result = 1;
        
        try {
        	conn = ds.getConnection();
            
            // 시퀀스 값을 가져온다. 
            String sql = ("SELECT NOTICE_CODE.NEXTVAL FROM TBL_NOTICE");
            
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
    
    
   
	// notice_code 값을 입력받아서 하나의 게시글에 대한 상세정보를 알아오기(select) 
	@Override
	public NoticeVO noticeOneDetail(String notice_code) throws Exception {
     
		NoticeVO nvo = null;
		
		try {
			conn = ds.getConnection();
			
			String sql = " select notice_code, fk_userid, notice_subject, notice_contents, notice_count, notice_registerday, notice_file_1, notice_file_2, notice_file_3 "
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
	            nvo.setNotice_file_1(rs.getString(7));
	            nvo.setNotice_file_2(rs.getString(8));
	            nvo.setNotice_file_3(rs.getString(9));

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

	// 페이지바를 만들기 위해서 공지사항 글에 대한 총페이지수 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap)throws SQLException {
		
		int totalPage = 0;
		
		try {
			
			conn = ds.getConnection();
			
			 String sql = " select ceil(count(*)/10) as total " +
					    "   from tbl_notice " ;
			           
		
			  pstmt = conn.prepareStatement(sql);
			
			  rs = pstmt.executeQuery();
			
			  rs.next();
			
			  totalPage = rs.getInt(1);
		
		} finally {
			close();
		}
		return totalPage;
	}

	

	//공지사항에 속하는 글들을 페이지바를 사용해 페이징 처리하여 조회(select)해오기
	@Override
	public List<NoticeVO> selectPagingNoticeList(Map<String, String> paraMap) throws SQLException {
		
		List<NoticeVO> noticeList = new ArrayList<>(); 
	      
		try {
	        conn = ds.getConnection();
	        
	        String sql = "select notice_code, fk_userid, notice_subject, notice_contents, notice_count,  to_char(notice_registerday, 'yyyy-mm-dd') as notice_registerday , notice_file_1, notice_file_2, notice_file_3 \n"+
	        		"from\n"+
	        		"(\n"+
	        		"select rownum as rn, notice_code, fk_userid, notice_subject, notice_contents, notice_count, notice_registerday, notice_file_1, notice_file_2, notice_file_3 \n"+
	        		"from\n"+
	        		"(\n"+
	        		"select notice_code, fk_userid, notice_subject, notice_contents, notice_count, notice_registerday , notice_file_1, notice_file_2, notice_file_3 \n"+
	        		"from tbl_notice \n"+
	        		"order by notice_registerday desc\n"+
	        		") A\n"+
	        		")B \n"+
	        		"where rn between ? and ?";
			
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = 10;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(2, (currentShowPageNo*sizePerPage));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				NoticeVO nvo = new NoticeVO();
	             
				nvo.setNotice_code(rs.getInt(1));
				nvo.setFk_userid(rs.getString(2));
				nvo.setNotice_subject(rs.getString(3));
				nvo.setNotice_contents(rs.getString(4));
				nvo.setNotice_count(rs.getInt(5));
				nvo.setNotice_registerday(rs.getString(6));
				nvo.setNotice_file_1(rs.getString(7));
				nvo.setNotice_file_2(rs.getString(8));
				nvo.setNotice_file_3(rs.getString(9));
				
				
				noticeList.add(nvo);
				
			}//end of while
			
	      } finally {
	         close();
	      }
		
		return noticeList;
	}
	
	// 공지사항 글 작성시키는 메소드
	@Override
	public void  noticeWrite(NoticeVO nvo) throws Exception {
		
		  
	      
	      try {
	         conn = ds.getConnection();
	         
	         String sql = "    insert into tbl_notice(notice_code, fk_userid, notice_subject, notice_contents , notice_count , notice_registerday , notice_file_1 ,notice_file_2,notice_file_3 )  "+
	 				      "    values(seq_notice_code.nextval,  ? ,  ? ,  ? , default , default ,  ?  ,  ?  ,  ?  ) " ;
			 
	         
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, nvo.getNotice_code());
	         pstmt.setString(2, nvo.getFk_userid());
	         pstmt.setString(3, nvo.getNotice_subject());    
	         pstmt.setString(4, nvo.getNotice_contents()); 
	         pstmt.setInt(5, nvo.getNotice_count());    
	         pstmt.setString(6, nvo.getNotice_registerday());    
	         pstmt.setString(7, nvo.getNotice_file_1()); 
	         pstmt.setString(8, nvo.getNotice_file_2()); 
	         pstmt.setString(9, nvo.getNotice_file_3()); 
	         
	         pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      
	}//end of public void  noticeWrite(NoticeVO nvo) throws Exception
	


	
	

	

}
