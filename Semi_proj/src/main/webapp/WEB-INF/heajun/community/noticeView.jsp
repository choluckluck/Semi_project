<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script>
	$(document).ready(function(){
		//목록버튼 클릭이벤트
		$("button#notice_list").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		//커뮤니티사이드바_공지사항 클릭 이벤트
		$("div#sidebar_notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		
		//이전글보기 글씨 클릭이벤트
		$("span#previous_post").click(function(){
			
		});
		
		//다음글보기 글씨 클릭이벤트
		$("span#next_post").click(function(){
			
		});
		
		
	});
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/heajun/community/communitySidebar.jsp" /> 
	<div id="contents" class="col-9 ml-5">
		<form id="notice_contents_form" name="notice_contents_form">
			<div style="font-weight:bold;">NOTICE</div>	
			<table class="table table-condensed mt-4" style="font-size:10pt;">
				<tr>
					<td class="col-1 align-middle">제목</td>
					<td class="col-11">!제목</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>!관리자이름</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>!작성일자</td>
				</tr>
				<tr>
					<td colspan="2" class="pt-5 pb-5" style="border-bottom:solid 1px #d9d9d9;">~~`!내용</td>
				</tr>
			</table>
		</form>
		<div class="mt-3 mb-5 ">
			<span><button id="notice_list" type="button" class="white" style="height:35px;">목록</button></span>
		</div>
		<div id="Viewother_post" class="pb-3 mb-5">
			<table id="Viewother_post_table" class="w-100" style="border: solid 1px #d9d9d9; font-size:10pt;">
				<tr id="previous">
					<td class="col-1 pt-1 pb-1" style="border-bottom: solid 1px #d9d9d9; border-right: solid 1px #d9d9d9;">
						<span class="mr-1"><img src="<%= ctxPath%>/images/hyerin/uparrow.png" width="7px"></span>
						이전글
					</td>
					<td class="col-11" style="border-bottom: solid 1px #d9d9d9;">
						<span id="previous_post">!!이전글글제목</span>
					</td>
				</tr>
				<tr id="next">
					<td class="col-1 pt-1 pb-1" style="border-bottom: solid 1px #d9d9d9; border-right: solid 1px #d9d9d9;">
						<span class="mr-1"><img src="<%= ctxPath%>/images/hyerin/downnarrow.png" width="7px"></span>
						다음글
					</td>
					<td class="col-11" style="border-bottom: solid 1px #d9d9d9;">
						<span id="next_post">!!다음글글제목</span>
					</td>
				</tr>
			</table>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/> 