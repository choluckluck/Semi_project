package hasol.board.model;

import java.sql.*;
import java.util.*;

import javax.naming.*;
import javax.sql.DataSource;

public class J_ProductDAO implements J_InterProductDAO {
	
	private DataSource ds;  // DataSource ds 는 아파치톰캣이 제공하는 DBCP(DB Connection Pool) 이다.  
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
   
   
	// 생성자
	public J_ProductDAO() {
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
	

	
	// 총페이지 알아오기
	@Override
	public int getTotalPage(Map<String, String> paraMap) throws SQLException {
		
		int totalPage = 0;
		
		try {
			conn = ds.getConnection();			
			
			String sql = " select ceil(count(*)/?) "+
						 " from tbl_product " +
					     "where prod_name like '% ? %'";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(paraMap.get("sizePerPage")) );
			pstmt.setString(2, paraMap.get("searchWord"));

			rs = pstmt.executeQuery();
			
			rs.next();
			
			totalPage = rs.getInt(1);
			
		} finally {
			close();
		}
		
		return totalPage;
	}//end of getTotalPage
	
	
	
	
	// 상품 리스트
	@Override
	public List<J_ProductVO> qnaSearchProduct(Map<String, String> paraMap) throws SQLException {
		
		List<J_ProductVO> qnaProductList = new ArrayList<>();
		
		try {
			
			conn = ds.getConnection();
			
			String sql = "select prod_name, prod_code, pimage, phigh, psaleprice, pdcode, pcolor, psize \n"+
						"from\n"+
						"( \n"+
						"    select rownum as RNO, prod_name, prod_code, pdcode, phigh, psaleprice, pcolor, psize, pimage\n"+
						"    from\n"+
						"    (\n"+
						"        select A.prod_name prod_name\n"+
						"             , A.prod_code prod_code\n"+
						"             , A.prod_image pimage\n"+						
						"             , A.prod_high phigh\n"+
						"             , A.prod_saleprice psaleprice\n"+
						"             , B.prod_detail_code pdcode\n"+
						"             , B.prod_color pcolor\n"+
						"             , B.prod_size psize\n"+
						"        from tbl_product A join tbl_prod_detail B\n"+
						"        on A.prod_code = B.fk_prod_code\n"+
						"        where A.prod_name like '% ? %'\n"+
						"        order by prod_code\n"+
						"    ) V\n"+
						") T\n"+
						"where RNO between ? and ?";
			
			int currentPageNo = Integer.parseInt(paraMap.get("currentPageNo"));
			int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, paraMap.get("searchWord"));
			pstmt.setInt(2, (currentPageNo*sizePerPage) - (sizePerPage - 1) );
			pstmt.setInt(3, (currentPageNo*sizePerPage));
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				J_ProductVO pvo = new J_ProductVO();
				
				pvo.setProd_name(rs.getString(1));
				pvo.setProd_code(rs.getString(2));
				pvo.setProd_image(rs.getString(3));
				pvo.setProd_high(rs.getString(4));
				pvo.setProd_saleprice(rs.getString(5));
				
				J_ProductDetailVO pdvo = new J_ProductDetailVO();
				pdvo.setProd_detail_code(sql);
				pdvo.setProd_color(sql);
				pdvo.setProd_size(rs.getString(1));
				
				pvo.setPdvo(pdvo); // 상품디테일코드
				
				 qnaProductList.add(pvo);
			}
			
		} finally {
			close();
		}
		
		return  qnaProductList;
	}

	
	
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	

	
	
	
	

	
	
	
	
	

	

}
