<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>


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
  
  
</style>

<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
  
  <div id="container">
 	<div class="row">
 	   <div class="col-2">
 	   <br><br>
		   <h2 style="text-align:center;">마이페이지</h2>
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
		    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
			  <button type="button" class="btn btn-gray">주문조회</button>
			  <button type="button" class="btn btn-gray">관심 상품</button>
			  <button type="button" class="btn btn-gray">적립금</button>
			  <button type="button" class="btn btn-gray">쿠폰</button>
			  <button type="button" class="btn btn-gray">회원정보 수정</button>
			  <button type="button" class="btn btn-gray">리뷰 & 문의내역 관리</button>
			  <button type="button" class="btn btn-gray">회원정보수청</button>
			</div>
	   </div>
	   <div class="col-10">

		<br><br>
		<h5>관심 상품</h5>
		<br><br>
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:70px;">
				<col style="width:100px;">
				<col style="width:230px;">
				<col style="width:90px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">
			</colgroup>
			<thead>
			  <tr>
				<th scope="col"><input type="checkbox"/></th>
				<th scope="col" colspan="2">상품 정보</th>
				<th scope="col">판매가</th>
				<th scope="col">적립금</th>
				<th scope="col">배송구분</th>
				<th scope="col">배송비</th>
				<th scope="col">합계</th>
				<th scope="col">선택</th>
			  </tr>
			</thead>
			<tbody>
			  <tr style="vertical-align:middle; height : 150px;">
			 	<td><input type="checkbox"/></td>
		 		<td><a href=# ><img src="./shoes1.jpg"></a></td>
		 		<td style="text-align:left">
		 			<a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >띠아모 플랫 (1.5cm)</a>
		 			<br>[옵션: LEOPARD/235]<br>
		 		    <button type="button" class="" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">옵션 변경</button>
		 		</td>
		 		<td>29,800원</td>
		 		<td><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원</td>
		 		<td>기본배송</td>	
		 		<td>무료</td>
		 		<td>29,800원</td>
		 		<td>
		 		<div class="">
		 		  <button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">장바구니<br>담기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
				</div>
				
		 		</td>
		      </tr>
			  <tr style="vertical-align:middle; height : 150px;">
			 	<td><input type="checkbox"/></td>
		 		<td><a href=# ><img src="./shoes1.jpg"></a></td>
		 		<td style="text-align:left">
		 			<a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >띠아모 플랫 (1.5cm)</a>
		 			<br>[옵션: LEOPARD/235]<br>
		 		    <button type="button" class="" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">옵션 변경</button>
		 		</td>
		 		<td>29,800원</td>
		 		<td><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원</td>
		 		<td>기본배송</td>	
		 		<td>무료</td>
		 		<td>29,800원</td>
		 		<td>
		 		<div class="">
		 		  <button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">장바구니<br>담기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
				</div>
				
		 		</td>
		      </tr>
			  <tr style="vertical-align:middle; height : 150px;">
			 	<td><input type="checkbox"/></td>
		 		<td><a href=# ><img src="./shoes1.jpg"></a></td>
		 		<td style="text-align:left">
		 			<a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >띠아모 플랫 (1.5cm)</a>
		 			<br>[옵션: LEOPARD/235]<br>
		 		    <button type="button" class="" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">옵션 변경</button>
		 		</td>
		 		<td>29,800원</td>
		 		<td><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원</td>
		 		<td>기본배송</td>	
		 		<td>무료</td>
		 		<td>29,800원</td>
		 		<td>
		 		<div class="">
		 		  <button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">장바구니<br>담기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
				</div>
				
		 		</td>
		      </tr>
			  <tr style="vertical-align:middle; height : 150px;">
			 	<td><input type="checkbox"/></td>
		 		<td><a href=# ><img src="./shoes1.jpg"></a></td>
		 		<td style="text-align:left">
		 			<a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >띠아모 플랫 (1.5cm)</a>
		 			<br>[옵션: LEOPARD/235]<br>
		 		    <button type="button" class="" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">옵션 변경</button>
		 		</td>
		 		<td>29,800원</td>
		 		<td><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원</td>
		 		<td>기본배송</td>	
		 		<td>무료</td>
		 		<td>29,800원</td>
		 		<td>
		 		<div class="">
		 		  <button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">장바구니<br>담기</button>
		 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
				</div>
				
		 		</td>
		      </tr>
		    </tbody>
		  </table>
	      
	      
		<div class="row" style="width:90%;">
			<div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;">삭제하기</button>
			</div>
	
			<div class="col-2" style="border:solid 1px gray; margin-left:20px; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;">장바구니 담기</button>
			</div>
	
			<div class="col-2" style="border:solid 1px gray; margin-left:280px; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;">전체상품주문</button>
			</div>
	
			<div class="col-2" style="border:solid 1px gray; margin-left:20px; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center; ">관심상품 비우기</button>
			</div>
	
		</div>
		
		<br><br>


		  <div style="width:85%; display: grid; place-items: center;">
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
	   



	   
	   </div>
     </div>
   </div>
	
	
  </body>
</html>