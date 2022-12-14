<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<%
    String ctxPath= request.getContextPath();
    
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
$(document).ready(function(){
	
	
	
});
function goSearche() {
	
	const frm_select  = document.selectItem
	frm_select.action = "productHp.sue";
	frm_select.submit();
	
}
</script>
</head>
<body>
<div class="container">


	<div style="margin-top: 10%;">
	
		<select class="form-select-lg-3" aria-label="Default select example" style="float: right;" name="selectItem"  id="selectItem" onchange="goSearch()">
		  <option value="popularityitem" selected >인기상품순</option>
		  <option value="newItem">신상품순</option>
		  <option value="lowPriceItem">낮은가격순</option>
		  <option value="highPriceItehm">높은가격순</option>    
		</select>
		<!-- <p><button type="button" class="btn btn-dark" style="color: white ;" onclick="goSearch()">검색</button></p> -->
		
	</div>
	
	
	<div>
		<p class="fst-normal" style="text-align: left; font-size: 25px; padding-bottom: 30px;">Sale</p>
	</div>
	

<div class="row">
	
	<c:forEach var="pvo" items="${requestScope.productList}">
	
	<div class="col-lg-3" id="sideinfo" style="margin-bottom: 5%;">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/product/${pvo.prod_image}" class="card-img-top" alt="...">
  				<div class="card-body">
    				<div class="card-title" >
    				
    				<c:forTokens var="color" items="${pvo.prod_color}" delims=",">
    				<span class="best_color" style="background-color: ${color};"> </span>      
    				</c:forTokens>
    				<span> &nbsp;&nbsp;&nbsp;&nbsp; 리뷰 ${pvo.prod_review_count} </span>
    				</div>
    				
    				<p class="card-text"><div class="fw-bolder">${pvo.prod_name} (${pvo.prod_high}cm) </div>
    				<c:if test="${pvo.prod_saleprice ne pvo.prod_price}">
	   				<span><fmt:formatNumber value="${pvo.prod_saleprice}" pattern="###,###"></fmt:formatNumber></span>
    				<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${pvo.prod_price}" pattern="#,###"/></span>
    				<span style="color: red; "> ${pvo.discountPercent}% </span></p>
					</c:if>	
					<c:if test="${pvo.prod_saleprice eq pvo.prod_price}">
    				<fmt:formatNumber value="${pvo.prod_price}" pattern="###,###"></fmt:formatNumber></p>
					</c:if>	
    				</p>
    				
    				<a href='/Semi_proj/heajun/product/productdetail.sue?prod_code=${pvo.prod_code}' class="stretched-link" style="color:white; background-color: #003366;"></a>
  				</div>
		</div>
     </div>

     </c:forEach>
     
  	</div>	
 	
 
 
  
  <nav aria-label="Page navigation">
		  <ul class="pagination justify-content-center pagination-sm my-5">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a >${requestScope.pageBar}</a></li>
		    
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
  
 </div>


</body>
</html>