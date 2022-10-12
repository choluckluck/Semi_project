<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script>
	$(document).ready(function(){
		

		//목록버튼 클릭이벤트
		$("button#review").click(function(){
			location.href="<%= ctxPath%>/heajun/board/review.sue";
		});
		
		
		
	});
</script>

<div class="row container-fluid mt-5">
    	<div id="contents" class="col-9 ml-5">
	
		 
			<div style="font-weight:bold;">Review</div>	
			<table class="table table-condensed mt-4" style="font-size:10pt;">
		
			<thead>
                <div id="review_code"> ${requestScope.rvo.reivew_code}번 게시글 &nbsp; </div>
				<tr>
					<td class="col-1 align-middle">제목</td>
					<td class="col-11">${requestScope.rvo.reivew_subject}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${requestScope.rvo.fk_userid}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${requestScope.rvo.reivew_registerday}</td>
				</tr>
				<tr>
					<td colspan="2" class="pt-5 pb-5" style="border-bottom:solid 1px #d9d9d9;">${requestScope.rvo.reivew_contents}</td>
				</tr>
				
		</thead>
				
					
		
				
              
			</table>
	
		<div class="mt-3 mb-5 ">
			<span><button id="review" type="button" class="white" style="height:35px;">목록</button></span>
		</div>
		
	</div>
</div>



<jsp:include page="/WEB-INF/hyerin/footer.jsp"/> 