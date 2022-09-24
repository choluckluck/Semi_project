<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BEST</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">

</style>

</head>
<body >

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

	<div class="container-fluid" id="container" style="position: relative; top:85px; padding: 0.1% 1.5%;">
      
	  <div class="row">
		 <div class="col-md-2" id="sideinfo">
			
			

			
			<div id="sidecontent" style="text-align: left; padding: 20px;">
						<div class="row">
				<div class="col ">
				<p class="fw-bolder" style="font-size: 30px">BEST</p>
				</div>
			</div>
				
				<br>
			<div class="row">
				<div>
					<p class="fw-bolder" style="text-align: left; font-size: 18px;">Filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-light">Reset all</button></p>	
					<hr style="background: black; padding-top: 0px;">	
				</div>
			</div>
			
			<form name="productFL">
			 <div>
					<label for="usr" class="fw-bolder" style="padding-bottom: 20px; ">검색어</label>
  					<input type="text" class="form-control" id="search">	
					
				</div>
				<br><br>
				
				<div class="container" style="padding: 0px">
				<label for="usr" class="fw-bolder" style="padding-bottom: 20px; ">가격</label> 
					<div class="row" style="padding-left: 10px">
					<input type="text" class="form-control col" id="searchPrice1">~<input type="text" class="form-control col" id="searchPrice2">
				    </div>
				</div>
				<br><br>
				
				<div class="color" style="padding: 0px;">
				<p class="fw-bolder" >색상범주(코딩)</p>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
  						<label class="btn btn-success form-check-inline" for="btncheck1" style="padding: 10%;">green</label>&nbsp;
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
 				 		<label class="btn btn-warning form-check-inline" for="btncheck2" style="padding: 10%;">yellow</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
  						<label class="btn form-check-inline" for="btncheck3" style="padding: 10%; background-color:purple; color: white;" >purple</label>
  					</div>
  					
  					<div>
  						<input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
  						<label class="btn btn-primary form-check-inline" for="btncheck4" style="padding: 10%;">skyblue</label>
					</div>
				</div>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
  						<label class="btn btn-outline-danger form-check-inline" for="btncheck5" style="padding: 10%;">&nbsp;&nbsp;red&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
 				 		<label class="btn btn-outline-dark form-check-inline" for="btncheck6" style="padding: 10%;">&nbsp;black&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck7" autocomplete="off">
  						<label class="btn btn-outline-success form-check-inline" for="btncheck7" style="padding: 10%;">&nbsp;green</label>
  					</div>
  					
  					<div>
  						<input type="checkbox" class="btn-check" id="btncheck8" autocomplete="off">
  						<label class="btn btn-outline-primary form-check-inline" for="btncheck8" style="padding: 10%;">skyblue</label>
					</div>
				</div>
				<br><br>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck9" autocomplete="off">
  						<label class="btn form-check-inline" for="btncheck9" style="padding: 10%; background-color:orange; color: white;">orange</label>&nbsp;
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck10" autocomplete="off">
 				 		<label class="btn btn-warning form-check-inline" for="btncheck10" style="padding: 10%; background-color:pink; color: white;">&nbsp;&nbsp;pink&nbsp;&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check" id="btncheck11" autocomplete="off">
  						<label class="btn form-check-inline" for="btncheck11" style="padding: 8%; background-color:Aquamarine; color: black;" >Aquamarine</label>
  					</div>
  				
				</div>
				
			</div>
			<br><br>
			
			<div class="color" style="padding: 0px;">
				<p class="fw-bolder" >사이즈(코딩)</p>
		    </div>
		    <div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize1" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize1" style="padding: 10%;">&nbsp;220&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize2" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize2" style="padding: 10%;">&nbsp;225&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize3" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize3" style="padding: 10%;">&nbsp;230&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize4" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize4" style="padding: 10%;">&nbsp;235&nbsp;</label>
				</div>								
			</div>
			
			<br><br>

			<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize5" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize5" style="padding: 10%;">&nbsp;220&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize6" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize6" style="padding: 10%;">&nbsp;225&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize7" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize7" style="padding: 10%;">&nbsp;230&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" id="btnchecksize8" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="btnchecksize8" style="padding: 10%;">&nbsp;235&nbsp;</label>
				</div>								
			</div>
				
			</form>
			
			</div>
		 </div>
		   
		 
		 
		 <div class="col-md-10" id="maininfo" align="center"> 
		 
			<div id="maincontent">
		 <jsp:include page="2.productBestTop.jsp" /> 
		 <jsp:include page="2.productBestBottom.jsp" /> 
		</div>
	 </div>
	 </div>
</div> 
			
    

    
<div style="margin-top: 10%">
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
</div>  


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>