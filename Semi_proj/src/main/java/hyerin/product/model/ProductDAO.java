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
				ProductDetailVO pdvo = new ProductDetailVO();
				
				best_pvo.setProd_code(rs.getString(1));
				best_pvo.setProd_name(rs.getString(2));
				best_pvo.setProd_kind(rs.getString(3));
				best_pvo.setProd_image(rs.getString(4));
				best_pvo.setProd_high(rs.getString(5));
				best_pvo.setProd_price(rs.getString(6));
				best_pvo.setProd_saleprice(rs.getString(7));
				pdvo.setProd_color(rs.getString(8));
				best_pvo.setPdvo(pdvo);
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
				ProductDetailVO pdvo = new ProductDetailVO();
				
				new_pvo.setProd_code(rs.getString(1));
				new_pvo.setProd_name(rs.getString(2));
				new_pvo.setProd_kind(rs.getString(3));
				new_pvo.setProd_image(rs.getString(4));
				new_pvo.setProd_high(rs.getString(5));
				new_pvo.setProd_price(rs.getString(6));
				new_pvo.setProd_saleprice(rs.getString(7));
				pdvo.setProd_color(rs.getString(8));
				new_pvo.setPdvo(pdvo);
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
				
				ProductDetailVO pdvo = new ProductDetailVO();
				pdvo.setProd_color(rs.getString(8));
				md_pvo.setPdvo(pdvo);
				
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
					"    select rownum as rno, prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_color, prod_registerday, md_pick_yn "+
					"    from (select * from v_tbl_allproduct order by prod_registerday desc) ";
			
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
					" left join ( select * from v_tbl_prod_detail_stock )VPD on VPD.fk_prod_code = prod_code "+
					" where rno between ? and ? ";

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
				ProductDetailVO pdvo = new ProductDetailVO();
				
				pvo.setProd_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_kind(rs.getString(3));
				pvo.setProd_image(rs.getString(4));
				pvo.setProd_high(rs.getString(5));
				pvo.setProd_price(rs.getString(6));
				pvo.setProd_saleprice(rs.getString(7));

				pdvo.setProd_color(rs.getString(8));
				pvo.setPdvo(pdvo);
				
				pvo.setProd_registerday(rs.getString(9));
				pvo.setMd_pick_yn(rs.getString(10));
				pvo.setPdvo(pdvo);
				
				pvoList.add(pvo);
				
			}
			
			
		} finally {
			close();
		}
		
		return pvoList;
	}
	

	
	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	
	// ** 상품 등록 **
	
	
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
	
	
	
	//해당 상품코드, 상품컬러에 대한 사이즈를 조회하기
	@Override
	public List<ProductDetailVO> getProductSize(String pcode, String pcolor) throws SQLException {
		List<ProductDetailVO> pdvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select prod_size " +
						 " from tbl_prod_detail "+
						 " where fk_prod_code = ? and prod_color = ? ";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pcode);
			pstmt.setString(2, pcolor);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDetailVO pdvo = new ProductDetailVO();
				pdvo.setProd_size(rs.getString(1));
				
				pdvoList.add(pdvo);
			}
			
			
		} finally {
			close();
		}
		
		
		return pdvoList;
	}
	
	
	//재고량을 조회해온다
	@Override
	public String getStock(String p_code, String p_color, String p_size) throws SQLException {
		String stock = "";
		
		try {
			conn = ds.getConnection();
			
			String sql = " select prod_stock " +
						 " from tbl_prod_detail "+
						 " where fk_prod_code = ? and prod_color = ? and prod_size = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, p_code);
			pstmt.setString(2, p_color);
			pstmt.setString(3, p_size);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				stock = rs.getString(1);
			}
			
			
		} finally {
			close();
		}
		
		return stock;
	}
	
	
	
	
	// 상품번호 채굴해오기
	@Override
	public String getProdCode() throws SQLException {
		String prodcode = ""; //SEQ_PRODUCT_CODE
		
		try {
			 conn = ds.getConnection();
			 
			 String sql = " select 'prod-'||lpad(SEQ_PRODUCT_CODE.nextval,4,0) AS prod_code " +
					      " from dual ";
					   
			 pstmt = conn.prepareStatement(sql);
			 rs = pstmt.executeQuery();
			 			 
			 rs.next();
			 prodcode = rs.getString(1);
		
		} finally {
			close();
		}
		
		return prodcode;
	}//end of getProdCode
	
	
	
	//tbl_product 테이블에 제품 insert하기
	@Override
	public int insertProduct(ProductVO pvo) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_product( prod_code, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_registerday, prod_description, prod_point, md_pick_yn ) "
					   + " values(?, ?, ?, ?, ?, ?, ?, sysdate, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pvo.getProd_code());
			pstmt.setString(2, pvo.getProd_name());
			pstmt.setString(3, pvo.getProd_kind());
			pstmt.setString(4, pvo.getProd_image());
			pstmt.setString(5, pvo.getProd_high());
			pstmt.setInt(6, Integer.parseInt(pvo.getProd_price()));
			pstmt.setInt(7, Integer.parseInt(pvo.getProd_saleprice()));
			pstmt.setString(8, pvo.getProd_description());
			pstmt.setInt(9, Integer.parseInt(pvo.getProd_point()));
			pstmt.setString(10, pvo.getMd_pick_yn());
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}//end of insertProduct

	
	
	// tbl_product_image에 상품상세 이미지를 insert 해주기
	@Override
	public int insertProductImage(String prod_code, String product_image_file) throws SQLException {
		int n = 0;
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_product_image(product_image_code, fk_prod_code, product_image_file) "
					   + " values('d-img-'||lpad(SEQ_PRODUCT_IMAGE_CODE.nextval,4,0), ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			pstmt.setString(2, product_image_file);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}//end of insertProductImage
	
	
	
	
	//옵션 정보가 있을 때 tbl_prod_detail에 insert 해주기
	@Override
	public int insertProductDetail(ProductDetailVO pdvo) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " insert into tbl_prod_detail(prod_detail_code, fk_prod_code, prod_color, prod_size, prod_stock) "
					   + " values('d-prod-'||lpad(SEQ_PROD_DETAIL_CODE.nextval,4,0), ?, ?, ?, ?) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pdvo.getFk_prod_code());
			pstmt.setString(2, pdvo.getProd_color());
			pstmt.setString(3, pdvo.getProd_size());
			pstmt.setInt(4, Integer.parseInt(pdvo.getProd_stock()));
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		
		return n;
	}//end of insertProductDetail
	
	
	//해당 prod_code의 상품정보를 보여주기(select) 
	@Override
	public ProductVO getOneEditProduct(String prod_code) throws SQLException {
		ProductVO pvo = new ProductVO();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select prod_code, prod_name, prod_description, prod_kind, prod_image, prod_high, prod_saleprice, prod_price, prod_registerday, md_pick_yn,  prod_point "
						+ " from tbl_product "
						+  " where prod_code = ? "; 
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				pvo.setProd_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_description(rs.getString(3));
				pvo.setProd_kind(rs.getString(4));
				pvo.setProd_image(rs.getString(5));
				pvo.setProd_high(rs.getString(6));
				pvo.setProd_price(rs.getString(7));
				pvo.setProd_saleprice(rs.getString(8));
				pvo.setProd_registerday(rs.getString(9));
				pvo.setMd_pick_yn(rs.getString(10));
				pvo.setProd_point(rs.getString(11));
				
			}
			
		} finally {
			close();
		}
		
		
		return pvo;
	}
	
	
	//해당 prod_code의 상품상세정보를 보여주기 (select)
	@Override
	public List<ProductDetailVO> getOneProductDetail(String prod_code) throws SQLException {
		List<ProductDetailVO> pdvoList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = " select prod_detail_code, fk_prod_code, prod_color, prod_size, prod_stock "
						+ " from tbl_prod_detail "
						+ " where fk_prod_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ProductDetailVO pdvo = new ProductDetailVO();
				
				pdvo.setProd_detail_code(rs.getString(1));
				pdvo.setFk_prod_code(rs.getString(2));
				pdvo.setProd_color(rs.getString(3));
				pdvo.setProd_size(rs.getString(4));
				pdvo.setProd_stock(rs.getString(5));
				
				pdvoList.add(pdvo);
			}
			
			
		} finally {
			close();
		}
		
		return pdvoList;
	}
	
	
	// tbl_product에 받아온 상품 정보를 update해주기
	@Override
	public int updateProduct(ProductVO pvo) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			//prod_image가 null일 때는 prod_image를 제외하고 업데이트 해준다
			
			String sql = " update tbl_product set prod_name = ?, prod_kind = ?, "
					   + " prod_high = ?, prod_price = ?, prod_saleprice = ?, prod_description = ?, prod_point = ?, md_pick_yn = ? ";
			
			String prod_image = pvo.getProd_image();
			if(prod_image != null) {
				sql += ", prod_image = ? ";
			}
			
			sql += " where prod_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pvo.getProd_name());
			pstmt.setString(2, pvo.getProd_kind());
			pstmt.setString(3, pvo.getProd_high());
			pstmt.setInt(4, Integer.parseInt(pvo.getProd_price()));
			pstmt.setInt(5, Integer.parseInt(pvo.getProd_saleprice()));
			pstmt.setString(6, pvo.getProd_description());
			pstmt.setInt(7, Integer.parseInt(pvo.getProd_point()));
			pstmt.setString(8, pvo.getMd_pick_yn());
			
			if(prod_image != null) {
				pstmt.setString(9, pvo.getProd_image());
				pstmt.setString(10, pvo.getProd_code());
			}
			else {
				pstmt.setString(9, pvo.getProd_code());
			}
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
		
	}//end of updateProduct

	
	// tbl_product_image에 상품상세 이미지를 update 해주기
	@Override
	public int updateProductImage(String prod_code, String product_image_file) throws SQLException {
		
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " update tbl_product_image set product_image_file = ? "
					   + " where fk_prod_code = ? ";
					
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, product_image_file);
			pstmt.setString(2, prod_code);
			
			n = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		
		return n;
	}//end of updateProductImage

	
	// 기존에 있던 옵션 모두 지워주기
	@Override
	public int deleteProductDetailAll(String prod_code) throws SQLException {
		int n = 0;
		
		try {
			conn = ds.getConnection();
			
			String sql = " delete tbl_prod_detail "
					   + " where fk_prod_code = ? ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			
			n = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return n;
	}//end of deleteProductDetailAll
	
	
	//한 상품을 삭제하기
	@Override
	public int deleteOneProduct(String prod_code) throws SQLException {
		int n3 = 0;
		try {
			int n = 0;
			conn = ds.getConnection();
			
			String sql = " delete from tbl_prod_detail "
						+ " where fk_prod_code = ? ";
		
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, prod_code);
			
			n = pstmt.executeUpdate();
			
			//성공 시 tbl_product_image에 있는 정보도 지워준다
			if (n == 1 || n==0) {
				int n2 = 0;
				
				String sql2 = " delete tbl_product_image "
							+ " where fk_prod_code = ? ";
			
				pstmt = conn.prepareStatement(sql2);
				
				pstmt.setString(1, prod_code);
				
				n2 = pstmt.executeUpdate();
			
				//성공시 tbl_product에 있는 상품을 지워준다
				if(n2 == 1 ) {
					
					String sql3 = " delete tbl_product "
							   + " where prod_code = ? ";
					
					pstmt = conn.prepareStatement(sql3);
					
					pstmt.setString(1, prod_code);
					
					n3 = pstmt.executeUpdate();
					
				}
			}
	
			
		} finally {
			close();
		}
		
		return n3;
	}//end of deleteOneProduct
	
	
	//해당하는 상품들을 삭제해준다
	@Override
	public int deleteMultiProduct(Map<String, String[]> paraMap) throws SQLException {
		int n3 = 0;
		
		try {
			String[] prod_codeArr = paraMap.get("prod_codeArr");
			
			int n = 0;
			conn = ds.getConnection();
			
			for(String prod_code : prod_codeArr) {
			
				String sql = " delete from tbl_prod_detail "
							+ " where fk_prod_code = ? ";
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, prod_code);
				n = pstmt.executeUpdate();
				
				
				//성공 시 tbl_product_image에 있는 정보도 지워준다
				int n2 = 0;
				
				String sql2 = " delete tbl_product_image "
							+ " where fk_prod_code = ? ";
			
				pstmt = conn.prepareStatement(sql2);
				pstmt.setString(1, prod_code);
				n2 = pstmt.executeUpdate();
			
				//성공시 tbl_product에 있는 상품을 지워준다
				if(n2 == 1 ) {
					
					String sql3 = " delete tbl_product "
							   + " where prod_code = ? ";
					
					pstmt = conn.prepareStatement(sql3);
					
					pstmt.setString(1, prod_code);
					
					n3 = pstmt.executeUpdate();
					
				}
			
			}//end of for
			
		} finally {
			close();
		}
		
		return n3;
	}//end of deleteMultiProduct

	
	
	
	
	
	

	

}
