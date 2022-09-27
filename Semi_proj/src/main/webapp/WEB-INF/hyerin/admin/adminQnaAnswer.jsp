<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>문의답변</title>

	<%-- Bootstrap CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<%-- Font Awesome 5 Icons --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<%-- 직접 만든 CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hyerin_style.css" />
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/main_style.css" />
	
	<!-- CSS -->
    <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2209081131">
    <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2209081131">
	
	
	<%-- Optional JavaScript --%>
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>
	
	<%-- jQueryUI CSS--%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
	<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
	<script>
		$(document).ready(function(){
			
			
			
		});
	</script>
	
</head>
<body>
	<div class="row container-fluid mt-5" style="margin:0; padding:0;">
		<div class="col-1"></div>
		<div id="contents" class="col-10">
			<form id="qnaAnswer_form" name="qnaAnswer_form">
				<div style="font-weight:bold;">문의답변</div>	
				<table id="notice_write" class="table table-condensed mt-4" style="font-size:10pt;">
					<tr>
						<td class="col-1 align-middle">제목</td>
						<td class="col-11"><input name="subject" type="text" class="form-control" placeholder="제목을 입력하세요"/></td>
					</tr>
					<tr>
						<td colspan="2" class="clear">
							<textarea id="answer_contents" class="form-control w-100" style="height:300px;"></textarea>
			            </td>
	           		</tr>
				</table>
			</form>
			<div class="my-2">
				<span><button id="qnaAnswer_reset" type="reset" class="float-right mr-2 white" style="height:40px;">취소</button></span>
				<span><button id="qnaAnswer_submit" type="button" class="float-right mr-2 black" style="height:40px;">등록</button></span>
			</div>
		</div>
		<div class="col-1"></div>
	</div>
</body>
</html>