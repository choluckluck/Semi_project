package seongmin.order.model;

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

import seongmin.login.model.MemberVO;
import seongmin.product.model.LikeVO;
import seongmin.product.model.ProductDetailVO;
import seongmin.product.model.ProductVO;
import seongmin.product.model.ThumbVO;

public class OrderDAO implements InterOrderDAO {

	private DataSource ds; // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	// 생성자
	public OrderDAO() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/semi");

		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

	// 사용한 자원을 반납하는 close() 메소드 생성하기
	private void close() {
		try {

			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (pstmt != null) {
				pstmt.close();
				pstmt = null;
			}
			if (conn != null) {
				conn.close();
				conn = null;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	@Override
	public List<OrderVO> recentOrderList(Map<String, String> paraMap) throws SQLException {

		List<OrderVO> ovoList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "  select userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind, prod_saleprice, prod_code \n"
					+ " from\n" + " (\n"
					+ " select rownum as num, userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind, prod_saleprice, prod_code \n"
					+ " from\n"
					+ " (select userid, to_char(orderdate,'yyyy-mm-dd') as orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind, prod_saleprice, prod_code \n"
					+ " from tbl_order\n" + "	left join\n" + "	tbl_member m\n" + "	on fk_userid = userid\n"
					+ "	left join tbl_order_detail d\n" + "	on order_code = fk_order_code\n"
					+ "	left join tbl_product p\n" + "	on fk_prod_code = p.prod_code\n"
					+ "  left join tbl_order_state s\n" + "  on order_state_name = fk_order_state_name \n"
					+ "	where userid = ? \n";

			String order_state = paraMap.get("order_state");
			String startDate = paraMap.get("startDate");
			String endDate = paraMap.get("endDate");

			if (startDate != null && startDate != "") {
				sql += " and '" + startDate + "' <= orderdate ";
			}

			if (endDate != null && endDate != "") {
				sql += " and '" + endDate + "' >= orderdate ";
			}

			if (order_state != null && order_state != "" && !"all".equalsIgnoreCase(order_state)) {
//					int order_state1 = Integer.parseInt(order_state);
				sql += " and order_state_code  = " + order_state + " \n ";
			}

			System.out.println(order_state);
			System.out.println(startDate);
			System.out.println(endDate);

			sql += "  order by orderdate desc ) V " + " ) D " + " where num between ? and ? ";

			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(3, (currentShowPageNo * sizePerPage));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO ovo = new OrderVO();

				ovo.setFk_userid(rs.getString(1));
				ovo.setOrderdate(rs.getString(2));
				ovo.setOrder_code(rs.getString(3));

				// very Important
				ProductVO pvo = new ProductVO();
				pvo.setProd_name(rs.getString(4));
				pvo.setProd_image(rs.getString(7));
				pvo.setProd_kind(rs.getString(9));
				pvo.setProd_saleprice(rs.getString(10));
				pvo.setProd_code(rs.getString(11));
				ovo.setPvo(pvo);

				OrderDetailVO odvo = new OrderDetailVO();
				odvo.setOrder_buy_count(rs.getInt(5));
				odvo.setOrder_price(rs.getInt(8));
				ovo.setOdvo(odvo);

				ovo.setOrder_state(rs.getString(6));

				// very Important

				ovoList.add(ovo);
			} // end of while

		} finally {
			close();
		}

		return ovoList;
	} // end of public List<OrderVO> recentOrderList

	// 총 주문조회
	@Override
	public List<Integer> totalOrderList(Map<String, String> paraMap) throws SQLException {
		List<Integer> totalOrderList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select sum(total_order_amount) as total_amount, count(*) as total_count\n"
					+ "from tbl_order\n" + "where fk_userid = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();

			if (rs.next()) {
				totalOrderList.add(rs.getInt(1));
				totalOrderList.add(rs.getInt(2));
			} // end of while

		} finally {
			close();
		}

		return totalOrderList;
	} // end of public List<OrderVO> recentOrderList

	@Override
	public List<ProductVO> likeList(Map<String, String> paraMap) throws SQLException {

		List<ProductVO> likeList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select prod_name, prod_price, prod_image, prod_kind, prod_code \n" + "from\n" + "tbl_like\n"
					+ "join tbl_product\n" + "on fk_prod_code = prod_code\n" + "where fk_userid = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO lpvo = new ProductVO();
				lpvo.setProd_name(rs.getString(1));
				lpvo.setProd_price(rs.getString(2));
				lpvo.setProd_image(rs.getString(3));
				lpvo.setProd_kind(rs.getString(4));
				lpvo.setProd_code(rs.getString(5));

				likeList.add(lpvo);
			} // end of while

		} finally {
			close();
		}

		return likeList;

	} // end of public List<OrderVO> recentOrderList

	// 페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0;

		try {
			conn = ds.getConnection();

			String sql = "select ceil(count(*)/5) \n" + "from tbl_order_detail\n" + "join tbl_order\n"
					+ "on order_code = fk_order_code\n" +
					"left join tbl_order_state\n"+
					"on order_state_name = fk_order_state_name \n"+
					"where fk_userid = ? ";

			String order_state = paraMap.get("order_state");
			String startDate = paraMap.get("startDate");
			String endDate = paraMap.get("endDate");

			if (order_state != null && order_state != "" && !"all".equalsIgnoreCase(order_state) ) {
//				int order_state1 = Integer.parseInt(order_state);
				sql += " and order_state_code  = " + order_state + " ";
			}

			if (startDate != null && startDate != "") {
				sql += " and '" + startDate + "'<= orderdate ";
			}

			if (endDate != null && endDate != "") {
				sql += " and '" + endDate + "' >= orderdate ";
			}

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();

			rs.next();

			totalPage = rs.getInt(1);

		} finally {
			close();
		}

		return totalPage;
	}

	@Override
	public List<OrderVO> recentOrderList1(Map<String, String> paraMap) throws SQLException {
		List<OrderVO> ovoList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind, prod_saleprice, prod_code \n"+
					"					from\n"+
					"                    (\n"+
					"					select rownum, userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind, prod_saleprice, prod_code\n"+
					"					from\n"+
					"					(select userid, to_char(orderdate,'yyyy-mm-dd') as orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind, prod_saleprice, prod_code \n"+
					"					from tbl_order\n"+
					"                    left join\n"+
					"                    tbl_member m\n"+
					"                    on fk_userid = userid\n"+
					"					left join tbl_order_detail d \n"+
					"                    on order_code = fk_order_code\n"+
					"                    left join tbl_product p\n"+
					"					on fk_prod_code = p.prod_code\n"+
					"                    left join tbl_order_state s\n"+
					"					on order_state_name = fk_order_state_name \n"+
					"                    where userid = ? \n"+
					"                    order by orderdate desc\n"+
					"					) V \n"+
					"                   ) D";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO ovo = new OrderVO();

				ovo.setFk_userid(rs.getString(1));
				ovo.setOrderdate(rs.getString(2));
				ovo.setOrder_code(rs.getString(3));
				ovo.setOrder_state(rs.getString(6));

				// very Important
				ProductVO pvo = new ProductVO();
				pvo.setProd_name(rs.getString(4));
				pvo.setProd_image(rs.getString(7));
				pvo.setProd_kind(rs.getString(9));
				pvo.setProd_saleprice(rs.getString(10));
				pvo.setProd_code(rs.getString(11));
				ovo.setPvo(pvo);

				OrderDetailVO odvo = new OrderDetailVO();
				odvo.setOrder_buy_count(rs.getInt(5));
				odvo.setOrder_price(rs.getInt(8));
				ovo.setOdvo(odvo);


				// very Important

				ovoList.add(ovo);
			} // end of while

		} finally {
			close();
		}

		return ovoList;

	}

	@Override
	public int getTotalPage1(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0;

		try {
			conn = ds.getConnection();

			String sql = "select ceil(count(*)/5) \n"+
					"from tbl_like\n"+
					"where fk_userid = ? \n"+
					"";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();

			rs.next();

			totalPage = rs.getInt(1);

		} finally {
			close();
		}

		return totalPage;
	}

	@Override
	public List<ProductVO> likeList1(Map<String, String> paraMap) throws SQLException {

		List<ProductVO> likeList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select prod_image, prod_name, prod_price, prod_point, prod_saleprice, fk_prod_size, fk_prod_color, fk_prod_code, like_code \n"+
					"from\n"+
					"(\n"+
					"select rownum as num, like_code, prod_image, prod_name, prod_price, prod_point, prod_saleprice, fk_prod_size, fk_prod_color, fk_prod_code \n"+
					"from\n"+
					"(\n"+
					"select like_code, prod_image, prod_name, prod_price, prod_point, prod_saleprice, fk_prod_size, fk_prod_color, fk_prod_code \n"+
					"from tbl_like\n"+
					"join tbl_product\n"+
					"on fk_prod_code = prod_code\n"+
					"where fk_userid = ?  \n"+
					"order by like_code desc\n"+
					") V\n"+
					") D\n"+
					"where num between ? and ? ";
						
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			pstmt.setInt(2, (currentShowPageNo * sizePerPage) - (sizePerPage - 1));
			pstmt.setInt(3, (currentShowPageNo * sizePerPage));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO pvo = new ProductVO();
				pvo.setProd_image(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_price(rs.getString(3));
				pvo.setProd_point(rs.getString(4));
				pvo.setProd_saleprice(rs.getString(5));
				pvo.setProd_code(rs.getString(8));
				
				ProductDetailVO pdvo = new ProductDetailVO();
				pdvo.setProd_size(rs.getString(6));
				pdvo.setProd_color(rs.getString(7));								
				pvo.setPdvo(pdvo);
				
				LikeVO lvo = new LikeVO();
				lvo.setLike_code(rs.getString(9));
				
				pvo.setLvo(lvo);
				
				likeList.add(pvo);
			} // end of while

		} finally {
			close();
		}

		return likeList;
	} // end of public List<OrderVO> recentOrderList

	@Override
	public List<OrderVO> rowspan(Map<String, String> paraMap) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	
	
	// 주문상세에서 주문정보 조회해오는 메소드
	@Override
	public List<OrderVO> oderDetailList(String order_code) {
		List<OrderVO> oList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select order_code, to_char(orderdate, 'yyyy-mm-dd') as orderdate, fk_order_state_name, name \n"+
					"from tbl_order\n"+
					"join tbl_member\n"+
					"on fk_userid = userid \n"+
					"where order_code = ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_code);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO ovo = new OrderVO();

				ovo.setOrder_code(rs.getString(1));
				ovo.setOrderdate(rs.getString(2));
				ovo.setOrder_state(rs.getString(3));
				
				// very Important
				MemberVO mvo = new MemberVO();
				mvo.setName(rs.getString(4));

				ovo.setMvo(mvo);

				// very Important

				oList.add(ovo);
				
			} // end of while
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}

		return oList;

	}

	@Override
	public List<OrderVO> totalOrderList(String order_code) {
		
		List<OrderVO> totalList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select case when sum(delivery_fee) >= 2500\n"+
					"then 2500 else 0 end as totalprice\n"+
					", sum(total), sum(prod_point) \n"+
					"from \n"+
					"(\n"+
					"select order_code, prod_saleprice, prod_saleprice*order_buy_count as total, delivery_fee, prod_point*order_buy_count as prod_point \n"+
					"from tbl_order\n"+
					"join\n"+
					"tbl_order_detail\n"+
					"on order_code = fk_order_code\n"+
					"join\n"+
					"tbl_product\n"+
					"on fk_prod_code=prod_code\n"+
					")\n"+
					"where order_code = ? \n"+
					"group by order_code";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, order_code);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				OrderVO ovo = new OrderVO();
				
				ovo.setShipfee(rs.getString(1));
				ovo.setTotal(rs.getString(2));
				ovo.setTotalPoint(rs.getString(3));
				
				totalList.add(ovo);
				
			} // end of while
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}

		return totalList;
		
	}

	@Override
	public int isOrder(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		try {
			conn = ds.getConnection();

			String sql = "SELECT fk_prod_code, fk_userid\n"+
					"from tbl_order O\n"+
					"join tbl_order_detail D\n"+
					"on order_code = fk_order_code\n"+
					"where fk_userid = ? and fk_prod_code = ? ";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("fk_userid"));
			pstmt.setString(2, paraMap.get("fk_prod_code"));
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				n= 1;				
			} // end of while
			
			else {
				n = 2;
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		
		return n;
	}

	@Override
	public int isRegistered(Map<String, String> paraMap) throws SQLException {
		int n = 0;
		try {
			conn = ds.getConnection();

			String sql = "select *\n"+
					"from tbl_review\n"+
					"where fk_userid = ? and fk_prod_code = ? ";			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("fk_userid"));
			pstmt.setString(2, paraMap.get("fk_prod_code"));
			
			rs = pstmt.executeQuery();

			if (rs.next()) { //있으면
				n= 1;				
			} // end of while
			
			else { //없으면 
				n = 2;
			}
			
		} catch (SQLException e){
			e.printStackTrace();
		} finally {
			close();
		}
		
		return n;
	}

}
