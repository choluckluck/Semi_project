<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펌프스</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
a:link {text-decoration: none; color: gray;}
a:visited {text-decoration: none; color: gray;}
a.link:hover {text-decoration: none; color: gray;}
a:active {text-decoration: none; color: gray;}
</style>

</head>
<body>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>


	<div class="container-fluid" id="container" style="position: relative; top:85px; padding: 0.1% 1.5%;">
      
	  <div class="row">
		 <div class="col-md-2" id="sideinfo">
			
			

			
			<div id="sidecontent" style="text-align: left; padding: 20px;">
						<div class="row">
				<div class="col ">
				<p class="fw-bolder" style="font-size: 30px">힐/펌프스</p>
				</div>
			</div>
				<ul style="list-style: none; text-align: left; padding:0px; font-size: 17px; color:gray;">
					<li class="fw-bolder"> <a href="#" class="link">4~6cm</a><li>
					<li class="fw-bolder"><a href="#" class="link">7cm~</a><li>
				</ul>
				<br>
			<div class="row">
				<div>
					<p class="fw-bolder" style="text-align: left; font-size: 18px;">Filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-light">Reset all</button></p>	
					<hr style="background: black; padding-top: 0px;">	
				</div>
			</div>
			
			<form name="productHpFrm" >
			 <div>
					<label for="usr" class="fw-bolder" style="padding-bottom: 20px; ">검색어</label>
  					<input type="text" class="form-control" id="searchWord" name="searchWord" >	
					
				</div>
				<br><br>
				
				<div class="container" style="padding: 0px">
				<label for="usr" class="fw-bolder" style="padding-bottom: 20px; ">가격</label> 
					<div class="row" style="padding-left: 10px">
					<input type="text" class="form-control col" id="searchPrice1" name="searchPrice1">~<input type="text" class="form-control col" id="searchPrice2" name="searchPrice2">
				    </div>
				</div>
				<br><br>
				
				<!-- 체크박스 색상 -->
				<div class="color" style="padding: 0px;">
				<p class="fw-bolder" >색상범주(코딩)</p>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="greenColor" id="green" value="green" autocomplete="off">
  						<label class="btn btn-success form-check-inline" for="green" style="padding: 10%;" >green</label>&nbsp;
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="yellowColor" id="yellow" value="yellow" autocomplete="off">
 				 		<label class="btn btn-warning form-check-inline" for="yellow" style="padding: 10%;">yellow</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="purpleColor" id="purple" value="purple" autocomplete="off">
  						<label class="btn form-check-inline" for="purple" style="padding: 10%; background-color:purple; color: white;" >purple</label>
  					</div>
  					
  					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="skyblueColor" id="skyblue" value="skyblue"  autocomplete="off">
  						<label class="btn btn-primary form-check-inline" for="skyblue" style="padding: 10%;">skyblue</label>
					</div>
				</div>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="redColor" id="red" value="red" autocomplete="off">
  						<label class="btn btn-outline-danger form-check-inline" for="red" style="padding: 10%;">&nbsp;&nbsp;red&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="blackColor" id="black" value="black" autocomplete="off">
 				 		<label class="btn btn-outline-dark form-check-inline" for="black" style="padding: 10%;">&nbsp;black&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="brownColor" id="brown" value="brown" autocomplete="off">
  						<label class="btn btn-outline-primary form-check-inline" for="brown" style="padding: 10%;">brown</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="silverColor" id="silver" value="silver" autocomplete="off">
  						<label class="btn btn-outline-success form-check-inline" for="silver" style="padding: 10%; ">&nbsp;silver&nbsp;</label>
  					</div>
  					
  					
				</div>
				<br><br>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="orangeColor" id="orange" value="orange" autocomplete="off">
  						<label class="btn form-check-inline" for="orange" style="padding: 10%; background-color:orange; color: white;">orange</label>&nbsp;
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="pinkColor" id="pink" value="pink" autocomplete="off">
 				 		<label class="btn btn-warning form-check-inline" for="white" style="padding: 10%; background-color:pink; color: white;">&nbsp;&nbsp;pink&nbsp;&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="AquamarineColor" id="Aquamarine" value="Aquamarine" autocomplete="off">
  						<label class="btn form-check-inline" for="Aquamarine" style="padding: 8%; background-color:Aquamarine; color: black;" >Aquamarine</label>
  					</div>
  				
				</div>
				
			</div>
			<br><br>
			
			<div class="color" style="padding: 0px;">
				<p class="fw-bolder" >사이즈(코딩)</p>
		    </div>
		    <div class="btn-group " role="group" aria-label="Basic checkbox toggle button group" >
				<div>
 						<input type="checkbox" class="btn-check" name="Size220" id="220" value="220" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="220" style="padding: 10%;">&nbsp;&nbsp;220&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size226" id="225" value="225" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="225" style="padding: 10%;">&nbsp;&nbsp;225&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size230" id="230" value="230" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="230" style="padding: 10%;">&nbsp;&nbsp;230&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size235" id="235" value="235" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="235" style="padding: 10%;">&nbsp;&nbsp;235&nbsp;&nbsp;</label>
				</div>								
			</div>
			
			<br>

			<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
				<div>
 						<input type="checkbox" class="btn-check" name="Size240" id="240" value="240" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="240" style="padding: 10%;">&nbsp;&nbsp;240&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size245" id="245" value="245" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="245" style="padding: 10%;">&nbsp;&nbsp;245&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size250" id="250" value="250" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="250" style="padding: 10%;">&nbsp;&nbsp;250&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size255" id="255" value="255" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="255" style="padding: 10%;">&nbsp;&nbsp;255&nbsp;&nbsp;</label>
				</div>								
			</div>
			
			<br><br>
			<select class="form-select-lg-3" aria-label="Default select example" style="" name="selectItem"  id="selectItem" onchange="goSearch()">
		  <option value="popularityitem" selected >인기상품순</option>
		  <option value="newItem">신상품순</option>
		  <option value="lowPriceItem">낮은가격순</option>
		  <option value="highPriceItehm">높은가격순</option>
		  <option value="discountItem" >할인율순</option>
		</select>
		
			<br><br>
			<p><button type="button" class="btn btn-dark" style="color: white;" onclick="goSearch()">검색</button></p>	
		
			
			
			</form>
			
			</div>
		 </div>
		   
		 
		 
		 <div class="col-md-10" id="maininfo" align="center"> 
		 
			<div id="maincontent">
		 <jsp:include page="4.productHpTop.jsp" /> 
		 <jsp:include page="4.productHpBottom.jsp" /> 
		</div>
	 </div>
	 </div>
</div> 
			
			
			
<script type="text/javascript">
	$(document).ready(function(){
		
		// 검색어 이벤트 
		$("input#searchWord").bind("keyup", function(e) {
			
			 if(e.keyCode == 13) { // 검색어에서 엔터를 치면 검색하러 가도록 한다.
				   goSearch();	   
			   }	   
			   
		   });
		
		if("${requestScope.searchWord}" != "") { //검색어가 null아닐때만 꽂아준다
		 	   $("input#searchWord").val("${requestScope.searchWord}");
		   }
		
		// 가격검색 이벤트
		
		$("input#searchPrice1").bind("keyup", function(e) {
			
			 if(e.keyCode == 13) { // 검색어에서 엔터를 치면 검색하러 가도록 한다.
				   goSearch();	   
			   }	   
			   
		   });
		
		if("${requestScope.searchPrice1}" != "") { //검색어가 null아닐때만 꽂아준다
		 	   $("input#searchPrice1").val("${requestScope.searchPrice1}");
		   }
		
		
		$("input#searchPrice2").bind("keyup", function(e) {
			
			 if(e.keyCode == 13) { // 검색어에서 엔터를 치면 검색하러 가도록 한다.
				   goSearch();	   
			   }	   
			   
		   });
		
		if("${requestScope.searchPrice2}" != "") { //검색어가 null아닐때만 꽂아준다
		 	   $("input#searchPrice2").val("${requestScope.searchPrice2}");
		   }
		
		//체크박스 이벤트
		
	    /* $(".colorcheck").change(function(){ //체크박스 체크 해제시 
	        if($(".colorcheck").is(":checked")){
	            goSearch();
	            
	        }else{
	            godelete();
	        }
	    });
	     */
		
		if("${requestScope.redColor}" != "") { //검색어가 null아닐때만 꽂아준다
				 $("input:checkbox[id='${requestScope.redColor}']").prop("checked", true);
			   } 
	     
		if("${requestScope.Size220}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size220}']").prop("checked", true);
		   } 
	    
	     
	    
	    
	});// end of ready---------------
	function goSearch() {
		
		const frm = document.productHpFrm
		frm.action = "productHp.sue";
		frm.submit();
		
	
	
	
	}
	
</script>			
    
<div style="margin-top: 10%">
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>