<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</head>
<body>


	
	


<div class="container">

	<div >
		<img src="<%= ctxPath%>/images/jihee/abproduct.png" class="img-fluid col-lg-12" alt="..." style="padding-bottom: 30px;">
	</div>
	
	<div >
		<p class="fst-normal" style="text-align: left; font-size: 25px; padding-bottom: 30px;">CATEGORY BEST</p>
	</div>

 	<div class="row">
     <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="<%= request.getContextPath()%>/jihee/product/productSn.sue"class="btn btn-outline-primary" style="color:blue;">스니커즈</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="<%= request.getContextPath()%>/product/productBest.sue"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="<%= request.getContextPath()%>/product/sideFL.sue"class="btn btn-primary" style="color:white; ">상세페이지</a>
  				</div>
		</div>
     </div>
          
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="<%= request.getContextPath()%>/product/productSale.sue"class="btn btn-primary" style="color:white;">상세페이지</a>
  				</div>
		</div>
     </div>
     
    
     
     
  </div>
  

  
</div>
  
  




<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>