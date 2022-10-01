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

		<h3 style:"margin-top:1px;">Address</h3>
		<br><br>
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:60px">
				<col style="width:120px">
				<col style="width:120px">
				<col style="width:120px">
				<col style="width:160px">
				<col style="width:160px">
				<col style="width:auto">
				<col style="width:76px">
			</colgroup>
			<thead>
			  <tr>
				<th scope="col">
				<span class="">
				<input id="allCheck" onclick="myshopAddr.checkAll(this)" value="" type="checkbox">
				</span>
				</th>
				<th scope="col">주소록 고정</th>
				<th scope="col">배송지명</th>
				<th scope="col">수령인</th>
				<th scope="col">일반전화</th>
				<th scope="col">휴대전화</th>
				<th scope="col">주소</th>
				<th scope="col">수정</th>
			  </tr>
			</thead>
					
			<tbody>
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
	
		    </tbody>
		  </table>
			<br>
			
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
		  
		  	      
	      
		<div class="row" style="width:90%;">
			<div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
			<button type="button" style="width: 200px; height:40px; border:none; background-color:white; font-size:12pt; color:gray; text-align:center;">선택 주소록 삭제</button>
			</div>
	
	
			<div class="col-2" style="border:solid 1px #172a41; background-color: #172a41; color: white; margin-left:700px; display: flex; align-items: center; justify-content: center;">
			<button type="button" style="width: 200px; height:40px; border:none; background-color:#172a41; font-size:12pt; color:white; text-align:center;">배송지 등록</button>
			</div>
		</div>
		
		<br><br>



		  <br><br>
	   



	   
	   </div>
     </div>
   </div>
	<jsp:include page="../hyerin/footer.jsp"></jsp:include>
	
  </body>
</html>