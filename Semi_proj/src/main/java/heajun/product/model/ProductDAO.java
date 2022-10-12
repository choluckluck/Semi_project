package heajun.product.model;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import util.security.AES256;
import util.security.SecretMyKey;

public class ProductDAO implements InterProductDAO {

	private DataSource ds;
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private AES256 aes;
	
	// 생성자
	public ProductDAO() {
		
		 try {
	         Context initContext = new InitialContext();
	          Context envContext  = (Context)initContext.lookup("java:/comp/env");
	          ds = (DataSource)envContext.lookup("jdbc/semi");
	          
	          aes = new AES256(SecretMyKey.KEY);
	          // SecretMyKey.KEY 은 우리가 만든 비밀키이다.
	          
	      } catch(NamingException e) {
	         e.printStackTrace();
	      } catch(UnsupportedEncodingException e) {
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

   
   //////////////////////////////////////////////////////////////////
   
   
	
	// 관심상품에 상품 담기
	@Override
	public int addWish(String userid, String prod_code, String prod_color, String prod_size) throws Exception {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
		/*
		     먼저 장바구니 테이블(tbl_cart)에 어떤 회원이 새로운 제품을 넣는 것인지,
		     아니면 또 다시 제품을 추가로 더 구매하는 것인지를 알아야 한다.
		     이것을 알기위해서 어떤 회원이 어떤 제품을  장바구니 테이블(tbl_cart) 넣을때
		     그 제품이 이미 존재하는지 select 를 통해서 알아와야 한다.
		     
		   -------------------------------------------
		    cartno   fk_userid     fk_pnum   oqty  
		   -------------------------------------------
		      1      seoyh          7         2     
		      2      seoyh          6         3     
		      3      leess          7         5     
		  */
			
			String sql = " select like_code "
					   + " from tbl_like "
					   + " where fk_userid = ? and fk_prod_code = ? "
					   + " and fk_prod_color = ? and fk_prod_size = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, prod_code);
			pstmt.setString(3, prod_color);
			pstmt.setString(4, prod_size);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 관심상품에 해당 상품이 있을 경우
				result = 10;
			}
			
			else {
				// 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
				
				sql = " insert into tbl_Like(Like_code, fk_userid, fk_prod_code, fk_prod_color, fk_prod_size) "
					+ " values('like-'||lpad(seq_like_code.nextval,4,0), ?, ?, ? ,?) ";
  
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, prod_code);
				pstmt.setString(3, prod_color);
				pstmt.setString(4, prod_size);
				
				result = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		return result;
	}

	@Override
	public int addCart(String userid, String prod_code, String qnty, String prod_color, String prod_size)
			throws Exception {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
		/*
		     먼저 장바구니 테이블(tbl_cart)에 어떤 회원이 새로운 제품을 넣는 것인지,
		     아니면 또 다시 제품을 추가로 더 구매하는 것인지를 알아야 한다.
		     이것을 알기위해서 어떤 회원이 어떤 제품을  장바구니 테이블(tbl_cart) 넣을때
		     그 제품이 이미 존재하는지 select 를 통해서 알아와야 한다.
		     
		   -------------------------------------------
		    cartno   fk_userid     fk_pnum   oqty  
		   -------------------------------------------
		      1      seoyh          7         2     
		      2      seoyh          6         3     
		      3      leess          7         5     
		  */
			
			String sql = " select cart_code "
					   + " from tbl_cart "
					   + " where fk_userid = ? and fk_prod_code = ? "
					   + " and fk_prod_color = ? and fk_prod_size = ?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, prod_code);
			pstmt.setString(3, prod_color);
			pstmt.setString(4, prod_size);
			

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				// 어떤 제품을 추가로 장바구니에 넣고자 하는 경우 
				
				String cart_code = rs.getString("cart_code");
				
				sql = " update tbl_cart set qnty = qnty + ? "
					+ " where cart_code = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(qnty));
				pstmt.setString(2, cart_code);
				
				result = pstmt.executeUpdate();
			}
			
			else {
				// 장바구니에 존재하지 않는 새로운 제품을 넣고자 하는 경우
				
				sql = " insert into tbl_cart(cart_code, fk_userid, fk_prod_code, qnty, fk_prod_color, fk_prod_size) "
					+ " values('cart-'||lpad(seq_cart_code.nextval,4,0), ?, ?, ? ,?, ?) ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				pstmt.setString(2, prod_code);
				pstmt.setInt(3,Integer.parseInt(qnty));
				pstmt.setString(4, prod_color);
				pstmt.setString(5, prod_size);
				
				result = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		
		return result;	
	}

}
