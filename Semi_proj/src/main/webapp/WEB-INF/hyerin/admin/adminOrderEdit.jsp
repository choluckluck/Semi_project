<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주문수정</title>

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
	</style>
</head>
<body>
	<div class="row container-fluid" align="center" style="margin:0; padding:0;">
		<div id="contents" class="col-12">
			<form name="admin_productRegister_frm">
				<table id="register_table" class="container register_table">
					<tr>
						<td colspan="2" id="register_text" class="pt-5">주문정보</td>
						<td colspan="2" id="register_text" class="pt-5">배송정보</td>
					</tr>
					<tr>
						<td colspan="4" id="necessary_index" class="text-right"></td>
					</tr>
					<tr>
						<td width="20%" class="font-weight-bold align-baseline  ">주문번호</td>
						<td width="30%">!주문번호</td>
						<td rowspan="2" width="20%" class="font-weight-bold align-baseline  ">
							배송주소
							<div><button id="delivery_addressEdit" type="button" class="white" style="height:25px; width:40%;">변경</button></div>
						</td>
						<td rowspan="2" width="30%" class="font-weight-bold align-baseline  ">!배송주소</td>
					</tr>
					<tr>
						<td width="20%" class="font-weight-bold align-baseline">주문일자</td>
						<td width="30%">!주문일자</td>
					</tr>
					<tr>
						<td width="20%" class="font-weight-bold align-baseline">주문자</td>
						<td width="30%">!주문자</td>
						<td width="20%" class="font-weight-bold align-baseline">연락처</td>
						<td width="30%">!연락처</td>
					</tr>
					<tr>
						<td width="20%" class="font-weight-bold align-baseline">주문상태</td>
						<td width="30%">
							<select class="mt-1 mr-2 productOrder_sort">
								<option value="productOrder_confirm">입금대기</option>
								<option value="productOrder_confirm">입금확인요청</option>
								<option value="productOrder_confirm">결제확인</option>
								<option value="productOrder_prepare">상품준비중</option>
								<option value="productOrder_delivery_ing">배송중</option>
								<option value="productOrder_delivery_complete">배송완료</option>
								<option value="productOrder_cancel">취소</option>
								<option value="productOrder_exchange">교환</option>
								<option value="productOrder_return">반품</option>
							</select>
						</td>
						<td width="20%" class="font-weight-bold align-baseline">택배회사</td>
						<td width="30%">!택배회사</td>
					</tr>
					<tr>
						<td width="20%" class="font-weight-bold align-baseline">인증전화번호</td>
						<td width="30%">!인증전화번호</td>
						<td width="20%" class="font-weight-bold align-baseline">운송장번호</td>
						<td width="30%">!운송장번호</td>
					</tr>
					<tr>
						<td colspan="4" id="register_text" class="pt-5">결제정보</td>
					</tr>
					<tr>
						<td colspan="4" id="necessary_index" class="text-right"></td>
					</tr>
					<tr>
						<td width="20%" class="font-weight-bold align-baseline">주문금액</td>
						<td width="30%">!주문금액</td>
						<td width="20%" class="font-weight-bold align-baseline">배송비</td>
						<td width="30%">!배송비</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</body>
</html>