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

		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:210px;">
				<col style="width:75px;">
				<col style="width:250px;">
				<col style="width:80px;">
				<col style="width:120px;">
				<col style="width:120px;">
				<col style="width:160px;">
			</colgroup>
			<thead>
			  <tr>
				<th scope="col">주문일 / 주문번호</th>
				<th scope="col" colspan="2">주문내역</th>
				<th scope="col">수량</th>
				<th scope="col">금액</th>
				<th scope="col">주문상태</th>
				<th scope="col">취소/교환/반품</th>
			  </tr>
			</thead>
			<tbody>
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
						<nav class="my-5">
					    	<div style="display: flex; width: 80%">
					    		<ul class="pagination" style="margin: auto">${requestScope.pageBar}</ul>
					    	</div>
					    </nav>
					</c:when>
				
					
					<c:otherwise>
						<tr style="vertical-align: middle">
							<td colspan="5">최근 주문내역이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
		   	 </tbody>
		   	 
		  </table>
		  
		      