<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 보기</title>

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
	
	
	<script>
		$(document).ready(function(){
			
			
			
		});//end of ready
	
		
		//문자를 전송해주는 함수
		function msgSend(){
			
			
		}//end of msgSend
	</script>
</head>
<body>
	<div id="registerwrite_container" class="container-fluid row mt-5">
		<div class="col-1"></div>
		<div class="col-10">
			<form name="registerForm">
				<table id="register_table" class="container register_table">
						<tr>
							<td colspan="4" id="register_text">회원정보보기</td>
						</tr>
						<tr>
							<td colspan="4" id="necessary_index" class="text-right">
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline w-25 pt-2">
								아이디
							</td>
							<td>
								${requestScope.mvo.userid}
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								이름 
							</td>
							<td>
								${requestScope.mvo.name}
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								주소 
							</td>
							<td>
								<span>${requestScope.mvo.address}</span>
								<span>${requestScope.mvo.detailaddress}</span>
								<span>${requestScope.mvo.extraaddress}</span>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								휴대전화
							</td>
							<td>
								${requestScope.mvo.mobile }
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								이메일 
							</td>
							<td>
								${requestScope.mvo.email}
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								마케팅 수신동의
							</td>
							<td class="pt-2">
								<c:if test="${requestScope.mvo.marketing_yn == 0 }">
									<input type="checkbox" id="agree_sms" class="agree_chx pt-4" disabled/>
									<label for="agree_sms" class="mr-5">SMS</label>
									<input type="checkbox" id="agree_email" class="agree_chx pt-4" disabled/>
									<label for="agree_email">이메일</label>
								</c:if>
								<c:if test="${requestScope.mvo.marketing_yn == 1 }">
									<input type="checkbox" id="agree_sms" class="agree_chx pt-4" checked disabled/>
									<label for="agree_sms" class="mr-5">SMS</label>
									<input type="checkbox" id="agree_email" class="agree_chx pt-4" disabled/>
									<label for="agree_email">이메일</label>
								</c:if>
								<c:if test="${requestScope.mvo.marketing_yn == 2 }">
									<input type="checkbox" id="agree_sms" class="agree_chx pt-4"  disabled/>
									<label for="agree_sms" class="mr-5">SMS</label>
									<input type="checkbox" id="agree_email" class="agree_chx pt-4" checked disabled/>
									<label for="agree_email">이메일</label>
								</c:if>
								<c:if test="${requestScope.mvo.marketing_yn == 3 }">
									<input type="checkbox" id="agree_sms" class="agree_chx pt-4" checked disabled/>
									<label for="agree_sms" class="mr-5">SMS</label>
									<input type="checkbox" id="agree_email" class="agree_chx pt-4" checked disabled/>
									<label for="agree_email">이메일</label>
								</c:if>
							</td>
						</tr>
					</table>
					
					<hr style="border: none; background-color: black; height:1px;">
					
					<table id="register_table_2" class="container register_table mb-5">
						<tr>
							<td class="font-weight-bold align-baseline w-25">성별</td>
							<td class="align-middle">
								<c:if test="${requestScope.mvo.gender == '1'}">
									남
								</c:if>
								<c:if test="${requestScope.mvo.gender == '2'}">
									여
								</c:if>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">생년월일</td>
							<td>
								${requestScope.mvo.birthday}
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">회원등급</td>
							<td>
								${requestScope.mvo.grade_code}
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">은행</td>
							<td>
								<span class="font-weight-bold">은행명 : </span>
								<span class="mr-2">${requestScope.mvo.bank_name}</span>
								<span class="font-weight-bold">예금주 : </span>
								<span class="mr-2">${requestScope.mvo.account_name}</span>
								<span class="font-weight-bold">계좌번호 : </span>
								<span class="mr-2">${requestScope.mvo.account}</span>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">가입일자</td>
							<td>
								${requestScope.mvo.registerday}
							</td>
						</tr>
						<tr class="pb-5">
							<td class="font-weight-bold align-baseline">문자전송</td>
							<td>
								<textarea class="register_input w-100" style="height:100px;" ></textarea>
								<button type="button" id="join_btn" class="black" style="width:100%;" onclick="sendMessage();">전송</button>
							</td>
						</tr>
						<tr>
							<td colspan="2" class="pb-5"><button type="button" id="cancel_btn" class="white" style="width:100%;" onclick="window.close()">닫기</button></td>
						</tr>
					</table>
			</form>
		</div>
		<div class="col-1"></div>
	</div>
</body>
</html>