package seongmin.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class LikeDAO implements InterLikeDAO {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
   
   
	// 생성자
	public LikeDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			ds = (DataSource)envContext.lookup("jdbc/semi");
			  
		          
		} catch(NamingException e) {
			e.printStackTrace();
		} 
	}//end of 생성자
   	
	
   // 사용한 자원을 반납하는 close() 메소드 생성하기 
	private void close() {
		try {
			
			if(rs != null)    {rs.close();    rs=null;}
			if(pstmt != null) {pstmt.close(); pstmt=null;}
			if(conn != null)  {conn.close();  conn=null;}
			
		} catch(SQLException e) {
			e.printStackTrace();
		}
		
	} //end of close();
	
	
	
	@Override
	public int delLike(String like_code) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " delete from tbl_like "+ 
					     " where like_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, like_code);
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;		
		
	}


	@Override
	public int delLikeList(Map<String, Object> paraMap) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			conn.setAutoCommit(true); // 자동커밋

			String[] like_codeArr = (String[]) paraMap.get("like_codeArr"); // 제품번호
			String sql = "";
			
			int cnt = 0;
			for(int i=0; i<like_codeArr.length; i++) {
				sql = " delete from tbl_like "+ 
					  " where like_code = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, like_codeArr[i]);
				
				pstmt.executeUpdate();
				cnt++;
				
			}
			
			if(cnt == like_codeArr.length) {
				n = 1;
			}		
			
		} finally {
			close();
		}
		
		return n;
		
	}
}
