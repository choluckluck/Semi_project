package heajun.board.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public QnaVO qnaOneDetail(String qna_code) throws Exception {
       
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

	// 페이지바를 만들기 위해서 문의글 대한 총페이지수 알아오기
	@Override
	public int getTotalPage(String qna_code) throws Exception {
      int totalPage = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/10) " 
						+ "from tbl_qna "
						+ " where fk_member_code = 'null' " ; 
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qna_code);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		return totalPage;
	}

	//문의사항 속하는 글들을 페이지바를 사용해 페이징 처리하여 조회(select)해오기
	@Override
	public List<QnaVO> selectPagingQnaList(Map<String, String> paraMap) throws Exception {
		List<QnaVO> QnaList = new ArrayList<>(); //new를 해줬기 때문에 null이 아니다! 사이즈가 0일 뿐임.
	      
		try {
	        conn = ds.getConnection();
	        
	        String sql = " select qna_code, fk_member_code, category , subject, contents, registerday  " +
	        		"	        		 from ( " +
	        		"	        		    select rownum AS qna_code, fk_member_code, category , subject, contents, registerday " +
	        		"	        		    from( " +
	        		"	        		        select qna_code, fk_member_code, category , subject, contents, registerday  " +
	        		"	        		        from tbl_qna  " +
	        		"                            where fk_member_code != ' null '  " +
	        		"	        		   ) V " +
	        		"	        		 )T " +
	        		"	        		 where qna_code between ? and ? " +
	        		"                       order by qna_code ASC " ;
			
	       
	        
			// === 페이징 처리의 공식 ===
			// where RNO between (조회하고자하는 페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는 페이지번호 * 한페이지당보여줄행의개수)
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = 10;
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("qna_code"));
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(3, (currentShowPageNo*sizePerPage));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				QnaVO qvo = new QnaVO();
	             
				qvo.setQna_code(rs.getInt(1));
				qvo.setFk_member_code(rs.getString(2));
				qvo.setCategory(rs.getString(3));
				qvo.setSubject(rs.getString(4));
				qvo.setContents(rs.getString(5));
				qvo.setRegisterday(rs.getDate(6));
				
				
				
				QnaList.add(qvo);
				
			}//end of while
			
	      } finally {
	         close();
	      }
		
		return QnaList;
	}
	//VO 를 사용하지 않고 Map으로 처리 => 한 번만 실행하려고 abstract에서 실행
	//tbl_qna 테이블에서 글번호(qna_code), id(fk_member_code), 제목(subject),날짜(registerday)을 조회해오기
	@Override
	public List<HashMap<String, String>> getQnaList() throws Exception {
        
		List<HashMap<String, String>> QnaList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select qna_code, fk_member_code, category , subject, contents, registerday , file_1, file_2, file_3 ,answer_yn "
						+ "from tbl_qna "
						+ "order by qna_code asc " ; 
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				HashMap<String, String> map = new HashMap<>();
				map.put("qna_code", rs.getString(1));
				map.put("fk_member_code", rs.getString(2));
				map.put("category", rs.getString(3));
				map.put("subject", rs.getString(4));
				map.put("contents", rs.getString(5));
				map.put("registerday", rs.getString(6));
				map.put("file_1", rs.getString(7));
				map.put("file_2", rs.getString(8));
				map.put("file_3", rs.getString(9));
				map.put("answer_yn", rs.getString(9));
				
				
				QnaList.add(map);
			}
				
		} finally {
			close();
		}
		
		return QnaList;
	}


}//public class QnaDAO implements InterQnaDAO
