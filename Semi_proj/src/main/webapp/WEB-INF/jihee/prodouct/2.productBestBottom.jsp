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

	<div style="margin-top: 5%;">
		<select class="form-select-lg-3" aria-label="Default select example" style="float: right;">
		  <option selected>인기상품순</option>
		  <option value="1">신상품순</option>
		  <option value="2">낮은가격순</option>
		  <option value="3">높은가격순</option>
		  <option value="4">할인율순</option>
		</select>
	</div>
	
	
	<div>
		<p class="fst-normal" style="text-align: left; font-size: 25px; padding-bottom: 30px;">BEST</p>
	</div>

 	<div class="row">
     <div class="col-lg-3" id="bottomSideinfo1">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="<%= request.getContextPath()%>/jihee/product/productSale.sue"class="btn btn-outline-primary">Sale</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="bottomSideinfo2">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     	</div>
     
      <div class="col-lg-3" id="bottomSideinfo3">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     	</div>
          
      <div class="col-lg-3" id="bottomSideinfo4">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
  	</div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="bottomSideinfo5">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) </br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
  
  	

      <div class="col-lg-3" id="bottomSideinfo6">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) </br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="bottomSideinfo7">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) </br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
          
      <div class="col-lg-3" id="bottomSideinfo8">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) </br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
  </div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="bottomSideinfo9">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) </br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="bottomSideinfo10">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="bottomSideinfo11">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) </br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
          
      <div class="col-lg-3" id="bottomSideinfo12">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
  </div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="bottomSideinfo13">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="bottomSideinfo14">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="bottomSideinfo15">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
          
      <div class="col-lg-3" id="bottomSideinfo16">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
  </div>
  
  <div class="row" style="margin-top: 5%;">
     <div class="col-lg-3" id="bottomSideinfo17">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
  	

      <div class="col-lg-3" id="bottomSideinfo18">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>
     </div>
     
      <div class="col-lg-3" id="bottomSideinfo19">
  		<div class="card" style="width: 16rem;">
  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
  				<div class="card-body">
    				<p class="card-title">색(코딩) 리뷰(코딩)</p>
    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
    				<a href="#"class="btn btn-outline-primary">상세페이지</a>
  				</div>
		</div>  
      </div>

  
</div>

</div>
</body>
</html>