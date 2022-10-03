<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String ctxPath = request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우리꺼~~</title>

<script>

	window.onload = function(){
		
		alert("회원가입이 완료되었습니다. 감사합니다.");
		
		const frm = document.loginFrm;
		frm.action = "<%= ctxPath%>/main.sue";
		frm.method = "POST";
		frm.submit();
		
	};
	
</script>

</head>
<body> 
	<form name='loginFrm'>
		<input type="hidden" name="userid" value="${requestScope.userid}"/>
		<input type="hidden" name="pwd" value="${requestScope.pwd}"/>
	</form>
</body>
</html>