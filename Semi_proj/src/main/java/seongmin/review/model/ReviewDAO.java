package seongmin.review.model;

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

import seongmin.qna.model.QnaVO;
import seongmin.review.model.InterReviewDAO;

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
			
		} //end of close()

		@Override
		public int getTotalPage(Map<String, String> paraMap) throws SQLException {
			int totalPage = 0;

			try {
				conn = ds.getConnection();

				String sql = "select ceil(count(*)/10) \n"+
						"from tbl_review\n"+
						"where fk_userid = ? \n"+
						"";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("userid"));

				rs = pstmt.executeQuery();

				rs.next();

				totalPage = rs.getInt(1);

			} finally {
				close();
			}

			return totalPage;	
		}

		@Override
		public List<ReviewVO> geReviewList(Map<String, String> paraMap) throws SQLException {
			List<ReviewVO> reviewList = new ArrayList<>();

			try {
				conn = ds.getConnection();


				String sql = "select rnum, review_code, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade, fk_prod_code, fk_order_detail_code\n"+
						"from \n"+
						"(\n"+
						"select  rownum as rnum, review_code, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade, fk_prod_code, fk_order_detail_code\n"+
						"from\n"+
						"(\n"+
						"select review_code, review_subject, review_contents, to_char(review_registerday, 'yyyy-mm-dd') as review_registerday, review_file_1, review_file_2, review_file_3, review_grade, fk_prod_code, fk_order_detail_code\n"+
						"from tbl_review R\n"+
						"join tbl_member M\n"+
						"on userid = fk_userid\n"+
						"where fk_userid= ?  \n"+
						" order by review_registerday desc			\n"+
						") V\n"+
						") D\n"+
						"where rnum between ? and ?";
				
				
				int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
				int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("userid"));

				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(3, (currentShowPageNo * sizePerPage));			
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ReviewVO rvo = new ReviewVO();
					rvo.setRnum(rs.getString(1));
					rvo.setReview_code(rs.getString(2));
					rvo.setReview_subject(rs.getString(3));
					rvo.setReview_contents(rs.getString(4));
					rvo.setReview_registerday(rs.getString(5));
					rvo.setReview_file_1(rs.getString(6));
					rvo.setReview_file_2(rs.getString(7));
					rvo.setReview_file_3(rs.getString(8));
					rvo.setReview_grade(rs.getString(9));
					rvo.setFk_prod_code(rs.getString(10));
					rvo.setFk_order_detail_code(rs.getString(11));
					
					// very Important

					reviewList.add(rvo);
					
				} // end of while
				
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				close();
			}

			return reviewList;
			
		}

		@Override
		public int getTotalPage_review(Map<String, String> paraMap) throws SQLException {

			int totalPage = 0;

			try {
				conn = ds.getConnection();

				String sql = "select ceil(count(*)/10) \n"+
						"from tbl_review\n"+
						"where fk_prod_code = ? \n"+
						"";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("prod_code"));

				rs = pstmt.executeQuery();

				rs.next();

				totalPage = rs.getInt(1);

			} finally {
				close();
			}

			return totalPage;	
			
		}

		@Override
		public List<ReviewVO> geReviewList_proddetail(Map<String, String> paraMap) throws SQLException {

			List<ReviewVO> reviewList = new ArrayList<>();

			try {
				conn = ds.getConnection();


				String sql = "select rnum, review_code, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade, fk_prod_code, fk_order_detail_code\n"+
						"from \n"+
						"(\n"+
						"select  rownum as rnum, review_code, review_subject, review_contents, review_registerday, review_file_1, review_file_2, review_file_3, review_grade, fk_prod_code, fk_order_detail_code\n"+
						"from\n"+
						"(\n"+
						"select review_code, review_subject, review_contents, to_char(review_registerday, 'yyyy-mm-dd') as review_registerday, review_file_1, review_file_2, review_file_3, review_grade, fk_prod_code, fk_order_detail_code\n"+
						"from tbl_review R\n"+
						"join tbl_member M\n"+
						"on userid = fk_userid\n"+
						"where fk_prod_code = ?  \n"+
						" order by review_registerday desc			\n"+
						") V\n"+
						") D\n"+
						"where rnum between ? and ?";
				
				
				int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo1"));
				int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage1"));
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("prod_code"));

				pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
				pstmt.setInt(3, (currentShowPageNo * sizePerPage));			
				
				rs = pstmt.executeQuery();

				while (rs.next()) {
					ReviewVO rvo = new ReviewVO();
					rvo.setRnum(rs.getString(1));
					rvo.setReview_code(rs.getString(2));
					rvo.setReview_subject(rs.getString(3));
					rvo.setReview_contents(rs.getString(4));
					rvo.setReview_registerday(rs.getString(5));
					rvo.setReview_file_1(rs.getString(6));
					rvo.setReview_file_2(rs.getString(7));
					rvo.setReview_file_3(rs.getString(8));
					rvo.setReview_grade(rs.getString(9));
					rvo.setFk_prod_code(rs.getString(10));
					rvo.setFk_order_detail_code(rs.getString(11));
					
					// very Important

					reviewList.add(rvo);
					
				} // end of while
				
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				close();
			}

			return reviewList;
		}


		
		
		
}
