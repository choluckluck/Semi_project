<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%
    String ctxPath = request.getContextPath();
%>


<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 


<style type="text/css">
div{
		margin: 10px, 0px;
	}
	
	
td{padding: 10px;}
    


  ul{
    list-style-type: none;
    position:relative;
    right: 30px;
  }

  div.info {
   position:relative;
   left: 600px;
   bottom:700px;
  }

  div.keyImage{
   padding: 50px;

  }
  
  button#submit{
   margin-right:-4px;
  }

  button#submit2{
   margin-right: 7px;
  }

  button#submit3{
   margin-left:-3px;
   background-color: black;
   color: white;
  }
  
  .carousel-inner > .item > img {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 400px;
    } 
  
  
table#code{
position:relative;
right:35px;
}

.form-select{
 border-color: #e6e6e6;
 border-radius:5px;
 width:12px;
}
</style>



<script type="text/javascript">

	
$(document).ready(function() {
	
	  // === 주문개수 스피터 달기 === //
	   $("input#spinner").spinner( {
		   spin: function(event, ui) {
			   if(ui.value > 100) {
				   $(this).spinner("value", 100);
				   return false;
			   }
			   else if(ui.value < 1) {
				   $(this).spinner("value", 1);
				   return false;
			   }
		   }
	   } );// end of $("input#spinner").spinner({});------------- 
	   
	   
	 
	   
});//end of $(document).ready(function() {--------------------

	
//Function Declaration

function checkCart() {
   
   // === 주문량에 대한 유효성 검사하기 === //
    
    const frm = document.cartFrm;
    const regExp = /^[0-9]+$/; // 숫자만 체크하는 정규표현식
    const qnty = frm.qnty.value; 
    const bool = regExp.test(qnty);
    
    if(!bool) {
       // 숫자 이외의 값이 들어온 경우 
       alert("수량은 1개 이상이어야 합니다.");
       frm.qnty.value = "1";
       frm.qnty.focus();
       return; // 종료
    }
    
    // 문자형태로 숫자로만 들어온 경우
    if( Number(qnty) < 1 ) {
       alert("수량은 1개 이상이어야 합니다.");
       frm.qnty.value = "1";
       frm.qnty.focus();
       return; // 종료
    }
}
     // === 주문개수 스피터 달기 === //
      $("input#spinner").spinner( {
         spin: function(event, ui) {
            if(ui.value > 100) {
               $(this).spinner("value", 100);
               return false;
            }
            else if(ui.value < 1) {
               $(this).spinner("value", 1);
               return false;
            }
         }
      } );// end of $("input#spinner").spinner({});------------- 
      

});//end of $(document).ready(function() {--------------------


// 관심상품 바로가기
function goWish() {
   
   checkCart();
   
   const frm = document.cartFrm;
      frm.method = "POST";
      frm.action = "<%=request.getContextPath()%>/heajun/product/addWish.sue";
      frm.submit();

}


// 장바구니 바로가기
function goCart() {
      
      checkCart();
      
      // 주문개수가 1개 이상인 경우
      const frm = document.cartFrm;
      frm.method = "POST";
      frm.action = "<%=request.getContextPath()%>/heajun/product/addCart.sue";
      frm.submit();
      
}// end of function goCart()------------------------------ 


function goOrder() {

   checkCart();
   
   // 주문개수가 1개 이상인 경우
   const frm = document.cartFrm;
   
   let totalPrice = Number("${requestScope.pvo2.prod_price}")*Number($("input#spinner").val()); // 정가 * 수량
   let sumtotalPrice = Number("${requestScope.pvo2.prod_saleprice}")*Number($("input#spinner").val()); // 판매가 * 수량
   let sumtotalpoint = Number("${requestScope.pvo2.prod_point}")*Number($("input#spinner").val()); // 포인트 * 수량
      
   frm.totalPrice.value=totalPrice;
   frm.sumtotalPrice.value=sumtotalPrice;
   frm.sumtotalpoint.value=sumtotalpoint;
   
   frm.method = "POST";
      frm.action = "<%=request.getContextPath()%>/heajun/product/directOrder.sue";
   frm.submit();

}// end of function goOrder()------------------------------
	

</script>

</head>
<body>
<div id="container" style=" margin:0 auto; width:90%; position:relative;">

	<br><br>
	<div class="row" style="margin-top:80px;">	
		<div class="col-4" style="width:450px; border:solid 0px gray;" z-index: 3;>
		<ul>
		<li class="pvo"><img src="<%= ctxPath%>/images/product/${requestScope.pvo2.prod_image}" style="width:100%; margin-left:3px; margin-right:3px;"alt="..." ></li>
		<%-- <c:forEach var="pvo" items="${requestScope.pvo.prod_image}" begin="0" end="3" step="1">
		 <img src="<%= ctxPath%>/images/product/${ivo.prod_image}" style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">
        </c:forEach> --%>
        </ul>
   </div>
 <br><br>
		   
		
		
	


		<div class="  col-6" style="margin-left:50px;">
			<div style="font-size: 20px; margin-left:50px;"><strong style="font-size: 25px;">${requestScope.pvo2.prod_name}</strong ><a href="#" style=" color:gray;">(<span>${requestScope.pvo.prod_high}cm</span>)</a></div>
			<div style="font-size: 25px; margin-left:10px;"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.pvo2.prod_saleprice}원&nbsp;&nbsp;</strong><strike>&nbsp;${requestScope.pvo.prod_price}원</strike></div>
			<br>
			<div style="width: 100%;">
			
				<table  id="code" style="margin-left:50px;">
					<tr>
						<th style="width: 115px; text-align: center;">Code</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.pvo2.prod_code}</td>
					</tr>
					<tr>
						<th style="width: 115px; text-align: center;">적립금</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.pvo2.prod_point}원</td>
					</tr>
					<tr>
						<th style="width: 115px; text-align: center;">배송비</th>
						<td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,500원</strong> (70,000원 이상 구매 시 무료)</td>
					</tr>
				</table >
				
				

			<%-- ==== 장바구니담기 또는 바로주문하기 폼 value="${pvo.prod_code}"==== --%>
		    <form name="cartFrm">
		    
				<table style="margin-left:50px; margin-bottom:10px;">   
					<tr class="option">
						<th style="width: 115px; text-align:left;">COLOR</th>
							
							<td>
							
								<select  class="pvoList form-select" name="prod_color"id="pvoList"  style="width: 250px; font-size:15px; margin-left:1px; height:30px; ">    
								
								  <c:forTokens var="prod_color" items="${requestScope.pvo2.pdvo.prod_color}" delims=",">
								     <option value="${prod_color}">${prod_color}</option>   
						           </c:forTokens>  
						           
								 </select>
								
								

							</td>
					 </tr>
						
				 <tr class="option">	
				 <th style="width: 115px; text-align:left;">SIZE</th>
						<td>
								
							<select  class="pvoList form-select" name="prod_size"id="pvoList"  style="width: 250px; font-size:15px; margin-left:1px; height:30px; ">      
								
								<c:forTokens var="prod_size" items="${requestScope.pvo2.pdvo.prod_size}" delims=",">
								     <option value="${prod_size}">${prod_size}</option>   
						           </c:forTokens>  
							 </select>
									
						</td>
						
					</tr> 
					
					
			</table>    
				 

				     	    
			    <ul class="Productdetail list-unstyled mt-6" style="margin-left:80px; >
			    	<li >
			        	<label style="margin-left:80px; for="spinner" ><strong>주문수량&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong></label>
	  					<input id="spinner" name="qnty" value="1" style="width: 25px; ">
					</li>
					<li class="my-5 mx5" >
						<button type ="button" id="button2"  class="buttons border btn btn-outline-secondary  " onclick="goWish();  ">♡</button>
						<button type ="button" id="button"   class="buttons border btn btn-outline-secondary  col-4"  onclick="goCart();">장바구니</button>
						<button type ="button" id="button3"  class="buttons border btn btn-outline-secondary  col-4" onclick="goOrder();">바로구매</button>
					</li>
					
				</ul>
				  <input type="hidden" id="prod_code" name="prod_code" value="${requestScope.pvo2.prod_code}" />				
				  <input type="hidden" name="totalPrice" value=""/>
                  <input type="hidden" name="sumtotalPrice" value=""/>
                  <input type="hidden" name="sumtotalpoint" value=""/>
                  <input type="hidden" name="price" value="${requestScope.pvo2.prod_price}"/>
                  <input type="hidden" name="saleprice" value="${requestScope.pvo2.prod_saleprice}"/>
				
				
			</form>	
				
		
			
			</div>
			
		</div>
		
	</div> 
	
	
	<br><br>
	<br><br><br><br>
	
	<div class="row" style="text-align:center; vertical-align:middle; font-size:17pt; height:60px; border:solid 1px gray; background-color:white; position:sticky; top:0; z-index: 2;">
		<div class="col-4" style="padding:10px;  color:gray; ">
			<a href="#" style=" color:gray;">상품정보</a>
		</div>
		<div class="col-4" style="padding:10px; ">
			<a href="#" style=" color:gray;">리뷰(<span id=""></span>)</a>
		</div>
		<div class="col-4" style="padding:10px; ">
			<a href="#" style=" color:gray;">상품문의</a>
		</div>	
	</div>
	

						           
		  
		<%-- 상품 상세 이미지 보여주기 시작 --%>
	    <div class="row" style="margin-top:120px; " >
			 <c:forTokens var="product_image_file" items="${requestScope.ivo.product_image_file}" delims=",">
			    <img src="<%= ctxPath%>/images/product/${product_image_file}" style="margin: 0 auto; width:90%; height:90%; object-fit:cover; position:relative;" alt="...">
		     </c:forTokens>  
	    </div>  
 		<%-- 고정적 이미지 --%>
        <div class="row" style="margin-top:120px; " >
 			 <img src="<%= ctxPath%>/images/heajun/Pdetailimage1.jpg"style="margin: 0 auto; width:90%; height:90%; object-fit:cover; position:relative;" alt="..."> 
	     
	           <img src="<%= ctxPath%>/images/heajun/Pdetailimage2.jpg" style="margin: 0 auto; width:90%; height:90%; object-fit:cover; position:relative;" alt="..."> 
	     </div>  
  
		  
		  
		  
		
	  		
	<%-- === 추가이미지 보여주기 시작 === --%>
	<%-- <c:if test="${not empty requestScope.imgFile}">
		<div class="" id="prdDetail" style="position:relative; top:150px;>
			<c:forEach var="product_image_file" items="${requestScope.imgFile}">
				<div class="col-md-6 my-3">
					<img src="/Semi_proj/images/${product_image_file}" class="img-fluid" style="width: 100%;" />
				</div>
			</c:forEach>
		</div>
	</c:if> --%>
	<%-- === 추가이미지 보여주기 끝 === --%>
	
	  		
	  		
	  		<div id="tabs" class="tabs" style="margin:0 auto; border:solid 1px gray; position:relative; top:150px; width:90%;">
				<nav class="navbar navbar-expand-lg">
				  <div class="container-fluid" style="text-align:center;">

				    <div class="collapse navbar-collapse" id="navbarNav" style=" justify-content:center; color:gray; font-size:20px; ">
				      <ul class="navbar-nav" style="">
				        <li class="nav-item" style="margin-left:20px;">
				          <a class="nav-link active" href="#section-1">주문/교환/반품</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link" href="#section-2">A/S안내</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link" href="#section-3">사이즈 안내/브랜드구분</a>
				        </li>
				        <li class="nav-item">
				          <a class="nav-link" href="#section-4">소재별 관리법</a>
				        </li>
				        
				      </ul>
				    </div>
				  </div>
				</nav>
               
               <div class="content" style="text-align:left;">
                 <section id="section-1" class="content-current">
                  <ul>
					<li>
                      <h5>주문 취소</h5>
                      <p>오전 12시 이전까지 상품준비중 상태에서 마이페이지 내에서 취소신청 가능합니다. <br> (배송준비중 상태에서는 취소 불가능)</p>
                      <p><span>실시간으로 재고 변동으로 인해 재고품절의 경우, 취소처리 될 수 있습니다.</span></p>
					</li>
                    <li>
                     <h5>교환/반품</h5>
                     <p>상품 수령일로부터 7일 이내에 교환/반품 접수 가능합니다.<br> (교환/반품접수는 사이트의 고객 센터 내 교환/반품 게시판을 통해 접수 부탁드립니다.) <br><a href="https://www.jinnykimcollection.co.kr/board/consult/list.html" style="color:#152a4e; text-decoration:unterline;">고객센터 바로가기 &gt;</a></p>
                     <p>변심으로 인한 반품 시, 왕복배송비 6,000원 차감 후 환불처리 됩니다.<br>(단, 복수구매건 및 조건부무료배송 적용기준에 따라 배송비는 달라질 수 있습니다.)</p>
                     <p>변심으로 인한 교환 시, 왕복배송비 6,000원 입금으로만 가능 합니다. <span>★ 상품 분실 우려로 인한 맞교환 불가 ★</span><br>(하나은행 : 769-910010-55004 / 예금주 : 지니킴)</p>
                     <p>외부착화 전 상품에 한하여, 교환/반품 접수 가능 합니다. <br>(상품 및 TAG, 받으셨던 그대로 박스에 동봉하여 테이프 등으로 안전하게 포장하여 발송해 주시기 바랍니다.)</p>
                    </li>
                    <li>
                      <h5 style="text-decoration:underline;">교환/반품이 불가 한 경우</h5>
                      <p>착화 흔적이 있는 경우</p>
                      <p>고객님의 귀책사유로 상품이 훼손된 경우</p>
                      <p>상품의 TAG, 포장, 케이스 등을 훼손 및 분실하여 상품 가치가 현저히 상실된 경우</p>
                      <p>시간의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소된 경우</p>
                      <p>착화 전 충분히 확인하실 수 있는 불량 부분(박음질, 양쪽 사이즈 또는 색상 다름, 굽 불량 등) 미확인으로 인한 외부착화</p>
                      <p>패턴이 있는 상품은 원단의 특성 상 재단,재봉 시 패턴의 위치 및 이미지가 달라질 수 있어 이로 인한 무상교환/반품 불가</p>
                    </li>
                    <li>
                    </li>
                  </ul>
                </section>   
                    
				<section id="section-2">
				  <ul>
				    <li>
                        <h5>AS 이용 안내</h5>
                        <p>지니킴의 모든 상품은 주문제작이 아닌 대량생산 제품으로 상품에 따라 수선이 불가 할 수 있습니다.</p>
                        <p>절차 : 지니킴 공식 홈페이지 내 고객센터 &gt; AS문의 &gt; 글쓰기를 통해 사진과 내용 접수 &gt; 수선 가능여부 답변 (1~3일 내) </p>
                        <p>AS기간은 평일 기준 7~15일 정도 소요 됩니다. (주말 및 공휴일 제외)</p>
                        <p>상품 수선의 따라 수선비용과 배송비가 발생 될 수 있습니다. (수선시 비용 개별 안내)</p>
                    </li>
                    <li>
                       <h5>AS 가능한 경우</h5>
                       <p>초기 불량이 확인되는 경우 AS 또는 교환,반품</p>
                       <p>생산 진행중으로 부자재 수급이 가능한 경우(구입 후 3개월 미만)</p>
                       <p>밴드 수선건 (Black, White 컬러만 허용 *유색컬러는 불가)</p>
                       <p>* AS 이 후 최초 착화 전 새상품 상태와 완벽히 동일할 수는 없음.</p>
                    </li>
                    <li>
                        <h5 style="text-decoration:underline;">AS 불가한 경우</h5>
                        <p>까래(깔창) 수선</p>
                        <p>스트랩 수선 - 끊어짐, 교체 등 (길이조절의 한계, 동일 소재 수급불가)</p>
                        <p>공장 생산이 마감 된 상품</p>
                        <p>피혁부분, 부자재 , 장식이 단종 된 상품</p> 
                        <p>기획상품 또는 이월상품</p>
                        <p>구입 후 3개월 이상 경과 된 상품</p>
                    </li>
                    <li>
                    </li>
                   </ul>
                 </section>
                 
                 <section id="section-3">
                   <ul>
					<li><h5>사이즈 표기 기준안</h5></li>
                   </ul>
					<div class="sizeTable">
                      <table>
						<thead>
						  <tr>
							<th width="33.33333%">KR</th>
                            <th width="33.33333%">US</th>
                            <th width="33.33333%">EU</th>
                          </tr>
                        </thead>
						<tbody>
						  <tr>
						    <td>220</td>
                            <td>5</td>
                            <td>35</td>
                          </tr>
						  <tr>
						    <td>225</td>
                            <td>5.5</td>
                            <td>35.5</td>
                          </tr>
						  <tr>
							<td>230</td>
                            <td>6</td>
                            <td>36</td>
                          </tr>
						  <tr>
							<td>235</td>
                            <td>6.5</td>
                            <td>36.5</td>
                          </tr>
						  <tr>
							<td>240</td>
                            <td>7</td>
                            <td>37</td>
                          </tr>
						  <tr>
							<td>245</td>
                             <td>7.5</td>
                             <td>37.5</td>
                          </tr>
						  <tr>
							<td>250</td>
                            <td>8</td>
                            <td>38</td>
                          </tr>
						  <tr>
							<td>255</td>
                            <td>8.5</td>
                            <td>38.5</td>
                          </tr>
						</tbody>
					</table>
				</div>
			</section>
			
			<section id="section-4">
			  <ul>
				<li>
                   <h5>소재별 관리법</h5>
                   <h6>REAL LEATHER(천연 가죽) </h6>
                   <p>천연가죽은 본연 소재의 유연함과 탄성으로 인해 신을 수록 발에 맞게 변형이 됩니다.<br>
                       소재의 특성상 피부나 섬유에 이염이 될 수 있으나, 이는 제품의 하자가 아닌 소재의 특성이므로 이로 인한 교환/반품은 불가합니다. <br>
                       천연가죽 상품은 수분에 약하므로 물에 닿지 않게 유의해주시고, 흡수가 되었을 경우 물기를 부드러운 천으로 닦아 없애고 <br>
                       충분히 말려주셔야 습기로 인한 변형이 줄어 들 수 있습니다.<br>
                       소재의 특성상 가죽 마다 가죽 결의 질감이나 색상 차이가 있을 수 있으며 미세 스크래치가 존재 할 수 있습니다.<br>
                       또한 모니터의 밝기나 해상도에 따라 실물과 약간의 색상 차이가 있을 수 있습니다. </p>
                   <h6>SYNTHETIC LEATHER(합성 피혁)</h6>
                   <p>오염이나 물에 젖었을 경우 부드러운 천으로 닦은 후, 그늘에서 건조하기시 바랍니다.<br>
                       화기 가까이 장시간 노출될 경우 접착부분이 떨어 질 수 있으며 물, 유류 화학용품 등을 사용한 습식 세탁을 피해주세요.</p>
                   <h6>PATENT(에나멜 소재)</h6>
                   <p>제품을 서로 붙여서 보관하면 이염이 발생될 수 있으므로, 화지에 개별로 싸서 보관하기를 권장드립니다.<br>
                       온도차에 민감하므로 급격한 온도 변화시 갈라짐 현상이 있을 수 있으니 특별히 보관에 유의 하시기 바랍니다. (더스트백 보관 권장)</p>

                   <h6>SUEDE(스웨이드 소재)</h6>
                   <p>먼지가 묻었을 경우 전체적으로 전용 브러쉬로 먼지를 털어냅니다.<br>
                       착용할 때 미리 스웨이드/누벅 전용 방수 스프레이를 뿌려주면 좀 더 깨끗하고 오래 착용할 수 있습니다.</p>

                   <div class="boxBg">
                       <p>* 보관 시에는 더스트백에 넣어 다른 상품과 분리하여 표면에 이물질이 흡착되지 않도록 주의하여 주십시오.<br>
                           * 장기간 사용하지 않을 경우는 먼지를 잘 턴 후 더스트백에 넣어 통풍이 잘 되는 그늘진 곳에 보관하시고<br>
                           &nbsp;&nbsp;&nbsp;한 달에 한번씩은 상품의 상태를 확인하시기 바랍니다. <br>
                           * 물에 젖었을 때 가죽 표면이 손상 및 염료가 탈색될 수 있으며 주름의 원인이 되므로 주의하시기 바랍니다.</p>
                       <p style="padding:0;">* JUST JINNY의 모든 합성피혁 제품은 통기성이 좋은 곳에 보관해두시면 더욱 오래 좋은 상태로 유지할 수 있습니다.</p>
                   </div>
                 </li>
                 <li>
                     <h5>품질보증기준</h5>
                     <p>지니킴 모든 제품의 품질보증기간은 구입일로부터 6개월 입니다.</p>
                 </li>
                 <li>
                      <h5>유의사항</h5>
                      <p>모든 상품의 디자인과 이미지의 저작권은 지니킴에 있습니다. <br>
                          상품 디자인 및 로고의 무단 도용, 이미지의 사업적인 사용, 복제를 금합니다.<br>
                          이미지 무단 사용 적발시 법적 조치와 손해배상 청구를 이행할 수 있습니다.</p>
                 </li>
               </ul>
               
			   <ul>
				 <li>
                      <h5>Material information</h5>
                      <h6>CALF : 소가죽 </h6>
                      <p>조직이 치밀하고 섬세하며 얇고, 털 구멍이 작아서 표면이 매우 곱고 부드러움</p>
                      
                      <h6>KID : 염소가죽(스웨이드) </h6>
                      <p>조직이 치밀하고 섬세하며 얇고, 털 구멍이 작아서 표면이 매우 곱고 부드러움</p>
                      
                      <h6>NAPPA : 양가죽 </h6>
                      <p>얇고 유연하여 부드러움이 가장 큰 특징</p>
                      
                      <h6>SATIN : Fabric 실크소재 </h6>
                      <p>여성스럽고 고급스러운 느낌을 주나, 올이 풀리거나 보풀이 생길 수 있으므로 마찰을 조심해야 하고<br> 오염이 될 경우에 세탁이 어려우므로 주의가 필요함</p>
                      
                      <h6>PATENT : 코팅처리된 가죽 </h6>
                      <p>일반 소재에 비해 관리가 용이하나 날씨(온도)의 변화에 소재의 느낌이 달라짐 <br> ex) 더운날 - 잘늘어남 / 추운날 - 하드한 느낌</p>
                  </li>
                    
              </ul>
            </section>
		  </div>
       </div> <!-- end of tabs -->
       
    <div id="prdreview" style="width:125%; margin: 0 auto; position:relative; top:300px;">	
 		<jsp:include page="/WEB-INF/seongmin/review_include.jsp"></jsp:include> 

      </div> 
      
      
     <div id="prdQuestion" style="width:90%; margin: 0 auto; position:relative; top:500px;">					
 		<jsp:include page="/WEB-INF/seongmin/qnaList_include.jsp"></jsp:include> 					  			  
	 </div>

	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	
	


 
</body>
</html>
 <jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include> 