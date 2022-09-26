<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	form[name='member_search_form']{
		float:right;
	}
	
	#product_search{
		border: none;
		border-bottom: solid 1px black;
	}
	
	#admin_member_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
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
		float: right;
		width:150px;
		height:40px;
	}
</style>

<script>
	$(document).ready(function(){
		
	});

</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="member">
			<div style="font-weight:bold;">
				<span class="mr-3 mt-1" style="font-size:20pt;">회원관리</span>
				<span id="member_sort" class="pt-1">
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
							<th width="5%" height="50px" class="admin_member_th text-center">아이디</th>
							<th width="15%" class="admin_member_th text-center">회원명</th>
							<th width="10%" class="admin_member_th text-center">이메일</th>
							<th width="20%" class="admin_member_th text-center">성별</th>
							<th width="10%" class="admin_member_th text-center">수정</th>
							<th width="10%" class="admin_member_th text-center">삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="160px" class="admin_member_tbody text-center"><input type="checkbox" id="product_1" name="member_chx"/></td>
							<td height="160px" class="admin_member_tbody text-center">!상품코드</td>
							<td class="text-center admin_member_tbody"><img id="admin_product_img_1" height="150px" src="<%= ctxPath%>/images/hyerin/best_img_3.jpg"></td>
							<td class="text-center admin_member_tbody">!상품 분류</td>
							<td class="text-center admin_member_tbody">!상품명</td>
							<td class="text-center admin_member_tbody">!상품 가격</td>
							<td class="text-center admin_member_tbody">!상품 수량</td>
							<td class="text-center admin_member_tbody"><button id="admin_productRevise_btn" type="button" class="white" style="height:30px;">수정</button></td>
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