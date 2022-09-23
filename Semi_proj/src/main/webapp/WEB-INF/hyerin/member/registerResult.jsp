<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>가입완료</title>
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
		// 완료 버튼 클릭시 메인페이지로 이동하는 이벤트
		$("button#register_finish_btn").click(function(){
			location.href="<%= ctxPath%>/main.up";
		});

	});
</script>

</head>
<body>
	<div id="registerwrite_container" class="container-fluid row mt-5">
		<div class="col-3"></div>
		<div class="col-6">
			<table id="register_result_table" class="container mb-4">
					<tr>
						<td colspan="4" id="register_text">가입완료</td>
					</tr>
					<tr>
						<td colspan="4" class="register_result_text">
							<span>회원가입이 완료되었습니다.</span>
							<div>~님은 !회원이십니다.</div>
						</td>
					</tr>
					<tr>
						<td class="pt-4 pb-4">
							<div class="registermember_infobox py-4 px-4">
								<table width="100%">
									<tr >
										<td width="25%">아이디</td>
										<td>아이디</td>
									</tr>
									<tr>
										<td>이름</td>
										<td>이름</td>
									</tr>
									<tr>
										<td>이메일</td>
										<td>이메일</td>
									</tr>
								</table>
							</div>
						</td>				
					</tr>
					<tr>
						<td class="pb-4"><button type="button" id="register_finish_btn" class="register_finish_btn">완료</button></td>
					</tr>
					<tr>
						<td>
							<span class="coupon_subject">[신규회원]1만원 할인쿠폰</span>
							<div class="coupon_info">10,000원 할인</div>
							<div class="coupon_due">발급일로부터 30일 이내</div>
						</td>
					</tr>
					<tr>
						<td>
							<span class="coupon_subject">[신규회원]5% 할인쿠폰</span>
							<div class="coupon_info">5.0% 할인</div>
							<div class="coupon_due">발급일로부터 30일 이내</div>
						</td>
					</tr>
					<tr>
						<td class="pb-5">
							<span class="coupon_subject">[신규회원]무료배송 할인쿠폰</span>
							<div class="coupon_info">기본배송비 할인</div>
							<div class="coupon_due">발급일로부터 30일 이내</div>
						</td>
					</tr>
				</table>
		</div>
		<div class="col-3"></div>
	</div>
	
</body>
</html>