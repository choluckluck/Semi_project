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
	   	  <br><br>
	      <h2>${sessionScope.loginuser.name} 님, 안녕하세요. </h2>
	      <h2>고객님은 [ㅇㅇㅇ] 등급입니다. </h2>
	      <h6> 1원 이상 구매시 00%를 추가적립 받으실 수 있습니다.</h6>
	      <br><br>
	      <div id=buttons>
		      <button type="button" class="btn btn-white btn-lg col-3" style = "font-size: 15px; border:solid 1px black"><div style="text-align:center; font-weight:bold">적립금</div><div style="text-align:center">0000원</div></button>
		      <button type="button" class="btn btn-white btn-lg col-3" style = "font-size: 15px; border:solid 1px black"><div style="text-align:center; font-weight:bold">쿠폰</div><div style="text-align:center">00개</div></button>
		      <button type="button" class="btn btn-white btn-lg col-3" style = "font-size: 15px; border:solid 1px black"><div style="text-align:center; font-weight:bold">총 주문</div><div style="text-align:center">00,000원(00회)</div></button>
	      </div>
	      <br><br>
		      <div style="display:inline; font-size:13pt;">최근 주문 내역</div>
		      <div style="display:inline; font-size:13pt; position:relative; left:71%;"><a class="prd" href=#>더보기 ▶</a></div>
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
				<th scope="col">상품구매금액</th>
				<th scope="col">주문상태</th>
			  </tr>
			</thead>
			<tbody>
			  <tr style="vertical-align:middle">
			 	<td>2022-09-15<br><a class="orderview" href=#>[20220915-0000403]</a></td>
		 		<td><a href=# ><img src="./images/shoes1.jpg"></a></td>
		 		<td style="text-align:left"><a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >띠아모 플랫 (1.5cm)</a><br>[옵션: LEOPARD/235]</td>
		 		<td>1</td>
		 		<td>49,800원</td>
		 		<td>입금 전</td>	
		      </tr>
			  <tr style="vertical-align:middle">
			 	<td>2022-09-15<br><a class="orderview" href=#>[20220915-0000403]</a></td>
		 		<td><a class = "prd" href=#><img src="./images/shoes1.jpg"></a></td>
		 		<td style="text-align:left"><a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >띠아모 플랫 (1.5cm)</a><br>[옵션: LEOPARD/235]</td>
		 		<td>1</td>
		 		<td>49,800원</td>
		 		<td>입금 전</td>	
		      </tr>
		    </tbody>
		  </table>
	      
	      <br><br>
		      <div style="display:inline; font-size:13pt;">관심 상품</div>
		      <div style="display:inline; font-size:13pt; position:relative; left:75%;"><a class="prd" href=#>더보기 ▶</a></div>
	      <br><br>
	      
	 <div class="row" style="width:90%">
	  
		  <div class="col" style="border:none">		  
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./images/pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>			 
		  </div>

   		  <div class="col">
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./images/pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>
		  </div>

		  <div class="col">			
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>
		  </div>

		  <div class="col">			
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>
		  </div>

		  		  								  			  
	 </div>
			<br><br><br><br>

	   
	   
	   
	   </div>
     </div>
   </div>
	
	
  </body>
  
  <jsp:include page="../hyerin/footer.jsp"></jsp:include>
  
</html>