package jihee.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO implements InterProductDAO {
	private DataSource ds;	//DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public ProductDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi");
		} catch(NamingException e) {
			e.printStackTrace();
		}
	}
	
	//사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {
			if(rs != null) { rs.close(); rs = null;}
			if(pstmt != null) { pstmt.close(); pstmt = null;}
			if(conn != null) { conn.close(); conn = null;}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	
	//상품 카드 목록 가져오기
	@Override
	public List<ProductVO> selectProductAll() throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select prod_code, prod_name, prod_kind, prod_image\n"+
					" ,prod_high, prod_color ,prod_size, prod_price, prod_stock\n"+
					" ,prod_registerday\n"+
					"from tbl_product"; 
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next() ) {
				
				ProductVO pvo = new ProductVO();
				pvo.setProd_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_kind(rs.getString(3));
				pvo.setProd_image(rs.getString(4));
				pvo.setProd_high(rs.getString(5));
				pvo.setProd_color(rs.getString(6));
				pvo.setProd_size(rs.getString(7));
				pvo.setProd_price(rs.getInt(8));
				pvo.setProd_stock(rs.getString(9));
				pvo.setProd_registerday(rs.getString(10));
				
				productList.add(pvo);
				
			}// end of while-----
			
		} finally {
			close();
		} 
		
		return productList;
	}//public List<ProductVO> selectProductAll() throws SQLException------- 
}
