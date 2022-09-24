<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="../hyerin/header.jsp"></jsp:include>
<jsp:include page="sideMenu.jsp" />
	   <div class="col-10">

		<br><br>
		<h5>관심 상품</h5>
		<br><br>
		
<table border="1" summary="">
<caption>회원 기본정보</caption>
<colgroup>
<col style="width:150px;">
<col style="width:auto;">
</colgroup>

<tbody>
<tr>
<th scope="row" style="vertical-align:top;">아이디 *</th>
<td>
<input type="text" id="" name="" class="" placeholder="" value="" >						 
<p class="form-guide">(영문소문자/숫자, 4~16자)</p>
</td>
</tr>

<tr>
<th scope="row" style="vertical-align:top;">비밀번호 *
</th>
<td>
<div class="">
<input type="password" id="" name="" autocomplete="off" maxlength="16" 0="disabled" value="" >
<div class="">
<div class="">
<strong class="txtWarn">※ 비밀번호 입력 조건</strong>
<ul class="ec-base-help typeDash gBlank10 txtWarn">				
<li> 영문 대소문자/숫자/특수문자 중 3가지 이상 조합, 8자~16자</li>
<li> 입력 가능 특수문자</li>
<li> 공백 입력 불가능</li>
</ul>
</div>
</div>
</div>
</td>
</tr>

<tr class="">
<th scope="row">비밀번호 확인
</th>
<td>
<input type="password" id="" name="" autocomplete="off" maxlength="16" 0="disabled" value="" >
</td>
</tr>


<tr style="display:1">
<th scope="row" id="">이름*</th>
<td>
<input type="text" id="" name="" placeholder="" maxlength="30" readonly="readonly" value="" >
</td>
</tr>

<tr class="">
<th scope="row">주소 *
</th>
<td>
<input type="text" id="" name="" class="" placeholder="" readonly="readonly" maxlength="14" value="">
<a href="#none" class="btnNormal" onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');" id="postBtn">우편번호</a><br>
<input type="text" id="" name="" class="" placeholder="" readonly="readonly" maxlength="14" value="">						<a href="#none" class="btnNormal" onclick="ZipcodeFinder.Opener.bind('postBtn', 'postcode1', 'postcode2', 'addr1', 'layer', 'ko_KR');" id="postBtn">우편번호</a><br>
<p class="form-guide inine">기본주소</p>
<br>
						<input id="addr2" name="addr2" fw-filter="" fw-label="주소" fw-msg="" class="inputTypeText" placeholder="" value="" type="text"> <p class="form-guide inine">나머지주소 (선택입력가능)</p> 
					</td>
				</tr>
<tr class="">
<th scope="row">일반전화 <span class="req displaynone">필수</span>
</th>
					<td><select id="phone1" name="phone[]" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="">
<option value="02">02</option>
<option value="031">031</option>
<option value="032">032</option>
<option value="033">033</option>
<option value="041">041</option>
<option value="042">042</option>
<option value="043">043</option>
<option value="044">044</option>
<option value="051">051</option>
<option value="052">052</option>
<option value="053">053</option>
<option value="054">054</option>
<option value="055">055</option>
<option value="061">061</option>
<option value="062">062</option>
<option value="063">063</option>
<option value="064">064</option>
<option value="0502">0502</option>
<option value="0503">0503</option>
<option value="0504">0504</option>
<option value="0505">0505</option>
<option value="0506">0506</option>
<option value="0507">0507</option>
<option value="070">070</option>
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
<option value="0508">0508</option>
</select>-<input id="phone2" name="phone[]" maxlength="4" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text">-<input id="phone3" name="phone[]" maxlength="4" fw-filter="isNumber&amp;isNumber" fw-label="일반전화" fw-alone="N" fw-msg="" value="" type="text"></td>
				</tr>
<tr class="">
<th scope="row">휴대전화 <span class="req displaynone">필수</span>
</th>
					<td>
						<select id="mobile1" name="mobile[]" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="">
<option value="010">010</option>
<option value="011">011</option>
<option value="016">016</option>
<option value="017">017</option>
<option value="018">018</option>
<option value="019">019</option>
</select>-<input id="mobile2" name="mobile[]" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text">-<input id="mobile3" name="mobile[]" maxlength="4" fw-filter="isNumber" fw-label="휴대전화" fw-alone="N" fw-msg="" value="" type="text"><button type="button" class="btnNormal displaynone" id="btn_action_verify_mobile" onclick="memberVerifyMobile.editSendVerificationNumber(); return false;">인증번호받기</button>
						<p class="txtWarn gBlank5 displaynone" id="result_send_verify_mobile_fail"></p>
						<ul class="txtInfo gBlank5 displaynone" id="result_send_verify_mobile_success">
<li>인증번호가 발송되었습니다.</li>
							<li>인증번호를 받지 못하셨다면 휴대폰 번호를 확인해 주세요.</li>
						</ul>
</td>
				</tr>
<tr class="displaynone" id="confirm_verify_mobile">
<th scope="row">인증번호 <span class="req">필수</span>
</th>
					<td>
						<div class="verify">
							<input id="verify_sms_number" name="verify_sms_number" fw-filter="isMax[15]" fw-label="verify_sms_number" fw-msg="" class="inputTypeText" placeholder="" maxlength="15" value="" type="text">							<span class="time" id="expiryTime"></span>
						</div>
						<button type="button" class="btnNormal" id="btn_verify_mobile_confirm" onclick="memberVerifyMobile.editVerifySmsNumberConfirm(); return false;">확인</button>
					</td>
				</tr>
<tr class="">
<th scope="row">SMS 수신여부 <span class="req">필수</span>
</th>
					<td><input id="is_sms0" name="is_sms" fw-filter="isFill" fw-label="is_sms" fw-msg="" value="T" type="radio"><label for="is_sms0">수신함</label>
<input id="is_sms1" name="is_sms" fw-filter="isFill" fw-label="is_sms" fw-msg="" value="F" type="radio" checked="checked"><label for="is_sms1">수신안함</label><p class="form-guide">쇼핑몰에서 제공하는 유익한 이벤트 소식을 SMS로 받으실 수 있습니다.</p>
</td>
				</tr>
<tr>
<th scope="row">이메일 <span class="req">필수</span>
</th>
					<td>
						<input id="email1" name="email1" fw-filter="isFill&amp;isEmail" fw-label="이메일" fw-alone="N" fw-msg="" value="" type="text"> <span id="emailMsg"></span>
						<p class="form-guide displaynone">이메일 주소 변경 시 로그아웃 후 재인증을 하셔야만 로그인이 가능합니다.<br>인증 메일은 24시간 동안 유효하며, 유효 시간이 만료된 후에는 가입 정보로 로그인 하셔서 재발송 요청을 해주시기 바랍니다.</p>
					</td>
				</tr>
<tr class="">
<th scope="row">이메일 수신여부 <span class="req">필수</span>
</th>
					<td><input id="is_news_mail0" name="is_news_mail" fw-filter="isFill" fw-label="is_news_mail" fw-msg="" value="T" type="radio"><label for="is_news_mail0">수신함</label>
<input id="is_news_mail1" name="is_news_mail" fw-filter="isFill" fw-label="is_news_mail" fw-msg="" value="F" type="radio" checked="checked"><label for="is_news_mail1">수신안함</label><p class="form-guide">쇼핑몰에서 제공하는 유익한 이벤트 소식을 이메일로 받으실 수 있습니다.</p>
</td>
				</tr>
<tr class="displaynone">
<th scope="row">평생회원</th>
					<td>
						<input id="is_lifetime0" name="is_lifetime" fw-filter="" fw-label="is_lifetime" fw-msg="" value="T" type="radio"><label for="is_lifetime0">동의함</label>
<input id="is_lifetime1" name="is_lifetime" fw-filter="" fw-label="is_lifetime" fw-msg="" value="F" type="radio" checked="checked"><label for="is_lifetime1">동의안함</label>						<ul class="txtDesc">
<li>평생회원은 <strong>JINNY KIM</strong> 회원 탈퇴시까지 휴면회원으로 전환되지 않습니다.</li>
							<li class="">지금 평생회원으로 전환하시면 쿠폰혜택을 드립니다.(전환시 최초 1회)</li>
							<li class="">평생회원 쿠폰혜택을 받으신 경우, 3개월간 평생회원을 유지하셔야 합니다.</li>
						</ul>
</td>
				</tr>
</tbody>
</table>
	      

		
		<br><br>


	   



	   
	   </div>
     </div>
   </div>
<jsp:include page="../hyerin/footer.jsp"></jsp:include>	
	
  </body>
</html>