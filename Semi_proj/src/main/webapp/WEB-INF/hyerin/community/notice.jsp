<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//글쓰기 글씨 클릭 이벤트
		$("button#notice_write").click(function(){
			const frm = document.notice_form;
			frm.action="<%= ctxPath%>/hyerin/community/noticeWrite.up";
			frm.method = "get";
			frm.submit();
		});
		
		//커뮤니티사이드바_공지사항 클릭 이벤트
		$("div#sidebar_notice").click(function(){
			location.href="<%= ctxPath%>/hyerin/community/notice.up";
		});
		
		
		// 타이틀 => 게시글 클릭이벤트
		$("tbody > tr > td:nth-child(2)").click(function(){
			
		});
		
	});
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/community/communitySidebar.jsp" />
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
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">10</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">9</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">8</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">7</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">6</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">5</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">4</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">3</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">2</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
					<tr>
						<td height="50px" class="text-center notice_td" style="border-bottom: solid 1px #d9d9d9">1</td>
						<td style="border-bottom: solid 1px #d9d9d9">Title</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Writer</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Date</td>
						<td class="text-center" style="border-bottom: solid 1px #d9d9d9">Hits</td>
					</tr>
				</tbody>
			</table>
		</form>
		<div style="text-align:right;" class="my-5"><button type="button" id="notice_write" class="black" style="width:150px; height:40px;">글쓰기</button></div>
		<nav aria-label="Page navigation">
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