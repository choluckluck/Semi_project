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

import hasol.board.model.J_ProductDetailVO;
import hasol.board.model.J_ProductVO;
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
	   
	   
	
	// QnA 문의글이 있는 총 페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws Exception {
		
		int totalPage = 0;

		String colname = paraMap.get("sarchType");
		String searchWord = paraMap.get("searchWord"); 
		String searchMin = paraMap.get("qna_search_min");
		String searchMax = paraMap.get("qna_search_max");
		
		System.out.println("searchMin: " + searchMin);
		System.out.println("searchMin: " + searchMax);
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select ceil(count(*)/10)\n"+
					" from tbl_qna\n"+
					" where fk_userid != 'admin'\n" +
					" and to_char(registerday,'yyyy-mm-dd') between '"+searchMin+"' and '"+searchMax+"'";
			
	          // 검색 키워드가 있다면
	          if(!"All".equals(colname)) {
	        	  if(searchWord != null &&  !searchWord.trim().isEmpty() ) {
	                  sql += " and " +colname+ " like '%'|| ? || '%' ";
	        	  }   
	          }    
	          
	          pstmt = conn.prepareStatement(sql);
	          
	          // 검색 키워드가 있다면
		      if(!"All".equals(colname)) {
		    	  if(searchWord != null &&  !searchWord.trim().isEmpty() ) {
		    		  pstmt.setString(1, searchMin);  
	        	  }
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
		
		System.out.println("dao 옴");
		String colname = paraMap.get("sarchType");
		String searchWord = paraMap.get("searchWord"); 
		String searchMin = paraMap.get("qna_search_min");
		String searchMax = paraMap.get("qna_search_max");
		int currentPageNo = Integer.parseInt(paraMap.get("currentPageNo"));
		int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
		
		System.out.println("searchType:" + colname);
		System.out.println("searchWord:" + searchWord);
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select qcode, qcategory, quserid, qsubject, qregisterday, qanswer, prod_name, prod_code, prod_kind, phigh, pimage\n"+
					"from\n"+
					"(     \n"+
					"    select rownum AS RNO, qcode, qcategory, quserid, qsubject, qregisterday, qanswer, prod_name, prod_code, prod_kind, pimage, phigh    \n"+
					"    from    \n"+
					"    (        \n"+
					"        select A.qna_code qcode\n"+
					"        , A.category qcategory\n"+
					"        , A.fk_userid quserid\n"+
					"        , A.subject qsubject\n"+
					"        , A.registerday qregisterday\n"+
					"        , A.answer_yn qanswer\n"+
					"        , B.prod_name prod_name             \n"+
					"        , B.prod_code prod_code             \n"+
					"		 , B.prod_kind prod_kind		\n"+		
					"        , B.prod_image pimage         \n"+
					"        , B.prod_high phigh        \n"+
					"        from tbl_qna A\n"+
					"        join tbl_product B        \n"+
					"        on A.fk_prod_code = B.prod_code    \n" +
					"		 where to_char(A.registerday,'yyyy-mm-dd') between '"+searchMin+"' and '"+searchMax+"'";

			// 검색 키워드가 있다면
        	if(!"0".equals(searchWord) &&  !searchWord.trim().isEmpty() ) {
                  sql += " and " +colname+ " like '%'|| ? || '%' " ;  
        	}
       	
        	sql += "        ) V\n"+
        		   ") T\n" +
      			   " where RNO between ? and ?"+
        		   " order by qregisterday desc";			
        	
			pstmt = conn.prepareStatement(sql);
			
			// 검색 키워드가 있다면
	        if(!"0".equals(searchWord) &&  !searchWord.trim().isEmpty() ) {
		        	pstmt.setString(1, searchWord);	 
		        	pstmt.setInt(2, (currentPageNo*sizePerPage) - (sizePerPage - 1));
		  			pstmt.setInt(3, (currentPageNo*sizePerPage));
	        }
	        // 검색 키워드가 없다면
        	else {
    		    pstmt.setInt(1, (currentPageNo*sizePerPage) - (sizePerPage - 1));
  			    pstmt.setInt(2, (currentPageNo*sizePerPage));
        	}
	        
	        rs = pstmt.executeQuery();
	        
	        while(rs.next()) {
	        	
	        	
	        	J_QnaVO qvo = new J_QnaVO();
	        	qvo.setQna_code(rs.getInt(1));
	        	qvo.setCategory(rs.getString(2));
	        	qvo.setFk_userid(rs.getString(3));
	        	qvo.setSubject(rs.getString(4));
	        	qvo.setRegisterday(rs.getString(5));
	        	qvo.setAnswer_yn(rs.getString(6));
	        	
	        	J_ProductVO pvo = new J_ProductVO();
	        	pvo.setProd_name(rs.getString(7));
	        	pvo.setProd_code(rs.getString(8));
	        	pvo.setProd_kind(rs.getString(9));
	        	pvo.setProd_high(rs.getString(10));
	        	pvo.setProd_image(rs.getString(11));
	        	
	        	qvo.setPvo(pvo);
	        	
	        	QnaList.add(qvo);
	        }
		} finally {
			close();
		}
		
		return QnaList;
	}

}
