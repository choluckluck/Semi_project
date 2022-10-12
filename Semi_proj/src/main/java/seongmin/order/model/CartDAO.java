package seongmin.order.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class CartDAO implements InterCartDAO {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
   
   
	// 생성자
	public CartDAO() {
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
	public int goCart(Map<String, String> paraMap) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			conn.setAutoCommit(true); // 자동커밋

			String sql = "\n"+
					"insert into tbl_cart\n"+
					"values('cart-'||lpad(seq_cart_code.nextval,4,0) , ?, ?, 1, ?, ?)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("fk_prod_code"));
			pstmt.setString(3, paraMap.get("fk_prod_color"));
			pstmt.setString(4, paraMap.get("fk_prod_size"));
			
			result = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return result;	
		
	}


	@Override
	public int goCart2(Map<String, Object> paraMap) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			conn.setAutoCommit(true); // 자동커밋

			String[] fk_prod_codeArr = (String[]) paraMap.get("fk_prod_codeArr"); // 제품번호
			String[] prod_nameArr = (String[]) paraMap.get("prod_nameArr"); // 제품번호
			String[] fk_prod_colorArr = (String[]) paraMap.get("fk_prod_colorArr"); // 제품번호
			String[] fk_prod_sizeArr = (String[]) paraMap.get("fk_prod_sizeArr"); // 제품번호
		
			String sql = "";
			
			int cnt = 0;
			for(int i=0; i<fk_prod_codeArr.length; i++) {
				sql =   " insert into tbl_cart\n"+
						" values('cart-'||lpad(seq_cart_code.nextval,4,0) , ?, ?, 1, ?, ?)";

				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, (String) paraMap.get("userid"));
				pstmt.setString(2, fk_prod_codeArr[i]);
				pstmt.setString(3, fk_prod_colorArr[i]);
				pstmt.setString(4, fk_prod_sizeArr[i]);
				
				pstmt.executeUpdate();
				cnt++;				
			}
			
			if(cnt == fk_prod_codeArr.length) {
				n = 1;
			}		
			
		} finally {
			close();
		}
		
		return n;
		
	}


	@Override
	public int isExist(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
//			conn.setAutoCommit(true); // 자동커밋

			String sql = "select *\n"+
					"from tbl_cart\n"+
					"where fk_userid = ? and fk_prod_code=? and fk_prod_color=? and fk_prod_size= ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("fk_prod_code"));
			pstmt.setString(3, paraMap.get("fk_prod_color"));
			pstmt.setString(4, paraMap.get("fk_prod_size"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				n = 1;
			}
			
			else{
				
				n = 2;
			}
			
		} finally {
			close();
		}
				
		
		return n;
	}


	@Override
	public int updateCart(Map<String, String> paraMap) throws SQLException {

		int n = 0;
		
		try {
			n=0;
			
			conn = ds.getConnection();
			conn.setAutoCommit(true); // 자동커밋

			String sql = "update tbl_cart set qnty = qnty+1 \n"+
					"where fk_userid = ? and fk_prod_code= ?  and fk_prod_color=? and fk_prod_size=? \n"+
					"";			
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("userid"));
			pstmt.setString(2, paraMap.get("fk_prod_code"));
			pstmt.setString(3, paraMap.get("fk_prod_color"));
			pstmt.setString(4, paraMap.get("fk_prod_size"));
			
			n = pstmt.executeUpdate();
			
			if(n>=2) {
				n = 1;
			}
			
		} finally {
			close();
		}
				
		n++;
		
		return n;	
		
	}


	@Override
	public int isExist2(Map<String, Object> paraMap) throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

}
