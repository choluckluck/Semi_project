package seongmin.qna.model;

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

import seongmin.order.model.OrderDetailVO;
import seongmin.product.model.ProductVO;

public class QnaDAO implements InterQnaDAO {
	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public QnaDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {

			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<QnaVO> getQnaList(Map<String, String> paraMap) throws SQLException {

		List<QnaVO> qnaList = new ArrayList<>();

		try {
			conn = ds.getConnection();


			String sql = "select rnum, category, subject, contents, registerday, fk_prod_code \n"+
					"from (\n"+
					"select  rownum as rnum, category, subject, contents, registerday, fk_prod_code \n"+
					"from\n"+
					"(\n"+
					"select category, subject, contents, to_char(Q.registerday, 'yyyy-mm-dd') as registerday, fk_prod_code \n"+
					"from tbl_qna Q		join tbl_member M\n"+
					"on userid = fk_userid\n"+
					"where fk_userid = ? \n"+
					" order by registerday desc\n"+
					" ) V            \n"+
					" ) D\n"+
					"where rnum between ? and ?";
			
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(3, (currentShowPageNo * sizePerPage));			
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaVO qvo = new QnaVO();
				qvo.setRnum(rs.getString(1));
				qvo.setCategory(rs.getString(2));
				qvo.setSubject(rs.getString(3));
				qvo.setContents(rs.getString(4));
				qvo.setRegisterday(rs.getString(5));
				qvo.setFk_prod_code(rs.getString(6)); 
				
				
				// very Important

				qnaList.add(qvo);
				
			} // end of while
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}

		return qnaList;
	}

	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0;

		try {
			conn = ds.getConnection();

			String sql = "select ceil(count(*)/10) \n"+
					"from tbl_qna\n"+
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
	public List<QnaVO> getqnaList_proddetail(Map<String, String> paraMap) throws SQLException {
		List<QnaVO> qnaList = new ArrayList<>();

		try {
			conn = ds.getConnection();


			String sql = "select rnum, category, subject, contents, registerday, fk_userid \n"+
					"from (\n"+
					"select  rownum as rnum, category, subject, contents, registerday, fk_userid \n"+
					"from\n"+
					"(\n"+
					"select category, subject, contents, to_char(Q.registerday, 'yyyy-mm-dd') as registerday, fk_userid \n"+
					"from tbl_qna Q		join tbl_member M\n"+
					"on userid = fk_userid\n"+
					"where fk_prod_code = ? \n"+
					" order by registerday desc\n"+
					" ) V            \n"+
					" ) D\n"+
					"where rnum between ? and ?";			
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo2"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage2"));
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("prod_code"));

			pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(3, (currentShowPageNo * sizePerPage));			
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				QnaVO qvo = new QnaVO();
				qvo.setRnum(rs.getString(1));
				qvo.setCategory(rs.getString(2));
				qvo.setSubject(rs.getString(3));
				qvo.setContents(rs.getString(4));
				qvo.setRegisterday(rs.getString(5));
				qvo.setFk_userid(rs.getString(6));
				
				// very Important

				qnaList.add(qvo);
				
			} // end of while
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}

		return qnaList;		
	}

	@Override
	public int getTotalPage_qna(Map<String, String> paraMap) throws SQLException {

		int totalPage = 0;

		try {
			conn = ds.getConnection();

			String sql = "select ceil(count(*)/10) \n"+
					"from tbl_qna\n"+
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
	public int qnaRegister(Map<String, String> paraMap) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(true);
			
			String sql = "insert into tbl_qna\n"+
					"values(seq_qna_code.nextval, ?, ?, ?, ?, sysdate, null, null, null, 'N', ?)";			
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("category"));
			pstmt.setString(3, paraMap.get("subject"));
			pstmt.setString(4, paraMap.get("contents"));
			pstmt.setString(5, paraMap.get("prod_code"));
						
			n = pstmt.executeUpdate();				
			
		} catch (SQLException e) {
			conn.rollback();
			conn.setAutoCommit(true); //자동커밋으로 바꾸어준다
			
		} finally {
			close();
		}
		
		return n;	
		
	}

	@Override
	public int qnaRegister2(Map<String, String> paraMap) throws SQLException {

		int n = 0;
		
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(true);
			
			String sql = "insert into tbl_qna\n"+
					"values(seq_qna_code.nextval, ?, ?, ?, ?, sysdate, null, null, null, 'N', null)";			
			pstmt = conn.prepareStatement(sql);

			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("category"));
			pstmt.setString(3, paraMap.get("subject"));
			pstmt.setString(4, paraMap.get("contents"));
						
			n = pstmt.executeUpdate();				
			
		} catch (SQLException e) {
			conn.rollback();
			conn.setAutoCommit(true); //자동커밋으로 바꾸어준다
			
		} finally {
			close();
		}
		
		return n;			
	}

	
	
	

	
	
	
}
