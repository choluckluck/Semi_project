package hyerin.review.model;

import java.sql.*;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import hyerin.product.model.ProductVO;

public class ReviewDAO implements InterReviewDAO {
	
	
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
   
   
	// 생성자
	public ReviewDAO() {
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
			
			String sql = "select ceil(count(*)/5)\n"+
						"from tbl_review\n"+
						"left join\n"+
						"tbl_product\n"+
						"on fk_prod_code = prod_code\n";
				
			String review_sortType = paraMap.get("review_sortType"); //all, fk_userid, prod_name, review_registerday 
			String review_searchWord = paraMap.get("review_searchWord");
			
			//검색 기준을 선택한 경우
			if( review_searchWord != null && !review_searchWord.trim().isEmpty() ) {
				if(!"all".equals(review_sortType) || !"".equals(review_sortType)) {
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
	}//end of getToTalReviewPage

	
	
	//페이징한 검색이 있는, 또는 없는 리뷰목록 조회(select)
	@Override
	public List<ReviewVO> selectPagingReview(Map<String, String> paraMap) throws SQLException {
		List<ReviewVO> rvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select review_code, fk_prod_code, prod_name, prod_kind, prod_image, fk_userid, review_subject, review_contents, to_char(review_registerday,'yyyy-mm-dd') as review_registerday, review_file_1, review_file_2, review_file_3, review_grade \n"+
						"from\n"+
						"(\n"+
						"    select rownum as rno, review_code, fk_prod_code, prod_kind, prod_name, prod_image, fk_userid, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade \n"+
						"    from (select * from tbl_review order by review_registerday desc )\n"+
						"    left join\n"+
						"    tbl_product\n"+
						"    on fk_prod_code = prod_code\n";
						
			
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
				ReviewVO rvo = new ReviewVO();
				ProductVO pvo = new ProductVO();
				
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
				
				rvoList.add(rvo);
			}
			
		} finally {
			close();
		}
		
		return rvoList;
	}//end of selectPagingReview
	
	
	
	//reviewcode에 해당하는 행을 삭제하기
	@Override
	public int deleteUserReview(String review_code) throws SQLException {
		int result = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " delete tbl_review where review_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, review_code);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;
	}//end of deleteUserReview

	
	//해당하는 리뷰들을 삭제해준다
	@Override
	public int deleteMultiReview(Map<String, String[]> paraMap) throws SQLException {
		int result = 0;
		try {
			String[] review_codeArr = paraMap.get("review_codeArr");
			
			conn = ds.getConnection();
			
			String sql = " delete tbl_review where review_code = ? ";
			
			for(String review_code : review_codeArr) {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, review_code);
				
				result = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		return result;
	}//end of deleteMultiReview
	

}
