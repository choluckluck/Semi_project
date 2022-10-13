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
	
	// 토글 하나만 보여주는 함수.	
	function reviewshow() {
		
//		alert("sdfsd");
		$(this).parent().find(".collapse").hide();		
		$(this).next().show();
	}


	function myQnawrite(){
		// 나의 정보 수정하기 팝업창 띄우기		

		
	
//			alert("문의 페이지로 이동합니다.");
			
			const myQnaForm = document.myQnaForm;
			myQnaForm.action="<%=request.getContextPath() %>/heajun/board/qna_write2.sue";
			myQnaForm.method = "GET";
			myQnaForm.submit(); 

		
			
	}//end of qnawrite()

	
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


		<h3 style="margin-top:1px;">문의내역 관리</h3>
		<br><br>
		
		
		<form name = "myQnaForm">		
		  <table class="table table" style="text-align:left; width:90%">
			<colgroup>
				<col style="width:70px;">
				<col style="width:70px;">
				<col style="width:250px;">
				<col style="width:84px;">
				<col style="width:80px;">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">

			<c:choose>
				<c:when test="${not empty requestScope.qnaList}">					
					<c:forEach var="qvo" items="${requestScope.qnaList}" varStatus="status">
						
						<tr>
							<td>${qvo.rnum}</td>
							<td>${qvo.category}</td>
							<td style="text-align:left;">
								<div class="btn" data-toggle="collapse" data-target="#demo${status.index}" onclick="reviewshow()">${qvo.subject}</div>
								<div id="demo${status.index}" class="collapse" style="text-align:left">${qvo.contents}</div>
							</td>
							<td>${sessionScope.loginuser.name }</td>
							<td>${qvo.registerday}</td>
						</tr>
							   	<input type="hidden" id="fk_userid" name="fk_userid" value="${sessionScope.loginuser.userid}" />   
	   							<input type="hidden" id="fk_prod_code" name="fk_prod_code" value="${qvo.fk_prod_code}" />   	   					
					</c:forEach>					
				</c:when>				
				<c:otherwise>
							<tr>
								<td colspan="6">문의 내역이 없습니다.</td>
							</tr>
				</c:otherwise>
			</c:choose>				
		    </tbody>
		  </table>
		  		  <div style="text-align:right;  width:90%;" class="">
	    	            <button type="button" id="myQnaWrite" style="background-color: black; color:white; border:solid 1px gray;" onclick="myQnawrite()">문의하기</button>
	              </div>
		  
		  
	   		  <nav class="my-5">
			<div style="display: flex; width: 80%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar1}</ul>
			</div>
		  </nav>
	      
	      <br>

	   <br><br>
	  </form>
	



	   
	   </div>
     </div>
   </div>
	
<jsp:include page="../hyerin/footer.jsp"></jsp:include>
	
  </body>
</html>