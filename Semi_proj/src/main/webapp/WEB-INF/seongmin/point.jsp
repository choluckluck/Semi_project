<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

	$(document).ready (function(){
		

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
		
		<h3 style="margin-top:1px;">적립금</h3>
		<br>
		
		<div class="row">
			<div class="col-2" style="">* 총 적립금</div>
			<div class="col-2" style="margin-right:50px; text-align:right;">0원</div>
			<div class="col-2" style="">* 사용가능 적립금</div>
			<div class="col-2" style="margin-right:50px; text-align:right;">0원</div>
		</div>
		<br>
		<div class="row">
			<div class="col-2" style="">* 사용된 적립금</div>
			<div class="col-2" style="margin-right:50px; text-align:right;">0원</div>
			<div class="col-2" style="">* 미가용 적립금</div>
			<div class="col-2" style="margin-right:50px; text-align:right;">0원</div>
		</div>		  
		<br>
		<div class="row">
			<div class="col-2" style="">* 환불예정 적립금</div>
			<div class="col-2" style="margin-right:50px; text-align:right;">0원</div>
		</div>


<br><br>
		  <div id=buttons>
	      	<div class="row" style="height:60px;">	      
		      <button type="button" class="cabtn btn-lg col-3" style = "background-color:#172a41; color:white; font-size: 15px; border:solid 1px gray"><div style="text-align:center; font-weight:bold">적립내역보기</div></button>
		      <button type="button" class="cabtn btn-lg col-3" style = "color:gray; font-size: 15px; border:solid 1px gray"><div style="text-align:center; font-weight:bold">미가용적립내역보기</div></button>
		      <button type="button" class="cabtn btn-lg col-3" style = "color:gray; font-size: 15px; border:solid 1px gray"><div style="text-align:center; font-weight:bold">미가용쿠폰/회원등급적립내역</div></button>
			</div>
	      </div>
			<br><br>
		
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:150px;">
				<col style="width:150px;">
				<col style="width:200px;">
				<col style="width:300px;">
			</colgroup>
			<thead>
			  <tr style="font-size:11pt;">
				<th scope="col">주문날짜</th>
				<th scope="col">적립금</th>
				<th scope="col">관련 주문</th>
				<th scope="col">내용</th>
			  </tr>
			</thead>
			<tbody style="font-size:12pt;">
				<tr>
					<td>2022-09-13</td>
					<td>-2,710원</td>
					<td>ㅇ</td>
					<td>ㅇ</td>
				</tr>

		    </tbody>
		  </table>
	      
	      <br>

  <div style=" display: grid; place-items: center;">
    <div style="inline">
    
	    <button type="button" class="btn btn-white"> << </button>
	    <button type="button" class="btn btn-white"><</button>
	    <button type="button" class="btn btn-outline-secondary">1</button>
	    <button type="button" class="btn btn-outline-secondary">2</button>
	    <button type="button" class="btn btn-outline-secondary">3</button>
	    <button type="button" class="btn btn-white">></button>
	    <button type="button" class="btn btn-white">>></button>
	</div>
  </div>
	   <br><br>
	   
		<div class="">
			<h5>적립금 안내</h5>
			<div class="inner" style="width:90%;">
				<ol class="">
				  <li class=" ">주문으로 발생한 적립금은 배송완료 후 3일 부터 실제 사용 가능한 적립금으로 전환됩니다. <br>배송완료 시점으로부터 3일 동안은 미가용 적립금으로 분류됩니다. </li>
				  <li class="">미가용 적립금은 반품, 구매취소 등을 대비한 임시 적립금으로 사용가능 적립금으로 전환되기까지 상품구매에 사용하실 수 없습니다.</li>
				  <li class="">사용가능 적립금(총적립금 - 사용된적립금 - 미가용적립금)은 상품구매 시 바로 사용가능합니다.</li>
				</ol>
			</div>
		</div>


	   
	   </div>
     </div>
   </div>
<jsp:include page="../hyerin/footer.jsp"></jsp:include>	
	
  </body>
</html>