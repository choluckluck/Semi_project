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

  div.sel:hover {
  	cursor:pointer;
  }
  
  div.cabtn:active {
  	background-color:black;
  	color:white;
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

		<h3 style="margin-top:1px;">리뷰&문의 내역 관리</h3>
		<br><br>
		
		

		  <h6 style="display:inline">분류 선택</h6>
		    <select id="" name="" onchange="">
			  <option value="">작성 일자별</option>
			  <option value="">분류별</option>
		    </select>		
			
			
		
		
	
		<br><br>		
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:70px;">
				<col style="width:135px;">
				<col style="width:300px;">
				<col style="width:84px;">
				<col style="width:80px;">
				<col style="width:55px;">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
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

	




	   
	   </div>
     </div>
   </div>
	
<jsp:include page="../hyerin/footer.jsp"></jsp:include>
	
  </body>
</html>