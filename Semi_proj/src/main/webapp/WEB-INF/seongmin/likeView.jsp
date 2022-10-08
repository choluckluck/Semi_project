<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:choose>
	<c:when test="${not empty sessionScope.likeList}">
		<c:forEach var="lpvo" items="${sessionScope.likeList}">
		  <div class="col" style="border:none">		  
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="<%=request.getContextPath() %>/images/product/${lpvo.prod_image}" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">${lpvo.prod_name} <br>    <fmt:formatNumber value="${lpvo.prod_price}" pattern="#,###"/>원 </div>
			  </a>
			</div>			 
		  </div>
		</c:forEach>
	</c:when>
	<c:otherwise>
			<div>최근 주문내역이 없습니다.</div>
	</c:otherwise>
</c:choose>

