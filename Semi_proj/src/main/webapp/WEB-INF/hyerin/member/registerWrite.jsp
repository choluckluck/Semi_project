<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		// 문서로딩시 경고 메시지는 숨김
		$(".register_warning").hide();
		
		// 문서로딩시 가능하다는 메시지는 숨김
		$(".register_approval").hide();
		
		// 취소버튼 클릭시 메인페이지로 이동
		$("button#cancel_btn").click(function(){
			location.href="메인페이지경로";
		});
		
		
		// 가입버튼 클릭이벤트
		$("button#join_btn").click(function(){
			location.href = "<%= ctxPath%>/hyerin/member/registerResult.sue";
			/* const frm = document.registerForm;
			frm.action = "registerResult.sue";
			frm.method = "post";
			frm.submit(); */
		});
		
	});
	
	
	
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
								<input type="text" name="member_id" class="register_input w-100"/>
								<div id="id_approval" class="register_approval"> 는 사용가능한 아이디입니다.</div>
								<div id="id_warning" class="register_warning">아이디를 입력해주세요.</div>
								<div class="register_description">(영문소문자/숫자, 4~16자)</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								비밀번호<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" name="member_pwd" class="register_input w-100"/>
								<div id="pwd_warning" class="register_warning">비밀번호를 입력해주세요.</div>
								<div class="register_description">(영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자)</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								비밀번호 확인<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" name="member_pwdcheck" class="register_input w-100"/>
								<div id="pwdcheck_warning" class="register_warning">비밀번호가 일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								이름<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" name="member_name" class="register_input w-100"/>
								<div id="name_warning" class="register_warning">이름을 입력해주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								주소<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" name="member_zipcode" class="zipcode_input w-25"/>
								<button type="button" id="zipcode_btn" class="zipcode_btn w-25">우편번호</button>
								<div class="mt-2"></div>
								<input type="text" name="member_defaultAddress" class="register_input w-100"/>
								<div class="register_description">기본주소</div>
								<input type="text" name="member_detailAddress" class="register_input w-100 mt-2"/>
								<div class="register_description">나머지주소(선택입력가능)</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								일반전화
							</td>
							<td>
								<select class="register_phoneselect">
									<option selected>02</option>
									<option value="1">031</option>
									<option value="2">032</option>
									<option value="3">033</option>
								</select>
								<span class="division">-</span>
								<input type="text" name="telephone_middle" class="register_input_phone"/>
								<span class="division">-</span>
								<input type="text" name="telephone_last" class="register_input_phone"/>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								휴대전화<span class="necessary">*</span>
							</td>
							<td>
								<select class="register_phoneselect">
									<option selected>010</option>
									<option value="1">011</option>
									<option value="2">016</option>
									<option value="3">017</option>
									<option value="4">018</option>
									<option value="5">019</option>
								</select>
								<span class="division">-</span>
								<input type="text" name="cellphone_middle" class="register_input_phone"/>
								<span class="division">-</span>
								<input type="text" name="cellphone_last" class="register_input_phone"/>
								<div id="phone_warning" class="register_warning">휴대전화번호를 입력해주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								이메일<span class="necessary">*</span>
							</td>
							<td>
								<input type="text" name="memeber_email" class="register_input w-100"/>
								<div id="email_warning" class="register_warning">이메일을 입력해주세요.</div>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline pt-2">
								마케팅 수신동의
							</td>
							<td class="pt-2">
								<input type="checkbox" id="agree_sms" class="agree_chx pt-4"/>
								<label for="agree_sms" class="mr-5">SMS</label>
								<input type="checkbox" id="agree_email" class="agree_chx pt-4"/>
								<label for="agree_email">이메일</label>
								<div class="register_description">쇼핑몰에서 제공하는 신상품 소식/할인쿠폰을 무상으로 보내드립니다.</div>
							</td>
						</tr>
					</table>
					
					<hr style="border: none; background-color: black; height:1px;">
					
					<table id="register_table_2" class="container register_table mb-5">
						<tr>
							<td class="font-weight-bold align-baseline w-25">성별</td>
							<td class="align-middle">
								<input type="radio" id="male" name="gender" value="male" class="agree_radio">
								<label for="male" class="mr-5">남자</label>
								<input type="radio" id="female" name="gender" value="female" class="agree_radio">
								<label for="female">여자</label>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">생년월일</td>
							<td>
								<input type="text" id="yyyy" name="yyyy" class="register_input w-25"/>
								<span class="pr-4">년</span>
								<input type="text" id="mm" name="mm" class="register_input w-25"/>
								<span class="pr-4">월</span>
								<input type="text" id="dd" name="dd" class="register_input w-25"/>
								<span class="pr-4">일</span>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">지역</td>
							<td>
								<select id="region" class="region w-100">
									<option selected>선택</option>
									<option>경기</option>
									<option>서울</option>
									<option>인천</option>
									<option>강원</option>
									<option>충남</option>
									<option>충북</option>
									<option>대전</option>
									<option>경북</option>
									<option>경남</option>
									<option>대구</option>
									<option>부산</option>
									<option>울산</option>
									<option>전북</option>
									<option>전남</option>
									<option>광주</option>
									<option>제주</option>
									<option>해외</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="font-weight-bold align-baseline">추천인 아이디</td>
							<td><input type="text" class="register_input w-100"/></td>
						</tr>
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