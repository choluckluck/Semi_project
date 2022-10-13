<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//확인버튼 클릭이벤트
		$("button#pwdfind_submit").click(function(){
			
			if ($("#pwdfind_id").val().trim() == ""){
				alert("이름을 입력해 주세요!");
				return false;
			}
			
			if ($("#pwdfind_name").val().trim() == ""){
				alert("이름을 입력해 주세요!");
				return false;
			}

			
			if ($("#pwdfind_email").val().trim() == ""){
				alert("이메일을 입력해 주세요!");
				return false;
			}
			else {
				const email = $("#pwdfind_email").val().trim();
				const regExp = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
				const bool = regExp.test(email);
				
				if(!bool) { //정규 표현식에 위배된 경우	
					alert("올바른 이메일 형식을 입력해 주세요!");
					return false;
				}
			}
	
			const frm = document.pwdfind_form;
			frm.action = "pwdFindResult.sue";
			frm.method = "post";
			frm.submit(); 
		});
		
		//취소버튼 클릭이벤트
		$("button#pwdfind_cancel").click(function(){
			location.href="<%= ctxPath%>/main.sue";
		});
		
	});
	
</script>

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-4"></div>
	<div class="col-4">
		<form name="pwdfind_form">
			<table id="pwdfind_table" class="container mb-5">
				<tr>
					<td colspan="4" id="pwdfind_text" class="pb-4">비밀번호 찾기</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="pwdfind_id" name="userid" class="pwdfind_input_text" placeholder="아이디"/>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="pwdfind_name" name="name" class="pwdfind_input_text" placeholder="이름"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" id="pwdfind_email" name="email" class="pwdfind_input_text" placeholder="abc@naver.com"/>
					</td>
				</tr>			
				<tr>
					<td colspan="5" class="pt-4"><button type="button" id="pwdfind_submit" name="pwdfind_submit" class="black w-100">확인</button></td>
				</tr>
				<tr>
					<td colspan="2" class="pb-3"><button type="button" id="pwdfind_cancel" class="white w-100">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-3"></div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>