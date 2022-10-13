<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">

	$(document).ready (function(){
		

		
		
		
		
		
		
	});
	
	function qnashow() {
		
//		alert("sdfsd");
		$(this).parent().find(".collapse").hide();		
		$(this).next().show();

	}

	// === qna 작성하기 === //
	function qnawrite(){
		// 나의 정보 수정하기 팝업창 띄우기		

		if(${sessionScope.loginuser == null} ) {
			alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			location.href="<%=request.getContextPath() %>/hyerin/login/login.sue"		
		}
		
		else {
			alert("문의 페이지로 이동합니다.");
			
			const qnaForm = document.qnaForm;
			qnaForm.action="<%=request.getContextPath() %>/heajun/board/qna_write.sue";
			qnaForm.method = "GET";
			qnaForm.submit(); 
		}
		
			
	}//end of qnawrite()

	
	
	
	
	</script>

<style type="text/css">

  table {
  	border-top : solid 1px gray;
  	width:80%;
  }
</style>

	<div style="width : 85%; margin:0 auto;">		
		<h3 style="margin-top:1px;">문의</h3>
		<br><br>		
		
		  <table class="table table" style="text-align:left;">
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
				<th scope="col">아이디</th>
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
								<div class="btn" data-toggle="collapse" data-target="#demo${status.index}" onclick="qnashow()">${qvo.subject}</div>
								<div id="demo${status.index}" class="collapse" style="text-align:left">${qvo.contents}</div>			
							</td>
							<td>${qvo.fk_userid }</td>
							<td>${qvo.registerday}</td>
						</tr>
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
		  		  <div style="text-align:right;  width:100%;" class="">
	    	            <button type="button" id="qnaWrite" style="background-color: black; color:white; border:solid 1px gray;" onclick="qnawrite()">문의하기</button>
	              </div>
	   		  <nav class="my-5">
			<div style="display: flex; width: 100%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar2}</ul>
			</div>
		  		</nav>
		  		
<form name="qnaForm">
	<input type="hidden" id="fk_prod_code" name="fk_prod_code" value="${requestScope.pvo2.prod_code}" />   
	<input type="hidden" id="fk_userid" name="fk_userid" value="${sessionScope.loginuser.userid}" />   
</form>

		</div>		      