<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품수정</title>

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
</head>
<body>
	<div class="row container-fluid">
		<div class="col-1"></div>
		<div id="contents" class="col-10">
			<form name="admin_productRegister_frm">
				<table id="register_table" class="container register_table">
					<tr>
						<td colspan="4" id="register_text">상품수정</td>
					</tr>
					<tr>
						<td colspan="4" id="necessary_index" class="text-right">
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline pt-2">
							상품종류
						</td>
						<td>
							<select id="product_kind" class="register_phoneselect">
								<option value="all" selected>전체</option>
								<option value="종류">종류..</option>
							</select>
							<div id="id_warning" class="register_warning">상품종류를 선택해주세요.</div>
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline pt-2">
							상품명
						</td>
						<td>
							<input type="text" name="member_id" class="register_input w-100"/>
							<div id="id_approval" class="register_approval">!상품명 는 사용가능한 상품명입니다.</div>
							<div id="id_warning" class="register_warning">상품명을 입력해주세요.</div>
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline pt-2">
							굽높이
						</td>
						<td>
							<select id="product_high" class="register_phoneselect">
								<option value="all" selected>전체</option>
								<option value="종류..">종류..</option>
							</select>
							<div id="id_warning" class="register_warning">굽높이를 선택해주세요.</div>
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline">색상</td>
						<td class="align-middle">
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">색상1</label>
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">색상1</label>
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">색상1</label>
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">색상1</label>
							<input type="checkbox" id="female" name="gender" value="female" class="agree_radio">
							<label for="female">색상2</label>
							<div id="id_warning" class="register_warning">색상을 선택해주세요.</div>
						</td>
						
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline">사이즈</td>
						<td class="align-middle">
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">사이즈1</label>
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">사이즈1</label>
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">사이즈1</label>
							<input type="checkbox" id="male" name="gender" value="male" class="agree_radio">
							<label for="male" class="mr-5">사이즈1</label>
							<input type="checkbox" id="female" name="gender" value="female" class="agree_radio">
							<label for="female">사이즈2</label>
							<div id="id_warning" class="register_warning">사이즈를 선택해주세요.</div>
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline pt-2">
							가격
						</td>
						<td>
							<input type="text" name="member_id" class="register_input w-100"/>
							<div id="id_warning" class="register_warning">가격을 입력해주세요.</div>
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline pt-2">
							재고수량
						</td>
						<td>
							<input type="text" name="member_id" class="register_input w-100"/>
							<div id="id_warning" class="register_warning">재고수량을 입력해주세요.</div>
						</td>
					</tr>
					<tr>
						<td width="15%" class="font-weight-bold align-baseline pt-2">
							이미지
						</td>
						<td class="pt-2">
							<input type="file" name="member_id" class="w-100"/>
							<div id="id_warning" class="register_warning">이미지 파일을 첨부해주세요.</div>
						</td>
					</tr>
					<tr>
						<td colspan="2" class="pt-5 pb-2"><button type="button" id="join_btn" class="black" style="width:100%;">등록</button></td>
					</tr>
					<tr>
						<td colspan="2" class="pb-5"><button type="button" id="cancel_btn" class="white" style="width:100%;">취소</button></td>
					</tr>
				</table>
			</form>
		</div>
		<div class="col-1"></div>
	</div>
</body>
</html>