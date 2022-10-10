<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% String ctxPath = request.getContextPath(); %>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<style tpye="css/text">
/* .tooltip {
	display:none;
	position: absolute;
	background: #ffffff;
	border: 1px solid #f57171;
	padding: 20px;
}

.task-tooltip:after, .task-tooltip:before {
	top: 100%;
	left: 50%;
	border: solid transparent;
	content: "";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.task-tooltip:after {
	border-color: rgba(255, 255, 255, 0);
	border-top-color: #ffffff;
	border-width: 10px;
	margin-left: -10px;
}
.task-tooltip:before {
	border-color: rgba(245, 113, 113, 0);
	border-top-color: #f57171;
	border-width: 11px;
	margin-left: -11px;
} */

input[type='number']::-webkit-outer-spin-button,
input[type='number']::-webkit-inner-spin-button {
	  -webkit-appearance: none;
	  margin: 0;
}

</style>
 
<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<script>

	// ** 입력 확인 용
	let id_check = false;
	let pwd_check = false;
	let pwdcheck_check = false;
	let name_check= false;
	let post_check = false;
	let mobile_check = false;
	let email_check = false;

	$(document).ready(function(){
		
		// ========= default 설정 사항 ==========
		// 문서로딩시 경고 메시지는 숨김
		$(".register_warning").hide();
		
		// 문서로딩시 가능하다는 메시지는 숨김
		$(".register_approval").hide();
		
		// 문서로딩시 아이디 입력 칸에 포커스
		$("input[name=userid]").focus();
		
		// 비밀번호 입력창 경고 툴팁 숨김
		$("#pwd_warning_tooltip").hide();
		
		
		// 취소버튼 클릭시 메인페이지로 이동
		$("button#cancel_btn").click(function(){
			location.href="메인페이지경로";
		});
		
		// ========= default 설정 사항 끝 ==========
		
			

		
		// 1. 아이디 확인
		$("input[name=userid]").blur((e)=>{	
			const $target = $(e.target);
			const userid = $target.val().trim();
			const regExp = new RegExp(/^(?=.*[a-z])(?=.*\d)[A-Za-z\d]{4,16}$/)// 영문소문자,숫자를 입력하여 4-16자리
			const bool = regExp.test($target.val());
			
			if(userid == ""){ // 입력하지 않거나 공백만 입력한 경우
				id_check = false;
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				
				$target.parent().find("#id_warning").show();
			}
			else { // 공백이 아닌 글자를 입력한 경우
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				

				if(!bool){// 아이디가 정규 표현식에서 위배됐다면 or 숫자로만 이뤄졌다면
					id_check = false;
					$target.parent().find("#id_warning2").show();
				}
				else{
					// 아이디 중복 사용 체크
					$.ajax({
						url:"<%= ctxPath%>/hasol/member/idDuplicateCheck.sue",
						data:{"userid":$("input#userid").val()}, //userid => getParameter해온 내용														 // data 는 /MyMVC/member/idDuplicateCheck.up 로 전송해야할 데이터를 말한다.
						type:"post", 
						async:true,	
						success:function(text){ 
							const json = JSON.parse(text);

							if(json.isExists){ //입력한 userid가 이미 사용중이라면
								$("div#idcheckResult").html($("input#userid").val()+"은 이미 사용 중인 아이디 입니다.");
								$("div#idcheckResult").show();
								id_check = false;
							}
							else{ //입력한 userid가 존재하지 않는 경우라면
								$("div#idcheckResult").hide();
								$target.parent().find("#id_approval").show();
								id_check = true;
							}
						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}
			}
		});
		
		
		// 2. 비밀번호 확인
 		$("input[name=pwd]").blur((e)=>{
			const $target = $(e.target);
			const pwd = $target.val().trim();
			const regExp = new RegExp(/^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#$%^&*()_-])[A-Za-z\d$@$!%*#?&]{8,16}$/); // 영문소문자,숫자를 입력하여 4-16자리		
			const bool = regExp.test($target.val());
					
			if(pwd == ""){ // 입력하지 않거나 공백만 입력한 경우
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				
				$target.parent().find("#pwd_warning").show();
			}
			else { // 공백이 아닌 글자를 입력한 경우
				pwd_check = false;
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();

				if(!bool){ // 정규 표현식에서 위배됐다면
					pwd_check = false;
					$target.parent().find("#pwd_warning2").show();
				}	
				else{
					$target.parent().find("#pwd_approval").show();
					pwd_check = true;
				}
			}
					
		});
		
		// 3. 비밀번호 재확인
		$("input[name=pwdcheck]").blur((e)=>{
			const $target = $(e.target);
			const pwd = $("input[name=pwd]").val();
			const pwdcheck = $target.val();
			
			if(pwdcheck == ""){ // 입력하지 않거나 공백만 입력한 경우
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				
				pwdcheck_check = false;
				$target.parent().find("#pwdcheck_warning").show();
			}
			else { // 공백이 아닌 글자를 입력한 경우
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				
				if(pwd != pwdcheck) {//암호와 암호확인값이 틀린 경우
					pwdcheck_check = false;
					$target.parent().find("#pwdcheck_warning").show();
				}
				else{ //암호와 암호확인값이 같은 경우				
					$target.parent().find("#pwdcheck_warning").hide();
					pwdcheck_check = true;
				}	
			}
		});
		

		// 4. 이름 확인
		$("input[name=name]").blur((e)=>{
			const $target = $(e.target);
			const name = $target.val().trim();
			
			if(name == ""){ //입력하지 않거나 공백만 입력한 경우
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				
				name_check = false;
				$target.parent().find(".register_warning").show();
			}
			else{ //공백이 아닌 글자를 입력한 경우				
				$target.parent().find(".register_warning").hide();
				$target.parent().find(".register_approval").hide();
				
				name_check = true;
			}
		});//end of blur
		
		
		// 5. 주소는 바깥에~ 함수로 되어 있음.
		
		
		//6. 핸드폰 번호 확인		
		// 핸드폰 번호 middle 의 blur이벤트
		$("input[name=mobile2]").blur((e)=>{
			const $target = $(e.target);
			const mobile_m = $target.val().trim();
			const regExp = new RegExp(/^[1-9][0-9]{2,3}$/g); // 숫자 3자리 또는 4자리만 들어오도록 검사하는 정규표현식 객체 생성
			const bool = regExp.test($target.val());
			
			if(mobile_m == ""){ //입력하지 않거나 공백만 입력한 경우
				mobile_check = false;
				$target.parent().find(".register_warning").show();
			}
			else {
				$target.parent().find(".register_warning").hide();

				if(!bool){ //국번이 정규표현식에 위배된 경우라면
					mobile_check = false;
				}
				else{ //국번이 정규표현식에 맞는 경우라면				
					mobile_check = true;
				}
			}
			
		});//end of blur
		
		// 핸드폰 번호 last 의 blur이벤트
		$("input[name=mobile3]").blur((e)=>{
			const $target = $(e.target);
			const mobile_l = $target.val().trim();
			const regExp = new RegExp(/^[1-9][0-9]{2,3}$/g); // 숫자 3자리 또는 4자리만 들어오도록 검사하는 정규표현식 객체 생성
			const bool = regExp.test($target.val());
			
			if(mobile_l == ""){ //입력하지 않거나 공백만 입력한 경우
				mobile_check = false;
				$target.parent().find(".register_warning").show();
			}
			else {
				$target.parent().find(".register_warning").hide();
				
				if(!bool) { //국번이 정규표현식에 위배된 경우라면
					mobile_check = false;
				}
				else { //국번이 정규표현식에 맞는 경우라면				
					mobile_check = true;
				}
			}
		});//end of blur
		
		
		// . 이메일 확인
		$("input[name=email]").blur((e)=>{
			const $target = $(e.target);
			const email = $target.val().trim();
			const regExp = new RegExp(/^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i);
			const bool = regExp.test($target.val());
			
			if(email == "") { //입력하지 않거나 공백만 입력한 경우
				$target.parent().find(".register_warning").hide();			
				email_check = false;
				$target.parent().find("#email_warning").show();
			}
			else {	
				$target.parent().find(".register_warning").hide();
				
				if(!bool){ //이메일이 정규표현식에 위배된 경우라면
					email_check = false;
					$target.parent().find("#email_warning2").show();
				}
				else{ //이메일이 정규표현식에 맞는 경우라면

					// 이메일 중복 사용 체크
					$.ajax({
						url:"<%= ctxPath%>/hasol/member/emailDuplicateCheck.sue",
						data:{"email":$("input#email").val()},
						type:"post", 
						async:true,	
						success:function(text){ 
							const json = JSON.parse(text);

							if(json.isExists){ //입력한 email이 이미 사용중이라면
								$("div#emailcheckResult").html("등록된 이메일입니다.");
								$("div#emailcheckResult").show();
								email_check = false;
							}
							else{ //입력한 email이 존재하지 않는 경우라면
								email_check = true;
								$("div#emailcheckResult").hide();
							}
						},
						error: function(request, status, error){
							alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
						}
					});
				}
			}
		});//end of blur
		
		
		
		// 생년월일 입력란
		// 월
		let mm_html = "";
		for(var i=1; i<=12; i++){
			if(i<10){
				mm_html += "<option>0"+i+"</option>";
			}
			else{
				mm_html += "<option>"+i+"</option>";
			}
		}//end of for
		
		$("select#birthmm").html(mm_html);
		
		// 일
		let dd_html = "";
		for(var i=1; i<=31; i++){
			if(i<10){
				dd_html += "<option>0"+i+"</option>";
			}
			else{
				dd_html += "<option>"+i+"</option>";
			}
		}//end of for
		
		$("select#birthdd").html(dd_html);
		

		// 가입버튼 클릭이벤트
		$("button#join_btn").click(function(){
			
			if (!id_check) {
				alert("아이디를 올바르게 입력해 주세요!");
			}
			else if(!pwd_check) {
				alert("비밀번호를 올바르게 입력해 주세요!");
			}
			else if(!pwdcheck_check) {
				alert("비밀번호 확인을 진행해 주세요!");
			}
			else if(!name_check) {
				alert("이름을 올바르게 입력해 주세요!");
			}
			else if(!post_check) {
				alert("모든 주소를 올바르게 입력해 주세요!");
			}
			else if(!mobile_check){
				alert("연락처를 올바르게 입력해 주세요!");
			}
			else if(!email_check){
				alert("이메일을 올바르게 입력해 주세요!");
			}
			else {
				
				// 마케팅 수신 여부 체크
				let cnt = 0;
				let val = 0;
				
				$("input:checkbox[name='marketing']").each(function(index, item) {
					if( $(item).prop("checked") ) {
					//	alert($(item).val());
					    cnt++;
					    val = Number($(item).val());
					}
				});
				
				if(cnt == 2) {
					val = 3;
				}
				
				// alert("val => " + val);
				
				const frm = document.registerForm;
				frm.marketing_yn.value = val;

				// form 값 전송
				frm.action = "<%= ctxPath%>/hyerin/member/registerResult.sue";
				frm.method = "post";
				frm.submit(); 
			}
		});
	
	}); // end of document.ready
	
	
	
	
	// 5. 우편 주소 확인
	function zipcodeSearch(){
		post_check = false;
		
		new daum.Postcode({
               oncomplete: function(data) {
                   let addr = ''; // 주소 변수
                   let extraAddr = ''; // 참고항목 변수

                   //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                   if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                       addr = data.roadAddress;
                   } else { // 사용자가 지번 주소를 선택했을 경우(J)
                       addr = data.jibunAddress;
                   }

                   // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                   if(data.userSelectedType === 'R'){

                       if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                           extraAddr += data.bname;
                       }
                       // 건물명이 있고, 공동주택일 경우 추가한다.
                       if(data.buildingName !== '' && data.apartment === 'Y'){
                           extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                       }
                       // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                       if(extraAddr !== ''){
                           extraAddr = ' (' + extraAddr + ')';
                       }
                       // 조합된 참고항목을 해당 필드에 넣는다.
                       document.getElementsByName("extraaddress").value = extraAddr;
                   
                   } else {
                       document.getElementsByName("extraaddress").value = '';
                   }
				
                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById("postcode").value = data.zonecode;
                   document.getElementById("address").value = addr;
                   // 커서를 상세주소 필드로 이동한다.
                   document.getElementById("detailAddress").focus();
               }
        	
           }).open();
		post_check = true;
	}//end of zipcodeSearch()
	
	
	
	
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
	

</script>

	<div id="registerwrite_container" class="container-fluid row mt-5">
		<div class="col-3"></div>
		<div class="col-6">
			<form name="registerForm">
				<table id="register_table" class="container register_table">
						<tr>
							<td colspan="4" id="register_text">회원가입</td>
						</tr>
						<tr>
							<td colspan="4" id="necessary_index" class="text-right">
								<span class="necessary">*</span><span class="font-weight-bold">필수</span>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline w-25 pt-2">
								아이디<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" id="userid" name="userid" class="register_input w-100"/>
								<div id="id_approval" class="register_approval"> 사용 가능한 아이디입니다.</div>
								<div id="idcheckResult" class="register_warning"></div>
								<div id="id_warning" class="register_warning">아이디를 입력해주세요.</div>
								<div id="id_warning2" class="register_warning">대문자/공백/특수문자가 포함되었거나, 숫자로 시작 또는 숫자로만 이루어진 아이디는 사용할 수 없습니다.</div> 
								<div class="register_description">(영문소문자/숫자, 4~16자)</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								비밀번호<span class="necessary">*</span>
							</td>
							<td>
								<!--
								<div id="pwd_warning_tooltip" class="tooltip">
									<p>※ 비밀번호 입력 조건 </p>
									<p>- 대소문자/숫자/특수기호 중 3가지 이상 조합하여 8자~16자</p>
									<p>[입력가능 특수문자]</p>
									<p>!@#$%^&*()_-=[]{}|;:&lt;&gt;,./?</p>
								</div>
								-->
								<input type="password" name="pwd" class="register_input w-100"/>
								<div id="pwd_approval" class="register_warning">사용 가능한 비밀번호입니다.</div> 
								<div id="pwd_warning" class="register_warning">비밀번호를 입력해주세요.</div>
								<div id="pwd_warning2" class="register_warning">사용 불가능한 비밀번호입니다.</div>
								<div class="register_description">(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								비밀번호 확인<span class="necessary">*</span>
							</td>
							<td>							
								<input type="password" name="pwdcheck" class="register_input w-100"/>
								<div id="pwdcheck_warning" class="register_warning">비밀번호가 일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								이름<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" name="name" class="register_input w-100"/>
								<div id="name_warning" class="register_warning">이름을 입력해주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								주소<span class="necessary">*</span>
							</td>
							<td>
								<input type="number" id="postcode" name="postcode" class="zipcode_input w-25" onClick="zipcodeSearch()" readonly/>
								<button type="button" class="zipcode_btn w-25" onClick="zipcodeSearch()" >우편번호</button>
								<div class="mt-2"></div>
								<input type="text" id="address" name="address" class="register_input w-100" onClick="zipcodeSearch()" readonly/>
								<div class="register_description">기본주소</div>
								<input type="text" id="detailAddress" name="detailaddress" class="register_input w-100 mt-2"/>
								<div class="register_description">나머지주소(선택입력가능)</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								휴대전화<span class="necessary">*</span>
							</td>
							<td>
								<select class="register_phoneselect" name="mobile1">
									<option selected>010</option>
									<option value="1">011</option>
									<option value="2">016</option>
									<option value="3">017</option>
									<option value="4">018</option>
									<option value="5">019</option>
								</select>
								<span class="division">-</span>
								<input type="number" oninput='handleOnInput(this, 4)' name="mobile2" class="register_input_phone"/>
								<span class="division">-</span>
								<input type="number" oninput='handleOnInput(this, 4)' name="mobile3" class="register_input_phone"/>
								<div id="phone_warning" class="register_warning">휴대전화번호를 입력해주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								이메일<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" id="email" name="email" class="register_input w-100"/>
								<div id="emailcheckResult" class="register_warning"></div>
								<div id="email_warning" class="register_warning">이메일을 입력해주세요.</div>
								<div id="email_warning2" class="register_warning">올바른 이메일 형식을 입력해 주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								마케팅 수신동의
							</td>
							<td class="pt-2">
								<input type="checkbox" name="marketing" class="agree_chx pt-4" value="1"/>
								<label for="agree_sms" class="mr-5">SMS</label>
								<input type="checkbox" name="marketing" class="agree_chx pt-4" value="2"/>
								<label for="agree_email">이메일</label>
								<input type="hidden" name="marketing_yn" value="0"/> <!-- 값 전송하기 위한..! -->
								<div class="register_description">쇼핑몰에서 제공하는 신상품 소식/할인쿠폰을 무상으로 보내드립니다.</div>
							</td>
						</tr>
					</table>
					
					<hr style="border: none; background-color: black; height:1px;">
					
					<table id="register_table_2" class="container register_table mb-5">
						<tr>
							<td class="font-weight-bold align-baseline w-25">성별</td>
							<td class="align-middle">
								<input type="radio" id="male" name="gender" value="1" class="agree_radio">
								<label for="male" class="mr-5">남자</label>
								<input type="radio" id="female" name="gender" value="2" class="agree_radio">
								<label for="female">여자</label>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">생년월일</td>
							<td>
								<input type="number" id="birthyyyy" name="birthyyyy" class="register_input w-25" min="1900" max="2200" oninput="handleOnInput(this, 4)"/>
								<span class="pr-4">년</span>
								<select id="birthmm" name="birthmm" class="register_select w-25" ></select>
								<span class="pr-4">월</span>
								<select id="birthdd" name="birthdd" class="register_select w-25"></select>
								<span class="pr-4">일</span>
							</td>
						</tr>
						<tr>
						<tr>
							<td colspan="2" class="pt-5 pb-2"><button type="button" id="join_btn" class="black" style="width:100%;">가입</button></td>
						</tr>
						<tr>
							<td colspan="2" class="pb-5"><button type="button" id="cancel_btn" class="white" style="width:100%;">취소</button></td>
						</tr>
					</table>
			</form>
		</div>
		<div class="col-3"></div>
	</div>
	
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>