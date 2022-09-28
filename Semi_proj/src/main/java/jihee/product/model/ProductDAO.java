package jihee.product.model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDAO implements InterProductDAO {
	private DataSource ds;	//DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool)
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
	
	//BEST 상품 알아오기
	@Override
	public List<ProductVO> selectBestProduct(Map<String, String> bestParaMap) throws SQLException {
		
		 List<ProductVO> bestProductList = new ArrayList<>();
		 
		 try {
		
			 conn = ds.getConnection();
			 
			 String sql = "select prod_code, prod_name, prod_kind , prod_image, prod_high,  prod_color, prod_price, prod_registerday, nvl(prod_review_count,0) as prod_review_count, nvl(prod_order_count,0) as prod_order_count, prod_saleprice\n"+
					 "from tbl_product\n"+
					 "left JOIN \n"+
					 "(\n"+
					 "    select fk_prod_code, count(*) as prod_order_count\n"+
					 "    from tbl_order_detail\n"+
					 "    group by fk_prod_code\n"+
					 ")OD\n"+
					 "ON prod_code = OD.fk_prod_code\n"+
					 "left join\n"+
					 "(\n"+
					 "    select fk_prod_code, count(*) as prod_review_count\n"+
					 "    from tbl_review\n"+
					 "    group by fk_prod_code\n"+
					 ")R\n"+
					 "ON prod_code = R.fk_prod_code\n"+
					 "order by prod_order_count desc";
			 
				pstmt = conn.prepareStatement(sql);
				
				rs = pstmt.executeQuery();
				
				
				while(rs.next() ) {
					
					ProductVO pvo = new ProductVO();
					pvo.setProd_code(rs.getString(1));
					pvo.setProd_name(rs.getString(2));
					pvo.setProd_kind(rs.getString(3));
					pvo.setProd_image(rs.getString(4));
					pvo.setProd_high(rs.getString(5));
					pvo.setProd_color(rs.getString(6));
					pvo.setProd_price(rs.getInt(7));
					pvo.setProd_registerday(rs.getString(8));
					pvo.setProd_review_count(rs.getInt(9)); 
					pvo.setProd_order_count(rs.getInt(10));
					pvo.setProd_saleprice(rs.getInt(11));
					bestProductList.add(pvo);
					
				}
			 
			 
			 
		 }finally {
			close();
		}
		 
		
		
		return bestProductList;
	}
	
	//상품 카드 목록 가져오기
	@Override
	public List<ProductVO> selectProductAll(Map<String, String> paraMap) throws SQLException {
		
		List<ProductVO> productList = new ArrayList<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select prod_code, prod_name, prod_kind, prod_image\n"+
					"	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock\n"+
					"	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count ,rownum AS RNO\n"+
					"from\n"+
					"(select rownum AS RNO ,prod_code, prod_name, prod_kind, prod_image\n"+
					"	 ,prod_high, prod_color ,prod_size, prod_price, prod_stock\n"+
					"	 ,prod_registerday, nvl(prod_review_count,'0') as prod_review_count\n"+
					"from tbl_product left JOIN \n"+
					"(\n"+
					"\n"+
					"    select fk_prod_code, count(*) as prod_review_count \n"+
					"    from tbl_review\n"+
					"    group by fk_prod_code\n"+
					")\n"+
					"ON prod_code = fk_prod_code\n"+
					"where prod_kind like '%' and prod_color like '%' ";
			
			// 검색어를 입력하여 검색하는 경우
			
			 String searchWord = paraMap.get("searchWord");
			 
			 if(searchWord !=null  && !searchWord.trim().isEmpty() ) {
				 
				 sql += " and prod_name like '%'|| ? ||'%'  ";
				 
			 }
			
			// 가격 검색하는 경우
			 
			 String searchPrice1 = paraMap.get("searchPrice1");
			 String searchPrice2 = paraMap.get("searchPrice2");
			 
			 System.out.println("DAO searchPrice2 :" + searchPrice2);
			 System.out.println("DAO searchPrice1 :" + searchPrice1);
			 
			 int searchPriceStart=0;
			 int searchPriceEnd =5000000;
			 
			 if(searchPrice1 !=null  && !searchPrice1.trim().isEmpty() ) {
				 
					searchPriceStart = Integer.parseInt(searchPrice1);
					
				 }
				  
				 
				  
			  if(searchPrice2 !=null  && !searchPrice2.trim().isEmpty() ) {
				  
				  searchPriceEnd = Integer.parseInt(searchPrice2);
			  }

			 sql += " and prod_price between ? and ?  ";
			 
			  
			 System.out.println("DAO searchPriceStart :" + searchPriceStart);

	
			// === 페이징처리의 공식 ===
			 // where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수); 
			
			 
			 sql += " order by prod_registerday desc " +
					 " )\n"+
				   " where RNO between ? and ? ";
			 
			 int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			 int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			 
			 
			pstmt = conn.prepareStatement(sql);
			
			//System.out.println("searchPriceStart :" +searchPriceStart);
			//System.out.println("searchPriceEnd :" +searchPriceEnd);
			
			
			if( searchWord != null && !searchWord.trim().isEmpty() ) {
				
				pstmt.setString(1, searchWord);
				
				pstmt.setInt(2,  searchPriceStart);
				pstmt.setInt(3,  searchPriceEnd);
				pstmt.setInt(4, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
				pstmt.setInt(5, (currentShowPageNo*sizePerPage) ); // 공식
			 }
			 else {
				pstmt.setInt(1,  searchPriceStart);
				pstmt.setInt(2,  searchPriceEnd);
				pstmt.setInt(3, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
				pstmt.setInt(4, (currentShowPageNo*sizePerPage) ); // 공식
			 }
			
			
				 
			
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next() ) {
				
				ProductVO pvo = new ProductVO();
				pvo.setProd_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_kind(rs.getString(3));
				pvo.setProd_image(rs.getString(4));
				pvo.setProd_high(rs.getString(5));
				pvo.setProd_color(rs.getString(6));
				pvo.setProd_size(rs.getString(7));
				pvo.setProd_price(rs.getInt(8));
				pvo.setProd_stock(rs.getString(9));
				pvo.setProd_registerday(rs.getString(10));
				pvo.setProd_review_count(rs.getInt(11));
				
				productList.add(pvo);
				
			}// end of while-----
			
		} finally {
			close();
		} 
		
		return productList;
	}//public List<ProductVO> selectProductAll() throws SQLException------- 

	
	
	//총 페이지바 페이지수 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		
		int totalPage = 0;
		
		
		try {
			conn = ds.getConnection();
			
			String sql = " select ceil(count(*)/20)  \n"+
						 " from tbl_product"; 
			
			
	
			pstmt = conn.prepareStatement(sql);
				
			
			rs = pstmt.executeQuery(); //if next필요없다 count는 결과 없어도 0이 나오니까
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
			
		}finally {
			close();
		}
		
					
		return totalPage;
	
	}

	
}
