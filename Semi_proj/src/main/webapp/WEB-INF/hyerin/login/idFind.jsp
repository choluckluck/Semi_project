<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){

		//확인버튼 클릭이벤트
		$("button#idfind_submit").click(function(){
			
			if ($("#idfind_name").val().trim() == ""){
				alert("이름을 입력해 주세요!");
				return false;
			}

			
			if ($("#idfind_email").val().trim() == ""){
				alert("이메일을 입력해 주세요!");
				return false;
			}
			else {
				const email = $("#idfind_email").val().trim();
				const regExp = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
				const bool = regExp.test(email);
				
				if(!bool) { //정규 표현식에 위배된 경우	
					alert("올바른 이메일 형식을 입력해 주세요!");
					return false;
				}
			}
			
			location.href="<%= ctxPath%>/hyerin/login/idFindResult.sue";
			
			const frm = document.idfind_form;
			frm.action = "idFindResult.sue";
			frm.method = "post";
			frm.submit(); 
		});
		
		
		//취소버튼 클릭이벤트
		$("button#idfind_cancel").click(function(){
			location.href="<%= ctxPath%>/main.sue";
		});
		
		 /*  $("input[type='idfind_radio']").check(function(){
			  $("span.error").hide();
			  // $("div#divfileattach").empty();
		  }); */		
		
	});
	

	

	
</script>
<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-4"></div>
	<div class="col-4">
	
		<form name="idfind_form">
			<table id="idfind_table" class="container mb-5">
				<tr>
					<td colspan="4" id="idfind_text" class="pb-4">아이디 찾기</td>
				</tr>

				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="idfind_name" name="idfind_name" class="idfind_input_text"/>
					</td>
				</tr>
				<tr>
					<td><div class = "emailFind">이메일</div></td>
					<td>
						<div class = "emailFind">
						<input type="text" id="idfind_email" name="idfind_email" class="idfind_input_text" placeholder="abc@naver.com"/></div>
					</td>
				</tr>
				
				<tr>
					<td colspan="2" class="pt-5 pb-1"><button type="button" id="idfind_submit" name="idfind_submit" class="black w-100">확인</button></td>
				</tr>
				<tr>
					<td colspan="2" class="pb-3"><button type="button" id="idfind_cancel" class="white w-100">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
	<div class="col-3"></div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>
