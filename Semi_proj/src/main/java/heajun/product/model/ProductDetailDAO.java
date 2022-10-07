package heajun.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ProductDetailDAO implements InterProductDetailDAO {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	// 생성자
	public void ProductDAO() {
		
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/myoracle");
		    
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
	
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기 
	@Override
	public ProductVO_HJ selectProduct(String prod_code) throws SQLException {
	        
		ProductVO_HJ pvo = null;
		
		try {
			
			 conn = ds.getConnection();
			
			  
		     String sql = " select prod_code, prod_name, prod_image, prod_high, prod_price, prod_registerday, md_pick_yn, prod_saleprice, prod_description, prod_point  " +
					 " from tbl_product " +
					 " where prod_code =  ' ? '  " ;
					 
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, prod_code);
			 			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 pvo = new ProductVO_HJ(); 
				 
				 
				 pvo.setProd_code(rs.getString(1));
				 pvo.setProd_name(rs.getString(2));
				 pvo.setProd_image(rs.getString(3));
				 pvo.setProd_high(rs.getString(4));
				 pvo.setProd_price(rs.getInt(5));
				 pvo.setProd_registerday(rs.getString(6));
				 pvo.setMd_pick_yn(rs.getString(7));
				 pvo.setProd_saleprice(rs.getInt(8));
				 pvo.setProd_description(rs.getString(9));
				 pvo.setProd_price(rs.getInt(10));
				 
				 
				 
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		
		return pvo;		
	}

	// 옵션 선택을 위한 해당 상품의 옵션 정보가져오기 
	@Override
	public List<ProductDetailVO> selectProductOption(String prod_detail_code) throws SQLException {

		List<ProductDetailVO> option = new ArrayList<>();
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " select P.prod_code, prod_name, prod_image, prod_high, prod_price, prod_registerday, md_pick_yn, prod_saleprice, prod_description, prod_point,prod_detail_code,fk_prod_code,prod_color,prod_size,prod_stock "+
					" from  " +
					" ( " +
					" select prod_code, prod_name, prod_image, prod_high, prod_price, prod_registerday, md_pick_yn, prod_saleprice, prod_description, prod_point   "+
					" from tbl_product\n"+
					" where prod_code = 'prod-0047' " +
					" ) P JOIN tbl_prod_detail O " +
					" ON P.prod_code = O.fk_prod_code " ;
					
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_detail_code);
		
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				
				ProductVO_HJ pvo = new ProductVO_HJ();
				
				 pvo.setProd_code(rs.getString(1));
				 pvo.setProd_name(rs.getString(2));
				 pvo.setProd_image(rs.getString(3));
				 pvo.setProd_high(rs.getString(4));
				 pvo.setProd_price(rs.getInt(5));
				 pvo.setProd_registerday(rs.getString(5));
				 pvo.setMd_pick_yn(rs.getString(7));
				 pvo.setProd_saleprice(rs.getInt(8));
				 pvo.setProd_description(rs.getString(9));
				 pvo.setProd_price(rs.getInt(10));
				 
				 ProductDetailVO ovo = new ProductDetailVO();
				 
				 ovo.setProd_detail_code(rs.getString(11));
				 ovo.setFk_prod_code(rs.getString(12));
				 ovo.setProd_color(rs.getString(13));
				 ovo.setProd_size(rs.getString(14));
				 ovo.setProd_stock(rs.getInt(15));
				
				 pvo.setPvo(ovo);
				
				option.add(ovo);
			}// end of while(rs.next())-----------------------
			
		} finally {
			close();
		}		
	
		return option;
	}
	
}
