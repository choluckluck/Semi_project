<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품적용하기</title>

<!-- style.css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/hasol/style_selectProduct.css">

<script type="text/javascript" src="js/jquery-3.6.0.min.js">

	$(document).ready(function(){
	
		
		// 검색창 엔터 시 검색
		$("input#searchWord").bind("keyup",(e)=>{
			   if(e.keyCode == 13){ //검색어에서 엔터를 입력했을 경우 검색한다
				   goSearch();
			   }  
	    });
		
		if(${requestScope.sizePerPage} != null) { // 또는 "${requestScope.sizePerPage}" != ""
			   $("select#sizePerPage").val("${requestScope.sizePerPage}");
		   };
		   
	});
	
	
	//////////////////////////////////////////////////
	// function
	
	// "검색" 버튼 클릭
	function goSearch() {
		
		let searchWord = $("searchWord").val();
		let sizePerPage = $("sizePerPage").val();
		let currentPageNo = $("currentPageNo").val();
		
		$.ajax({
			url: "<%= ctxPath%>/hasol/board/productSearchJson.sue",
			data: { "searchWord": searchWord,
					"sizePerPage": sizePerPage,
					"currentPageNo" : currentPageNo,
			dataType: "JSON",
			success: function(json){
				
				let html = '';
			}
				
			}
			
		})const frm = document.selectProductFrm;
	    frm.action = "selectProductList.sue";
	    frm.method = "get";
	    frm.submit();
	
	}
	
	// "선택" 버튼 클릭시 호출되는 함수  
	function goSelect() {
		
		const frm = document.selectProductFrm;
	    frm.action = "selectProduct.sue";
	    frm.method = "get";
	    frm.submit();
	

	}


</script>
</head>
<body>
    
    <!-- header -->
    <div class="header">
    	<span> 상품 검색 </span>
    </div>

    
    <!-- main -->
    <div class="container">

        <!-- 상품 검색영역 -->
		<form name="selectProductFrm">
		<div>
		<span style="font-size:15px;"> 상품 찾기 </span>
			<table class="tbl_prodct_select">
               <tr> 
                   <td>
					<input type="text" id="searchWord" name="searchWord" placeholder="제품명을 입력해 주세요."/> 
					<input type="text" style="display: none;" />
					<button type="button" id="btn_search" onClick="goSearch()">검색</button>
                   </td>
               </tr>
			</table>	
		</div>
		
		<div style="display:flex; justify-content: space-between;">
			<span class="product_count"> n 개의 상품이 조회되었습니다. </span>
			<select name="sizePerPage">
				<option value="5"> 5개씩 보기 </option>
				<option value="10"> 10개씩 보기 </option>
				<option value="20"> 20개씩 보기 </option>
			</select>
		</div>
		</form>
		
		<!-- 상품 리스트 -->
		<div class="product_select">
            <table class="product_select_tab">
                <thead>
                    <tr height="30">
                        <td width="10%"> 상품 이미지</td>
                        <td width="80%">상품정보</td>
                        <td width="10%">선택</td>
                    </tr>
                </thead>
             <!-- 여기부터 제품 생길 때마다 반복 노출되어야하는 영역 -->
				<tbody>
					<tr>
	                     <td><img src="images/test4.jpg" width="80" style="padding: 10px 0;" >
	                     <td style="text-align:left; padding-left: 10px;">
	                         <p>제품명</p>
	                         <p style="color:grey;">옵션</p>
	                     </td>
	                     <td>
							<button type="button" onClick="goSelect()"> 선택 </button>
						 </td>
					</tr>
				</tbody>
			</table>
		</div>
          
	
		<!-- 페이징 위치 -->
		<nav aria-label="Page navigation">
			<ul id="pageBar" class="pagination justify-content-center pagination-sm my-5"></ul>
		  	<input type="hidden" name='currentPageNo' value="1"/>
		</nav>
	</div>
	
</body>
</html>