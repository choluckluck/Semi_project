package seongmin.product.model;

import java.sql.*;
import java.util.*;



import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import seongmin.login.model.MemberVO;
import seongmin.order.model.OrderDetailVO;
import seongmin.order.model.OrderVO;
import seongmin.login.model.InterMemberDAO;


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
		public List<ProductVO> interestList(Map<String, String> paraMap) throws SQLException {
			// TODO Auto-generated method stub
			return null;
		}


		
		// 주문 상세에서 주문내역확인
		@Override
		public List<ProductVO> orderDetailList(String order_code) {
			List<ProductVO> oList = new ArrayList<>();

			try {
				conn = ds.getConnection();

				String sql = "select prod_image, prod_name, fk_prod_color, fk_prod_size, prod_price, prod_saleprice, order_buy_count, prod_point, shipfee\n"+
						"from\n"+
						"(\n"+
						"select fk_order_code, prod_image, prod_name, fk_prod_color, fk_prod_size, prod_price, prod_saleprice, order_buy_count, prod_point\n"+
						"from tbl_product P\n"+
						"join \n"+
						"tbl_order_detail O\n"+
						"on prod_code = fk_prod_code\n"+
						"where fk_order_code =  ? \n"+
						")\n"+
						"join\n"+
						"(\n"+
						"select order_code, case sign((total_order_amount - discount_amount - point_use_amount)-70000) when 1 then 0 else 2500 end AS shipfee\n"+
						"from tbl_order\n"+
						")\n"+
						"on order_code = fk_order_code";
				
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order_code);

				rs = pstmt.executeQuery();

				while (rs.next()) {
					ProductVO pvo = new ProductVO();

					pvo.setProd_image(rs.getString(1));
					pvo.setProd_name(rs.getString(2));
					pvo.setProd_price(rs.getString(5));
					pvo.setProd_saleprice(rs.getString(6));
					pvo.setProd_point(rs.getString(8));
					pvo.setShipfee(rs.getString(9));
					
					// very Important
					OrderDetailVO odvo = new OrderDetailVO();
					odvo.setFk_prod_color(rs.getString(3));
					odvo.setFk_prod_size(rs.getString(4));
					odvo.setOrder_buy_count(rs.getInt(7));
					
					pvo.setOdvo(odvo);
					
					
					// very Important

					oList.add(pvo);
					
				} // end of while
				
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				close();
			}

			return oList;

		}




		@Override
		public List<String> getprod_info(Map<String, String> paraMap) throws SQLException {
			List<String> prod_info = new ArrayList<>();
			
			
			try {
				conn = ds.getConnection();

				String sql = "select prod_name, prod_image, order_detail_code\n"+
						"from tbl_product\n"+
						"join tbl_order_detail\n"+
						"on prod_code = fk_prod_code\n"+
						"where prod_code = ? ";
				
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, paraMap.get("prod_code"));

				rs = pstmt.executeQuery();

				if (rs.next()) {
					prod_info.add(rs.getString(1));
					prod_info.add(rs.getString(2));
					prod_info.add(rs.getString(3));
					
				} // end of while
				
			} catch (SQLException e){
				e.printStackTrace();
			} finally {
				close();
			}
			
			
			return prod_info;
			
		}
		
}
		
		
		// 관심상품 목록
		/*
		 * public List<ProductVO> interestList(Map<String, String> paraMap) {
		 * 
		 * List<ProductVO> interestList = new ArrayList<>();
		 * 
		 * try { conn = ds.getConnection();
		 * 
		 * String sql =
		 * "select sum(total_order_amount) as total_amount, count(*) as total_count\n"+
		 * "from tbl_order\n"+ "where fk_userid = ? ";
		 * 
		 * 
		 * pstmt = conn.prepareStatement(sql); pstmt.setString(1,
		 * paraMap.get("userid"));
		 * 
		 * rs = pstmt.executeQuery();
		 * 
		 * if(rs.next()) { totalOrderList.add(rs.getInt(1));
		 * totalOrderList.add(rs.getInt(2)); }//end of while
		 * 
		 * 
		 * 
		 * 
		 * }finally { close(); }
		 * 
		 * 
		 * return interestList;
		 * 
		 * }
		 */
		
		



