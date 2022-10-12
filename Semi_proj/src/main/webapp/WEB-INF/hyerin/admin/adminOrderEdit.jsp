<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문더보기</title>

	<%-- Bootstrap CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<%-- Font Awesome 5 Icons --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<%-- 직접 만든 CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hyerin_style.css" />
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/main_style.css" />
	
	<%-- Optional JavaScript --%>
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	
	<%-- jQueryUI CSS--%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
	<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
	
	<style>
		.productOrder_sort{
			border: solid 1px #d9d9d9;
			height: 30px;
			font-size: 10pt;
		}
		
		.userid:hover{
			cursor: pointer;
			text-decoration: underline;
		}
		
	</style>
	<script>
		$(document).ready(function(){
			
			const orderstateVal = "${requestScope.ovo.fk_order_state_name}";
			
			$("#fk_order_state_name").val(orderstateVal).prop("selected", true);
			
			
			//모달 사용
			var myModal = document.getElementById('myModal')
			var myInput = document.getElementById('myInput')

			myModal.addEventListener('shown.bs.modal', function () {
			  myInput.focus()
			})
			
			
		});//end of ready
	
	/////////////////////////////////////////////////////////////////////////////////////
	
	// function declaration
	function updateOrderState(){
		
		const frm = document.adminOrderEdit_frm;
		frm.action = "adminOrderEdit.sue";
		
		var updateval = $("#fk_order_state_name").val();
		
		
		if(updateval == "입금전"){$("#orderstate").val("1");}
		if(updateval == "결제확인"){$("#orderstate").val("2");}
		if(updateval == "상품준비중"){$("#orderstate").val("3");}
		if(updateval == "배송중"){$("#orderstate").val("4");}
		if(updateval == "배송완료"){$("#orderstate").val("5");}
		if(updateval == "취소"){$("#orderstate").val("6");}
		if(updateval == "교환"){$("#orderstate").val("7");}
		if(updateval == "반품"){$("#orderstate").val("8");}

		frm.method = "post";
		frm.submit();	
		
	}//end of updateOrderState
	
	
	//유저아이디를 클릭하면 유저에 대한 정보가 보이는 모달창
	
		
	
	</script>
</head>
<body>
	<form name="adminOrderEdit_frm">
		<input type="hidden" name="order_code" value="${requestScope.ovo.order_code}"/>
		<input type="hidden" id="orderstate" name="fk_order_state_name" value="0"/>
		<div class="row container-fluid" align="center" style="margin:0; padding:0;">
			<div class="col-1"></div>
			<table id="register_table" class="col-10 register_table">
				<tr>
					<td colspan="2" id="register_text" class="pt-5">주문정보</td>
					<td colspan="2" id="register_text" class="pt-5">결제정보</td>
				</tr>
				<tr>
					<td colspan="4" id="necessary_index" class="text-right"></td>
				</tr>
			</table>
			<div class="col-1"></div>
			<div class="col-1"></div>
			<table id="register_table" class="col-5 register_table">
				<tr>
					<td width="20%" class="font-weight-bold align-baseline">주문번호</td>
					<td width="30%">${requestScope.ovo.order_code}</td>
				</tr>
				<tr>
					<td width="20%" class="font-weight-bold align-baseline">주문일자</td>
					<td width="30%">${requestScope.ovo.orderdate }</td>
				</tr>
				<tr>
					<td width="20%" class="font-weight-bold align-basel	ine">아이디</td>
					<td width="30%">
						<button type="button" style="border:none; background-color:white; padding-left:0;">${requestScope.ovo.mvo.userid }</button></td>
				</tr>
				<tr>
					<td width="20%" class="font-weight-bold align-baseline">이름</td>
					<td width="30%">${requestScope.ovo.mvo.name }</td>
				</tr>
				<tr>
					<td width="20%" class="font-weight-bold align-baseline">연락처</td>
					<td width="30%">${requestScope.ovo.mvo.mobile }</td>
				</tr>
				<tr>
					<td width="20%" class="font-weight-bold align-baseline">주문상태</td>
					<td width="30%">
						<select id="fk_order_state_name" class="mt-1 mr-2 productOrder_sort">
							<option value="입금전">입금전</option>
							<option value="결제확인">결제확인</option>
							<option value="상품준비중">상품준비중</option>
							<option value="배송중">배송중</option>
							<option value="배송완료">배송완료</option>
							<option value="취소">취소</option>
							<option value="교환">교환</option>
							<option value="반품">반품</option>
						</select>
					</td>
					<td class="pt-1"><button type="button" class="black" style="width:60px; height: 30px;" onclick="updateOrderState();">적용</button></td>
				</tr>
				<tr>
					<td colspan="4"></td>
				</tr>
			</table>
			<table id="register_table" class="col-5 register_table" style="height:20px;">
				<tr>
					<td width="10%" class="font-weight-bold align-baseline">총주문금액</td>
					<td width="20%"><fmt:formatNumber value="${requestScope.ovo.total_order_amount}" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td width="10%" class="font-weight-bold align-baseline">포인트사용액</td>
					<td width="20%"><fmt:formatNumber value="${requestScope.ovo.point_use_amount}" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td width="10%" class="font-weight-bold align-baseline">상품할인금액</td>
					<td width="20%"><fmt:formatNumber value="${requestScope.ovo.discount_amount}" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td width="10%" class="font-weight-bold align-baseline">배송비</td>
					<td width="20%"><fmt:formatNumber value="${requestScope.ovo.delivery_fee}" pattern="#,###"/>원</td>
				</tr>
				<tr>
					<td width="10%" class="font-weight-bold align-baseline">실결제금액</td>
					<td width="20%"><fmt:formatNumber value="${requestScope.ovo.real_amount}" pattern="#,###"/>원</td>
				</tr>
			</table>
			<div class="col-1"></div>
			<div class="col-1"></div>
			<table id="register_table" class="register_table col-10 mb-5" style="clear:both;">
				<tr>
					<td colspan="6" id="register_text" class="pt-5">주문상세정보</td>
				</tr>
				<tr>
					<td colspan="6" id="necessary_index" class="text-right"></td>
				</tr>
				<c:forEach var="odvo" items="${requestScope.odvoList}">
					<tr>
						<td rowspan="4" class="pr-2" style="width:20%;">
						<div>
							<img src="<%= ctxPath%>/images/product/${odvo.pvo.prod_image}" width="100px"/>
						</div>
						<div>
							${odvo.order_detail_code}
						</div>
						</td>
					</tr>
					<tr style="height:30px">
						<td class="font-weight-bold align-baseline" style="width:10%;" >상품정보</td>
						<td class="align-baseline">${odvo.fk_prod_code} : ${odvo.pvo.prod_name}</td>
					</tr>
					<tr style="height:30px">
						<td class="font-weight-bold align-baseline">구매옵션</td>
						<td class="align-baseline">${odvo.fk_prod_color} / ${odvo.fk_prod_size} / 정가 <fmt:formatNumber value="${odvo.order_price}" pattern="#,###"/>원 / ${odvo.order_buy_count}개</td>
					</tr>
					<tr class="mb-2" style="height:30px">
						<td class="font-weight-bold align-baseline">총구매가격</td>
						<td class="align-baseline"> <fmt:formatNumber value="${odvo.oneDetailPrice}" pattern="#,###"/>원</td>
					</tr>
					<tr>
						<td colspan="6" style="border-top: solid 1px #d9d9d9;"></td>
					</tr>
				</c:forEach>
				
			</table>
			<div class="col-1"></div>
		</div>
		
		<div class="modal" tabindex="-1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">Modal title</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		        <p>Modal body text goes here.</p>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
		        <button type="button" class="btn btn-primary">Save changes</button>
		      </div>
		    </div>
		  </div>
		</div>
	</form>
</body>
</html>