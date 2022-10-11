<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

 <% 
 	String ctxPath = request.getContextPath(); 
 %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펌프스</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<style type="text/css">
a:visited {text-decoration: none; color: gray;}
a.link:hover {text-decoration: none; color: gray;}
a:active {text-decoration: none; color: gray;}
</style>

</head>
<body>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<form name="productHpFrm" >
	<div class="container-fluid" id="container" style="position: relative; top:85px; padding: 0.1% 1.5%;">
      
	  <div class="row">
		 <div class="col-md-2" id="sideinfo">
			
			

			
			<div id="sidecontent" style="text-align: left; padding: 20px;">
						<div class="row">
				<div class="col ">
				<p class="fw-bolder" style="font-size: 30px">앵클/부츠</p>
				</div>
			</div>
				<ul style="list-style: none; text-align: left; padding:0px; font-size: 17px; color:gray;">
					<li class="fw-bolder"> <a href="<%=ctxPath%>/jihee/product/productHp4cm.sue" class="link" style="text-decoration: none; color: gray;">앵클 1~6cm</a><li>
					<li class="fw-bolder"><a href="<%=ctxPath%>/jihee/product/productHp7cm.sue" class="link" style="text-decoration: none; color: gray;">앵클 7cm~</a><li>
					<li class="fw-bolder"><a href="<%=ctxPath%>/jihee/product/productHp7cm.sue" class="link" style="text-decoration: none; color: gray;">롱부츠</a><li>
				</ul>
				<br>
			<div class="row">
				<div>
					<p class="fw-bolder" style="text-align: left; font-size: 18px;">Filter&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="button" class="btn btn-light" onclick="form_reset()">Reset all</button></p>	
					<hr style="background: black; padding-top: 0px;">	
				</div>
			</div>
			
			
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
				<p class="fw-bolder" >색상범주</p>
				
				<div class="btn-group " role="group" aria-label="Basic checkbox toggle button group">
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="brownColor" id="brown" value="brown" autocomplete="off">
  						<label class="btn form-check-inline" for="brown" style="padding: 10%; background-color:brown; color: white;" >brown</label>&nbsp;
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="silverColor" id="silver" value="silver" autocomplete="off">
 				 		<label class="btn form-check-inline" for="silver" style="padding: 10%; background-color:silver; color: white;">silver</label>
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
  						<label class="btn btn-outline-danger form-check-inline" for="red" style="padding: 10%;">&nbsp;&nbsp;&nbsp;red&nbsp;&nbsp;&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="blackColor" id="black" value="black" autocomplete="off">
 				 		<label class="btn btn-outline-dark form-check-inline" for="black" style="padding: 10%;">&nbsp;black&nbsp;</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="greenColor" id="green" value="green" autocomplete="off">
  						<label class="btn btn-outline-success form-check-inline" for="green" style="padding: 10%;">green</label>
					</div>
					
					<div>
  						<input type="checkbox" class="btn-check colorcheck" name="yellowColor" id="yellow" value="yellow" autocomplete="off">
  						<label class="btn btn-outline-warning form-check-inline" for="yellow" style="padding: 10%; ">&nbsp;yellow&nbsp;</label>
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
				<p class="fw-bolder" >사이즈</p>
		    </div>
		    <div class="btn-group " role="group" aria-label="Basic checkbox toggle button group" >
				<div>
 						<input type="checkbox" class="btn-check" name="Size220" id="220" value="220" autocomplete="off">
 						<label class="btn btn-outline-secondary form-check-inline" for="220" style="padding: 10%;">&nbsp;&nbsp;220&nbsp;&nbsp;</label>
				</div>
				<div>
 						<input type="checkbox" class="btn-check" name="Size225" id="225" value="225" autocomplete="off">
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
			<p><button type="button" class="btn " style="color: white; background-color: #00264d;" onclick="goSearch()">검색</button></p>	
	
			
			
			
			
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
</form>			
			
			
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
		
	   /////////////////
		if("${requestScope.redColor}" != "") { //검색어가 null아닐때만 꽂아준다
				 $("input:checkbox[id='${requestScope.redColor}']").prop("checked", true);
			   } 
	     if("${requestScope.greenColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.greenColor}']").prop("checked", true);
		   } 
	     if("${requestScope.purpleColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.purpleColor}']").prop("checked", true);
		   } 
	     if("${requestScope.yellowColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.yellowColor}']").prop("checked", true);
		   } 
	     if("${requestScope.blackColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.blackColor}']").prop("checked", true);
		   } 
	     if("${requestScope.brownColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.brownColor}']").prop("checked", true);
		   } 
	     if("${requestScope.silverColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.silverColor}']").prop("checked", true);
		   } 
	     if("${requestScope.orangeColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.orangeColor}']").prop("checked", true);
		   } 
	     if("${requestScope.pinkColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.pinkColor}']").prop("checked", true);
		   } 
	     if("${requestScope.AquamarineColorColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.AquamarineColorColor}']").prop("checked", true);
		   } 
	     if("${requestScope.redColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.redColor}']").prop("checked", true);
		   } 
	     if("${requestScope.redColor}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.redColor}']").prop("checked", true);
		   } 
	     
	     
	   ///////////////////////  
	     
		if("${requestScope.Size220}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size220}']").prop("checked", true);
		   } 
	    
		if("${requestScope.Size225}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size225}']").prop("checked", true);
		   } 
		if("${requestScope.Size230}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size230}']").prop("checked", true);
		   } 
		if("${requestScope.Size235}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size235}']").prop("checked", true);
		   } 
		if("${requestScope.Size240}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size240}']").prop("checked", true);
		   } 
		if("${requestScope.Size245}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size245}']").prop("checked", true);
		   } 
		if("${requestScope.Size250}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size250}']").prop("checked", true);
		   } 
		
		if("${requestScope.Size255}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("input:checkbox[id='${requestScope.Size255}']").prop("checked", true);
		   } 
		
		if("$${requestScope.selectItem}" != "") { //검색어가 null아닐때만 꽂아준다
			 $("#selectItem").val("${requestScope.selectItem}").prop("selected", true);
		   } 
		
		
		
		
	     
	    
	    
	});// end of ready---------------
	
	function goSearch() {
		
		const frm = document.productHpFrm
		frm.action = "productAb.sue";
		frm.submit();
		

	}

	function form_reset() {
		
		$("input#searchWord").val("");
		
		$("input#searchPrice1").val("");
		 
		$("input#searchPrice2").val("");
		   
		$("input:checkbox").prop("checked", false);
	
	}
	
</script>			
    
<div style="margin-top: 10%">
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
</div>



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>