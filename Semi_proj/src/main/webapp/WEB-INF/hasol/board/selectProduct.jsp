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

<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>

<script>

	// "검색" 버튼 클릭
	function goSearch() {
		const frm = document.selectProductFrm;
	    frm.action = "selectProduct.sue";
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
		<form name="searchProductFrm">
		<div>
			<span style="font-size:15px;"> 상품 찾기 </span>
			
			    <table class="tbl_prodct_select">
                <tr> 
                    <td>
						<input type="text" placeholder="제품명을 입력해 주세요."/> 
						<button type="button" id="btn_search" onClick="goSearch()">검색</button>
                    </td>
                </tr>
			</table>
		</div>
		</form>
		
		<!-- 상품 리스트 -->
		<div class="product_select">
            <div style="display:flex; justify-content: space-between;">
				<span class="product_count"> n 개의 상품이 조회되었습니다. </span>
				<select name="sizePerPage">
					<option> 5개씩 보기 </option>
					<option> 10개씩 보기 </option>
					<option> 20개씩 보기 </option>
				</select>
			</div>
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
		<div class="paging"> </div>
	</div>
	
</body>
</html>