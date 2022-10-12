package hyerin.order.model;

import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
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

import hyerin.member.model.MemberVOhr;
import hyerin.product.model.ProductVO;
import util.security.AES256;
import util.security.SecretMyKey;

public class OrderDAO implements InterOrderDAO {
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private AES256 aes;
   
	// 생성자
	public OrderDAO() {
		try {
			Context initContext = new InitialContext();
		    Context envContext  = (Context)initContext.lookup("java:/comp/env");
		    ds = (DataSource)envContext.lookup("jdbc/semi");
		    
		    aes = new AES256(SecretMyKey.KEY);
		
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
	
	
	// 조회해올 주문의 총 페이지수 구하기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalOrderListPage = 0;
		
		try {
			
			conn = ds.getConnection();
			
			String orderstate = paraMap.get("orderstate");
			String searchBy = paraMap.get("searchBy");
			String mindate = paraMap.get("mindate");
			String maxdate = paraMap.get("maxdate");
			String minprice = paraMap.get("minprice");
			String maxprice = paraMap.get("maxprice");
			String searchword = paraMap.get("searchword");
			
			String sql = " select ceil(count(*)/5) "+
						 " from tbl_order ";
			
			if("".equals(orderstate)) { //orderstate로 정렬하지 않았을 경우
				if(!"".equals(searchBy)) { // 검색조건이 있는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						sql += " where orderdate between ? and ? ";
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						sql += " where total_order_amount between ? and ? ";
					}
					else { //주문코드나 아이디로 검색할 경우
						sql += " where  " + searchBy + " like '%'|| ? ||'%' ";
					}
				}
			}
			else { //orderstate로 정렬하는 경우
				sql += " where fk_order_state_name = ? ";
				if(!"".equals(searchBy)) { // 검색조건이 없는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						sql += " and orderdate between ? and ? ";
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						sql += " and total_order_amount between ? and ? ";
					}
					else { //주문코드나 아이디로 검색할 경우
						sql += " and  " + searchBy + " like '%'|| lower( ? ) ||'%' ";
					}
				}
			}
			
			
			sql += " order by orderdate desc ";
			
			
			pstmt = conn.prepareStatement(sql);
			
			
			if("".equals(orderstate)) { //orderstate로 정렬하지 않았을 경우
				if(!"".equals(searchBy)) { // 검색조건이 있는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						pstmt.setString(1, mindate);
						pstmt.setString(2, maxdate);
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						pstmt.setString(1, minprice);
						pstmt.setString(2, maxprice);
					}
					else { //주문코드나 아이디로 검색할 경우
						pstmt.setString(1, searchword);
					}
				}
			}
			else { //orderstate로 정렬하는 경우
				pstmt.setString(1, orderstate);
				if(!"".equals(searchBy)) { // 검색조건이 없는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						pstmt.setString(2, mindate);
						pstmt.setString(3, maxdate);
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						pstmt.setString(2, minprice);
						pstmt.setString(3, maxprice);
					}
					else { //주문코드나 아이디로 검색할 경우
						pstmt.setString(2, searchword.toLowerCase());
					}
				}
			}
			
			rs = pstmt.executeQuery();
			rs.next();
			
			totalOrderListPage = rs.getInt(1);
			
			
		} finally {
			close();
		}
		
		return totalOrderListPage;
	}//end of getTotalPage
	
	
	
	//페이징처리한 검색이 있는, 없는 주문목록 조회(select)
	@Override
	public List<OrderVO> selectPagingOrderList(Map<String, String> paraMap) throws SQLException {
		List<OrderVO> ovoList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String orderstate = paraMap.get("orderstate");
			String searchBy = paraMap.get("searchBy");
			String mindate = paraMap.get("mindate");
			String maxdate = paraMap.get("maxdate");
			String minprice = paraMap.get("minprice");
			String maxprice = paraMap.get("maxprice");
			String searchword = paraMap.get("searchword");
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			String sql = " select order_code, fk_userid, to_char(orderdate,'yyyy-mm-dd') as orderdate, fk_order_state_name, total_order_amount, real_amount "+
						 " from ( select rownum as rno, order_code, fk_userid, orderdate, fk_order_state_name, total_order_amount, real_amount from (select * from tbl_order order by orderdate desc) ";
			
			if("".equals(orderstate)) { //orderstate로 정렬하지 않았을 경우
				if(!"".equals(searchBy)) { // 검색조건이 있는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						sql += " where orderdate between ? and ?";
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						sql += " where total_order_amount between ? and ? ";
					}
					else { //주문코드나 아이디로 검색할 경우
						sql += " where  " + searchBy + " like '%'|| ? ||'%' ";
					}
				}
			}
			else { //orderstate로 정렬하는 경우
				sql += " where fk_order_state_name = ? ";
				if(!"".equals(searchBy)) { // 검색조건이 없는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						sql += " and orderdate between ? and ? ";
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						sql += " and total_order_amount between ? and ? ";
					}
					else { //주문코드나 아이디로 검색할 경우
						sql += " and  " + searchBy + " like '%'|| ? ||'%' ";
					}
				}
			}
			
			sql += " ) " +
				   " where rno between ? and ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			if("".equals(orderstate)) { //orderstate로 정렬하지 않았을 경우
				if(!"".equals(searchBy)) { // 검색조건이 있는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						pstmt.setString(1, mindate);
						pstmt.setString(2, maxdate);
						pstmt.setInt(3, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
						pstmt.setInt(4, (currentShowPageNo*sizePerPage));
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						pstmt.setString(1, minprice);
						pstmt.setString(2, maxprice);
						pstmt.setInt(3, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
						pstmt.setInt(4, (currentShowPageNo*sizePerPage));
					}
					else { //주문코드나 아이디로 검색할 경우
						pstmt.setString(1, searchword);
						pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
						pstmt.setInt(3, (currentShowPageNo*sizePerPage));
					}
				}
				else {
					
					pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(2, (currentShowPageNo*sizePerPage));
					
				}
			}
			else { //orderstate로 정렬하는 경우
				pstmt.setString(1, orderstate);
				if(!"".equals(searchBy)) { // 검색조건이 없는 경우
					if("orderdate".equals(searchBy)) { //날짜로 검색할 경우
						pstmt.setString(2, mindate);
						pstmt.setString(3, maxdate);
						pstmt.setInt(4, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
						pstmt.setInt(5, (currentShowPageNo*sizePerPage));
					}
					else if ("total_order_amount".equals(searchBy)) { //주문금액으로 검색할경우
						pstmt.setString(2, minprice);
						pstmt.setString(3, maxprice);
						pstmt.setInt(4, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
						pstmt.setInt(5, (currentShowPageNo*sizePerPage));
					}
					else { //주문코드나 아이디로 검색할 경우
						pstmt.setString(2, searchword);
						pstmt.setInt(3, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
						pstmt.setInt(4, (currentShowPageNo*sizePerPage));
					}
				}
				else {
					pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3, (currentShowPageNo*sizePerPage));
				}
				
			}
			
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				
				//order_code, fk_userid, orderdate, fk_order_state_name, total_order_amount, real_amount
				OrderVO ovo = new OrderVO();
				
				ovo.setOrder_code(rs.getString(1));
				ovo.setFk_userid(rs.getString(2));
				ovo.setOrderdate(rs.getString(3));
				ovo.setFk_order_state_name(rs.getString(4));
				ovo.setTotal_order_amount(rs.getInt(5));
				ovo.setReal_amount(rs.getInt(6));
				
				ovoList.add(ovo);
				
			}
			
		} finally {
			close();
		}
		
		return ovoList;
	}//end of selectPagingOrderList
	
	
	//오더코드로 주문정보 불러오기
	@Override
	public OrderVO getOneOrder(String order_code) throws SQLException {
		OrderVO ovo = new OrderVO();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = " select order_code, fk_userid, name, mobile, to_char(orderdate,'yyyy-mm-dd') as orderdate, fk_order_state_name, total_order_amount, real_amount, delivery_fee,  discount_amount, point_use_amount, nvl(total_price,0) "
						+ " from tbl_order "
						+ " join tbl_member "
						+ " on fk_userid = userid "
						+ " where order_code = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, order_code);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				MemberVOhr mvo = new MemberVOhr();
				ovo.setOrder_code(rs.getString(1));
				mvo.setUserid(rs.getString(2));
				mvo.setName(rs.getString(3));
				
				//핸드폰 - 처리해주기
				String mobile = aes.decrypt(rs.getString("mobile"));
				String mobile1 = mobile.substring(0,3);
				String mobile2 = mobile.substring(3,7);
				String mobile3 = mobile.substring(7);
				mobile = mobile1 + "-" + mobile2 + "-" + mobile3;
				
				mvo.setMobile(mobile);
				ovo.setMvo(mvo);
				ovo.setOrderdate(rs.getString(5));
				ovo.setFk_order_state_name(rs.getString(6));
				ovo.setTotal_order_amount(rs.getInt(7));
				ovo.setReal_amount(rs.getInt(8));
				ovo.setDelivery_fee(rs.getInt(9));
				ovo.setDiscount_amount(rs.getInt(10));
				ovo.setPoint_use_amount(rs.getInt(11));
				ovo.setTotal_price(rs.getInt(12));
				
			}
			
		} catch(GeneralSecurityException | UnsupportedEncodingException e) {
		     e.printStackTrace();
		} finally {
			close();
		}
		
		return ovo;
	}//end of getOneOrder
	
	
	//오더코드로 주문상세정보 불러오기
	@Override
	public List<OrderDetailVO> getOneOrderDetail(String order_code) throws SQLException {
		List<OrderDetailVO> odvoList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql =  " select fk_prod_code, prod_name, prod_image, prod_price, prod_saleprice, fk_prod_color, fk_prod_size , order_buy_count, order_price, order_detail_code "
						+ " from tbl_order_detail "
						+ " join tbl_product "
						+ " on fk_prod_code = prod_code "
						+ " where fk_order_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, order_code);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductVO pvo = new ProductVO();
				OrderDetailVO odvo = new OrderDetailVO();
				
				odvo.setFk_prod_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_image(rs.getString(3));
				pvo.setProd_price(rs.getString(4));
				pvo.setProd_saleprice(rs.getString(5));
				odvo.setPvo(pvo);
				odvo.setFk_prod_color(rs.getString(6));
				odvo.setFk_prod_size(rs.getString(7));
				odvo.setOrder_buy_count(rs.getInt(8));
				odvo.setOrder_price(rs.getInt(9));
				odvo.setOrder_detail_code(rs.getString(10));
				
				odvoList.add(odvo);
			}
			
		} finally {
			close();
		}
		
		return odvoList;
	}//end of getOneOrderDetail
	
	
	
	//주문상태를 변경해준다
	@Override
	public int updateOrderstate(String order_code, String fk_order_state_name) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			String sql = " update tbl_order set fk_order_state_name = ? where order_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, fk_order_state_name);
			pstmt.setString(2, order_code);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}//end of updateOrderstate
	
	
	
	//체크된 주문들의 주문상태를 변경해준다
	@Override
	public int updateOrderStateChecked(Map<String, Object> paraMap) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			String[] order_codeArr =  (String[]) paraMap.get("order_codeArr");
			String updateOrderstate = (String) paraMap.get("updateOrderstate");
			
			
			for(String order_code : order_codeArr) {
				String sql = " update tbl_order set fk_order_state_name = ? where order_code = ? ";
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, updateOrderstate);
				pstmt.setString(2, order_code);
				
				result = pstmt.executeUpdate();
			}
			
			
		} finally {
			close();
		}
		
		return result;
	}//end of updateOrderStateChecked
	
	
	//체크된 주문들을 삭제해준다
	@Override
	public int deleteOrderChecked(String[] order_codeArr) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			int n=0;
			for(String order_code : order_codeArr) {
				String sql = " delete tbl_order_detail where fk_order_code = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order_code);
				n = pstmt.executeUpdate();
				
				if(n > 0) {
					sql = " delete tbl_order where order_code = ? ";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, order_code);
					result = pstmt.executeUpdate();
				}
			}
			
		} finally {
			close();
		}
		
		return result;
	}//end of updateOrderStateChecked
	
	
	
	//받아온 order_code로 주문을 삭제해준다
	@Override
	public int deleteOneOrder(String order_code) throws SQLException {
		int result = 0;
		
		try {
			conn = ds.getConnection();
			
			int n = 0;
			String sql = " delete tbl_order_detail where fk_order_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_code);
			n = pstmt.executeUpdate();
			
			if(n > 0) {
				sql = " delete tbl_order where order_code = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, order_code);
				result = pstmt.executeUpdate();
			}
			
		} finally {
			close();
		}
		
		return result;
	}//end of deleteOneOrder
	
	
	// 오더코드 생성
	@Override
	public String getOrderCode() throws SQLException {
		
		String ordercode = "";
		
		try {
			conn = ds.getConnection();
			
			String sql = " select 'ord-'||lpad(SEQ_ORDERCODE.nextval,4,0) "
					   + " from dual ";
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			rs.next();
			
			ordercode = rs.getString(1);
			
		} finally {
			close();
		}
		
		
		return ordercode;
	}//end of getOrderCode
	
	
	
	
}
