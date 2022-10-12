<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<script type="text/javascript">

	$(document).ready (function(){
		

	});
	
	function reviewshow() {
		
//		alert("sdfsd");
		$(this).parent().find(".collapse").hide();		
		$(this).next().show();

	}

	// === 나의 정보 수정하기 === //
	function qnawrite(){
		// 나의 정보 수정하기 팝업창 띄우기
		const url = "<%= request.getContextPath()%>/member/memberEdit.up?userid="+userid;
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 650;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); // Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "memberEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	}//end of goEditPersonal

	
	
	
	
	</script>

<style type="text/css">

  table {
  	border-top : solid 1px gray;
  	width:80%;
  }
</style>


		<h3 style="margin-top:1px;">문의내역 관리</h3>
		<br><br>
		
	
		<br><br>		
		
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
							<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">${qvo.subject}</button></td>
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
	   		  <nav class="my-5">
			<div style="display: flex; width: 80%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar2}</ul>
			</div>
		  		</nav>
		 				 <div style="text-align:right;  width:90%;" class="">
	    	            <button type="button" id="reivewWrite" style="background-color: black; color:white; border:solid 1px gray;">문의하기</button>
	              </div>
		      