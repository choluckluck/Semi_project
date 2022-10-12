package heajun.board.model;

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

import heajun.product.model.ProductVO_HJ;


public class ReviewDAO_HJ implements InterReviewDAO_HJ{

	
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
   
   
	// 생성자
	public ReviewDAO_HJ() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/semi");
			  
		          
		} catch(NamingException e) {
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
	//리뷰목록의 총페이지수 구해오기
	@Override
	public int getToTalReviewPage(Map<String, String> paraMap) throws SQLException {
	int totalReviewPage = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select ceil(count(*)/4) " +
						" from tbl_review " +
						" left join "+
						" tbl_product "+
						" on fk_prod_code = prod_code " ;
				
			String review_sortType = paraMap.get("review_sortType"); //all, fk_userid, prod_name, review_registerday 
			String review_searchWord = paraMap.get("review_searchWord");
			
			//검색 기준을 선택한 경우
			if( review_searchWord != null && !review_searchWord.trim().isEmpty() ) {
				if(!"all".equals(review_sortType)) {
					sql += " where "+ review_sortType +" like '%'||?||'%' ";
				}
			}
			
			pstmt = conn.prepareStatement(sql);
			
			if( review_searchWord != null && !review_searchWord.trim().isEmpty() ) {
				if(!"all".equals(review_sortType)) {
					pstmt.setString(1, review_searchWord);
				}
			}
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalReviewPage = rs.getInt(1);
			
			
			
		} finally {
			close();
		}
		
		return totalReviewPage;
	}
	
	
	//페이징한 검색이 있는, 또는 없는 리뷰목록 조회(select)
	@Override
	public List<ReviewVO_HJ> selectPagingReview(Map<String, String> paraMap) throws SQLException {

		List<ReviewVO_HJ> rvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select review_code, fk_prod_code, prod_name, prod_kind, prod_image, fk_userid, review_subject, review_contents, to_char(review_registerday,'yyyy-mm-dd') as review_registerday, review_file_1, review_file_2, review_file_3, review_grade ,  fk_order_detail_code  "+
						" from "+
						"( " +
						"    select rownum as rno, review_code, fk_prod_code, prod_kind, prod_name, prod_image, fk_userid, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade  ,  fk_order_detail_code  " +
						"    from (select * from tbl_review order by review_registerday desc ) " +
						"    left join " +
						"    tbl_product " +
						"    on fk_prod_code = prod_code " ;
						
			
			String review_sortType = paraMap.get("review_sortType"); //all, fk_userid, prod_name, review_registerday 
			String review_searchWord = paraMap.get("review_searchWord");
			
			//검색 기준을 선택한 경우
			if( review_searchWord != null && !review_searchWord.trim().isEmpty() ) {
				if(!"all".equals(review_sortType)) {
					sql += " where "+ review_sortType +" like '%'||?||'%' ";
				}
			}
			sql += ")" +
					" where rno between ? and ? " +
					" order by review_registerday desc ";
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			pstmt = conn.prepareStatement(sql);
			
			if( review_searchWord != null && !review_searchWord.trim().isEmpty() ) {
				if(!"all".equals(review_sortType)) {
					pstmt.setString(1, review_searchWord);
					pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3, (currentShowPageNo*sizePerPage));
				}
			}
			else {
				pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(2, (currentShowPageNo*sizePerPage));
				
			}
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				ReviewVO_HJ rvo = new ReviewVO_HJ();
				ProductVO_HJ pvo = new ProductVO_HJ();
				
				rvo.setReview_code(rs.getString(1));
				rvo.setFk_prod_code(rs.getString(2));
				pvo.setProd_name(rs.getString(3));
				pvo.setProd_kind(rs.getString(4));
				pvo.setProd_image(rs.getString(5));
				rvo.setPvo(pvo);
				rvo.setFk_userid(rs.getString(6));
				rvo.setReview_subject(rs.getString(7));
				rvo.setReview_contents(rs.getString(8));
				rvo.setReview_registerday(rs.getString(9));
				rvo.setReview_file_1(rs.getString(10));
				rvo.setReview_file_2(rs.getString(11));
				rvo.setReview_file_3(rs.getString(12));
				rvo.setReview_grade(rs.getString(13));
				rvo.setFk_order_detail_code(rs.getString(14));
				
				rvoList.add(rvo);
			}
			
		} finally {
			close();
		}
		
		return rvoList;
	}

	//select한 글내용 불러오기 
	@Override
	public ReviewVO_HJ reviewOneDetail(String review_code) throws SQLException {
		
		
		ReviewVO_HJ rvo = null;
		
		try {
			conn = ds.getConnection();
			
			  String sql = " select review_code, fk_userid , review_subject , review_contents , review_registerday , review_file_1 , review_file_2 , review_file_3 , review_grade , fk_prod_code ,  fk_order_detail_code " +
					"		 from tbl_review   " +
					"        where review_code =  ' ? ' " ;
					                    
			
			pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, review_code);
		              
		    rs = pstmt.executeQuery();
		     
		    if(rs.next()) {  
		           
		    	    rvo = new ReviewVO_HJ();
		    	    
		    	    rvo.setReview_code(rs.getString(1));
		            rvo.setFk_userid(rs.getString(2));
		            rvo.setReview_subject(rs.getString(3));
		            rvo.setReview_contents(rs.getString(4));
		            rvo.setReview_registerday(rs.getString(5));
		            rvo.setReview_file_1(rs.getString(6));
		            rvo.setReview_file_2(rs.getString(7));
		            rvo.setReview_file_3(rs.getString(8));
		            rvo.setReview_grade(rs.getString(9));
		            rvo.setFk_prod_code(rs.getString(10));
		            rvo.setFk_order_detail_code(rs.getString(11));
		
		    }
			
		} catch(SQLException e) {   
		     e.printStackTrace();
		} finally {
			close();
		}
		
		return rvo;
			}

	
	//리뷰작성하기
	@Override
	public void write(String fk_userid, String review_subject, String review_contents) throws SQLException {

		try {
  			conn = ds.getConnection();
  			
  			String sql = " insert into tbl_review( review_code, fk_userid,review_subject,review_contents,review_registerday,review_file_1,review_file_2,review_file_3,review_grade,fk_prod_code,fk_order_detail_code ) "
  					   + " values(seq_review_code.nextval, ?, ?, ?, default , ? , ? , ? , ?, ?) " ;
  			
  			pstmt = conn.prepareStatement(sql);
  			
  			pstmt.setString(1, fk_userid);
  			pstmt.setString(2, review_subject);
  			pstmt.setString(3, review_contents);
  			
  	        pstmt.executeUpdate();
  	        
  		} catch (SQLException e) {
  			e.printStackTrace();
  		} finally {
  			close();
  		}
		
	}
	
	
	

}
