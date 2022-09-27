package jihee.product.model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

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
	public List<ProductVO> selectProductAll(Map<String, String> paraMap) throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select prod_code, prod_name, prod_kind, prod_image\n"+
					"	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock\n"+
					"	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count ,rownum AS RNO\n"+
					"from\n"+
					"(select rownum AS RNO ,prod_code, prod_name, prod_kind, prod_image\n"+
					"	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock\n"+
					"	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count\n"+
					"from tbl_product left JOIN \n"+
					"(\n"+
					"\n"+
					"    select fk_prod_code, count(*) as prod_review_count \n"+
					"    from tbl_review\n"+
					"    group by fk_prod_code\n"+
					")\n"+
					"ON prod_code = fk_prod_code\n"+
					"order by prod_registerday desc\n"+
					")\n"+
					" where RNO between ? and ? ";
			
			// === 페이징처리의 공식 ===
			 // where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수); 
			
			 int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			 int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			 
			 
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
			pstmt.setInt(2, (currentShowPageNo*sizePerPage) ); // 공식
			
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
				pvo.setProd_review_count(rs.getInt(11));
				
				productList.add(pvo);
				
			}// end of while-----
			
		} finally {
			close();
		} 
		
		return productList;
	}//public List<ProductVO> selectProductAll() throws SQLException------- 

	
	
	//총 페이지바 페이지수 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		
		int totalPage = 0;
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/20)  \n"+
						 " from tbl_product"; 
			
			
	
			pstmt = conn.prepareStatement(sql);
				
			
			rs = pstmt.executeQuery(); //if next필요없다 count는 결과 없어도 0이 나오니까
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
			
		}finally {
			close();
		}
		
					
		return totalPage;
	
	}
}
