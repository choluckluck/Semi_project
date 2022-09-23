<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hyerin_style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI CSS-->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script>
	$(document).ready(function(){
		// 회원가입 버튼 클릭이벤트
		$("button#register_btn").click(function(){
			location.href="<%= ctxPath%>/hyerin/member/registerWrite.up";
		});
		
		
		// 취소 버튼 클릭이벤트
		$("button#reset_btn").click(function(){
			location.href="메인페이지뷰단";
		});
		
	});
	
</script>

</head>
<body>
	<div id="container" class="container-fluid">
		<div class="row mt-5">
			<div class="col-3"></div>
			<div class="col-6">
				<form name="agree_form">
					<table id="login" class="container">
						<tr>
							<td colspan="4" id="login_text">회원가입</td>
						</tr>
						<tr>
							<td colspan="4" id="Allagree">
								<input id="Allagree_chx" type="checkbox" class="agree_chx"/>
								<label for="Allagree_chx" class="font-weight-bold">전체동의</label>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pt-1">
								<table class="agreebox">
									<tr>
										<td colspan="2" class="pt-4 px-4">
											<input id="agree_1_chx" type="checkbox" class="agree_chx"/>
											<label for="agree_1_chx" class="font-weight-bold">이용약관 동의(필수)</label>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="pt-2 pb-4 px-3"><iframe id="agree_1" class="agree w-100" src="../../agreement/agree_1.html" height="300px"></iframe></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pt-3 pb-3">
								<table class="agreebox">
									<tr>
										<td colspan="2" class="pt-4 px-4">
											<input id="agree_2_chx" type="checkbox" class="agree_chx"/>
											<label for="agree_2_chx" class="font-weight-bold">개인정보 수집 및 이용(필수)</label>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="pt-2 pb-4 px-3"><iframe id="agree_2" class="agree w-100" src="../../agreement/agree_2.html" height="300px"></iframe></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="padding-top:20px;"><button type="button" id="register_btn" class="black" style="width:100%">회원가입</button></td>
						</tr>
						<tr>
							<td colspan="4"><button type="reset" id="reset_btn" class="white mb-5" style="width:100%;">취소</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
</body>
</html>