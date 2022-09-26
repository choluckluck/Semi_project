<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
    
<script>
	$(document).ready(function(){
		
		//위쪽 화살표는 안보인다
		$("#up_arrow").hide();
		//$(".admin_product_sub").hide();
		
		// 상품관리 글자 클릭이벤트
		$("#admin_proudct").click(function(){
			$("#up_arrow").toggle();
			$("#down_arrow").toggle();
			$(".admin_product_sub").toggle();
		});
		 
		
		
		
	});
</script>
<style>
	a, a:hover {
		text-decoration: none;
		color: gray;
	}
	.admin_product_sub{
		margin-left: 15px;
	}
	
	.arrow, #admin_proudct:hover{
		cursor: pointer;
	}
	
	
	
</style>
<div id="sidebar" class="col-2 pl-5 pl-2">
	<div id="sidebar_admin" style="font-weight: bold; font-size:25px;">관리자</div>
	<div id="sidebar_admin_product" class="mt-4" style="color:gray; font-size:11pt;">
		<span id="admin_proudct">
			<a>상품 관리</a>
			<span class="ml-1 arrow"><img id="down_arrow" src="<%= ctxPath %>/images/hyerin/downnarrow.png" width="10px"/></span>
			<span class="arrow"><img id="up_arrow" src="<%= ctxPath %>/images/hyerin/uparrow.png" width="10px"/></span>
		</span>
		<div class="admin_product_sub mt-3"><a href="<%= ctxPath %>/hyerin/admin/adminProductList.up">상품목록</a></div>
		<div class="admin_product_sub mt-2"><a href="<%= ctxPath %>/hyerin/admin/adminProductRegister.up">상품등록</a></div>
		<div class="admin_product_sub mt-2 mb-1"><a href="<%= ctxPath %>/hyerin/admin/adminProductReview.up">상품리뷰</a></div>
	</div>
	<div id="sidebar_admin_order" class="mt-4" style="color:gray; font-size:11pt;"><a href="<%= ctxPath %>/hyerin/admin/adminOrder.up">주문 관리</a></div>
	<div id="sidebar_admin_member" class="mt-4" style="color:gray; font-size:11pt;"><a href="<%= ctxPath %>/hyerin/admin/adminMember.up">회원 관리</a></div>
	<div id="sidebar_admin_member" class="mt-4" style="color:gray; font-size:11pt;"><a href="<%= ctxPath %>/hyerin/admin/adminQna.up">문의 관리</a></div>
	<hr style="margin-top: 125px;">
	<div class="sidebar_info" style="font-size:8pt;" ><span class="font-weight-bold">평일</span>10:00 - 18:00 / <span class="font-weight-bold">점심</span>12:00-13:00</div>
	<div class="sidebar_info" style="font-size:8pt;"><span class="font-weight-bold">주말, 공휴일 휴무</span></div>
</div>