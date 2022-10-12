package jihee.product.controller;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import common.controller.AbstractController;
import jihee.product.model.*;




public class ProductHp extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		InterProductDAO pdao = new ProductDAO();
		
		
		// 1. BEST 상품 가져오기
		Map<String, String> paraMap = new HashMap<>();
		
		//1-1 종류 넘겨주기
		
				String productType_1 = "pumps";
				paraMap.put("productType_1", productType_1);
				
				String productType_2 = "slingback";
				paraMap.put("productType_2", productType_2);
				
				String productType_3 = "나나";
				paraMap.put("productType_3", productType_3);
				
				
				String productHigh_1 ="7";
				
				paraMap.put("productHigh_1", productHigh_1);
				
				String productHigh_2 ="5";
				
				paraMap.put("productHigh_2", productHigh_2);
				
				String productHigh_3 ="6.5";
				
				paraMap.put("productHigh_3", productHigh_3);
				
				String productBest = "Best";
				paraMap.put("Best", productBest);
				
				
		//할인율
		List<ProductVO> bestProductList = pdao.selectBestProduct(paraMap);
		
		
		/*
		 * for(ProductVO pvo : bestProductList) {
		 * 
		 * 
		 * pvo.getDiscountPercent();
		 * 
		 * System.out.println(pvo.getDiscountPercent());
		 * 
		 * }// end of for----------------------------
		 */		 
			
		
		request.setAttribute("bestProductList", bestProductList);
		
		
		
		
		
		////////////////////////////////////
		
		
		/*
		
		if( productList.size() > 0) {
			for(ProductVO pvo : productList) { 
				System.out.println( pvo.getProd_color() + "  " + pvo.getProd_code());
			}
		}
		*/
		
		
	
		
		
		
		
		
		//--------------------------------------------------------------------
		
	
		
		
		//2-1 검색어 넘겨주기
		
		String searchWord = request.getParameter("searchWord");
		
		// System.out.println("searchWord 확인용 : " +searchWord);
		
		
		
		paraMap.put("searchWord", searchWord);
		
	   // 2-2 검색(가격)넘겨주기 ////////////////////////////////////////////////
		
		String searchPrice1 = request.getParameter("searchPrice1");
		String searchPrice2 = request.getParameter("searchPrice2");
		
		/*
		 * if(searchPrice1 == null && searchPrice2==null ) {
		 * 
		 * searchPrice1 = "0"; searchPrice2 = "5000000"; }
		 */
		
		// 숫자만 입력가능하게 유효성 검사
		
		boolean is_digit_p1 = true;
		if( searchPrice1 !=null  && !searchPrice1.trim().isEmpty() ) {
			
			
	        for(int i=0; i<searchPrice1.length(); i++) { 
	                char ch = searchPrice1.charAt(i); 
	                if ( !Character.isDigit(ch)) {// 입력받은게 숫자입니까 -> !쓰면 반대로 입력받은게 숫자가 아닙니까?  digit맞는지 확인좀 Define이라 되어있었음
	                	is_digit_p1 = false; 
	                    break; 
	                    //return false;              //!false = !Character.isDefined(ch) = break;?
	                    
	                }
	                
	         }//end of for--------------------
		}
		
		boolean is_digit_p2 = true;
		if( searchPrice2 !=null  && !searchPrice2.trim().isEmpty() ) {
			
			
	        for(int i=0; i<searchPrice2.length(); i++) { 
	                char ch = searchPrice2.charAt(i); 
	                if ( !Character.isDigit(ch)) {// 입력받은게 숫자입니까 -> !쓰면 반대로 입력받은게 숫자가 아닙니까?  digit맞는지 확인좀 Define이라 되어있었음
	                	is_digit_p2 = false; 
	                    break; 
	                    //return false;              //!false = !Character.isDefined(ch) = break;?
	                    
	                }
	                
	         }//end of for--------------------
		}
		
        
       
        if ( is_digit_p1 != true) {
        	searchPrice1 = "";

        }
        
        if ( is_digit_p2 != true) {
        	searchPrice2 = "";

        }
        
        
        
        //System.out.println("searchPrice1 : " +searchPrice1);
       //System.out.println("JAVAsearchPrice2 : " +searchPrice2);
            
		paraMap.put("searchPrice1", searchPrice1);
		paraMap.put("searchPrice2", searchPrice2);
		
		request.setAttribute("searchPrice1", searchPrice1);
		request.setAttribute("searchPrice2", searchPrice2);
		
		
		// 2-3 색상 넘겨주기///////////////////////////////////
		request.getParameter("");
		
		String greenColor = request.getParameter("greenColor");
		String yellowColor = request.getParameter("yellowColor");
		String purpleColor = request.getParameter("purpleColor");
		String skyblueColor = request.getParameter("skyblueColor");
		String redColor = request.getParameter("redColor");
		String blackColor = request.getParameter("blackColor");
		String brownColor = request.getParameter("brownColor");
		String silverColor = request.getParameter("silverColor");
		String orangeColor = request.getParameter("orangeColor");
		String pinkColor = request.getParameter("pinkColor");
		String AquamarineColor = request.getParameter("AquamarineColor");	
		
		
		
		
		// System.out.println("확인용 controllor :" +redColor);
		
		String checkword="나나";
		//null값으로 들어오면 100 넣어주기
		
		if(greenColor == null ) {
			
			greenColor=checkword;
		}
		if(yellowColor == null ) {
					
			yellowColor=checkword;
				}
		if(purpleColor == null ) {
			
			purpleColor=checkword;
		}
		if(skyblueColor == null ) {
			
			skyblueColor=checkword;
		}
		if(redColor == null ) {
			
			redColor=checkword;
		}
		if(blackColor == null ) {
			
			blackColor=checkword;
		}
		
		if(brownColor == null ) {
			
			brownColor=checkword;
		}
		
		if(silverColor == null ) {
			
			silverColor=checkword;
		}
		if(orangeColor == null ) {
			
			orangeColor=checkword;
		}
		if(pinkColor == null ) {
			
			pinkColor=checkword;
		}
		if(AquamarineColor == null ) {
			
			AquamarineColor=checkword;
		}

		
		paraMap.put("greenColor",greenColor );
		paraMap.put("yellowColor",yellowColor);
		paraMap.put("purpleColor",purpleColor);
		paraMap.put("skyblueColor",skyblueColor);
		paraMap.put("redColor",redColor);
		paraMap.put("blackColor",blackColor);
		paraMap.put("brownColor",brownColor);
		paraMap.put("silverColor",silverColor );
		paraMap.put("orangeColor",orangeColor);
		paraMap.put("pinkColor",pinkColor);
		paraMap.put("AquamarineColor",AquamarineColor);	
		
		
		
		// System.out.println("searchColor 확인용 : " +greenColor +"\n" +yellowColor +"\n" + redColor +"\n" + blackColor);
		
		request.setAttribute("greenColor", greenColor);
		request.setAttribute("yellowColor", yellowColor);
		request.setAttribute("purpleColor", purpleColor);
		request.setAttribute("skyblueColor", skyblueColor);
		request.setAttribute("redColor", redColor);
		request.setAttribute("blackColor", blackColor);
		request.setAttribute("brownColor", brownColor);
		request.setAttribute("silverColor", silverColor);
		request.setAttribute("orangeColor", orangeColor);
		request.setAttribute("pinkColor", pinkColor);
		request.setAttribute("AquamarineColor", AquamarineColor);
		
		
		
		
		// 2-4 사이즈 넘겨주기 //////////////////////////////
		
		String Size220 = request.getParameter("Size220");
		String Size225 = request.getParameter("Size225");
		String Size230 = request.getParameter("Size230");
		String Size235 = request.getParameter("Size235");
		String Size240 = request.getParameter("Size240");
		String Size245 = request.getParameter("Size245");
		String Size250 = request.getParameter("Size250");
		String Size255 = request.getParameter("Size255");
		
		
		//null값으로 들어오면 100 넣어주기
		
				if(Size220 == null ) {
					
					Size220 =checkword;
				}
				if(Size225 == null ) {
							
					Size225=checkword;
						}
				if(Size230 == null ) {
					
					Size230=checkword;
				}
				if(Size235 == null ) {
					
					Size235=checkword;
				}
				if(Size240 == null ) {
					
					Size240=checkword;
				}
				if(Size245 == null ) {
					
					Size245=checkword;
				}
				
				if(Size250 == null ) {
					
					Size250=checkword;
				}
				
				if(Size255 == null ) {
					
					Size255=checkword;
				}
			
		paraMap.put("Size220",Size220 );
		paraMap.put("Size225",Size225);
		paraMap.put("Size230",Size230);
		paraMap.put("Size235",Size235);
		paraMap.put("Size240",Size240);
		paraMap.put("Size245",Size245);
		paraMap.put("Size250",Size250);
		paraMap.put("Size255",Size255);
		
		request.setAttribute("Size220", Size220);
		request.setAttribute("Size225", Size225);
		request.setAttribute("Size230", Size230);
		request.setAttribute("Size235", Size235);
		request.setAttribute("Size240", Size240);
		request.setAttribute("Size245", Size245);
		request.setAttribute("Size250", Size250);
		request.setAttribute("Size255", Size255);
	
		//2-4 select option 가져오기
		
		String selectItem = request.getParameter("selectItem");
		
		
		if (selectItem == null) {
			selectItem = "popularityitem";
		}
		
		paraMap.put("selectItem", selectItem);
		
		request.setAttribute("selectItem", selectItem);
		
		//System.out.println("java 확인용2 : " +selectItem);
		
		
				
		
		//3-1. 페이징 처리를 한 모든 상품 또는 검색한 상품 보여주기 //
				String sizePerPage = "20";
				// 한 페이지당 화면상에 보여줄 카드의 개수

				/*
				 * if(sizePerPage == null || !("3".equals(sizePerPage) ||
				 * "5".equals(sizePerPage) || "10".equals(sizePerPage))) { sizePerPage = "10"; }
				 */
				
				String currentShowPageNo = request.getParameter("currentShowPageNo");
				// currentShowPageNo 은 사용자가 보고자하는 페이지바의 페이지번호 이다.
		         // 메뉴에서 회원목록 만을 클릭했을 경우에는 currentShowPageNo 은 null 이 된다.
		         // currentShowPageNo 이 null 이라면 currentShowPageNo 을 1 페이지로 바꾸어야 한다.
				
				if(currentShowPageNo == null) {
					currentShowPageNo = "1";
				}
				
				// === GET 방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo 에 숫자가 아닌 문자를 입력한 경우 또는 
		         //     int 범위를 초과한 숫자를 입력한 경우라면 currentShowPageNo 는 1 페이지로 만들도록 한다. ==== // 
				try {
					if(Integer.parseInt(currentShowPageNo) < 1) {
						currentShowPageNo = "1";
					}
					
				}catch(NumberFormatException e) {
					currentShowPageNo = "1"; //숫자가 아닌 문자를 get방식으로 입력했을 때 무조건 1로 바꾸어준다
				}
				
				
				paraMap.put("sizePerPage", sizePerPage);
				paraMap.put("currentShowPageNo", currentShowPageNo);
				
				//3-2 상품목록 가져오기/////////////////////////////////////////////////////////////
				List<ProductVO> productList = pdao.selectProductAll(paraMap);
			
				request.setAttribute("productList", productList);
				
				request.setAttribute("searchWord", searchWord);
				
				
				
				

				// 3-3페이징 처리를 위한 검색이 있는 또는 검색이 없는 전체회원에 대한 총페이지 알아오기
				int totalPage = pdao.getTotalPage(paraMap);
				//System.out.println(totalPage);
				//sizePerPage가 10일때 totalPage는 21
				//sizePerPage가  5일때 totalPage는 41
				//sizePerPage가  3일때 totalPage는 68
				
				
				// 시작 <= GET방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo에 토탈페이지수보다 큰 값을 입력하여 장난친 경우에는 1페이지로 가게끔 막아줌
				if(Integer.parseInt(currentShowPageNo) > totalPage ) {
					currentShowPageNo = "1";
				}
				
				// 끝 <= GET방식이므로 사용자가 웹브라우저 주소창에서 currentShowPageNo에 토탈페이지수보다 큰 값을 입력하여 장난친 경우에는 1페이지로 가게끔 막아줌

		
		
		
	
	
		
		
		
		
	//-----------------------------------------------------------------------------------------
		
		
		
		//ProductVO pvo = new ProductVO();
		
		
	
	
		// ******** === 페이지바 만들기 시작 === ******** //
		
		/*
         1개 블럭당 10개씩 잘라서 페이지 만든다.
         1개 페이지당 3개행 또는 5개행 또는  10개행을 보여주는데
             만약에 1개 페이지당 5개행을 보여준다라면 
             총 몇개 블럭이 나와야 할까? 
             총 회원수가 207명 이고, 1개 페이지당 보여줄 회원수가 5 이라면
         207/5 = 41.4 ==> 42(totalPage)        
             
         1블럭               1 2 3 4 5 6 7 8 9 10 [다음]
         2블럭   [맨처음][이전] 11 12 13 14 15 16 17 18 19 20 [다음][마지막]
         3블럭   [맨처음][이전] 21 22 23 24 25 26 27 28 29 30 [다음][마지막]
         4블럭   [맨처음][이전] 31 32 33 34 35 36 37 38 39 40 [다음][마지막]
         5블럭   [맨처음][이전] 41 42 
      */
     
     // ==== !!! pageNo 구하는 공식 !!! ==== // 
      /*
          1  2  3  4  5  6  7  8  9  10  -- 첫번째 블럭의 페이지번호 시작값(pageNo)은  1 이다.
          11 12 13 14 15 16 17 18 19 20  -- 두번째 블럭의 페이지번호 시작값(pageNo)은 11 이다.   
          21 22 23 24 25 26 27 28 29 30  -- 세번째 블럭의 페이지번호 시작값(pageNo)은 21 이다.
          
           currentShowPageNo        pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
          ---------------------------------------------------------------------------------------------
                 1                   1 = ( (1 - 1)/10 ) * 10 + 1 
                 2                   1 = ( (2 - 1)/10 ) * 10 + 1 
                 3                   1 = ( (3 - 1)/10 ) * 10 + 1 
                 4                   1 = ( (4 - 1)/10 ) * 10 + 1  
                 5                   1 = ( (5 - 1)/10 ) * 10 + 1 
                 6                   1 = ( (6 - 1)/10 ) * 10 + 1 
                 7                   1 = ( (7 - 1)/10 ) * 10 + 1 
                 8                   1 = ( (8 - 1)/10 ) * 10 + 1 
                 9                   1 = ( (9 - 1)/10 ) * 10 + 1 
                10                   1 = ( (10 - 1)/10 ) * 10 + 1 
                 
                11                  11 = ( (11 - 1)/10 ) * 10 + 1 
                12                  11 = ( (12 - 1)/10 ) * 10 + 1
                13                  11 = ( (13 - 1)/10 ) * 10 + 1
                14                  11 = ( (14 - 1)/10 ) * 10 + 1
                15                  11 = ( (15 - 1)/10 ) * 10 + 1
                16                  11 = ( (16 - 1)/10 ) * 10 + 1
                17                  11 = ( (17 - 1)/10 ) * 10 + 1
                18                  11 = ( (18 - 1)/10 ) * 10 + 1 
                19                  11 = ( (19 - 1)/10 ) * 10 + 1
                20                  11 = ( (20 - 1)/10 ) * 10 + 1
                 
                21                  21 = ( (21 - 1)/10 ) * 10 + 1 
                22                  21 = ( (22 - 1)/10 ) * 10 + 1
                23                  21 = ( (23 - 1)/10 ) * 10 + 1
                24                  21 = ( (24 - 1)/10 ) * 10 + 1
                25                  21 = ( (25 - 1)/10 ) * 10 + 1
                26                  21 = ( (26 - 1)/10 ) * 10 + 1
                27                  21 = ( (27 - 1)/10 ) * 10 + 1
                28                  21 = ( (28 - 1)/10 ) * 10 + 1 
                29                  21 = ( (29 - 1)/10 ) * 10 + 1
                30                  21 = ( (30 - 1)/10 ) * 10 + 1                    
       */
		
		String pageBar = "";
		
		int blockSize = 10; //blockSize는 블럭(토막)당 보여지는 페이지 번호의 개수
		
		int loop = 1; //loop는 1부터 증가하여 1개 블럭을 이루는 페이지번호의 개수(지금은 10개) 까지만 증가하는 용도

		
		// ==== !!! pageNo 구하는 공식 !!! ==== // 
        //currentShowPageNo        pageNo  ==> ( (currentShowPageNo - 1)/blockSize ) * blockSize + 1 
		int pageNo = ( (Integer.parseInt(currentShowPageNo) - 1)/blockSize ) * blockSize + 1;
		//pageNo는 페이지바에서 보여지는 첫번째 번호
		
		
		
		if(searchWord == null) {
			searchWord = "";
		}
		
		if(searchPrice1 ==null) {
			searchPrice1= "";
		}
		
		if(searchPrice2 ==null) {
			searchPrice2= "";
		}
		
	
		
		/////////////////////////////////////////////////////////////////////
		
		
		// **** [맨처음][이전] 만들기 **** //
		
		  if(pageNo != 1) { //pageBar +=
			  if(pageNo != 1) 
					pageBar += "<li class='page-item'><a class='page-link' href='productHp.sue?sizePerPage="+sizePerPage+"&currentShowPageNo=1&searchWord="+searchWord+"'>" + "[맨처음]</a></li>";
					pageBar += "<li class='page-item'><a class='page-link' href='productHp.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+(pageNo-1)+"&searchWord="+searchWord+"'>" + "[이전]</a></li>";
				}
		
		// **** [맨처음][이전] 만들기 끝 **** //
		
		
		while( !(loop > blockSize || pageNo > totalPage) ) { //loop가 blocksize보다 커지면 탈출
			if(pageNo == Integer.parseInt(currentShowPageNo)) {
				pageBar += "<li class='page-item active'><a class='page-link' href=''>" + pageNo + "</a></li>";
				
			}
			else {
				pageBar += "<li class='page-item'><a class='page-link' href='productHp.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&searchWord="+searchWord+"&searchPrice1="+searchPrice1+"&searchPrice2="+searchPrice2+"&selectItem="+selectItem+"'>" + pageNo + "</a></li>";
			}
			loop++; // 1 2 3 4 5 6 7 8 9 10
			pageNo++; // 1   2  3  4  5  6  7  8  9 10
					  // 11 12 13 14 15 16 17 18 19 20
					  // 21 22 23 24 25 26 27 28 29 30 ...
					  // sizePerPAge가 10일때
			
			
		}//end of while
		
		//첫번째 블럭( 1   2  3  4  5  6  7  8  9 10 )인경우 pageNo 11이고
		//두번째 블럭( 11 12 13 14 15 16 17 18 19 20 )인경우 pageNo 21이고
		//세번째 블럭( 21 )인경우 pageNo 22
		
		// **** [다음][마지막] 만들기 **** //
		
		if( pageNo <= totalPage ) { //페이지가 totalPage보다 작거나 같을때만 (마지막 블럭 제외)  
			pageBar += "<li class='page-item'><a class='page-link' href='productHp.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+pageNo+"&searchWord="+searchWord+"'>" + "[다음]</a></li>";
			pageBar += "<li class='page-item'><a class='page-link' href='productHp.sue?sizePerPage="+sizePerPage+"&currentShowPageNo="+totalPage+"&searchWord="+searchWord+"'>" + "[마지막]</a></li>";
		}
		// **** [다음][마지막] 만들기 끝**** //
		
						
		request.setAttribute("pageBar", pageBar);
		
		//System.out.println("pagebar :" +pageBar +"\n tatalpage: " +totalPage);
		

		
		// ******** === 페이지바 만들기 끝 === ******** //

		//super.setRedirect(false);
		super.setViewPage("/WEB-INF/jihee/prodouct/4.productHpSide.jsp");
		

	}

}