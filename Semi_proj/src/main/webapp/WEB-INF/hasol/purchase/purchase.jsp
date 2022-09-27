 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
%>
<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<!-- style.css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/hasol/style_purchase.css">

<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script>

<script type="text/javascript">
$(document).ready(function(){
	
	//************** default 설정 **************//
	// 배송지 주소록 자동 설정
	$("input:radio[name='select_deliv']:radio[value='same']").prop("checked", true);
	
	// 결제 방식 자동 설정
	$("input:radio[name='pay_method']:radio[value='credit']").prop("checked", true);
	$("table#info_radio_nonaccount").hide();
 	$("span#info_radio_credit").show();  
	
	//************** default 설정 끝 **************//
	
	
	
	
	// 주소록 보기
	$("button#btn_show_addr").click(function(){
		
	})
	
	// 우편번호 설정
    $("img#zipcodeSearch").click(function(){
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
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
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
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
                    document.getElementById("extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("detailAddress").focus();
            }
        }).open(); 	

				
    });
	
	

	 
}); //

// ********* 팝업창 크기 설정 ***********
const pop_height = 600;
const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); 
const pop_top = Math.ceil( (window.screen.height - pop_height)/2 );



// 주소록보기 팝업창 띄우기
<%-- function goshowAddressbook(userid){
    const url = "<%= request.getContextPath()%>   ?userid="+userid;
   
    window.open(url, "showAddressbook",
              "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
    
 } --%>
 
 
 // 쿠폰적용 팝업창 띄우기
 function selectCoupon() {
	 const url = "<%= request.getContextPath()%>/hasol/purchase/purchase_popup.sue";
	 
	window.open(url,"selectCoupon",
            width="800", height="800");
 }
 
 
 // 수정 팝업창 띄우기

 
 
 // 결제수단 선택 영역
 function selectPay_method(){
     if($("input:radio[id=pay_credit]").is(":checked")){
		$("table#info_radio_nonaccount").hide();
	 	$("span#info_radio_credit").show();   
	 }
 	 else{
 		$("span#info_radio_credit").hide();
 		$("table#info_radio_nonaccount").show();      
 	 }
 }

 
 // 결제하기
 function goPurchase(userid) {
	
	 if(!$("input:checkbox[agree_purchase]").is("checked")) {
		 alert("결제 진행 약관에 동의가 필요합니다!");
	 }
	 else {
		 const userid = "${sessionScope.loginuser.userid}"; 
	     const url = "<%= request.getContextPath()%>/hasol/purchase/purchaseEnd.sue";
		
		 window.open(url, "coinPurchaseEnd",
				    "left=350px, top=100px, width=1000px, height=600px");
	 }
 }

</script>

</head>
<body>

<!-- header -->



<!-- main -->
	<div class="container">
		<div class="pur_title">
			<h2> 주문하기 </h2>
		</div>
        
        <!-- 혜택 정보 -->
		<div class="pur_benefit_info">
			<table class="tbl_pur_benefit_info">
				<tr>
                    <td rowspan='2'>혜택정보</td>
                    <td rowspan='2' width:10px style="padding: 0 3px;"></td>
                    <td>{userid} 님은 [WELCOME] 회원입니다. <br>
                        1원 이상 구매시 0% 추가적립 받으실 수 있습니다. (최대 100,000원)
                    </td>
                </tr>
                <tr> 
                    <td> 가용적립금: 100원 쿠폰: 0개 </td>
                </tr>
			</table>
		</div>


        <!-- 주문상품 정보 -->
        <div class="order_prod_detail">
            <span class="order_prod_detail_title"> 주문 상품 정보 </span>
                <table class="order_prod_detail_tab">
                    <thead>
                        <tr height="30">
                            <td colspan="2" width=200px">상품정보</td>
                            <td width="150px">수량</td>
                            <td width="150px">적립금</td>
                            <td width="150px">배송구분</td>
                            <td width="150px">배송비</td>
                            <td width="150px">합계</td>
                        </tr>
                    </thead>
                <!-- 여기부터 제품 생길 때마다 반복 노출되어야하는 영역 -->
                <tbody>
                    <tr>
                        <td width="100px" ><img src="images/test4.jpg" width="80" style="padding: 10% 0;" >
                        <td>
                            <p>제품명</p>
                            <p>옵션</p>
                            <p>가격</p>
                        </td>
                        <td>1</td>
                        <td>500원</td>
                        <td >기본배송</td>
                        <td>[조건]</td>
                        <td>얼마...</td>
                    </tr>
                    <tr>
                        <td colspan="2" height="30" >기본배송</td>
                        <td colspan="5">상품/구매금액60,000 + 배송비3,000=합계 00원</td>
                    </tr>
                </tbody>
            </table>
            <span style="font-size: 13px;"> ※ 상품의 옵션 및 수량 변경은 상품 상세 또는 장바구니에서 가능합니다.</span>
        </div>


        <!-- 배송지정보 -->
        <div class="delivery_info">
            <form name="delivery_info_form">
                <span class="delivery_info_title">배송 정보</span>
                <table class="deliver_info_tbl">
                <tr>
                    <td width="30px">배송지선택</td>
                    <td>
                       <input type="radio" name="select_deliv" value="same"/> <label for="same">회원정보와 동일 </label>
                       <input type="radio" name="select_deliv" value="another"/> <label for="another">새로운 배송지 </label>
                       <button type="button" id="btn_show_addr" onclick="goshowAddressbook('${(sessionScope.loginuser).userid}');">주소록보기</button>
                    </td>
                </tr>
                <tr>
                    <td width="30px">받으시는분 *</td>
                    <td><input type="text"/></td>
                </tr>
                <tr>
                    <td width="30px">휴대전화 *</td>
                    <td>
                    <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="010" readonly />&nbsp;-&nbsp;
                    <input type="text" id="hp2" name="hp2" size="6" maxlength="4" />&nbsp;-&nbsp;
                    <input type="text" id="hp3" name="hp3" size="6" maxlength="4" />
			        </td>
                </tr>
                <tr>
                    <td rowspan="2" width="30px">주소</td>
                    <!-- border 없애고 싶어요.... -->
                    <td style="border:none;" height="30px">
                       <input type="text" id="postcode" name="postcode" size="6" maxlength="5" />&nbsp;&nbsp;
                       <img id="zipcodeSearch" src="./images/b_zipcode.gif" style="vertical-align: middle;" />
                    </td>
                <tr>
                    <td width="30px">
                       <p style="font-size: 9px; ">기본주소</p>
                       <input type="text" id="address" name="address" size="40" placeholder="주소" style="margin-bottom: 5px;" /><br/>
                       <input type="text" id="detailAddress" name="detailAddress" size="40" placeholder="상세주소" style="margin-bottom: 20px;"/>&nbsp;<input type="text" id="extraAddress" name="extraAddress" size="40" placeholder="참고항목" /> 
                    </td>
                </tr>
                <tr>
                    <td width="30px">이메일&nbsp;<span class="star">*</span></td>
                    <td><input type="text" name="email" id="email" class="requiredInfo" placeholder="abc@def.com" />
                </tr>
                <tr>
                    <td width="30px">배송메시지</td>
                    <td "><textarea name="content"></textarea></td>
                </tr>
            </table>
            </form>
        </div>



        <!-- 주문 금액 정보 -->
        <div class="amount_info">
            <table class="tbl_amount_info_title" style="text-align: center;">
                <tr height="150px">
                    <td>
                        <span>총 주문 금액 </span>
                        <span><strong>0000</strong>원</span>    
                    </td>
                    <td>
                        <span>-</span>  
                    </td>
                    <td>
                        <span>총 할인 +부가결제 금액 </span>
                        <span><strong>0000</strong>원</span>    
                    </td>
                    <td>
                        <span>=</span>  
                    </td>
                    <td>
                        <span>총 결제예정 금액</span>
                        <span><strong>0000</strong>원</span>    
                    </td>
                </tr>
            </table>

            <table class="tbl_amount_info_body">
                <tr>
                    <td class="tbl_amount_info_name1">총 할인금액</td>
                    <td><strong>0000</strong>원</td>
                </tr>
                <!-- 아래 행은 쿠폰있을 시에만 노출 됨 -->
                <tr>
                    <td class="tbl_amount_info_name1">쿠폰할인</td>
                    <td><button type="button" class="btn_tbl_amount_info" id="btn_coupon_select" onClick="selectCoupon()">쿠폰적용</button></td>
                    <td rowspan="2" style="padding: 15px 0 0 50px;">
                        <strong>0000</strong>원
                        <button type="button" class="btn_tbl_amount_info" id="btn_coupon_modify">수정</button> 
                    <p id="useable_copon_info">[주문별] [신규회원] 5% 할인쿠폰 (~2022-10-13 23:59:59) 2000원</p>
                    </td>
                </tr>
            </table>


        
            <!-- 결제수단 -->
            <div class="pay_method" >
                <div style="margin-bottom:10px; font-size:13px; display: flex; justify-content: space-between; ">
                    <span style="font-weight: bold;"> 결제수단 </span>
                    <span style="display:flex; align-items:center;">
                        <input type="checkbox"/><label>결제수단과 입력정보를 다음에도 사용</label>
                    </span>
                </div>

                <table class="tbl_pay_method">
                    <tr style="border-bottom: solid 1px lightgray">
                        <td style="width: 700px;">
                            <input type="radio" id="pay_credit" name="pay_method" value="credit" onchange="selectPay_method()"/><label for="credit" >신용카드</label>
                            <input type="radio" id="pay_nonaccount"name="pay_method" value="non-account" onchange="selectPay_method()"/><label for="non-account" >무통장입금</label>
                        </td>
                        <td rowspan="2" style="padding: 30px;">
                            <p style="margin: 0;"><strong>최종결제금액</strong></p>
                            <strong style="font-size:30px;">60,000원</strong>
                            <br>
                            <br>
                            <p><input type="checkbox" id="agree_purchase"/><label>결제정보를 확인하였으며, 구매진행에 동의합니다.</label></p>
                            <p><button type="button" onClick="goPurchase('${(sessionScope.loginuser).userid}')">결제하기</button></p>
                            <p class="p_tbl_pay_method"><b>총 적립예정금액</b><span>0원</span></p>
                            <p class="p_tbl_pay_method"><b>상품별 적립금</b><span>0원</span></p>
                            <p class="p_tbl_pay_method"><b>회원적립금</b><span>0원</span></p>
                            <p class="p_tbl_pay_method" style="margin: 0;"><b>쿠폰적립금</b><span>0원</span></p>
                        </td>
                    </tr>
                    <tr>
                        <td style="display: flex; padding-top: 20px;">
                            <!-- 신용카드 -->
                            <span id="info_radio_credit"> 소액 결제의 경우 PC사 정책에 따라 결제 금액 제한이 있을 수 있습니다.</span>
                            <!-- 무통장입금 -->
                            <table class="pay_method_nonaccount" id="info_radio_nonaccount">
                                <tr>
                                    <td>입금자명</td>
                                    <td><input type="text"/></td>
                                </tr>
                                <tr>
                                    <td>입금은행</td>
                                    <td>쌍용은행: 1002-000-888820</td>
                                </tr>
                                <tr>
                                    <td>현금영수증신청</td>
                                    <td>
                                        <input type="radio" name="cashform" value="ok_cashform"/><label for="ok_cashform" name="cashform">현금영수증 신청</label>
                                        <input type="radio" name="cashform" value="no_cashform"/><label for="no_cashform" name="cashform">신청안함</label>
                                    </td>
                                </tr>
                            </table> 
                        </td>
                    </tr>
                </table>
            </div>
            <!-- 결제수단 끝 -->
            
            
            
        </div>
    </div>

<!-- footer -->
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>