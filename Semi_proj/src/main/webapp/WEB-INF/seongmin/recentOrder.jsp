<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">
	img#recentorderimg {
	  width: 100px;
	  height: 120px;
	  object-fit: cover;
	}
	
	td.recentordertd {
		vertical-align: middle;
	}
	
</style>


<c:choose>
	<c:when test="${not empty requestScope.recentOrderList}">
		<c:forEach var="rovo" items="${requestScope.recentOrderList}">
			<tr >
				<td class="recentordertd">${rovo.orderdate}<br>
				<a class="orderview" href=#>[${rovo.order_code}]</a></td>
				<td class="recentordertd"><a href="#"><div><img id="recentorderimg" src="<%=request.getContextPath() %>/images/product/${rovo.pvo.prod_kind}/${rovo.pvo.prod_image}"></div></a></td>
				<td class="recentordertd"style="text-align: left">
				<a class="prd" href="#">${rovo.pvo.prod_name}</a></td>
				<td class="recentordertd">${rovo.odvo.order_buy_count}</td>
				<td class="recentordertd"><fmt:formatNumber value="${rovo.odvo.order_price}" pattern="#,###"/>원</td>
				<td class="recentordertd">${rovo.order_state}</td>
			</tr>
		</c:forEach>
	</c:when>
	<c:otherwise>
		<tr style="vertical-align: middle">
			<td colspan="5">최근 주문내역이 없습니다.</td>
		</tr>
	</c:otherwise>
</c:choose>