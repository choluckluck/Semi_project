<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
    
<%
    String ctxPath = request.getContextPath();
%>

 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script>
	$(document).ready(function(){
	
		//글쓰기 글씨 클릭 이벤트
		$("button#noticeWrite").click(function(){
			const frm = document.noticeFrm;
			frm.action="noticeWrite.sue";
			frm.method = "get";
			frm.submit();
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
		
		<form name="noticeFrm">
			<div style="font-weight:bold;">NOTICE</div>	
			<table id="notice_list" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
				<thead>
					<tr>
						<th width="15%" height="50px" class="notice_th text-center" style="font-weight:normal; border-top:solid 1px black; border-bottom: solid 1px black ">No</th>
						<th width="45%" class="notice_th" style="text-align:center; font-weight:normal; border-top:solid 1px black; border-bottom: solid 1px black">Title</th>
						<th width="15%" class="notice_th text-center" style="font-weight:normal; border-top:solid 1px black; border-bottom: solid 1px black">Writer</th>
						<th width="15%" class="notice_th text-center" style="font-weight:normal; border-top:solid 1px black; border-bottom: solid 1px black">Date</th>
						<th width="10%" class="notice_th text-center" style="font-weight:normal; border-top:solid 1px black; border-bottom: solid 1px black">Hits</th>
					</tr>
				</thead>
				
				 <tbody id="notice_tbody">
		         <c:forEach var="nvo" items="${requestScope.notice}">
		            <tr>
						<td id="notice_code" height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">${nvo.notice_code}</td>
						<td id="notice_subject" style="border-bottom: solid 1px #d9d9d9">${nvo.notice_subject}</td>
						<td id="fk_userid" class="text-center" style="border-bottom: solid 1px #d9d9d9">${nvo.fk_userid}</td>
						<td id="notice_count" class="text-center" style="border-bottom: solid 1px #d9d9d9">${nvo.notice_count}</td>
						<td id="notice_registerday" class="text-center" style="border-bottom: solid 1px #d9d9d9">${nvo.notice_registerday}</td>
					</tr>
			         </c:forEach>
			     </tbody>
			     
		    
			</table>
		
		
			<nav class="my-5">
		    	<div style="display: flex; width: 80%">
		    		<ul class="pagination" style="margin: auto">${requestScope.pageBar}</ul>
		    	</div>
            </nav>
		
		</form>
		
	</div>
</div>
 <jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include> 