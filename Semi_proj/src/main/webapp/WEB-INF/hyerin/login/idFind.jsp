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
		
		checkbox();
		
		
		//확인버튼 클릭이벤트
		$("button#idfind_submit").click(function(){
			
			if ($("#idfind_name").val().trim() == ""){
				alert("이름을 입력해 주세요!");
				return false;
			}

			// 이메일 라디오 클릭시
			if($("#idfind_radio_email").is(":checked")){

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
						return true;
					}
				}
			}
			// 휴대폰 라디오 클릭시
			else if ($("#idfind_radio_mobile").is(":checked")){
				if ($("#h2").val().trim() == "" ||
					$("#h3").val().trim() == "" ){
					alert("핸드폰번호를 입력해 주세요!");
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
	

	
	
// ----------------------- declare function ----------------------- 

	
	// 체크박스 클릭 시 입력 칸 노출	
	function checkbox(){

		// 이메일 라디오 클릭시
		if($("#idfind_radio_email").is(":checked")){
			$("div.mobileFind").hide();
			$("div.emailFind").show();
		}
		// 휴대폰 라디오 클릭시
		else {
			$("div.emailFind").hide();
			$("div.mobileFind").show();
		}
	}
	
	// ** 숫자 수 제한 (숫자 4개만)
	function handleOnInput(el, maxlength) {
		  if(el.value.length > maxlength)  {
		    el.value 
		      = el.value.substr(0, maxlength);
		  }
	}
	
	// ** 숫자 수 제한 (숫자 2개만)
	function handleOnInput2(el, maxlength) {
		  if(el.value.length > maxlength)  {
		    el.value 
		      = el.value.substr(0, maxlength);
		  }
	}
	
	// 이메일 정규식 체크
	function emailCheck() {
		
	}
	
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
					<td>
					</td>
					<td class="pb-2">
						<input type="radio" id="idfind_radio_email" name="idfind_radio" value="email" class="agree_radio" onChange="checkbox()" checked/>
						<label for="idfind_email" class="mr-3">이메일</label>
						<input type="radio" id="idfind_radio_mobile" name="idfind_radio" value="mobile" class="agree_radio" onChange="checkbox()"/>
						<label for="idfind_phone">휴대폰 번호</label>
					</td>
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
						<input type="text" id="idfind_email" name="idfind_email" class="idfind_input_text" placeholder="abc@naver.ocm"/></div>
					</td>
				  
				</tr>
				<tr>  
					<td class="align-baseline">
						<div class = "mobileFind">휴대폰번호</div></td>
					<td class="pb-5">
					  <div class = "mobileFind">
						<select class="idfind_phonselect" name="h1">
							<option selected>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>018</option>
							<option>019</option>
						</select>
						<span class="division1" style="margin-right: 1px;">-</span>
						<input type="number" name="h2" id="h2" class="idfind_input_mobile" style="width:120px;" oninput="handleOnInput(this, 4)"/>
						<span class="division2" style="margin-right: 1px;">-</span>
						<input type="number" name="h3" id="h3"class="idfind_input_mobile" style="width:120px;" oninput="handleOnInput(this, 4)"/>
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
