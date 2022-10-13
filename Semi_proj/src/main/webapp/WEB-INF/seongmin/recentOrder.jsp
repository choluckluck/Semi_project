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

<script type="text/javascript">

	$(document).ready(function(){
		  $("a.orderview").click(function(e){
//		  	alert($(e.target).html());
		  	$(e.target).html()
		  });
		
		
		
		
	
	});


</script>


<c:choose>
	<c:when test="${not empty requestScope.recentOrderList}">
		<c:forEach var="rovo" begin="0" end="3" items="${requestScope.recentOrderList}">
			<tr >
				<td class="recentordertd">${rovo.orderdate}<br>
				[<a class="orderview" href="#">${rovo.order_code}</a>]</td>
				<%--<%=request.getContextPath()/seongmin/member/orderDetail.sue--%>				
				<td class="recentordertd"><a href="<%=request.getContextPath() %>/heajun/product/productdetail.sue?prod_code=${rovo.pvo.prod_code}"><div><img id="recentorderimg" src="<%=request.getContextPath() %>/images/product/${rovo.pvo.prod_image}"></div></a></td>
				<td class="recentordertd"style="text-align: left">
				<a class="prd" href="<%=request.getContextPath() %>/heajun/product/productdetail.sue?prod_code=${rovo.pvo.prod_code}">${rovo.pvo.prod_name}</a></td>
				<td class="recentordertd">${rovo.odvo.order_buy_count}</td>
				<td class="recentordertd">
				
				정가 : <fmt:formatNumber value="${rovo.odvo.order_price}" pattern="#,###"/>원<br>
				할인가 : <fmt:formatNumber value="${rovo.pvo.prod_saleprice}" pattern="#,###"/>원<br>
				</td>
				
				
				</td>
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