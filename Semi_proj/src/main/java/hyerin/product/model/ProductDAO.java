package hyerin.product.model;

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
			String sql = "select PO.prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, P.prod_color, prod_registerday, md_pick_yn, nvl(review_count, 0) as review_count, nvl(prod_order_count, 0) as prod_order_count\n"+
							"from tbl_product PO\n"+
							"JOIN\n"+
							"(\n"+
							"    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color\n"+
							"    from\n"+
							"    (\n"+
							"        select distinct prod_code, prod_color\n"+
							"        from tbl_product\n"+
							"        join\n"+
							"        tbl_prod_detail\n"+
							"        on prod_code = fk_prod_code\n"+
							"    ) P\n"+
							"    group by prod_code\n"+
							") P\n"+
							"ON PO.prod_code = P.prod_code\n"+
							"LEFT JOIN\n"+
							"(\n"+
							"    select fk_prod_code, count(*) as review_count\n"+
							"    from tbl_review\n"+
							"    group by fk_prod_code\n"+
							") R\n"+
							"ON fk_prod_code = P.prod_code\n"+
							"LEFT JOIN\n"+
							"(\n"+
							"    select fk_prod_code, count(*) as prod_order_count\n"+
							"    from tbl_order_detail\n"+
							"    group by fk_prod_code\n"+
							") OD\n"+
							"ON OD.fk_prod_code = P.prod_code"+
							" order by prod_order_count desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO best_pvo = new ProductVO();
				best_pvo.setProd_code(rs.getString(1));
				best_pvo.setProd_name(rs.getString(2));
				best_pvo.setProd_kind(rs.getString(3));
				best_pvo.setProd_image(rs.getString(4));
				best_pvo.setProd_high(rs.getString(5));
				best_pvo.setProd_price(rs.getString(6));
				best_pvo.setProd_saleprice(rs.getString(7));
				best_pvo.setProd_color(rs.getString(8));
				best_pvo.setProd_registerday(rs.getString(9));
				best_pvo.setProd_review_count(rs.getString(11));
				
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
			String sql = "select PO.prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, P.prod_color, prod_registerday, md_pick_yn, nvl(review_count, 0) as review_count, nvl(prod_order_count, 0) as prod_order_count\n"+
						"from tbl_product PO\n"+
						"JOIN\n"+
						"(\n"+
						"    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color\n"+
						"    from\n"+
						"    (\n"+
						"        select distinct prod_code, prod_color\n"+
						"        from tbl_product\n"+
						"        join\n"+
						"        tbl_prod_detail\n"+
						"        on prod_code = fk_prod_code\n"+
						"    ) P\n"+
						"    group by prod_code\n"+
						") P\n"+
						"ON PO.prod_code = P.prod_code\n"+
						"LEFT JOIN\n"+
						"(\n"+
						"    select fk_prod_code, count(*) as review_count\n"+
						"    from tbl_review\n"+
						"    group by fk_prod_code\n"+
						") R\n"+
						"ON fk_prod_code = P.prod_code\n"+
						"LEFT JOIN\n"+
						"(\n"+
						"    select fk_prod_code, count(*) as prod_order_count\n"+
						"    from tbl_order_detail\n"+
						"    group by fk_prod_code\n"+
						") OD\n"+
						"ON OD.fk_prod_code = P.prod_code"+
						" order by prod_registerday desc ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO new_pvo = new ProductVO();
				new_pvo.setProd_code(rs.getString(1));
				new_pvo.setProd_name(rs.getString(2));
				new_pvo.setProd_kind(rs.getString(3));
				new_pvo.setProd_image(rs.getString(4));
				new_pvo.setProd_high(rs.getString(5));
				new_pvo.setProd_price(rs.getString(6));
				new_pvo.setProd_saleprice(rs.getString(7));
				new_pvo.setProd_color(rs.getString(8));
				new_pvo.setProd_registerday(rs.getString(9));
				new_pvo.setProd_review_count(rs.getString(11));
				
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
			String sql = "select PO.prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, P.prod_color, prod_registerday, md_pick_yn, nvl(review_count, 0) as review_count, nvl(prod_order_count, 0) as prod_order_count\n"+
						"from tbl_product PO\n"+
						"JOIN\n"+
						"(\n"+
						"    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color\n"+
						"    from\n"+
						"    (\n"+
						"        select distinct prod_code, prod_color\n"+
						"        from tbl_product\n"+
						"        join\n"+
						"        tbl_prod_detail\n"+
						"        on prod_code = fk_prod_code\n"+
						"    ) P\n"+
						"    group by prod_code\n"+
						") P\n"+
						"ON PO.prod_code = P.prod_code\n"+
						"LEFT JOIN\n"+
						"(\n"+
						"    select fk_prod_code, count(*) as review_count\n"+
						"    from tbl_review\n"+
						"    group by fk_prod_code\n"+
						") R\n"+
						"ON fk_prod_code = P.prod_code\n"+
						"LEFT JOIN\n"+
						"(\n"+
						"    select fk_prod_code, count(*) as prod_order_count\n"+
						"    from tbl_order_detail\n"+
						"    group by fk_prod_code\n"+
						") OD\n"+
						"ON OD.fk_prod_code = P.prod_code\n"+
						"WHERE md_pick_yn = 'Y' and ROWNUM < 5\n"+
						"ORDER BY DBMS_RANDOM.VALUE";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				ProductVO md_pvo = new ProductVO();
				md_pvo.setProd_code(rs.getString(1));
				md_pvo.setProd_name(rs.getString(2));
				md_pvo.setProd_kind(rs.getString(3));
				md_pvo.setProd_image(rs.getString(4));
				md_pvo.setProd_high(rs.getString(5));
				md_pvo.setProd_price(rs.getString(6));
				md_pvo.setProd_saleprice(rs.getString(7));
				md_pvo.setProd_color(rs.getString(8));
				md_pvo.setProd_registerday(rs.getString(9));
				md_pvo.setProd_review_count(rs.getString(11));
				
				pvoList.add(md_pvo);
				
			}
			
		} finally {
		     close();
		}
		
		return pvoList;
	}//end of selectMDProduct

	
	
	
	
	
	//////////////////////////////////////////////////////////////////
	
	// 관리자 페이지
	
	
	// 총페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();
			
			String prodSortbyKind = paraMap.get("prodSortbyKind");
			String searchword = paraMap.get("searchword");
			
			String sql = " select ceil(count(*)/5) "+
						 " from v_tbl_product ";			
			
			// 상품종류로 정렬했을 경우
			if(prodSortbyKind != null && !"product_kind".equals(prodSortbyKind) ) {  
				sql += " where prod_kind = ? ";
				
				//검색어가 있을 경우
				if(!"".equals(searchword)) {
					sql += " and prod_name like '%'||?||'%' ";
				}
			}
			//정렬하지 않았을 경우
			else {
				//검색어가 있을 경우
				if(!"".equals(searchword)) {
					sql += " where prod_name like '%'||?||'%' ";
				}
			}
			
			pstmt = conn.prepareStatement(sql);
			
			if(prodSortbyKind != null && !"product_kind".equals(prodSortbyKind) ) {  
				pstmt.setString(1, prodSortbyKind);
				
				if(!"".equals(searchword)) {
					pstmt.setString(2, searchword);
				}
			}
			else {
				if(!"".equals(searchword)) {
					pstmt.setString(1, searchword);
				}
			}
			
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		return totalPage;
	}//end of getTotalPage
	
	
	// 첫 화면일때는 모든 상품정보를, 셀렉트박스를 변경했을때는 선택한 종류의 상품정보를 조회(select)
	@Override
	public List<ProductVO> selectPagingProductByKind(Map<String, String> paraMap) throws SQLException {
		List<ProductVO> pvoList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			
			String prodSortbyKind = paraMap.get("prodSortbyKind");
			String searchword = paraMap.get("searchword");
			
			String sql = "select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn\n"+
					"from \n"+
					"(\n"+
					"    select rownum as rno, prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn\n"+
					"    from v_tbl_product\n";
			
			// 상품종류로 정렬했을 경우
			if(prodSortbyKind != null && !"product_kind".equals(prodSortbyKind) ) {  
				//검색어가 있을 경우
				if(!"".equals(searchword)) {
					sql += " where prod_kind = ? and prod_name like '%'||?||'%' ";
				}
				//없을경우
				else {
					sql += " where prod_kind = ? ";
				}
			}
			//정렬하지 않았을 경우
			else {
				//검색어가 있을 경우
				if(!"".equals(searchword)) {
					sql += " where prod_name like '%'||?||'%' ";
				}
			}
			
			sql += ")\n"+
					"where rno between ? and ?";
			
			
			pstmt = conn.prepareStatement(sql);
			
			int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			// 상품종류로 정렬했을 경우
			if(prodSortbyKind != null && !"product_kind".equals(prodSortbyKind) ) {  
				if(!"".equals(searchword)) {
					pstmt.setString(1, prodSortbyKind);
					pstmt.setString(2, searchword);
					pstmt.setInt(3, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(4, (currentShowPageNo*sizePerPage));
				}
				else {
					pstmt.setString(1, prodSortbyKind);
					pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3, (currentShowPageNo*sizePerPage));
				}
			}
			else {
				if(!"".equals(searchword)) {
					pstmt.setString(1, searchword);
					pstmt.setInt(2, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(3, (currentShowPageNo*sizePerPage));
				}
				else {
					pstmt.setInt(1, (currentShowPageNo*sizePerPage) - (sizePerPage - 1));
					pstmt.setInt(2, (currentShowPageNo*sizePerPage));
				}
			}
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				
				ProductVO pvo = new ProductVO();
				pvo.setProd_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_kind(rs.getString(3));
				pvo.setProd_image(rs.getString(4));
				pvo.setProd_high(rs.getString(5));
				pvo.setProd_price(rs.getString(6));
				pvo.setProd_saleprice(rs.getString(7));
				pvo.setProd_color(rs.getString(8));
				pvo.setProd_registerday(rs.getString(9));
				pvo.setMd_pick_yn(rs.getString(10));
				
				pvoList.add(pvo);
				
			}
			
			
		} finally {
			close();
		}
		
		return pvoList;
	}

	
	
	
	//상품종류 목록을 가져오기
	@Override
	public List<String> selectProdKindList() throws SQLException {
		List<String> prodKindList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select distinct prod_kind "
					   + " from tbl_product ";
			
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				prodKindList.add(rs.getString(1));
			}
			
		} finally {
			close();
		}
		
		
		return prodKindList;
	}//end of selectProdKindList

	
	
	

	
	
	
	
	

	

}
