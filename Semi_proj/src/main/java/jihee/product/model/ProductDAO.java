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
	
	//총 페이지바 페이지수 알아오기
		@Override
		public int getTotalPage(Map<String, String> paraMap) throws SQLException {
			
			int totalPage = 0;
			
			
			try {
				conn = ds.getConnection();
				
				String sql = " select ceil(count(*)/20)  \n"+
							 " from tbl_product "; 
				
				
		
				pstmt = conn.prepareStatement(sql);
					
				
				rs = pstmt.executeQuery(); //if next필요없다 count는 결과 없어도 0이 나오니까
				
				rs.next();
				
				totalPage = rs.getInt(1);
				
				
			}finally {
				close();
			}
			
						
			return totalPage;
		
		}
	
	
	//BEST 상품 알아오기
	@Override
	public List<ProductVO> selectBestProduct(Map<String, String> bestParaMap) throws SQLException {
		
		 List<ProductVO> bestProductList = new ArrayList<>();
		 
		 try {
		
			 conn = ds.getConnection();
			 
			 String sql = "select PO.prod_code, prod_name,  prod_kind, prod_image, prod_high, P.prod_color, prod_saleprice, prod_registerday, nvl(review_count, 0) as review_count,   nvl(prod_order_count,0) as prod_order_count, prod_price\n"+
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
					 ")R\n"+
					 "ON fk_prod_code = P.prod_code\n"+
					 "left JOIN \n"+
					 "(\n"+
					 "    select fk_prod_code, count(*) as prod_order_count\n"+
					 "    from tbl_order_detail\n"+
					 "    group by fk_prod_code\n"+
					 ")OD\n"+
					 "ON R.fk_prod_code = OD.fk_prod_code\n"+
					 "order by prod_order_count desc ";
			 
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
			
			String sql = "select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_color, prod_size, prod_price,prod_registerday,nvl(review_count, 0) as review_count, prod_saleprice, rownum AS RNO\n"+
					"from(\n"+
					"select PO.prod_code, P.prod_color, P.prod_size, prod_name, prod_kind, prod_image, prod_high, prod_price, prod_saleprice, prod_registerday, nvl(review_count, 0) as review_count ,rownum AS RNO\n"+
					"from tbl_product PO\n"+
					"JOIN\n"+
					"(\n"+
					"    select prod_code, LISTAGG(P.prod_color,',') WITHIN GROUP (ORDER BY P.prod_color) AS prod_color\n"+
					"        ,LISTAGG(P.prod_size,',') WITHIN GROUP (ORDER BY P.prod_size) AS prod_size \n"+
					"    from\n"+
					"    (\n"+
					"        select distinct prod_code, prod_color, prod_size\n"+
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
					"where prod_kind like '%' ";
			
			// 1-1 검색어를 입력하여 검색하는 경우
			
			 String searchWord = paraMap.get("searchWord");
			 
			 if(searchWord !=null  && !searchWord.trim().isEmpty() ) {
				 
				 sql += " and prod_name like '%'|| ? ||'%'  ";
				 
			 }   
			
			//1-2  가격 검색하는 경우
			 
			 String searchPrice1 = paraMap.get("searchPrice1");
			 String searchPrice2 = paraMap.get("searchPrice2");
			 
			// System.out.println("DAO searchPrice2 :" + searchPrice2);
			// System.out.println("DAO searchPrice1 :" + searchPrice1);
			 
			 int searchPriceStart=0;
			 int searchPriceEnd =5000000;
			 
			 if(searchPrice1 !=null  && !searchPrice1.trim().isEmpty() ) {
				 
					searchPriceStart = Integer.parseInt(searchPrice1);
					
				 }
				  
				 
				  
			  if(searchPrice2 !=null  && !searchPrice2.trim().isEmpty() ) {
				  
				  searchPriceEnd = Integer.parseInt(searchPrice2);
			  }

			 sql += " and prod_price between ? and ?  ";
			 
			  
			// System.out.println("DAO searchPriceStart 확인용 :" + searchPriceStart);
			 
			 
			 // 1-3 색상 검색하는 경우
			 
			String green =  paraMap.get("greenColor");
			String yellow =  paraMap.get("yellowColor");
			String purple =  paraMap.get("purpleColor");
			String skyblue =  paraMap.get("skyblueColor");
			String red=  paraMap.get("redColor");
			String black =  paraMap.get("blackColor");
			String brown =  paraMap.get("brownColor");
			String silver = paraMap.get("silverColor");
			String orange =  paraMap.get("orangeColor");
			String pink =  paraMap.get("pinkColor");
			String aquamarine =  paraMap.get("AquamarineColor");
			
			/*
			 * List<String> colorList = new ArrayList<String>();
			 * 
			 * colorList.add(aquamarine); colorList.add(black); colorList.add(brown);
			 * colorList.add(green); colorList.add(orange); colorList.add(pink);
			 * colorList.add(purple); colorList.add(red); colorList.add(silver);
			 * colorList.add(skyblue); colorList.add(yellow);
			 */
		
			String checkword ="나나";
			
			/*
			 * if ( green.equals(checkword) && yellow.equals(checkword ) &&
			 * purple.equals(checkword )&& skyblue.equals(checkword ) &&
			 * red.equals(checkword ) && black.equals(checkword ) && silver.equals(checkword
			 * ) && brown.equals(checkword )&& orange.equals(checkword )&&
			 * pink.equals(checkword )&& aquamarine.equals(checkword ) ) {
			 * 
			 * green = "green"; yellow = "yellow"; purple = "purple"; skyblue = "skyblue";
			 * red= "red"; black = "black"; silver = "silver"; brown = "brown"; orange =
			 * "orange"; pink = "pink"; aquamarine ="aquamarine";
			 * 
			 * }
			 */
			 

			 if ( green==checkword && yellow==checkword && purple==checkword && skyblue==checkword  &&
			 red==checkword  && black==checkword  && silver==checkword && brown==checkword && orange==checkword &&
			 pink== checkword && aquamarine==checkword ) {
			 
			 green = "green"; yellow = "yellow"; purple = "purple"; skyblue = "skyblue";
			 red= "red"; black = "black"; silver = "silver"; brown = "brown"; orange =
			 "orange"; pink = "pink"; aquamarine ="aquamarine";
			 
			 }
			 
			// System.out.println("searchColor DAO 확인용 :"
			 //			+ " " +green +"\n" +yellow +"\n" + red +"\n" + black + yellow+ "brown :" +brown+ silver + orange + pink);
				
				
			 
			 
			//하나라도 null값 있으면
		
			
			/*
			 * for(int i=0; i<colorList.size(); i++) {
			 * 
			 * String colorCheck = colorList.get(i);
			 * 
			 * if ( colorCheck == null ) {
			 * 
			 * colorCheck = "100"; }
			 * ddks
			 * System.out.println(colorCheck); }
			 * 
			 * System.out.println("green :" +green +" red :" +red);
			 */
			
			 
			 // 1-4 사이즈 검색하는 경우
			 
			 String s220 =  paraMap.get("Size220");
			 String s225 =  paraMap.get("Size225");
			 String s230 =  paraMap.get("Size230");
			 String s235 =  paraMap.get("Size235");
			 String s240 =  paraMap.get("Size240");
			 String s245 =  paraMap.get("Size245");
			 String s250 =  paraMap.get("Size250");
			 String s255 = paraMap.get("Size255");
			 
			 if (s220 == checkword && s225 == checkword && s230 ==checkword && s235 == checkword &&  s240==checkword
					 && s245 == checkword && s250 == checkword && s255 == checkword ) {
				 
				 s220 = "220"; s225 = "20"; s225 = "220"; s230 = "230"; s235 = "235"; s240 = "240"; s245 = "245"; s250 = "250"; s255 = "255";
				 
			 }
			 
			// System.out.println("SIZE DAO 확인용 :"
			//		 			+ s220 +"\n"+ s225 +"\n" +s230 +"\n" + s235 +"\n");
			
					 			
			//1-5 select option 선택시
			 
			 String selectItem = paraMap.get("selectItem");
			 
			 
			 if (selectItem.equals("popularityitem")) {
				 
				 selectItem = "나";
			 }
					 			
			//////// 여기할 차례
			 
			sql += " and (  prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " +
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " +  
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
					 " or prod_color like '%'|| ? ||'%'  ) " ;
			
			//사이즈 sql
			
			sql += " and (  prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " +
					 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " +  
					 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " + 
					 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' ) " ;
				
	
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
			
			
			// 위치홀더 넣어주기 
			
			if( searchWord != null && !searchWord.trim().isEmpty() ) {
				
				pstmt.setString(1, searchWord);
				
				pstmt.setInt(2,  searchPriceStart);
				pstmt.setInt(3,  searchPriceEnd);
				
				pstmt.setString(4, green);  //시작
				pstmt.setString(5, yellow);
				pstmt.setString(6, aquamarine);
				pstmt.setString(7, black);
				pstmt.setString(8, orange);
				pstmt.setString(9, pink);
				pstmt.setString(10, purple);
				pstmt.setString(11, red);
				pstmt.setString(12, skyblue);
				pstmt.setString(13, silver);
				pstmt.setString(14, brown);
				
				pstmt.setString(15, s220);  //사이즈 시작
				pstmt.setString(16, s225);
				pstmt.setString(17, s230);
				pstmt.setString(18, s235);
				pstmt.setString(19, s240);
				pstmt.setString(20, s245);
				pstmt.setString(21, s250);
				pstmt.setString(22, s255);				
				
				
				pstmt.setInt(23, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
				pstmt.setInt(24, (currentShowPageNo*sizePerPage) ); // 공식
			 }
			 else {
				pstmt.setInt(1,  searchPriceStart);
				pstmt.setInt(2,  searchPriceEnd);
				
				pstmt.setString(3, green);  //시작
				pstmt.setString(4, yellow);
				pstmt.setString(5, aquamarine);
				pstmt.setString(6, black);
				pstmt.setString(7, orange);
				pstmt.setString(8, pink);
				pstmt.setString(9, purple);
				pstmt.setString(10, red);
				pstmt.setString(11, skyblue);
				pstmt.setString(12, silver);
				pstmt.setString(13, brown);
				
				pstmt.setString(14, s220);  //사이즈 시작
				pstmt.setString(15, s225);
				pstmt.setString(16, s230);
				pstmt.setString(17, s235);
				pstmt.setString(18, s240);
				pstmt.setString(19, s245);
				pstmt.setString(20, s250);
				pstmt.setString(21, s255);		
				
				
				pstmt.setInt(22, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
				pstmt.setInt(23, (currentShowPageNo*sizePerPage) ); // 공식
			 }

			
			

			
			
				 
			// SQL select 실행 및 데이터 가져오기 
			
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

	
	
	

	
}