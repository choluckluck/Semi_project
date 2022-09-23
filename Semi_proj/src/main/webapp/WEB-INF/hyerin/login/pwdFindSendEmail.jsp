<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//임시비밀번호전송 버튼 클릭이벤트
		$("button#pwdfind_send_email").click(function(){
			location.href="<%= ctxPath%>/hyerin/login/pwdFindResult.up";
			
			/* const frm = document.idfind_form;
			frm.action = "pwdFindResult.up";
			frm.method = "post";
			frm.submit(); */
		});
		
		//취소 버튼 클릭이벤트
		$("button#pwdfind_cancel").click(function(){
			location.href="<%= ctxPath%>/main.up";
		});
		
	});
	
</script>

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-3"></div>
	<div class="col-6">
		<table id="idfindResult_table" class="container mb-5">
			<tr>
				<td colspan="4" id="idfind_text">
					<div>비밀번호 찾기</div>
				</td>
			</tr>
			<tr>
				<td width="25%">임시 비밀번호</td>
				<td>
					<input type="radio" id="pwdfind_email" value="email" class="agree_radio" checked/>
					<label for="pwdfind_email">이메일</label>
				</td>
			</tr>
			<tr>
				<td class="align-baseline">이메일</td>
				<td class="pb-5">!이메일</td>
			</tr>
			<tr>
				<td colspan="2" class="pt-2 pb-2"><button type="button" id="pwdfind_send_email" class="black w-100">임시 비밀번호 전송</button></td>
			</tr>
			<tr>
				<td colspan="2" class="pb-3"><button type="button" id="pwdfind_cancel" class="white w-100">취소</button></td>
			</tr>
		</table>
	</div>
	<div class="col-3"></div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>