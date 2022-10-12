package heajun.product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class ProductDetailDAO implements InterProductDetailDAO {
	private DataSource ds;   //DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
	   private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   
	   // 생성자
	   public ProductDetailDAO() {
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
	// 제품번호를 가지고서 해당 제품의 정보를 조회해오기 
	@Override
	public ProductVO_HJ selectProduct(String prod_code) throws SQLException {
	        
		ProductVO_HJ pvo = new ProductVO_HJ();
		
		try {
			
			 conn = ds.getConnection();
			
			  
		     String sql = " select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_registerday, md_pick_yn, prod_saleprice, prod_description, prod_point "+
						  " from tbl_product "+
						  " where prod_code =   ? ";
	
		     
		     
		     
		     
		     System.out.println(prod_code);
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, prod_code);
			 
			 			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
				 
				 
				 pvo.setProd_code(rs.getString(1));
				 pvo.setProd_name(rs.getString(2));
				 pvo.setProd_kind(rs.getString(3));
				 pvo.setProd_image(rs.getString(4));
				 pvo.setProd_high(rs.getString(5));
				 pvo.setProd_price(rs.getInt(6));
				 pvo.setProd_registerday(rs.getString(7));
				 pvo.setMd_pick_yn(rs.getString(8));
				 pvo.setProd_saleprice(rs.getInt(9));
				 pvo.setProd_description(rs.getString(10));
				 pvo.setProd_point(rs.getInt(11));
				 
				 
				 
			 }// end of while-----------------------------
			 
		} finally {
			close();
		}
		
		return pvo;		
	}

	// 옵션 선택을 위한 해당 상품의 옵션 정보가져오기 
	@Override
	public ProductVO_HJ selectProductOption(String prod_code) throws SQLException {

		ProductVO_HJ pvo2 = new ProductVO_HJ();
		
		
		try {
			conn = ds.getConnection();
			
			  String sql = " select prod_code, prod_name, prod_kind,  prod_image, prod_high, prod_price, prod_registerday, md_pick_yn, prod_saleprice, prod_description, prod_point, prod_color, prod_size\n"+
					  "            from (   \n"+
					  "                   select P.prod_code, P.prod_name, P.prod_kind,  P.prod_image, P.prod_high, P.prod_price, P.prod_registerday, P.md_pick_yn, P.prod_saleprice, P.prod_description, P.prod_point, O.prod_color, O.prod_size \n"+
					  "                   from tbl_product P  \n"+
					  "                   join option_detail O \n"+
					  "                   on P.prod_code = O.prod_code \n"+
					  "                \n"+
					  "              ) \n"+
					  "                where prod_code = ? ";         
					
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, prod_code);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				pvo2.setProd_code(rs.getString(1));
				pvo2.setProd_name(rs.getString(2));
				pvo2.setProd_kind(rs.getString(3));
				pvo2.setProd_image(rs.getString(4));
				pvo2.setProd_high(rs.getString(5));
				pvo2.setProd_price(rs.getInt(6));
				pvo2.setProd_registerday(rs.getString(7));
				pvo2.setMd_pick_yn(rs.getString(8));
				pvo2.setProd_saleprice(rs.getInt(9));
				pvo2.setProd_description(rs.getString(10));
				pvo2.setProd_point(rs.getInt(11));
				 
				 ProductDetailVO pdvo = new ProductDetailVO();
				 
				 pdvo.setProd_color(rs.getString(12));
				 pdvo.setProd_size(rs.getString(13));
				
				 pvo2.setPdvo(pdvo);
				 
			}// end of while(rs.next())-----------------------
			
		} finally {
			close();
		}		
	
		return pvo2;
	}


	

	//위시리스트에 값보내기
	@Override
	public int addWish(String userid , String prod_code , String prod_color, String prod_size) throws SQLException {
		
		int result = 0;
	      
	      try {
	         conn = ds.getConnection();
	     
		            
	         String sql = " insert into tbl_like(like_code, fk_userid, fk_prode_code,  fk_prode_color ,fk_prod_size) "
		               + " values(seq_like_code.nextval, ?, ?, ?, ? ) ";
		            
	            pstmt.setString(1, userid );
	            pstmt.setString(2, prod_code);
	            pstmt.setString(3, prod_color);
	            pstmt.setString(4, prod_size);
	            
		            result = pstmt.executeUpdate();
	      } finally {
		         close();
		      }
		      
		      return result;		
		}  
		      
	

	//장바구니에 값 보내기
	@Override
	public int addCart(String userid , String prod_code, String prod_color, String prod_size, String qnty) throws SQLException {
		
		int result = 0;
		
	      try {
	         conn = ds.getConnection();
	          
	         String sql = " select cart_code "
	                  + " from tbl_cart "
	                  + " where fk_userid = ? and fk_prode_code = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, userid);
	         pstmt.setString(2, prod_code);
	         pstmt.setString(3, prod_color);
	         pstmt.setString(4, prod_size);
	         pstmt.setString(5, qnty);
	         
	         rs = pstmt.executeQuery();
	         
	         
	         if(rs.next()) {
		            // 어떤 제품을 추가로 장바구니에 넣고자 하는 경우 
		            
		            int cart_code = rs.getInt("cart_code");
		            
		            sql = " update tbl_cart set qnty = qnty + ? "
		               + " where cart_code = ? ";
		            
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setInt(1, Integer.parseInt(qnty));
		            pstmt.setInt(2, cart_code);
		            
		            result = pstmt.executeUpdate();
		         }
	         
	         else {
	         
	            sql = " insert into tbl_cart(cart_code, fk_userid , fk_prod_code, qnty, fk_prod_color , fk_prod_size) "
	               + " values(seq_cart_code.nextval,  ?, ?, ?, ? ) ";
	            
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setString(1, userid );
	            pstmt.setString(2, prod_code);
	            pstmt.setInt(3, Integer.parseInt(qnty));
	            pstmt.setString(4, prod_color);
	            pstmt.setString(5, prod_size);
	            
	            result =  pstmt.executeUpdate();
	          }
	         
	         } finally {
		         close();
		      }
		      
		      return result;      
		}

	//이미지 가지고서 해당 제품의 이미지를 조회해오기 
	@Override
	public Product_imageVO selectImage(String prod_code) throws SQLException {

		Product_imageVO ivo = new Product_imageVO();
		
		try {
			
			 conn = ds.getConnection();
			
			  
			   String sql = "  select  product_image_code, fk_prod_code, product_image_file,prod_code\n"+
					   "            from (   \n"+
					   "                   select  I.product_image_code, I.fk_prod_code,  I.product_image_file , P.prod_code  \n"+
					   "                   from tbl_product P  \n"+
					   "                   join tbl_product_image I \n"+
					   "                   on P.prod_code = I.fk_prod_code \n"+
					   "                \n"+
					   "              ) \n"+
					   "                where prod_code = ? " ;
	
		   
		     
		     
		     
			 
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, prod_code);
			 
			 			 
			 rs = pstmt.executeQuery();
			 
			 if(rs.next()) {
					
				 
				    ivo.setFk_prod_code(rs.getString(1));
					ivo.setProd_image_code(rs.getString(2));
					ivo.setProduct_image_file(rs.getString(3));
					
				    ProductVO_HJ pvo3 = new ProductVO_HJ();
				   
				     pvo3.setProd_code(rs.getString(1));
				
					 ivo.setPvo3(pvo3);
					
					
			 }// end of while(rs.next())-----------------------
				
		} finally {
			close();
		}		
	
		return ivo;
	}
}
