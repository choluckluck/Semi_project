package hyerin.product.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class ProductDAO implements InterProductDAO {
	
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
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
	
	
	//Best => 주문 많은 순으로 상품을 불러온다
	@Override
	public List<ProductVO> selectBestProduct() throws SQLException {
		List<ProductVO> pvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "select prod_code, prod_name, prod_kind, prod_high, prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,0) as prod_review_count, nvl(prod_order_count,0) as prod_order_count, prod_saleprice "+
						"from tbl_product left JOIN \n"+
						"(\n"+
						"    select fk_prod_code, count(*) as prod_order_count\n"+
						"    from tbl_order_detail\n"+
						"    group by fk_prod_code\n"+
						")OD\n"+
						"ON prod_code = OD.fk_prod_code\n"+
						"left join\n"+
						"(\n"+
						"    select fk_prod_code, count(*) as prod_review_count\n"+
						"    from tbl_review\n"+
						"    group by fk_prod_code\n"+
						")R\n"+
						"ON prod_code = R.fk_prod_code\n"+
						"order by prod_order_count desc";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO best_pvo = new ProductVO();
				best_pvo.setProd_code(rs.getString(1));
				best_pvo.setProd_name(rs.getString(2));
				best_pvo.setProd_kind(rs.getString(3));
				best_pvo.setProd_high(rs.getString(4));
				best_pvo.setProd_image(rs.getString(5));
				best_pvo.setProd_price(rs.getString(6));
				best_pvo.setProd_color(rs.getString(7));
				best_pvo.setProd_registerday(rs.getString(8));
				best_pvo.setProd_review_count(rs.getString(9));
				best_pvo.setProd_saleprice(rs.getString(11));
				
				pvoList.add(best_pvo);
				
			}
			
		} finally {
		     close();
		}
		
		return pvoList;
	}//end of selectBestProduct
	
	
	
	//new Arrival => 최신 등록일자 순으로 상품정보 정렬
	@Override
	public List<ProductVO> selectNewProduct() throws SQLException {
		List<ProductVO> pvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "select prod_code, prod_name, prod_kind, prod_high, prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,'0') as prod_review_count, prod_saleprice "+
						" from tbl_product left JOIN \n"+
						"(\n"+
						"    select fk_prod_code, count(*) as prod_review_count\n"+
						"    from tbl_review\n"+
						"    group by fk_prod_code\n"+
						")\n"+
						"ON prod_code = fk_prod_code\n"+
						"order by prod_registerday desc";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO new_pvo = new ProductVO();
				new_pvo.setProd_code(rs.getString(1));
				new_pvo.setProd_name(rs.getString(2));
				new_pvo.setProd_kind(rs.getString(3));
				new_pvo.setProd_high(rs.getString(4));
				new_pvo.setProd_image(rs.getString(5));
				new_pvo.setProd_price(rs.getString(6));
				new_pvo.setProd_color(rs.getString(7));
				new_pvo.setProd_registerday(rs.getString(8));
				new_pvo.setProd_review_count(rs.getString(9));
				new_pvo.setProd_saleprice(rs.getString(10));
				
				pvoList.add(new_pvo);
				
			}
			
		} finally {
		     close();
		}
		
		return pvoList;
	}//end of selectNewProduct
	
	
	
	
	//MD Pick => 노출여부 Y인 것만 랜덤으로 4개를 불러온다
	@Override
	public List<ProductVO> selectMDProduct() throws SQLException {
		List<ProductVO> pvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			String sql = "SELECT prod_code, prod_name, prod_kind, prod_high, prod_image, prod_price, prod_color, prod_registerday, nvl(prod_review_count,0) as prod_review_count\n, prod_saleprice "+
						"FROM (\n"+
						"   SELECT prod_code, prod_name, prod_kind, prod_high, prod_image, prod_price, prod_color, prod_registerday, prod_review_count\n, prod_saleprice"+
						"   FROM tbl_product\n"+
						"   left join\n"+
						"    (\n"+
						"        select fk_prod_code, count(*) as prod_review_count\n"+
						"        from tbl_review\n"+
						"        group by fk_prod_code\n"+
						"    )R\n"+
						"   ON prod_code = R.fk_prod_code\n"+
						"   WHERE md_pick_yn = 'Y'\n"+
						"   ORDER BY DBMS_RANDOM.VALUE\n"+
						")\n"+
						"WHERE ROWNUM < 5";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO md_pvo = new ProductVO();
				md_pvo.setProd_code(rs.getString(1));
				md_pvo.setProd_name(rs.getString(2));
				md_pvo.setProd_kind(rs.getString(3));
				md_pvo.setProd_high(rs.getString(4));
				md_pvo.setProd_image(rs.getString(5));
				md_pvo.setProd_price(rs.getString(6));
				md_pvo.setProd_color(rs.getString(7));
				md_pvo.setProd_registerday(rs.getString(8));
				md_pvo.setProd_review_count(rs.getString(9));
				md_pvo.setProd_saleprice(rs.getString(10));
				
				pvoList.add(md_pvo);
				
			}
			
		} finally {
		     close();
		}
		
		return pvoList;
	}//end of selectMDProduct

	

}
