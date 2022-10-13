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
	public List<ProductVO> selectBestProduct(Map<String, String> paraMap) throws SQLException {
		
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
					 " where ( prod_kind= ? or prod_kind= ? or prod_kind= ? ) \n" +
					 " order by ? ";

		
			 
				pstmt = conn.prepareStatement(sql);
				
				//System.out.println("searchPriceStart :" +searchPriceStart);
				//System.out.println("searchPriceEnd :" +searchPriceEnd);
				
			   String productType_1 = paraMap.get("productType_1"); 
				
			   String productType_2 = paraMap.get("productType_2");
			   
			   String productType_3 = paraMap.get("productType_3");
			   
			//   System.out.println("productType_1"+productType_1);
			   
			   String BestNewSale = paraMap.get("Best");
			   
			   if (BestNewSale.equals("Best") ) {
				   
				   BestNewSale = "prod_order_count desc";
			   }
			   
			   if (BestNewSale.equals("New") ) {
				   
				   BestNewSale = "prod_registerday desc";
			   }
			   
			   
			  // System.out.println("BestNewSale:"+BestNewSale);
			 
				pstmt.setString(1, productType_1);
				pstmt.setString(2, productType_2);
				pstmt.setString(3, productType_3);
				pstmt.setString(4, BestNewSale);
				
				
					
					 
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
			
			String sql = "select prod_code, prod_name, prod_kind, prod_image, prod_high, prod_color,prod_price, prod_saleprice, prod_size, prod_registerday, prod_review_count, prod_order_count, RNO2\n"+
					"from \n"+
					"(\n"+
					"select rownum AS RNO2,\n"+
					"       prod_code, prod_name, prod_kind, prod_image, prod_high, prod_color,prod_price, prod_saleprice, prod_size, prod_registerday, prod_review_count, prod_order_count\n"+
					"from \n"+
					"(\n"+
					"    select PO.prod_code, PO.prod_name, PO.prod_kind, PO.prod_image, PO.prod_high, CS.prod_color, PO.prod_price, PO.prod_saleprice, CS.prod_size, PO.prod_registerday, nvl(prod_review_count,0) as prod_review_count ,nvl(prod_order_count,0) as prod_order_count\n"+
					"    from tbl_product PO\n"+
					"    left join\n"+
					"    (\n"+
					"        select fk_prod_code, count(*) as prod_order_count  \n"+
					"        from tbl_order_detail\n"+
					"        group by fk_prod_code \n"+
					"    ) OD\n"+
					"    on PO.prod_code = OD.fk_prod_code\n"+
					"    left join\n"+
					"    (\n"+
					"       V_COLOR \n"+
					"    ) CS\n"+
					"    on PO.prod_code = CS.prod_code\n"+
					"    left join\n"+
					"    (\n"+
					"        select fk_prod_code, count(*) as prod_review_count\n"+
					"        from tbl_review\n"+
					"        group by fk_prod_code\n"+
					"    )R\n"+
					"    on PO.prod_code = r.fk_prod_code\n"+
					"	where ( prod_kind = ? or prod_kind= ? or prod_kind = ? )"
					+ "  and (prod_high = ? or prod_high= ? or prod_high= ? )\n" ;
					
				
			
					 
					
					
 
			
			// 1-1 검색어를 입력하여 검색하는 경우
			
			 String searchWord = paraMap.get("searchWord");
			 
			 if(searchWord !=null  && !searchWord.trim().isEmpty() ) {
				 
				 sql += " and prod_name like '%'|| ? ||'%' " ;
				       
				
			 }   
			
			//System.out.println("searchWord" +searchWord);
			
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

			 sql += " and prod_price between ? and ?\n" ;
			
			 
			  
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
			 
		//	 System.out.println("searchColor DAO 확인용 :"
		//	 			+ " " +green +"\n" +yellow +"\n" + red +"\n" + black + yellow+ "brown :" +brown+ silver + orange + pink);
				
				
			 sql += " and (  prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " +
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " +  
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
					 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
					 " or prod_color like '%'|| ? ||'%'  )\n" ;
			
			 
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
			 
			
			 
			 
			 if (selectItem!=null && selectItem.equals("popularityitem")) {
				 
				  selectItem = "prod_order_count desc"; }
				  
				
			 else if (selectItem!=null && selectItem.equals("newItem")) {
			 
			  selectItem = "prod_registerday desc"; }
			  
			  else if (selectItem!=null && selectItem.equals("lowPriceItem")) {
					 
				  selectItem = "prod_price asc"; }
			  
			  else if (selectItem!=null && selectItem.equals("highPriceItehm")) {
					 
				  selectItem = "prod_price desc"; }
			 
			 
			 
			 
			  
				/*
				 * else { discountItem }
				 */
			 
					 			
		// System.out.println("dao 최종확인 selectitem : " +selectItem);
			 
			
			//사이즈 sql
			
			sql += " and ( prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " +
					 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " +  
					 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " + 
					 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' )\n"+
					 " ORDER BY " +selectItem+ "\n" +
					 			
	
			// === 페이징처리의 공식 ===
			 // where RNO between (조회하고자하는페이지번호 * 한페이지당보여줄행의개수) - (한페이지당보여줄행의개수 - 1) and (조회하고자하는페이지번호 * 한페이지당보여줄행의개수); 
			
					") V\n"+
					") T \n"+
					"where T.RNO2 between ? and ? ";
					
		
			 int currentShowPageNo = Integer.parseInt(paraMap.get("currentShowPageNo"));
			 int sizePerPage = Integer.parseInt(paraMap.get("sizePerPage"));
			 
			 
			
			 
			 //String tem = "bloafer";
				//String tem2 = "'2', '3.5'";
			 
			pstmt = conn.prepareStatement(sql);
			
			//System.out.println("searchPriceStart :" +searchPriceStart);
			//System.out.println("searchPriceEnd :" +searchPriceEnd);
			
			//종류,굽높이
			String productType_1 = paraMap.get("productType_1");
		    String productType_2 = paraMap.get("productType_2");
		    String productType_3 = paraMap.get("productType_3");
		    
		    String productHigh_1 = paraMap.get("productHigh_1");
		    String productHigh_2 = paraMap.get("productHigh_2");
		    String productHigh_3 = paraMap.get("productHigh_3");
		    
		    //System.out.println("productHigh_1 : " +productHigh_1);
		   
		   
			// 위치홀더 넣어주기 
		   if( searchWord != null && !searchWord.trim().isEmpty() ) {
				
				pstmt.setString(1, productType_1);
				pstmt.setString(2, productType_2);
				pstmt.setString(3, productType_3);
				
				pstmt.setString(4, productHigh_1);
				pstmt.setString(5, productHigh_2);
				pstmt.setString(6, productHigh_3);

				
				pstmt.setString(7, searchWord);
				
				pstmt.setInt(8,  searchPriceStart);
				pstmt.setInt(9,  searchPriceEnd);
				
				pstmt.setString(10, green);  //시작
				pstmt.setString(11, yellow);
				pstmt.setString(12, aquamarine);
				pstmt.setString(13, black);
				pstmt.setString(14, orange);
				pstmt.setString(15, pink);
				pstmt.setString(16, purple);
				pstmt.setString(17, red);
				pstmt.setString(18, skyblue);
				pstmt.setString(19, silver);
				pstmt.setString(20, brown);
				
				pstmt.setString(21, s220);  //사이즈 시작
				pstmt.setString(22, s225);
				pstmt.setString(23, s230);
				pstmt.setString(24, s235);
				pstmt.setString(25, s240);
				pstmt.setString(26, s245);
				pstmt.setString(27, s250);
				pstmt.setString(28, s255);				
				
				
				pstmt.setInt(29, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
				pstmt.setInt(30, (currentShowPageNo*sizePerPage) ); // 공식
				
				
			 }
			 else {
				pstmt.setString(1, productType_1);
				pstmt.setString(2, productType_2);
				pstmt.setString(3, productType_3);
				
				pstmt.setString(4, productHigh_1);
				pstmt.setString(5, productHigh_2);
				pstmt.setString(6, productHigh_3);

				
				
				pstmt.setInt(7,  searchPriceStart);
				pstmt.setInt(8,  searchPriceEnd);
				
				pstmt.setString(9, green);  //시작
				pstmt.setString(10, yellow);
				pstmt.setString(11, aquamarine);
				pstmt.setString(12, black);
				pstmt.setString(13, orange);
				pstmt.setString(14, pink);
				pstmt.setString(15, purple);
				pstmt.setString(16, red);
				pstmt.setString(17, skyblue);
				pstmt.setString(18, silver);
				pstmt.setString(19, brown);
				
				pstmt.setString(20, s220);  //사이즈 시작
				pstmt.setString(21, s225);
				pstmt.setString(22, s230);
				pstmt.setString(23, s235);
				pstmt.setString(24, s240);
				pstmt.setString(25, s245);
				pstmt.setString(26, s250);
				pstmt.setString(27, s255);				
				
				
				pstmt.setInt(28, (currentShowPageNo*sizePerPage) - (sizePerPage - 1) ); // 공식 
				pstmt.setInt(29, (currentShowPageNo*sizePerPage) ); // 공식
		
			 }

			
			

			
			
				 
			// SQL select 실행 및 데이터 가져오기 
			
			rs = pstmt.executeQuery();
			
		//System.out.println(sql);
			
			while(rs.next() ) {
				
				
				ProductVO pvo = new ProductVO();
				pvo.setProd_code(rs.getString(1));
				pvo.setProd_name(rs.getString(2));
				pvo.setProd_kind(rs.getString(3));
				pvo.setProd_image(rs.getString(4));
				pvo.setProd_high(rs.getString(5));
				pvo.setProd_color(rs.getString(6));
				pvo.setProd_price(rs.getInt(7));
				pvo.setProd_saleprice(rs.getInt(8));
				pvo.setProd_size(rs.getString(9));				
				pvo.setProd_registerday(rs.getString(10));
				pvo.setProd_review_count(rs.getInt(11));
				
			
				productList.add(pvo);
			
			//	System.out.println(pvo.getProd_color());
				
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
					
					String sql = "select ceil(count(*)/20)\n"+
							"from tbl_product PO\n"+
							"left join\n"+
							"(\n"+
							"    select fk_prod_code, count(*) as prod_order_count  \n"+
							"    from tbl_order_detail\n"+
							"    group by fk_prod_code \n"+
							") OD\n"+
							"on PO.prod_code = OD.fk_prod_code\n"+
							"left join\n"+
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
							") CS\n"+
							"on PO.prod_code = CS.prod_code\n"+
							"left join\n"+
							"(\n"+
							"    select fk_prod_code, count(*) as prod_review_count\n"+
							"    from tbl_review\n"+
							"    group by fk_prod_code\n"+
							")R\n"+
							"on PO.prod_code = r.fk_prod_code\n"+
							"	where ( prod_kind = ? or prod_kind= ? or prod_kind = ? )"
							+ "  and (prod_high = ? or prod_high= ? or prod_high= ? )\n" ;
							
							
				
					// 1-1 검색어를 입력하여 검색하는 경우
					
					 String searchWord = paraMap.get("searchWord");
					 
					 if(searchWord !=null  && !searchWord.trim().isEmpty() ) {
						 
						 sql += "and prod_name like '%'|| ? ||'%' ";
						
					 }   
					 
					//System.out.println("searchWord" +searchWord);
					
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

					 sql += " and prod_price between ? and ?\n";
					
					 
					  
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
					
					
				
					String checkword ="나나";
					
					 

					 if ( green==checkword && yellow==checkword && purple==checkword && skyblue==checkword  &&
					 red==checkword  && black==checkword  && silver==checkword && brown==checkword && orange==checkword &&
					 pink== checkword && aquamarine==checkword ) {
					 
					 green = "green"; yellow = "yellow"; purple = "purple"; skyblue = "skyblue";
					 red= "red"; black = "black"; silver = "silver"; brown = "brown"; orange =
					 "orange"; pink = "pink"; aquamarine ="aquamarine";
					 
					 }
					 
				//	 System.out.println("searchColor DAO 확인용 :"
				//	 			+ " " +green +"\n" +yellow +"\n" + red +"\n" + black + yellow+ "brown :" +brown+ silver + orange + pink);
						
						
					 sql += " and (  prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " +
							 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " +  
							 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
							 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
							 " or prod_color like '%'|| ? ||'%' or prod_color like '%'|| ? ||'%' " + 
							 " or prod_color like '%'|| ? ||'%'  )\n" ;

					
					 
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
					 
					 
					 if (selectItem!=null && selectItem.equals("popularityitem")) {
						 
						  selectItem = "prod_order_count desc"; }
						  
						
					 else if (selectItem!=null && selectItem.equals("newItem")) {
					 
					  selectItem = "prod_registerday desc"; }
					  
					  else if (selectItem!=null && selectItem.equals("lowPriceItem")) {
							 
						  selectItem = "prod_price asc"; }
					  
					  else if (selectItem!=null && selectItem.equals("highPriceItehm")) {
							 
						  selectItem = "prod_price desc"; }
					 
					 
					  
						/*
						 * else { discountItem }
						 */
					 
							 			
				// System.out.println("dao 최종확인 : " +selectItem);
					 
					
					//사이즈 sql
					
					sql += " and ( prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " +
							 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " +  
							 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' " + 
							 " or prod_size like '%'|| ? ||'%' or prod_size like '%'|| ? ||'%' )\n"+
							 " ORDER BY " +selectItem+ "\n" ;
			
					pstmt = conn.prepareStatement(sql);
					
					//위치홀더 넣어주기
					
					
					
					String productType_1 = paraMap.get("productType_1");
				    String productType_2 = paraMap.get("productType_2");
				    String productType_3 = paraMap.get("productType_3");
				    
				    String productHigh_1 = paraMap.get("productHigh_1");
				    String productHigh_2 = paraMap.get("productHigh_2");
				    String productHigh_3 = paraMap.get("productHigh_3");
				//	   System.out.println("productType_2 :" +productType_2 );
						// 위치홀더 넣어주기 
						
					   if( searchWord != null && !searchWord.trim().isEmpty() ) {
							
						   pstmt.setString(1, productType_1);
							pstmt.setString(2, productType_2);
							pstmt.setString(3, productType_3);
							
							pstmt.setString(4, productHigh_1);
							pstmt.setString(5, productHigh_2);
							pstmt.setString(6, productHigh_3);

							
							pstmt.setString(7, searchWord);
							
							pstmt.setInt(8,  searchPriceStart);
							pstmt.setInt(9,  searchPriceEnd);
							
							pstmt.setString(10, green);  //시작
							pstmt.setString(11, yellow);
							pstmt.setString(12, aquamarine);
							pstmt.setString(13, black);
							pstmt.setString(14, orange);
							pstmt.setString(15, pink);
							pstmt.setString(16, purple);
							pstmt.setString(17, red);
							pstmt.setString(18, skyblue);
							pstmt.setString(19, silver);
							pstmt.setString(20, brown);
							
							pstmt.setString(21, s220);  //사이즈 시작
							pstmt.setString(22, s225);
							pstmt.setString(23, s230);
							pstmt.setString(24, s235);
							pstmt.setString(25, s240);
							pstmt.setString(26, s245);
							pstmt.setString(27, s250);
							pstmt.setString(28, s255);				
									
							
							
							
						 }
						 else {
						
							 pstmt.setString(1, productType_1);
								pstmt.setString(2, productType_2);
								pstmt.setString(3, productType_3);
								
								pstmt.setString(4, productHigh_1);
								pstmt.setString(5, productHigh_2);
								pstmt.setString(6, productHigh_3);

								
								
								pstmt.setInt(7,  searchPriceStart);
								pstmt.setInt(8,  searchPriceEnd);
								
								pstmt.setString(9, green);  //시작
								pstmt.setString(10, yellow);
								pstmt.setString(11, aquamarine);
								pstmt.setString(12, black);
								pstmt.setString(13, orange);
								pstmt.setString(14, pink);
								pstmt.setString(15, purple);
								pstmt.setString(16, red);
								pstmt.setString(17, skyblue);
								pstmt.setString(18, silver);
								pstmt.setString(19, brown);
								
								pstmt.setString(20, s220);  //사이즈 시작
								pstmt.setString(21, s225);
								pstmt.setString(22, s230);
								pstmt.setString(23, s235);
								pstmt.setString(24, s240);
								pstmt.setString(25, s245);
								pstmt.setString(26, s250);
								pstmt.setString(27, s255);			
							
						
						 }


						
					
					rs = pstmt.executeQuery(); //if next필요없다 count는 결과 없어도 0이 나오니까
					
					rs.next();
					
					totalPage = rs.getInt(1);
					
				//	System.out.println("totalpage dao용:" +totalPage);
					
					
				}finally {
					close();
				}
				
				// System.out.println("dao 결과값 " + totalPage);
				
							
				return totalPage;
				
			
			
			}
			
	//장바구니 목록 불러오기		
	@Override
	public List<cartVO> selectCartList(Map<String, String> paraMap) throws SQLException    {
		
		List<cartVO> cartList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select prod_image, prod_name, prod_price, prod_point, prod_saleprice, Qnty, fk_userid, cart_code, fk_prod_code,  fk_prod_color, fk_prod_size, prod_code \n"+
					"from tbl_product\n"+
					"join tbl_cart\n"+
					"on prod_code = fk_prod_code\n"+
					"where fk_userid = ? ";
						


			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("userid"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO pvo = new ProductVO();
				
				String prod_image = rs.getString("prod_image");
				String prod_name = rs.getString("prod_name");
				int prod_price = rs.getInt("prod_price");
				int prod_point = rs.getInt("prod_point");
				int prod_saleprice = rs.getInt("prod_saleprice");
				int qnty = rs.getInt("qnty");
				String fk_userid = rs.getString("fk_userid");
				String cart_code = rs.getString("cart_code");
				String fk_prod_code = rs.getString("fk_prod_code");
				String fk_prod_color = rs.getString("fk_prod_color");
				String fk_prod_size = rs.getString("fk_prod_size");
				String prod_code = rs.getString("prod_code");

				
				
				pvo.setProd_image(prod_image);
				pvo.setProd_name(prod_name);
				pvo.setProd_price(prod_price);
				pvo.setProd_point(prod_point);
				pvo.setProd_saleprice(prod_saleprice);
				pvo.setProd_code(prod_code);
				
				pvo.setTotalPriceTotalPoint(qnty); 
				
				cartVO cvo = new cartVO();
				cvo.setCart_code(cart_code);
				cvo.setFk_userid(fk_userid);
				cvo.setFk_prod_code(fk_prod_code);
				cvo.setQnty(qnty);
				cvo.setFk_prod_color(fk_prod_color);
				cvo.setFk_prod_size(fk_prod_size);
				cvo.setProd(pvo);	
				
				cartList.add(cvo);
				
				
				
			} // end of while

		} finally {
			close();
		}

		return cartList;
		
	
	
	}

	@Override
	public int updateCart(String cartno, int qnty) throws SQLException {
		int n = 0;
	      
	      try {
	         
	         conn = ds.getConnection();
	         
	         String sql = " update tbl_cart set qnty = ? "
	                  + " where cart_code = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, qnty);
	         pstmt.setString(2, cartno);
	         
	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return n;
	}

	@Override
	public int delCart(String cartno) throws SQLException {
		
		int n = 0;
	      
	      try {
	         
	         conn = ds.getConnection();
	         
	         String sql = " delete from tbl_cart "
	                  + " where cart_code = ? ";
	         
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, cartno);
	         
	         n = pstmt.executeUpdate();
	         
	      } finally {
	         close();
	      }
	      
	      return n;
	}

	@Override
	public Map<String, String> selectCartSumPrice(String userid) throws SQLException {
		
		HashMap<String, String> sumMap = new HashMap<>();
		
		try {
			conn = ds.getConnection();
			
			String sql = "select nvl( sum(B.prod_saleprice *  A.qnty), 0) AS SUMTOTALPRICE \n"+
						"from tbl_cart A join tbl_product B \n"+
						"on A.fk_prod_code = B.prod_code \n"+
						"where A.fk_userid = ? ";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			
			rs = pstmt.executeQuery();
			rs.next();
			
			sumMap.put("SUMTOTALPRICE", rs.getString("SUMTOTALPRICE") );
			
		} finally {
			close();
		}
		
		return sumMap;
	}

	//장바구니 모달 목록 가져오기
	@Override
	public List<cartVO> selectCartListOne(Map<String, String> paraMap)throws SQLException {
		
		List<cartVO> cartList = new ArrayList<>();

		try {
			conn = ds.getConnection();

			String sql = "select prod_image, prod_name, prod_price, prod_point, prod_saleprice, Qnty, fk_userid, fk_prod_code,  fk_prod_color, fk_prod_size\n"+
					"from tbl_product \n"+
					"join tbl_cart \n"+
					"on prod_code = fk_prod_code\n"+
					"where cart_code = ? ";

			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, paraMap.get("cart_code"));

			rs = pstmt.executeQuery();

			while (rs.next()) {
				ProductVO pvo = new ProductVO();
				
				String prod_image = rs.getString("prod_image");
				String prod_name = rs.getString("prod_name");
				int prod_price = rs.getInt("prod_price");
				int prod_point = rs.getInt("prod_point");
				int prod_saleprice = rs.getInt("prod_saleprice");
				int qnty = rs.getInt("qnty");
				String fk_userid = rs.getString("fk_userid");
				String fk_prod_code = rs.getString("fk_prod_code");
				String fk_prod_color = rs.getString("fk_prod_color");
				String fk_prod_size = rs.getString("fk_prod_size");
			

				pvo.setProd_image(prod_image);
				pvo.setProd_name(prod_name);
				pvo.setProd_price(prod_price);
				pvo.setProd_point(prod_point);
				pvo.setProd_saleprice(prod_saleprice);
				
				pvo.setTotalPriceTotalPoint(qnty); 
				
				cartVO cvo = new cartVO();
				cvo.setFk_userid(fk_userid);
				cvo.setFk_prod_code(fk_prod_code);
				cvo.setQnty(qnty);
				cvo.setFk_prod_color(fk_prod_color);
				cvo.setFk_prod_size(fk_prod_size);
				cvo.setProd(pvo);	
				
				cartList.add(cvo);
				
				
				
			} // end of while

		} finally {
			close();
		}

		return cartList;
		
	}

	//장바구니 글 작성하기
	@Override
	public int updateNotice(String subject, String board_content ,String userid) throws SQLException {
		
		int result = 0;
		
		try {
			conn = ds.getConnection();
		
		String sql = " insert into tbl_notice( NOTICE_CODE ,fk_userid, NOTICE_SUBJECT , NOTICE_CONTENTS , NOTICE_COUNT , NOTICE_REGISTERDAY ) "
				+ " values(seq_notice_code.nextval, ?, ?, ?, 0, sysdate) ";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, userid);
			pstmt.setString(2, subject);
			pstmt.setString(3, board_content);
			
			result = pstmt.executeUpdate();
		
			
		} finally {
			close();
		}
		
		return result;		
	
	}


	

	
	

	
}