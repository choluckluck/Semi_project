<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<%
    String ctxPath = request.getContextPath();
    //     /MyMVC
%>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function gocheck() {
	
	alert("체크박스 체크");
	
}

function godelete() {
	
	alert("체크박스 해제");
	
}
</script>
</head>
<body>
<div class="container">

	<div style="margin-top: 15%;">
		<select class="form-select-lg-3" aria-label="Default select example" style="float: right;">
		  <option selected>인기상품순</option>
		  <option value="1">신상품순</option>
		  <option value="2">낮은가격순</option>
		  <option value="3">높은가격순</option>
		  <option value="4">할인율순</option>
		</select>
	</div>
	
	
	<div>
		<p class="fw-bolder" style="text-align: left; font-size: 25px; padding-bottom: 30px;">힐/펌프스</p>
	</div>
	
<c:forEach var="i" begin="1" end="4">
<div class="row">
	<c:forEach var="pvo" items="${requestScope.productList}">
	<div class="col-lg-3" id="sideinfo" style="margin-bottom: 5%;">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">${pvo.prod_color} 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a class="btn btn-outline-primary" style="color:blue;" onclick="check();">플랫/로퍼</a>
  				</div>
		</div>
     </div>
     </c:forEach>
     
  	</div>	
 </c:forEach>  	
 
 
  
  <nav aria-label="Page navigation">
		  <ul class="pagination justify-content-center pagination-sm my-5">
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		    <li class="page-item"><a class="page-link">${requestScope.pageBar}</a></li>
		    
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