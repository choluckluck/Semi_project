<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠폰적용하기</title>

<!-- style.css -->
<link rel="stylesheet" href="<%= ctxPath%>/css/hasol/style_popup_coupon.css">

<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
</head>
<body>
    
    <!-- header -->
    <div class="header">
    	<span>쿠폰 조회/적용</span>
    </div>


    
    <!-- main -->
    <div class="container">

        <!-- 유의사항 -->
		<div class="use_coupon_notice">
			<table class="tbl_use_coupon_notice">
				<tr>
                    <td style="border: solid 1px lightgrey; padding: 5px;"><b>쿠폰 사용에 따른 유의사항</b></td>
                </tr>
                <tr> 
                    <td style="border: solid 1px lightgrey; padding: 5px;">
	                    <p> - 사용 가능한 쿠폰만 보여지게 됩니다. </p>
	                    <p> - 쿠폰은 회원등급 할인 이후에 적용되므로, 현재 페이지에서 보여지는 판매가와 실제 적용되는 금액과 다를 수 있습니다. </p>
                    </td>
                </tr>
			</table>
		</div>
		
		<!-- 상품별 쿠폰 적용 -->
		<div class="coupon_select">
            <span class="coupon_select_title"> 상품별 쿠폰 적용 </span>
            <table class="coupon_select_tab">
                <thead>
                    <tr height="30">
                        <td width="100px">배송구분</td>
                        <td width="90px">이미지</td>
                        <td width="150px">상품정보</td>
                        <td width="150px">판매가</td>
                        <td width="150px">할인혜택</td>
                        <td width="150px">상품별 쿠폰 선택</td>
                        <td width="150px">상품별 쿠폰 할인액</td>
                    </tr>
                </thead>
             <!-- 여기부터 제품 생길 때마다 반복 노출되어야하는 영역 -->
				<tbody>
					<tr>
	                 	<td>기본배송</td>
	                     <td><img src="images/test4.jpg" width="80" style="padding: 10px 0;" >
	                     <td style="text-align:left;">
	                         <p>제품명</p>
	                         <p style="color:grey;">옵션</p>
	                     </td>
	                     <td>얼마...</td>
	                     <td>500원</td>
	                     <td>사용가능쿠폰이 없습니다.</td>
	                     <td>0원</td>
					</tr>
				</tbody>
			</table>
		</div>
          
        <!-- 금액정보 -->
		<div class="coupon_amount_info">
			<table class="tbl_coupon_amount_info">
				<tr>
					<td style="padding:5px;">총 상품별 쿠폰 할인금액</td>
					<td style="padding:5px;">총 주문별 쿠폰 할인금액</td>
					<td style="padding:5px;">총 배송비 쿠폰 할인금액</td>  
                </tr>
                <tr> 
                    <td>0원</td>
                    <td>0원</td>
                    <td>0원</td>
                </tr>
                <tr>
                	<td colspan ="3"  >
                		<div style="margin:5px;">
	                		<select name= "coupon" style="width:300px;">
	                			<option value="">선택하세요</option>
	                			<option id="coupon_1"></option>
	                		</select>
                		</div>
                		<div>
	                		<select name="coupon" style="width:300px;">
	                			<option value="">선택하세요</option>
	                			<option id="coupon_1"></option>
	                		</select>
                		</div>
                	</td>
                </tr>
                <tr>
                	<td colspan="3" style="text-align:right; padding: 10px;">
                		<b>= 총 쿠폰 할인금액:
                		<span style="font-size:20px;">0원</span></b>
                	</td>
                </tr>
			</table>
		</div>
	</div>	
	
	
	<!-- footer -->
	<div class="btn_select_box">
		<button type="button" class="btn_select" id="btn_select_ok">쿠폰 적용하기</button>
		<button type="button" class="btn_select" id="btn_select_no">적용 취소하기</button>
	</div>
