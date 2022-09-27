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

<div class="row">
	<div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="<%= request.getContextPath()%>/jihee/product/sideFL.sue"class="btn btn-outline-primary" style="color:blue;">플랫/로퍼</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
  	</div>
  
  <div class="row" style="margin-top: 5%;">
    <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
  </div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  </div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  </div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="sideinfo">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary" style="color:blue;">상세페이지</a>
  				</div>
		</div>
     </div>
      </div>

  
</div>


</body>
</html>