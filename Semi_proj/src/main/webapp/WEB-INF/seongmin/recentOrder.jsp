<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
	<c:when test="${not empty requestScope.recentOrderList}">
		<c:forEach var="rovo" items="${requestScope.recentOrderList}">
			<tr style="vertical-align: middle">
				<td>${rovo.orderdate}<br>
				<a class="orderview" href=#>[${rovo.order_code}]</a></td>
				<td><a href=#><img src="./images/shoes1.jpg"></a></td>
				<td style="text-align: left">
				<a class="prd" href="#">${rovo.pvo.prod_name}</a></td>
				<td>${rovo.odvo.order_buy_count}</td>
				<td>${rovo.odvo.order_price}</td>
				<td>${rovo.order_state}</td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr style="vertical-align: middle">
			<td colspan="5">최근 주문내역이 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>