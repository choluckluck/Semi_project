<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String ctxPath = request.getContextPath();
    //     /MyMVC
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script type="text/javascript">
$(document).ready(function(){
	
	// 상세페이지 클릭시 페이지 이동
	
</script>
</head>
<body>
<div class="container">
	<div >
		<img src="<%= ctxPath%>/images/jihee/smproduct.png" class="img-fluid col-lg-12" alt="..." style="padding-bottom: 30px;">
	</div>
	
	<div >
		<p class="fst-normal" style="text-align: left; font-size: 25px; padding-bottom: 30px;">CATEGORY BEST</p>
	</div>
 	<div class="row">
	<c:forEach var="pvo" items="${requestScope.bestProductList}" begin="0" end="3" step="1">
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
    				<%-- <c:if test="${pvo.prod_price} == ${pvo.prod_saleprice}">
    					</c:if> --%>
    				<c:if test="${pvo.prod_saleprice ne pvo.prod_price}">
	   				<span><fmt:formatNumber value="${pvo.prod_saleprice}" pattern="###,###"></fmt:formatNumber></span>
    				<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${pvo.prod_price}" pattern="#,###"/></span>
					<span style="color: red; "> ${pvo.discountPercent}% </span>	</p>
					</c:if>	
					<c:if test="${pvo.prod_saleprice eq pvo.prod_price}">
    				<fmt:formatNumber value="${pvo.prod_price}" pattern="###,###"></fmt:formatNumber></p>
					</c:if>	
    				<a href='/Semi_proj/heajun/product/productdetail.sue?prod_code=${pvo.prod_code}' class="stretched-link" style="color:white; background-color: #003366;"></a>
  				</div>
		</div>
     </div>
     </c:forEach>
     
  	</div>	
 	
  
</div>
  
  
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>