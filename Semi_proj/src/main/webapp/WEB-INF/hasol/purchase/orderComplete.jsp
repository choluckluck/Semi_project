<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<style type="text/css">
	div#container{
		width:90%;
		margin: 0 auto;
	}
	
		/* 혜택정보 */
	.pur_benefit_info {
		margin:0 auto;
	    border: solid 1px lightgray;
	    padding:5px;
	}
	
	.tbl_pur_benefit_info {
	    width: 100%;
	}
	
	.tbl_pur_benefit_info tr:first-child td:first-child {
	    border-right: solid 1px lightgray;
	    width:14%;
	    font-weight: bold;
	    text-align: center;
	    margin-left: 10%;
	}
	
	
	.tbl_pur_benefit_info tr td:nth-child(3) {
	    padding: 10px 0;
	    border-bottom: solid 1px lightgray;
	    font-size: 15px;
	}
	
	.blackborder{
		border-top: solid 1px black !important;
		border-bottom: solid 1px black !important;
	}
	
	
</style>



<script type="text/javascript">

</script>



<div class="row container-fluid mt-5 pt-4">
<div id="container" style="position:relative;" class="col-8">
	<h2 style="font-weight:bold;" class="mb-2"> 주문 완료</h2>
      <div class="pur_benefit_info mt-2">
         <table class="tbl_pur_benefit_info">
            <tr>
                <td rowspan='2'>혜택정보</td>
                <td rowspan='2' width="10px" style="padding: 0 3px;"></td>
                <td style="font-size:9pt;">${sessionScope.loginuser.name} 님은
                [
                <c:if test="${sessionScope.loginuser.grade_code eq 1}">WELCOOME</c:if>
                <c:if test="${sessionScope.loginuser.grade_code eq 2}">SILVER</c:if>
                <c:if test="${sessionScope.loginuser.grade_code eq 3}">GOLD</c:if>
                <c:if test="${sessionScope.loginuser.grade_code eq 4}">VIP</c:if>
                ]
                회원입니다. <br>
                </td>
            </tr>
            <tr style="font-size:9pt;"> 
                <td class="py-2">가용적립금: <fmt:formatNumber value="${sessionScope.loginuser.point}" pattern="#,###"/>원</td>
            </tr>
         </table>
      </div>
      
      <c:set var="now" value="<%=new java.util.Date()%>" />
      
      <br>
      <div style="font-size: 10pt;">
		주문내역 및 배송에 관한 안내는 <a href="javascript:location.href='<%= ctxPath%>/seongmin/member/orderView.sue'" style="color:black; text-decoration: underline; font-size:13pt; font-weight:bold;">주문조회</a> 를 통하여 확인 가능합니다. <br>
		<br>
		주문번호 : <span>${requestScope.paraMap.order_code}</span> 
		<br>
		주문일자 : <span><fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></span>
	  </div>
	  <br><br>
	  
	   <div>
		<h5 style="font-weight:bold;">결제 정보</h5>
		<br>
		  <table class="table" style="width:100%; margin:0; font-size: 10pt;">
			<thead>
			  <tr>
				<td width="15%" style="font-weight:bold;">최종결제금액</td>
				<td style="text-align:left;"><span><fmt:formatNumber value="${requestScope.paraMap.totalRealamount}" pattern="#,###"/>원</span></td>
			  </tr>
			</thead>
			<tbody>
		    </tbody>
		  </table>
	      <hr style="margin:0; margin-bottom: 20px;">
		<br><br>
		
		<h5 class='mb-3' style="font-weight:bold;">주문상품 정보</h5>
	   <div id="prd-info" style="font-size: 10pt;">
	   		<table class="table" style="text-align:center; width:100%">
			<thead>
			  <tr>
				<th colspan="2" class="blackborder">상품정보</th>
				<th class="blackborder">수량</th>
				<th class="blackborder">적립금</th>
				<th class="blackborder">배송구분</th>
				<th class="blackborder">배송비</th>
				<th class="blackborder">합계</th>
			  </tr>
			</thead>
			<tbody>	
				<c:forEach var="pvo" items="${requestScope.pvoList}" varStatus="status"> 
					<tr>
						<c:set var="idx" value="${status.index}"></c:set>
						<td width="130px"><img src="<%=ctxPath%>/images/product/${pvo.prod_image}" width="130px" style="padding: 10% 0;" ></td>
						<td width="160px">
							<div id="prod_name">${pvo.prod_name}</div>
							<div>옵션:[${pvo.pdvo.prod_color}/${pvo.pdvo.prod_size}]</div>
							<div><fmt:formatNumber value="${pvo.prod_saleprice}" pattern="#,###"/>원</div>
						 </td>
						 <td>${requestScope.paraMap.order_buy_countArr[idx]}</td>
						 <td>${pvo.prod_point}</td>
						 <td >기본배송</td>
						 <td>
						 	<fmt:formatNumber value="${requestScope.paraMap.deliveryfee}" pattern="#,###"/>원
						 </td>
						 <td>
						 	<fmt:formatNumber value="${requestScope.paraMap.totalOnePriceArr[idx]}" pattern="#,###"/>원
					 	</td>
					</tr>
				</c:forEach>
				 <tr>
			        <td colspan="7" height="40px" align="right" style="padding-right: 10px;">
			        	상품구매금액 
				        <span style="margin-left:5px;"><fmt:formatNumber value="${requestScope.paraMap.totalOrderamount}" pattern="#,###"/></span>원
				        &nbsp;+&nbsp;배송비 
				        <span style="margin-left:5px;"><fmt:formatNumber value="${requestScope.paraMap.deliveryfee}" pattern="#,###"/></span>원
				        &nbsp;=&nbsp; 합계
				        <span style="font-weight:bold; margin-left:5px;"><fmt:formatNumber value="${requestScope.paraMap.totalRealamount}" pattern="#,###"/>원</span>
			        </td>
			    </tr>	
			
		    </tbody>
		  </table>
		  
	   	  <hr style="width:100%;">	   	
	   	<br><br><br>
	   	
	   	<div id="total">
	   	  <table class="table" style=" width:100%; font-size: 10pt;">
			<thead>
				<tr>
					<th class="blackborder" width="30%" style=" text-align:center;">총 주문금액</th>
					<th class="blackborder" width="30%" style=" text-align:center;">총 결제금액</th>
					<th class="blackborder" width="30%" style=" text-align:center;">총 적립금</th>	
				</tr>
			</thead>
			<tbody>
	      	  <tr>
				<td style="text-align:center;"><fmt:formatNumber value="${requestScope.paraMap.totalOrderamount}" pattern="#,###"/>원</td>
				<td style="text-align:center;"><fmt:formatNumber value="${requestScope.paraMap.totalRealamount}" pattern="#,###"/>원</td>
				<td style=" text-align:center;"><fmt:formatNumber value="${requestScope.paraMap.prodPoint}" pattern="#,###"/>원</td>
	      	  </tr>
		    </tbody>
		  </table>
		</div>
		  <hr style="width:100%;">
		  <br><br><br>
		  
	   	<div id="addr_info"><h5 style="font-weight:bold;">배송지 정보</h5></div>
	   	
	   	<br>	   	
	   	<table class="table" style=" width:100%; font-size: 10pt;">
			<colgroup>
				<col style="width:200px;">
				<col style="width:auto;">
			</colgroup>
			<tbody>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">받으시는분</td>
				<td scope="col"><span>${sessionScope.loginuser.name}</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">우편번호</td>
				<td scope="col"><span>${sessionScope.loginuser.postcode}</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">주소</td>
				<td scope="col"><span>${sessionScope.loginuser.address}&nbsp;${sessionScope.loginuser.detailaddress}&nbsp;${sessionScope.loginuser.extraaddress}</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">휴대전화</td>
				<td scope="col">
					<c:set var="mobile" value="${sessionScope.loginuser.mobile}"/>
               	   <c:set var="mobile1" value="${fn:substring(mobile, 0, 3)}"/>
               	   <c:set var="mobile2" value="${fn:substring(mobile, 3, 7)}"/>
               	   <c:set var="mobile3" value="${fn:substring(mobile, 7, 12)}"/>
               	   ${mobile1}-${mobile2}-${mobile3}
				</td>
		    </tbody>
		  </table>
		  <hr style="width:100%;">
		  
		  
		<div style="width:100%;" align="right" class="mb-5 pb-5">
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:480px;" onclick="javascript:location.href='<%= ctxPath%>/main.sue'">쇼핑 계속하기</button>
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;" onclick="javascript:location.href='<%= ctxPath%>/seongmin/member/orderView.sue'">주문 확인하기</button>
		</div>
		  
	   </div>



	   
	   </div>
	  </div>
</div>
	
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>


