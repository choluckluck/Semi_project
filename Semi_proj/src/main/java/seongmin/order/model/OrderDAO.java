package seongmin.order.model;

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

import seongmin.product.model.ProductVO;
import seongmin.product.model.ThumbVO;

public class OrderDAO implements InterOrderDAO {

	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
   
   
	// 생성자
	public OrderDAO() {
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
	
	
	@Override
	public List<OrderVO> recentOrderList(Map<String, String> paraMap) throws SQLException {
		
		
		List<OrderVO> ovoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select userid, to_char(orderdate,'yyyy-mm-dd') as orderdate, order_code, prod_name, order_buy_count, order_state, prod_image, order_price, prod_kind \n"+
					" from tbl_order o\n"+
					" left join\n"+
					" tbl_member m\n"+
					" on fk_userid = userid\n"+
					" left join tbl_order_detail d\n"+
					" on order_code = fk_order_code\n"+
					" left join tbl_product p\n"+
					" on fk_prod_code = p.prod_code\n"+
					" where userid = ? ";
											
					
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			while( rs.next()) {
				OrderVO ovo = new OrderVO();

				ovo.setFk_userid(rs.getString(1));
				ovo.setOrderdate(rs.getString(2));
				ovo.setOrder_code(rs.getString(3));

			//  very Important 								
				ProductVO pvo = new ProductVO();
				pvo.setProd_name(rs.getString(4));
				pvo.setProd_image(rs.getString(7));
				pvo.setProd_kind(rs.getString(9));
				ovo.setPvo(pvo);
				
				OrderDetailVO odvo = new OrderDetailVO();
				odvo.setOrder_buy_count(rs.getInt(5));
				odvo.setOrder_price(rs.getInt(8));
				ovo.setOdvo(odvo);				

				
				ovo.setOrder_state(rs.getString(6));
				

				//  very Important 				

				ovoList.add(ovo);	             
			}//end of while
			
			
			
			
		}finally {
			close();
			}
		
		System.out.println(ovoList.size());
		return ovoList;
	} //end of public List<OrderVO> recentOrderList

	

	// 총 주문조회
	@Override
	public List<Integer> totalOrderList(Map<String, String> paraMap) throws SQLException{
		List<Integer> totalOrderList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select sum(total_order_amount) as total_amount, count(*) as total_count\n"+
					"from tbl_order\n"+
					"where fk_userid = ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalOrderList.add(rs.getInt(1));
				totalOrderList.add(rs.getInt(2));            
			}//end of while
			
			
			
			
		}finally {
			close();
			}
		
		
		return totalOrderList;
	} //end of public List<OrderVO> recentOrderList

	@Override
	public List<ProductVO> likeList(Map<String, String> paraMap) throws SQLException {

		List<ProductVO> likeList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select prod_name, prod_price, prod_image, prod_kind \n"+
					"from\n"+
					"tbl_like\n"+
					"join tbl_product\n"+
					"on fk_prod_code = prod_code\n"+
					"where fk_userid = ? ";			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO lpvo = new ProductVO();
				lpvo.setProd_name(rs.getString(1));
				lpvo.setProd_price(rs.getString(2));
				lpvo.setProd_image(rs.getString(3));
				lpvo.setProd_kind(rs.getString(4));
				
				
				likeList.add(lpvo);
			}//end of while
		
		}finally {
			close();
			}
	
		return likeList;
		
	} //end of public List<OrderVO> recentOrderList

	
	

}
