<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//확인버튼 클릭이벤트
		$("button#pwdfind_submit").click(function(){
			location.href="pwdFindSendEmail.up";
			
			
			/* const frm = document.pwdfind_form;
			frm.action = "pwdFindSendEmail.up";
			frm.method = "post";
			frm.submit(); */
		});
		
		//취소버튼 클릭이벤트
		$("button#pwdfind_cancel").click(function(){
			location.href="메인페이지";
		});
		
	});
	
</script>

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-3"></div>
	<div class="col-6">
		<form name="pwdfind_form">
			<table id="pwdfind_table" class="container mb-5">
				<tr>
					<td colspan="4" id="pwdfind_text" class="pb-4">비밀번호 찾기</td>
				</tr>
				<tr>
					<td width="25%">회원유형</td>
					<td>
						<select id="member_category" class="w-100">
							<option selected>개인회원</option>
							<option>개인 사업자회원</option>
							<option>법인 사업자회원</option>
							<option>외국인회원</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>
					</td>
					<td class="pb-2">
						<input type="radio" id="pwdfind_email" name="pwdfind_radio" value="email" class="agree_radio"/>
						<label for="pwdfind_email" class="mr-3">이메일</label>
						<input type="radio" id="pwdfind_phone" name="pwdfind_radio" value="phone" class="agree_radio"/>
						<label for="pwdfind_phone">휴대폰 번호</label>
					</td>
				</tr>
				<tr>
					<td>아이디</td>
					<td>
						<input type="text" id="pwdfind_name" class="pwdfind_input_text"/>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="pwdfind_name" class="pwdfind_input_text"/>
					</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td>
						<input type="text" id="pwdfind_email" class="pwdfind_input_text"/>
					</td>
				</tr>
				<tr>
					<td class="align-baseline pt-3">휴대폰번호</td>
					<td class="pb-5">
						<select class="pwdfind_phonselect">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<span class="division" style="margin-right: 1px;">-</span>
						<input type="text" name="cellphone_middle" class="pwdfind_input_phone"/>
						<span class="division" style="margin-right: 1px;">-</span>
						<input type="text" name="cellphone_last" class="pwdfind_input_phone"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="pt-2 pb-2"><button type="button" id="pwdfind_submit" name="pwdfind_submit" class="black w-100">확인</button></td>
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