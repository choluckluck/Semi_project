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
		$("button#notice_write").click(function(){
			const frm = document.notice_form;
			frm.action="<%= ctxPath%>/heajun/community/noticeWrite.sue";
			frm.method = "get";
			frm.submit();
		});
		
		//커뮤니티사이드바_공지사항 클릭 이벤트
		$("div#sidebar_notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		
		// 타이틀 => 게시글 클릭이벤트
		 $("td#notice_num").click(function(){
			   var notice_code = $(this).next().next().next().next().next().text();	
			   location.href="<%=ctxPath%>/heajun/community/noticeView.sue?notice_code="+notice_code; 
		   });
		   $("td#notice_subject").click(function(){
			   var notice_code = $(this).next().next().next().next().text();	
			   location.href="<%=ctxPath%>/heajun/community/noticeView.sue?notice_code="+notice_code; 
		   });
		   $("td#fk_userid").click(function(){
			   var notice_code = $(this).next().next().next().text();	
			   location.href="<%=ctxPath%>/heajun/community/noticeView.sue?notice_code="+notice_code; 
		   });
		   $("td#notice_registerday").click(function(){
			   var notice_code = $(this).next().text();	
			   location.href="<%=ctxPath%>/heajun/community/noticeView.sue?notice_code="+notice_code; 
		   });
		   $("td#notice_count").click(function(){
			   var notice_code = $(this).next().next().text();	
			   location.href="<%=ctxPath%>/heajun/community/noticeView.sue?notice_code="+notice_code; 
		   });
		  
		   
		
	});
</script>

<div class="row container-fluid mt-5">
<jsp:include page="/WEB-INF/heajun/community/communitySidebar.jsp" />
	<div id="contents" class="col-9 ml-5">
		<form name="notice_form">
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
		</form>
		<div style="text-align:right;" class="my-5"><button type="button" id="notice_write" class="black" style="width:150px; height:40px; href="<%=ctxPath%>/heajun/community/noticeWrite.sue">글쓰기</button></div>
		<nav aria-label="Page navigation">${requestScope.pageBar}
		  <ul class="pagination justify-content-center pagination-sm my-5">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link" href="#">1</a></li>
		    <li class="page-item"><a class="page-link" href="#">2</a></li>
		    <li class="page-item"><a class="page-link" href="#">3</a></li>
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>
</div>
 <jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include> 