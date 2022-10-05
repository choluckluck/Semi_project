<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script>
	$(document).ready(function(){
		//목록버튼 클릭이벤트
		$("button#notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		//커뮤니티사이드바_공지사항 클릭 이벤트
		$("div#sidebar_notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		//커뮤니티사이드바_문의하기 클릭 이벤트
		$("div#sidebar_qna").click(function(){
			location.href="<%= ctxPath%>/heajun/board/qnalist.sue";
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
					<td class="col-11">${requestScope.nvo.notice_subject}</td>
				</tr>
				<tr>
					<td>작성자</td>
					<td>${requestScope.nvo.fk_userid}</td>
				</tr>
				<tr>
					<td>작성일</td>
					<td>${requestScope.nvo.notice_registerday}</td>
				</tr>
				<tr>
					<td colspan="2" class="pt-5 pb-5" style="border-bottom:solid 1px #d9d9d9;">${requestScope.nvo.notice_contents}</td>
				</tr>
			</table>
		</form>
		<div class="mt-3 mb-5 ">
			<span><button id="notice" type="button" class="white" style="height:35px;">목록</button></span>
		</div>
		
	</div>
</div>

<form name="noticeFrm">
	<input type="hidden" name="notice_code" value="${requestScope.nvo.notice_code}"/>
	<input type="hidden" name="fk_userid" value="${requestScope.nvo.fk_userid}"/>
	<input type="hidden" name="notice_subject" value="${requestScope.nvo.notice_subject}"/>
	<input type="hidden" name="notice_contents" value="${requestScope.nvo.notice_contents}"/>
</form>

<form name="ndelFrm">
	<input type="hidden" name="notice_code" value="${requestScope.nvo.notice_code}"/>
</form>

<jsp:include page="/WEB-INF/hyerin/footer.jsp"/> 