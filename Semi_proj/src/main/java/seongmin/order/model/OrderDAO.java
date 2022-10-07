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

			String sql = "  select userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind\n"
					+ " from\n" + " (\n"
					+ " select rownum as num, userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind\n"
					+ " from\n"
					+ " (select userid, to_char(orderdate,'yyyy-mm-dd') as orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind\n"
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

			sql += "  order by orderdate ) V " + " ) D " + " where num between ? and ? ";

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

			String sql = "select prod_name, prod_price, prod_image, prod_kind \n" + "from\n" + "tbl_like\n"
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

			String sql = "select userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind\n"
					+ "from\n" + "(\n"
					+ "select rownum, userid, orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind\n"
					+ "from\n"
					+ "(select userid, to_char(orderdate,'yyyy-mm-dd') as orderdate, order_code, prod_name, order_buy_count, fk_order_state_name, prod_image, order_price, prod_kind\n"
					+ "from tbl_order\n" + "left join\n" + "tbl_member m\n" + "on fk_userid = userid\n"
					+ "left join tbl_order_detail d\n" + "on order_code = fk_order_code\n" + "left join tbl_product p\n"
					+ "on fk_prod_code = p.prod_code\n" + "left join tbl_order_state s\n"
					+ "on order_state_name = fk_order_state_name \n" + "where userid = ? \n" + "order by orderdate\n"
					+ ") V\n" + ") D";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

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

	}

}