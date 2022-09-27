<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	
	#member_searchInfo_container{
		float:right;
	}
	
	#product_search{
		border: none;
		border-bottom: solid 1px black;
		font-size: 10pt;
	}
	
	#admin_member_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
		font-size: 10pt;
	}
	
	.admin_member_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom: solid 1px black;
	}
	
	.admin_member_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#admin_member_btn{
		float:right;
		width:150px;
		height:40px;
	}
</style>

<script>
	$(document).ready(function(){
		
	});
	
	function member_edit(){
		// 나의 정보 수정하기 팝업창 띄우기
		const url = "<%= ctxPath%>/hyerin/admin/adminMemberEdit.sue";
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "memberEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	}
	
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="member">
			<span class="mr-3 mt-1" style="font-size:20pt; font-weight:bold;">회원관리</span>
			<div id="member_searchInfo_container">
				<span id="member_sort" class="pt-1 mr-2">
					<select id="admin_member_sort" class="mt-1">
						<option value="latest" selected>전체선택</option>
						<option value="order_quantity">아이디</option>
						<option value="product_kind">회원명</option>
						<option value="product_kind">이메일</option>
					</select>
				</span>
				<form name="member_search_form" class="mt-2" style="display:inline-block;">
					<input type="text" id="product_search" name="product_search" placeholder="검색"/>
					<button type="button" id="product_search_btn" name="product_search_btn" style="border:none; background-color: transparent;">
						<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
					</button>
				</form>
			</div>
			<form name="admin_member_frm">
				<table id="admin_member" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
					<thead>
						<tr>
							<th width="5%" height="50px" class="admin_member_th text-center"><input type="checkbox" id="productAll" name="member_chx"/></th>
							<th width="5%" class="admin_member_th text-center">아이디</th>
							<th width="15%" class="admin_member_th text-center">회원명</th>
							<th width="10%" class="admin_member_th text-center">이메일</th>
							<th width="20%" class="admin_member_th text-center">성별</th>
							<th width="10%" class="admin_member_th text-center">수정</th>
							<th width="10%" class="admin_member_th text-center">삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="70px" class="admin_member_tbody text-center"><input type="checkbox" id="product_1" name="member_chx"/></td>
							<td class="admin_member_tbody text-center">!아이디</td>
							<td class="text-center admin_member_tbody">!회원명</td>
							<td class="text-center admin_member_tbody">!이메일</td>
							<td class="text-center admin_member_tbody">!성별</td>
							<td class="text-center admin_member_tbody"><button id="admin_productRevise_btn" type="button" class="white" style="height:30px;" onclick="member_edit();">수정</button></td>
							<td class="text-center admin_member_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="height:30px;">삭제</button></td>
						</tr>
					</tbody>
				</table>
				<div class="mt-3">
					<span><button type="button" id="" class="black" style="height:30px;">선택삭제</button></span>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>