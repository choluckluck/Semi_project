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
	
</style>



<script type="text/javascript">

</script>



<div class="row container-fluid mt-5 pt-4">
<div id="container" style="position:relative;" class="col-8">
	<h2 style="font-weight:bold;" class="mb-2">주문 실패</h2>
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
      <div style="font-size: 15pt;">
		<br>
		<span>주문이 실패되었습니다. 다시 시도해주세요.</span> 
		<br>
	  </div>
	  <br><br>
	  
	   <div>
		  
		<div style="width:100%;" align="right" class="mb-5 pb-5">
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:480px;" onclick="javascript:location.href='<%= ctxPath%>/main.sue'">쇼핑 계속하기</button>
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;" onclick="javascript:location.href='<%= ctxPath%>/seongmin/member/orderView.sue'">주문 확인하기</button>
		</div>
		  
	   </div>



	   
	   </div>
	  </div>
</div>
	
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>


