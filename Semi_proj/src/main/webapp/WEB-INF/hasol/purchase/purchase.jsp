 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
    String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="<%= ctxPath%>/css/hasol/style_purchase.css">
<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script type="text/javascript">
$(document).ready(function(){
	
	
	const userpoint = "${requestScope.loginuser.point}";
	//포인트입력 블러이벤트
	$("#wishusepoint").blur(function(e){
		const wishpoint = $(e.target).val();
		
		//정수입력 
		if(wishpoint != null && isNaN(wishpoint)){
			$("#point_warning").text("정수로 입력해주세요.");
			$(e.target).focus();
		}
		else{
			const OldtotalPrice = Number("${requestScope.viewMap.totalprice}");
			if(wishpoint > Number(userpoint)){
				
				$("#pont_warning").text("적립금이 부족합니다. 다시 입력해주세요.");
				$(e.target).val("");
				$(e.target).focus();
			}
			else{
				$("#point_warning").text("");
				
				//값을 변경해준다
				$("#point_use_amount").text(Number(wishpoint).toLocaleString('en'));
				
				const totalPrice = OldtotalPrice - wishpoint;
				$(".real_amount").text(totalPrice.toLocaleString('en'));
				$("#real_amount").val(totalPrice);
			}
		}
	});//end of blur
	
	
	//상품적립금 뿌려주기
	const pointJoin = "${requestScope.viewMap.pointJoin}";
	const pointArr = pointJoin.split(",");		
	var sumPoint = 0;
	
	for(var i=0; i<pointArr.length; i++){
		sumPoint += Number(pointArr[i]);
	}
	
	$(".prod_point").text(sumPoint.toLocaleString('en'));
	$("#totalProdpoint").val(sumPoint);
	
	
}); //end of ready
 
 // 결제하기
 function goPurchase() {
	
	 if(!$("input:checkbox[id=agree_purchase]").is(":checked")) {
		 alert("결제 진행 약관에 동의가 필요합니다!");
		 return;
	 }
	 else {
		 
		const totalPurchasePrice = $("#real_amount").val();
		//const userid = "${sessionScope.loginuser.userid}";
		let prod_name = $("#prod_name").text();
		prod_name = prod_name.substr(0,5) + "..외";
		const userid = "hyerin25";
		
	    const url = "<%= request.getContextPath()%>/hasol/purchase/purchaseEnd.sue?userid="+userid+"&prod_name="+prod_name+"&real_amount="+totalPurchasePrice;
	    
		window.open(url, "coinPurchaseEnd",
				    "left=350px, top=100px, width=1000px, height=600px");
	 }
 }//end of goPurchase

 
 
 
 // 결제 정보를 업데이트 해주기
 function insertOrder(){
	
	//실결제구매금액
	const real_amount = $("#real_amount").val();
	const order_amount = "${requestScope.viewMap.totalprice}";
	
	var point_use_amount = $("#wishusepoint").val();
	if(point_use_amount == null){
		point_use_amount = "0";
	}

	const priceJoin = "${requestScope.viewMap.priceJoin}";
	var priceArr = priceJoin.split(",");		
	var normal_amount = 0;
	for(var i=0; i<priceArr.length; i++){
		normal_amount += Number(priceArr[i]);
	}
	const discountamount = order_amount - normal_amount;
	
	const deliveryfee = "${requestScope.viewMap.deliveryfee}";
	
	const prod_codeJoin = "${requestScope.viewMap.prod_codeJoin}";
	const colorJoin = "${requestScope.viewMap.colorJoin}";
	const sizeJoin = "${requestScope.viewMap.sizeJoin}";
	const countJoin = "${requestScope.viewMap.countJoin}";
	
	/*
     <form name="orderinsert">
    	<input id="userid" type="text" name="userid" value="${requestScope.userid}"/>
    	<input id="totalUserpoint" type="text" name="totalUserpoint" value=""/>
    	<input id="totalRealamount" type="text" name="totalRealamount" value=""/>
    	<input id="totalOrderamount" type="text" name="totalOrderamount" value=""/>
    	<input id="pointUseamount" type="text" name="pointUseamount" value=""/>
    	<input id="discountamount" type="text" name="discountamount" value=""/>
    	<input id="deliveryfee" type="text" name="deliveryfee" value=""/>
    	
    	<input id="prod_code" type="text" name="prod_code" value=""/>
    	<input id="order_buy_count" type="text" name="order_buy_count" value=""/>
    	<input id="order_price" type="text" name="order_price" value=""/>
    	<input id="prod_color" type="text" name="prod_color" value=""/>
    	<input id="prod_size" type="text" name="prod_size" value=""/>
    </form>
	*/
	
	const frm = document.orderinsert;
	frm.totalRealamount.value = real_amount;
	frm.totalOrderamount.value = order_amount;
	frm.userusePoint.value = point_use_amount;
	frm.prodPoint.value = $("#totalProdpoint").val();
	frm.discountamount.value = discountamount;
	frm.deliveryfee.value = deliveryfee;
	frm.prod_code.value = prod_codeJoin;
	frm.order_buy_count.value = countJoin;
	frm.order_price.value = priceJoin;
	frm.prod_color.value = colorJoin;
	frm.prod_size.value = sizeJoin;
	
	
	frm.action = "<%= ctxPath%>/hasol/purchase/purchaseEndAfterInsertOrder.sue";
	frm.method = "post";
	frm.submit();
	
	 
 }//end of InsertOrder
 
</script>

</head>
<body>

<!-- main -->
	<div class="container">
		<div class="pur_title pb-2">
			<h2 style="font-weight: bold;"> 주문하기 </h2>
		</div>
        <!-- 혜택 정보 -->
		<div class="pur_benefit_info">
			<table class="tbl_pur_benefit_info">
				<tr>
                    <td rowspan='2'>혜택정보</td>
                    <td rowspan='2' width="10px" style="padding: 0 3px;"></td>
                    <td>${requestScope.loginuser.name} 님은 [
	                    <c:if test="${requestScope.loginuser.grade_code eq 1}">WELCOOME</c:if>
	                    <c:if test="${requestScope.loginuser.grade_code eq 2}">SILVER</c:if>
	                    <c:if test="${requestScope.loginuser.grade_code eq 3}">GOLD</c:if>
	                    <c:if test="${requestScope.loginuser.grade_code eq 4}">VIP</c:if>
                    ] 회원입니다. <br>
                        <!-- 1원 이상 구매시 0% 추가적립 받으실 수 있습니다. (최대 100,000원) -->
                    </td>
                </tr>
                <tr> 
                    <td> 가용적립금 : <fmt:formatNumber value="${requestScope.loginuser.point}" pattern="#,###"/>원 </td>
                </tr>
                
			</table>
		</div>


        <!-- 주문상품 정보 -->
		<div class="order_prod_detail">
		    <span class="order_prod_detail_title"> 주문 상품 정보</span>
			<table class="order_prod_detail_tab">
			    <thead>
			        <tr height="40px">
			            <td colspan="2" width="200px">상품정보</td>
			            <td width="150px">수량</td>
			            <td width="150px">적립금</td>
			            <td width="150px">배송구분</td>
			            <td width="150px">배송비</td>
			            <td width="150px">합계</td>
			        </tr>
			    </thead>
				<tbody>
					<c:forEach var="pvo" items="${requestScope.pvoList}" varStatus="status"> 
						<tr>
							<c:set var="idx" value="${status.index}"></c:set>
							<td width="100px"><img src="<%=ctxPath%>/images/product/${pvo.prod_image}" width="80px" style="padding: 10% 0;" ></td>
							<td>
								<p id="prod_name">${pvo.prod_name}</p>
								<p>옵션:[${pvo.pdvo.prod_color}/${pvo.pdvo.prod_size}]</p>
								<p><fmt:formatNumber value="${pvo.prod_saleprice}" pattern="#,###"/>원</p>
							 </td>
							 <td>${requestScope.viewMap.countArr[idx]}</td>
							 <td>${requestScope.viewMap.pointArr[idx]}</td>
							 <td >기본배송</td>
							 <td>
							 	<fmt:formatNumber value="${requestScope.viewMap.deliveryfee}" pattern="#,###"/>원
							 </td>
							 <td>
							 	<fmt:formatNumber value="${requestScope.viewMap.totalOnePriceArr[idx]}" pattern="#,###"/>원
						 	</td>
						</tr>
					</c:forEach>
				    <tr>
				        <td colspan="7" height="40px" align="right" style="padding-right: 10px;">
				        	상품구매금액 
					        <span style="margin-left:5px;"><fmt:formatNumber value="${requestScope.viewMap.totalorderprice}" pattern="#,###"/></span>원
					        &nbsp;+&nbsp;배송비 
					        <span style="margin-left:5px;"><fmt:formatNumber value="${requestScope.viewMap.deliveryfee}" pattern="#,###"/></span>원
					        &nbsp;=&nbsp; 합계
					        <span style="font-weight:bold; margin-left:5px;"><fmt:formatNumber value="${requestScope.viewMap.totalprice}" pattern="#,###"/></span>원
				        </td>
				    </tr>
				</tbody>
			</table>
		<span style="font-size: 13px;" class="mt-1"> ※ 상품의 옵션 및 수량 변경은 상품 상세 또는 장바구니에서 가능합니다.</span>
		</div>


        <!-- 배송지정보 -->
        <div class="delivery_info">
               <span class="delivery_info_title">배송 정보</span>
               <table class="deliver_info_tbl">
               <tr>
                   <td width="30px">받으시는분 *</td>
                   <td><input type="text" value="${requestScope.loginuser.name}"/></td>
               </tr>
               <tr>
                   <td width="30px">휴대전화 *</td>
                   <td>
                   		<c:set var="mobile" value="${requestScope.loginuser.mobile}"/>
                   	   <c:set var="mobile1" value="${fn:substring(mobile, 0, 3)}"/>
                   	   <c:set var="mobile2" value="${fn:substring(mobile, 3, 7)}"/>
                   	   <c:set var="mobile3" value="${fn:substring(mobile, 7, 12)}"/>
	                   <input type="text" id="hp1" name="hp1" size="6" maxlength="3" value="${mobile1}" readonly />&nbsp;-&nbsp;
	                   <input type="text" id="hp2" name="hp2" size="6" maxlength="4" value="${mobile2}"/>&nbsp;-&nbsp;
	                   <input type="text" id="hp3" name="hp3" size="6" maxlength="4" value="${mobile3}"/>
			        </td>
               </tr>
               <tr>
                   <td rowspan="2" width="30px">주소</td>
                   <td style="border:none;" height="30px">
                      <input type="text" id="postcode" name="postcode" size="6" maxlength="5" value="${requestScope.loginuser.postcode}"/>&nbsp;&nbsp;
                      <!-- <img id="zipcodeSearch" src="./images/b_zipcode.gif" style="vertical-align: middle;" /> -->
                   </td>
               <tr>
                   <td width="30px">
                      <p style="font-size: 9px; ">기본주소</p>
                      <input type="text" id="address" name="address" size="40" placeholder="주소" style="margin-bottom: 5px;" value="${requestScope.loginuser.address }"/><br/>
                      <input type="text" id="detailAddress" name="detailAddress" size="40" placeholder="상세주소" style="margin-bottom: 20px;" value="${requestScope.loginuser.detailaddress }"/>&nbsp;
                      <!-- <input type="text" id="extraAddress" name="extraAddress" size="40" placeholder="참고항목" /> --> 
                   </td>
               </tr>
               <tr>
                   <td width="30px">이메일&nbsp;<span class="star">*</span></td>
                   <td><input type="text" name="email" id="email" class="requiredInfo" value="${requestScope.loginuser.email}" />
               </tr>
            </table>
        </div>
		
        <!-- 주문 금액 정보 -->
        <div class="amount_info">
            <table class="tbl_amount_info_title" style="text-align: center;">
                <tr height="150px" style="border-bottom: solid 1px black;">
                    <td>
                        <span>총 주문 금액 </span>
                        <span><span id="total_order_amount" style="font-weight:bold;"><fmt:formatNumber value="${requestScope.viewMap.totalorderprice}" pattern="#,###"/></span>원</span>    
                    </td>
                    <td>
                        <span>-</span>  
                    </td>
                    <td>
                        <span>총 할인 금액 </span>
                        <span id="point_use_amount" style="font-weight:bold;">0</span><span>원</span>    
                    </td>
                    <td>
                        <span>=</span>  
                    </td>
                    <td>
                        <span>총 결제예정 금액</span>
                        <span><span class="real_amount" style="font-weight:bold;"><fmt:formatNumber value="${requestScope.viewMap.totalprice}" pattern="#,###"/></span>원</span>    
                    </td>
                </tr>
            </table>

            <table class="tbl_amount_info_body">
                <tr>
                    <td class="tbl_amount_info_name1" style="border-bottom: none;">적립금 사용</td>
                    <td>
                    	<input type="text" id="wishusepoint" class="point_use_amount" style="border: solid 1px #d9d9d9; height:30px; width:100px;"/><span class="ml-2">원</span>
                    	<span id="possiblePointuse">(가용 적립금 : <fmt:formatNumber value="${requestScope.loginuser.point}" pattern="#,###"/>원)</span>
                    	<div id="point_warning" style="font-weight:bold;"></div>
                    </td>
                </tr>
            </table>


        
            <!-- 결제수단 -->
            <div class="pay_method" >
                 <table class="tbl_pay_method">
                    <tr style="border-bottom: solid 1px lightgray">
                        <td rowspan="2" style="padding: 30px;">
                            <p style="margin: 0;" style="font-weight:bold;">최종결제금액</p>
                            <span style="font-weight:bold; font-size:30px;" class="real_amount">
                            	<fmt:formatNumber value="${requestScope.viewMap.totalprice}" pattern="#,###"/>
                            	<span>원</span>
                            </span>
                           	<input id="real_amount" type="text" value="${requestScope.viewMap.totalprice}"/>
                            <br>
                            <br>
                            <p><input type="checkbox" id="agree_purchase"/><label for="agree_purchase" class="ml-2">결제정보를 확인하였으며, 구매진행에 동의합니다.</label></p>
                            <p><button type="button" onClick="goPurchase()">결제하기</button></p>
                            <p class="p_tbl_pay_method"><b>총 적립예정금액</b>
                            	<span>
                            		<span class="prod_point"></span>원
                            	</span>
                            </p>
                            <p class="p_tbl_pay_method"><b>상품별 적립금</b>
                            	<span>
                            		<span class="prod_point"></span>원
                            	</span>
                            	<input type="text" id="totalProdpoint"/>
                            </p>
                            <!-- <p class="p_tbl_pay_method"><b>회원적립금</b><span>0원</span></p> -->
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <form name="orderinsert">
        	<input id="userid" type="text" name="userid" value="${requestScope.loginuser.userid}"/>
        	<input id="cart_code" type="text" name="cart_code" value="${requestScope.viewMap.cart_codeJoin}"/>
        	<input id="userusePoint" type="text" name="userusePoint" value="0"/>
        	<input id="prodPoint" type="text" name="prodPoint" value=""/>
        	<input id="totalRealamount" type="text" name="totalRealamount" value=""/>
        	<input id="totalOrderamount" type="text" name="totalOrderamount" value=""/>
        	<input id="discountamount" type="text" name="discountamount" value=""/>
        	<input id="deliveryfee" type="text" name="deliveryfee" value=""/>
        	<input id="prod_code" type="text" name="prod_code" value=""/>
        	<input id="order_buy_count" type="text" name="order_buy_count" value=""/>
        	<input id="order_price" type="text" name="order_price" value=""/>
        	<input id="prod_color" type="text" name="prod_color" value=""/>
        	<input id="prod_size" type="text" name="prod_size" value=""/>
        </form>
    </div>

<!-- footer -->
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>