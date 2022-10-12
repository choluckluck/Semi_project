<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		
		$("div.emailFind").hide();
		$("div.mobileFind").hide();
		
		
		//확인버튼 클릭이벤트
		$("button#idfind_submit").click(function(){
			location.href="<%= ctxPath%>/hyerin/login/idFindResult.sue";
			
			/* const frm = document.idfind_form;
			frm.action = "idFindResult.sue";
			frm.method = "post";
			frm.submit(); */
		});
		
		//취소버튼 클릭이벤트
		$("button#idfind_cancel").click(function(){
			location.href="<%= ctxPath%>/main.sue";
		});
		
		  $("input[type='radio']").check(function(){
			  $("span.error").hide();
			  $("div#divfileattach").empty();
		  });		
		
	});
	
</script>
<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-3"></div>
	<div class="col-6">
	
		<form name="idfind_form">
			<table id="idfind_table" class="container mb-5">
				<tr>
					<td colspan="4" id="idfind_text" class="pb-4">아이디 찾기</td>
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
						<input type="radio" id="idfind_email" name="idfind_radio" value="email" class="agree_radio"/>
						<label for="idfind_email" class="mr-3">이메일</label>
						<input type="radio" id="idfind_phone" name="idfind_radio" value="phone" class="agree_radio"/>
						<label for="idfind_phone">휴대폰 번호</label>
					</td>
				</tr>
				<tr>
					<td>이름</td>
					<td>
						<input type="text" id="idfind_name" class="idfind_input_text"/>
					</td>
				</tr>
				<tr>
				  
					<td><div class = "emailFind">이메일</div></td>
					<td>
						<div class = "emailFind"><input type="text" id="idfind_email" class="idfind_input_text"/></div>
					</td>
				  
				</tr>
				<tr>
				  
					<td class="align-baseline pt-3"><div class = "mobileFind">휴대폰번호</div></td>
					<td class="pb-5">
					  <div class = "mobileFind">
						<select class="idfind_phonselect">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<span class="division1" style="margin-right: 1px;">-</span>
						<input type="text" name="cellphone_middle" class="idfind_input_phone" style="width:150px;"/>
						<span class="division2" style="margin-right: 1px;">-</span>
						<input type="text" name="cellphone_last" class="idfind_input_phone" style="width:150px;"/>
					  </div>
					</td>
					
				  
				</tr>
				
				<tr>
					<td colspan="2" class="pt-2 pb-2"><button type="button" id="idfind_submit" name="idfind_submit" class="black w-100">확인</button></td>
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
