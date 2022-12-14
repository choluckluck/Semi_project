<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI CSS-->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


<style type="text/css">



  div#container {
  	margin: 0 auto;
  	width : 95%;
  }
     
  div.col-10 {
  	/* border:solid 1px gray;  */
  	margin : 0 auto;
  }

  button.btn-gray {
  	text-align:left;
  }
  
  a.prd {
  	text-decoration-line: none;
  	color:black;
  }
  
  a.prd:hover {
  	color:gray;
  }
  
  table {
  	border-top : solid 1px gray;
  	width:80%;
  }
  
    a.orderview {
    text-decoration-line: none;
  	color:black;
  }
  
  a.orderview:hover {
  	color:gray;
  }
   
  div#buttons {
  	font-size: 14px;
  }
	
		/* 혜택정보 */
	.pur_benefit_info {
		margin:0 auto;
	    border: solid 1px lightgray;
	    padding:5px;
	}
	
	.tbl_pur_benefit_info {
	    width: 100%;
	}
	
	.tbl_pur_benefit_info tr:first-child td:first-child {
	    border-right: solid 1px lightgray;
	    width:14%;
	    font-weight: bold;
	    text-align: center;
	    margin-left: 10%;
	}
	
	
	.tbl_pur_benefit_info tr td:nth-child(3) {
	    padding: 10px 0;
	    border-bottom: solid 1px lightgray;
	    font-size: 15px;
	}
	
</style>



<script type="text/javascript">

	
	
	

</script>


</head>
<body>
<jsp:include page="../hyerin/header.jsp"></jsp:include>




<div id="container" style="position:relative;">

 	<div class="row">
  	   <div class="col-2">
  	    	<br><br>
  	   
 		 <jsp:include page="sideMenu.jsp" />	   
	   </div>	

	   <div class="col-10">
	   <br><br>
	   
	<h2> 주문 상세정보</h2>
	<br><br>
	
		<h5>주문정보</h5>
	<c:forEach var="rovo" items="${requestScope.oList}">
		  <table class="table table" style="text-align:center; width:90%; border-bottom:solid 1px gray;">
			<colgroup>
				<col style="width:300px;">
				<col style="width:auto;">

			</colgroup>
			<thead>
			  <tr>
				<td scope="col" style="font-weight:bold;">주문번호</td>
				<td scope="col" style="text-align:left; "><span>${rovo.order_code } </span></td>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td style="text-align:center; font-weight:bold;">주문일자</td>
				<td style="text-align:left;"><div>${rovo.orderdate}</div></td>
		      </tr>
			  <tr>
				<td style="text-align:center; font-weight:bold;">주문자 성명</td>
				<td style="text-align:left;"><div>${sessionScope.loginuser.name}</div></td>
			  </tr>
			  <tr>
				<td style="text-align:center; font-weight:bold;">주문처리상태</td>
				<td style="text-align:left;"><div>${rovo.order_state}</div></td>
			  </tr>
		    </tbody>
		  </table>
	</c:forEach>
      
      
      <br>
	  
	  

	   <div class="">
	  
	      
		<br><br>
		
		<h5>주문상품 정보</h5>
	   <div id="prd-info" >
	   		  <table class="table table" style="text-align:center; width:90%; border-bottom:solid 1px gray;">
			<colgroup>
				<col style="width:100px;">
				<col style="width:auto;">
				<col style="width:200px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">

			</colgroup>
			<thead>
			  <tr>
				<th colspan="2">상품정보</th>
				<th scope="col">판매가</th>
				<th scope="col">수량</th>
				<th scope="col">적립금</th>
				<th scope="col">합계</th>
			  </tr>
			</thead>
			<tbody>
			 <c:forEach var="detailList" items="${requestScope.detailList}">			
			  <tr style="">
			  	<td>
			  		<div style=" height:100px; width:75px;"><img src="<%=request.getContextPath() %>/images/product/${detailList.prod_image}" style="width:100%; height:100%; object-fit:cover;"/></div>
			  	</td>
			  	<td style="text-align:left; vertical-align:middle;">
					<div style="">
					<a href="#" style="color:black;"><span>${detailList.prod_name }</span></a><br><span>[옵션: ${detailList.odvo.fk_prod_color} / ${detailList.odvo.fk_prod_size}mm ]</span>
					</div> 			  	
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>정가 : <fmt:formatNumber value="${detailList.prod_price}" pattern="#,###"/>원 <br> 할인가 : <fmt:formatNumber value="${detailList.prod_saleprice}" pattern="#,###"/>원 </span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>${detailList.odvo.order_buy_count}개</span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span><fmt:formatNumber value="${detailList.prod_point*detailList.odvo.order_buy_count}" pattern="#,###"/>원</span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span><fmt:formatNumber value="${detailList.prod_saleprice * detailList.odvo.order_buy_count}" pattern="#,###"/>원</span>
			  	</td>			  	
		      </tr>
		     </c:forEach>   
		      <c:forEach var="totalList" items="${requestScope.totalList}">			
		      <tr>
		     	<td style="text-align:left;"><span></span></td>
		      	<td colspan="6" style="text-align:right;">
		      		상품구매금액 : <span style= "margin-right:5px;"><fmt:formatNumber value="${totalList.total}" pattern="#,###"/>원 </span>
		      		+   배송비 : <span style= "margin-right:5px;"><fmt:formatNumber value="${totalList.shipfee}" pattern="#,###"/></span>
		      		=   합계 : <span><fmt:formatNumber value="${totalList.total+totalList.shipfee}" pattern="#,###"/>원</span>
		      	</td>
		      </tr>		 
		      
		      </c:forEach>		       
		    </tbody>
		  </table>
	   	<br><br><br>

	<c:forEach var="totalList" items="${requestScope.totalList}">			
	   	<div id="total">
	   	  <table class="table table" style=" width:90%">
			<colgroup>
				<col style="width:50%;">
				<col style="width:50%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style=" text-align:center;">총 주문금액</th>
					<th scope="col" style=" text-align:center;">총 적립금</th>	
				</tr>
			</thead>
			<tbody>
	      	  <tr>
				<td style="font-weight:bold; text-align:center;"><span><fmt:formatNumber value="${totalList.total}" pattern="#,###"/>원</span></td>
				<td style="font-weight:bold; text-align:center;"><span><fmt:formatNumber value="${totalList.totalPoint}" pattern="#,###"/>원</span></td>
	      	  </tr>
		    </tbody>
		  </table>
		</div>
	</c:forEach>

<%-- 		<h5>결제정보</h5>		
		  <table class="table table" style="text-align:center; width:90%; border-bottom:solid 1px gray;">
			<colgroup>
				<col style="width:300px;">
				<col style="width:auto;">

			</colgroup>
			<thead>
			  <tr>
				<td scope="col" style="font-weight:bold;">최종결제금액</td>
				<td scope="col" style="text-align:left; "><span>32,800원</span></td>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td style="text-align:center; font-weight:bold;">결제수단</td>
				<td style="text-align:left;"><div><span>무통장입금</span><br>입금자 : <span>ooo</span><br> 계좌번호: 하나은행 0000000 ((주)지니킴) <button type="button" style="background-color:white; color:black; font-size:10pt; border:solid 1px gray;">인터넷뱅킹 바로가기</button><br>현금영수증 발행 : <span style="font-size:bold">신청안함</span></div></td>
		      </tr>
			  <tr>
			  </tr>
		    </tbody>
		  </table> --%>
		  	   	

		  <br><br><br>
		  
	   	
	   	
	   	<div id="addr_info"><h5>배송지 정보</h5></div>
	   	
	   	<br>	   	
	   	<table class="table table" style=" width:100%; border-bottom:solid 1px gray; ">
			<colgroup>
				<col style="width:200px;">
				<col style="width:auto;">
			</colgroup>
			<tbody>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">받으시는분</td>
				<td scope="col"><span>${loginuser.name}</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">우편번호</td>
				<td scope="col">(<span>${loginuser.postcode}</span>)</td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">주소</td>
				<td scope="col"><span>${loginuser.address}  ${loginuser.detailaddress} (${loginuser.extraaddress})</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">일반전화</td>
				<td scope="col"><span>-</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">휴대전화</td>
				<td scope="col"><span>${ fn:substring(sessionScope.loginuser.mobile, 0, 3)}-${ fn:substring(sessionScope.loginuser.mobile, 3, 7)}-${ fn:substring(sessionScope.loginuser.mobile, 7, 11)}</span></td>
	      	  <tr >
				<td scope="col" style="font-weight:bold; color:gray;">배송메시지</td>
				<td scope="col" style="vertical-align:middle;"><span >경비실 앞에 놔주세요.</span></td>
			  </tr>
		    </tbody>
		  </table>
		  
	   </div>



	   
	   </div>
	  </div>
	  </div>
	  </div>
	 
	  
	  	


<jsp:include page="../hyerin/footer.jsp"></jsp:include>


</body>
</html>