<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="../hyerin/header.jsp"></jsp:include>
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

  
</style>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("a.orderview").click(function(e){
			const orderCode = $(e.target).html();
//			alert(orderCode);
			$("#ord_code").val(orderCode);
//			alert($("#ord_code").val());
			$("#orderViewFrm").submit();
		});

	});

</script>



<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>


 <header></header>
  
 	   <br><br>
 	   
  <div id="container">
 	<div class="row">
  	   <div class="col-2">
 		 <jsp:include page="sideMenu.jsp" />	   
	   </div>	

	   <div class="col-10">
	   	  
	      <h3>${sessionScope.loginuser.name} 님, 안녕하세요. </h3>
	      <h3>고객님은 [${sessionScope.loginuser.grade_code}] 등급입니다. </h3>
	      <h6> 1원 이상 구매시 00%를 추가적립 받으실 수 있습니다.</h6>
	      <br><br>
	      <div id=buttons>
		      <button type="button" class="btn btn-white btn-lg col-3" style = "font-size: 15px; border:solid 1px black" onclick="location.href='<%=request.getContextPath() %>/seongmin/member/point.sue'" ><div style="text-align:center; font-weight:bold">적립금</div><div style="text-align:center">${sessionScope.loginuser.point} 원</div></button>
		      <button type="button" class="btn btn-white btn-lg col-3" style = "font-size: 15px; border:solid 1px black" onclick="location.href='<%=request.getContextPath() %>/seongmin/member/coupon.sue'"><div style="text-align:center; font-weight:bold">쿠폰</div><div style="text-align:center">00개</div></button>
		      <button type="button" class="btn btn-white btn-lg col-3" style = "font-size: 15px; border:solid 1px black" onclick="location.href='<%=request.getContextPath() %>/seongmin/member/orderView.sue'"><div style="text-align:center; font-weight:bold">총 주문</div><div style="text-align:center"><fmt:formatNumber value="${requestScope.total_amount}" pattern="#,###"/>원 (${requestScope.total_count}회)</div></button>
	      </div>
	      <br><br>
		      <div style="display:inline; font-size:13pt;">최근 주문 내역</div>
		      <div style="display:inline; font-size:13pt; position:relative; left:71%;"><a class="prd" href="<%=request.getContextPath() %>/seongmin/member/orderView.sue">더보기 ▶</a></div>
		  <br>
		  <br>
 			  
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:210px;">
				<col style="width:75px;">
				<col style="width:300px;">
				<col style="width:80px;">
				<col style="width:140px;">
				<col style="width:140px;">
			</colgroup>
			<thead>
			  <tr>
				<th scope="col">주문일 / 주문번호</th>
				<th scope="col" colspan="2">주문내역</th>
				<th scope="col">수량</th>
				<th scope="col">상품구매금액 <br>(1족 기준)</th>
				<th scope="col">주문상태</th>
			  </tr>
			</thead>
			<tbody>	
 		 		<jsp:include page="./recentOrder.jsp"></jsp:include>

 		 		
 		 		
		    </tbody>
		  </table>		  	    
	      <br><br>
		      <div style="display:inline; font-size:13pt;">관심 상품</div>
		      <div style="display:inline; font-size:13pt; position:relative; left:75%;"><a class="prd" href="<%=request.getContextPath() %>/seongmin/member/interestPrd.sue">더보기 ▶</a></div>
	      <br><br>
	      
	 <div class="row" style="width:100%">
	  
 		 <jsp:include page="./likeView.jsp"></jsp:include>
		

		  		  								  			  
	 </div>
			<br><br><br><br>

	   
	   
	   
	   </div>
     </div>
   </div>
	<form method="POST" id="orderViewFrm" name="orderViewFrm" action="<%= request.getContextPath()%>/seongmin/member/orderDetail.sue">
	<input type="hidden" id="ord_code" name="ord_code" value=""/>	
	<!-- <input type="submit" /> -->
	</form>	
  </body>
  
  <jsp:include page="../hyerin/footer.jsp"></jsp:include>
  
</html>