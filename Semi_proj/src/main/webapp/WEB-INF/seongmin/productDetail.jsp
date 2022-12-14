<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- 직접 만든 CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/style.css" />

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI CSS-->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>


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
   background-color: #1c284a;
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
</style>



<script type="text/javascript">

	
	
	

</script>


</head>
<body>
<jsp:include page="../hyerin/header.jsp"></jsp:include>
<div id="container" style=" margin:0 auto; width:90%; position:relative;">

	<div id="quickView" style="width:55px; height:240px; background-color:#172A41; position:fixed; bottom:100px; right:50px; z-index:100;">
		<div id="" type="button" style="text-align:center; margin-top:5px;">
			<img src="./images/heart.jpg" class="" alt="..." style="">
			<br>
			<span style="color:white;">11개</span>
		</div>
		<div  id="" type="button" style="text-align:center; margin-top:10px;">
			<img src="./images/timer.jpg" class="" alt="..." style="height:">
		</div>
		<div  id="" type="button" style="text-align:center; margin-top:10px;">
			<img src="./images/up.jpg" class="" alt="..." style="">
		</div>
		<div  id="" type="button" style="text-align:center; margin-top:10px;">
			<img src="./images/down.jpg" class="" alt="..." style="">
		</div>
	</div>

	<br><br>
	<div class="row">	
		<div class="col-4" style="width:450px; height:550px; border:solid 1px gray;" z-index: 3;>
		   <img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">
		   <br><br>
		   
			<div class="row" style="border:solid 1px gray; heigth:200px; text-align:center; margin:auto;">
				<div class="col-2">
					<img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">					
				</div>
				<div class="col-2">
					<img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">					
				</div>

				<div class="col-2">
					<img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">					
				</div>			
				<div class="col-2">
					<img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">					
				</div>			
				<div class="col-2">
					<img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">					
				</div>			
				<div class="col-2">
					<img src="https://www.jinnykimcollection.co.kr/web/product/extra/small/202208/a71ea7169a3030bfdf98fce73d65ee6f.jpg"  style="margin: 0 auto; width:100%; height:100%; object-fit:cover; position:relative;" alt="...">					
				</div>			
			</div>

		</div>
		  
		 

	
		<div class="col-6" style="margin-left:150px;">
			<div style="font-size: 15px; margin-left:100px;">(특가)<strong style="font-size: 15px;">드레이 로퍼</strong >(1cm)</div>
			<div style="font-size: 15px; margin-left:100px;"><strong style="color:red;">63% </strong><strong>29,800원</strong><strike>&nbsp;79,900원</strike></div>
			<br>
			<div style="width: 100%;">
				<table id="code" style="margin-left:100px;">
					<tr>
						<th style="width: 115px; text-align: center;">Code</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;P0000FXM</td>
					</tr>
					<tr>
						<th style="width: 115px; text-align: center;">적립금</th>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;300원</td>
					</tr>
					<tr>
						<th style="width: 115px; text-align: center;">배송비</th>
						<td><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,000원</strong> (70,000원 이상 구매 시 무료)</td>
					</tr>
				</table >
				     
				<table style="margin-left:100px;">   
					<tr>
						<th style="width: 115px; text-align:left;">COLOR</th>
							<td>
								<select id="optionselect" style="width: auto; font-size:15px;">
									<option selected value="0" style="width: 350px;">-[필수] 옵션을 선택해 주세요-</option>
									<option>CREAM COLOR</option>
									<option>LIGHT GREEN SUEDE</option>
									<option>PEACOCK SUEDE</option>
								</select>
							</td>
						</tr>
					
					<tr>
						<th style="width: 115px; text-align:left;">SIZE</th>
						<td>
							<select id="optionselect" style="width: auto; font-size:15px;">
								<option selected value="0" style="width: 350px;">-[필수] 옵션을 선택해 주세요-</option>
								<option>235</option>
								<option>240</option>
							</select>
						</td>
					</tr>
				</table>
				
				<table class="cartList">     
				</table>
				
				<input type ="hidden" name="opseq" value="0">
				<input type ="hidden" name="oqty"  value="0">
				   
			</div>
			<hr>
			<div class="totalPrice" style="font-size:13px;" align="right" >
			<strong style="font-size: 13px;">총 상품금액 (수량): &nbsp;</strong>
			<span id="tprice">
				0원
			</span>
			&nbsp;/&nbsp;
			<span id="tcnt">
				0
			</span>
				개
			</div>
			<br/>
			<hr>
			
			<div class="my-5" >
				<button type ="submit" id="submit2"  class="buttons border btn btn-outline-secondary   ">♡</button>
				<button type ="submit" id="submit"   class="buttons border btn btn-outline-secondary  col-5">장바구니</button>
				<button type ="submit" id="submit3"  class="buttons border btn btn-outline-secondary  col-6">바로구매</button>
			</div>
		</div>
	</div> 
	<br><br>
	<br><br><br><br>
	<div class="row" style="text-align:center; vertical-align:middle; font-size:17pt; height:60px; border:solid 1px gray; background-color:white; position:sticky; top:0; z-index: 2;">
		<div class="col-4" style="padding:10px;  color:gray; ">
			<a href="#prdDetail" style=" color:gray;">상품정보</a>
		</div>
		<div class="col-4" style="padding:10px; ">
			<a href="#prdReview" style=" color:gray;">리뷰(<span id=""></span>)</a>
		</div>
		<div class="col-4" style="padding:10px; ">
			<a href="#prdQuestion" style=" color:gray;">상품문의</a>
		</div>	
	</div>
	
	<br><br>	
	
	
	<h2>FOR YOU</h2>
	
		 <div class="row" style="text-align:center; position:relative; z-index: 1;">
	  
		  <div class="col" style="border:none">		  
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./images/pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left;">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>			 
		  </div>

   		  <div class="col">
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./images/pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>
		  </div>

		  <div class="col">			
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>
		  </div>

		  <div class="col">			
			<div class="card" style="width: 250px; height:400px;">
			 <a href="#" class="btn btn-white">
			  <img src="./pic22.jpg" class="card-img-top" alt="...">
			  <br><br>
			    <div style="text-align:left">드레이 로퍼(1cm) <br> 29,800원 </div>
			  </a>
			</div>
		  </div>
			<br><br>
			<br><br>
			<br><br>
		  	<div class="" id="prdDetail" style="position:relative; top:150px;">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/COMMON/JK_NOTICE_TOP.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/COMMON/2022/JK_22SPRING_TOP.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_TOP.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_DESIGNTIP.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_WHITE.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_BEIGE.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_BLACK.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_GUNMETAL.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_INFO.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_FITTING.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_ADD.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/JINNYKIM/22SS/JK_PU/JKPU_RachelBloafer_22SS_CELEB.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/COMMON/2022/JK_22SPRING_ADD.jpg">
				<img src="https://www.jinnykimcollection.co.kr/jkimg/COMMON/2022/JK_22SPRING_BRAND.jpg">
			</div>
	  		
	  		
	  		
	  		
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
                    <h5><a href="https://www.jinnykimcollection.co.kr/board/faq/list.html?board_no=3">자주묻는 질문 확인하기 ▶</a></h5>
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
                        <h5><a href="https://www.jinnykimcollection.co.kr/board/faq/list.html?board_no=3">자주묻는 질문 확인하기 ▶</a></h5>
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
       
       
       <div id="prdReview" style="width:90%; margin: 0 auto; position:relative; top:300px;">
			<h5 style="text-align:left;">REVIEW</h5>
			  <table class="table table" style="text-align:center; width:100%">
			<colgroup>
				<col style="width:120px;">
				<col style="width:auto;">
				<col style="width:100px;">
				<col style="width:200px;">
				<col style="width:80px;">
				<col style="width:80px;" class="">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
				<th scope="col" class="">평점</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">
				<tr class="xans-record-">
					<td>309</td>
					<td class="subject left txtBreak" style="text-align:left;">
						<a href="/article/review/4/198686/?no=198686&amp;board_no=4&amp;spread_flag=T">만족</a>
						<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image">
						<span class="txtWarn"></span>
					</td>
					<td> 네****</td>
					<td class="txtInfo txt11">2022-09-13 03:39:02</td>
					<td class="txtInfo txt11">413</td>
					<td class=""><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></td>
				</tr>

				<tr class="xans-record-">
					<td>309</td>
					<td class="subject left txtBreak" style="text-align:left;">
						<a href="/article/review/4/198686/?no=198686&amp;board_no=4&amp;spread_flag=T">만족</a>
						<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image">
						<span class="txtWarn"></span>
					</td>
					<td> 네****</td>
					<td class="txtInfo txt11">2022-09-13 03:39:02</td>
					<td class="txtInfo txt11">413</td>
					<td class=""><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></td>
				</tr>

				<tr class="xans-record-">
					<td>309</td>
					<td class="subject left txtBreak" style="text-align:left;">
						<a href="/article/review/4/198686/?no=198686&amp;board_no=4&amp;spread_flag=T">만족</a>
						<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image">
						<span class="txtWarn"></span>
					</td>
					<td> 네****</td>
					<td class="txtInfo txt11">2022-09-13 03:39:02</td>
					<td class="txtInfo txt11">413</td>
					<td class=""><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></td>
				</tr>

				<tr class="xans-record-">
					<td>309</td>
					<td class="subject left txtBreak" style="text-align:left;">
						<a href="/article/review/4/198686/?no=198686&amp;board_no=4&amp;spread_flag=T">만족</a>
						<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image">
						<span class="txtWarn"></span>
					</td>
					<td> 네****</td>
					<td class="txtInfo txt11">2022-09-13 03:39:02</td>
					<td class="txtInfo txt11">413</td>
					<td class=""><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></td>
				</tr>

				<tr class="xans-record-">
					<td>309</td>
					<td class="subject left txtBreak" style="text-align:left;">
						<a href="/article/review/4/198686/?no=198686&amp;board_no=4&amp;spread_flag=T">만족</a>
						<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image">
						<span class="txtWarn"></span>
					</td>
					<td> 네****</td>
					<td class="txtInfo txt11">2022-09-13 03:39:02</td>
					<td class="txtInfo txt11">413</td>
					<td class=""><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></td>
				</tr>

				<tr class="xans-record-">
					<td>309</td>
					<td class="subject left txtBreak" style="text-align:left;">
						<a href="/article/review/4/198686/?no=198686&amp;board_no=4&amp;spread_flag=T">만족</a>
						<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_hit.gif" alt="HIT" class="ec-common-rwd-image">
						<span class="txtWarn"></span>
					</td>
					<td> 네****</td>
					<td class="txtInfo txt11">2022-09-13 03:39:02</td>
					<td class="txtInfo txt11">413</td>
					<td class=""><img src="//img.echosting.cafe24.com/skin/base/board/ico_point5.gif" alt="5점"></td>
				</tr>

		
		    </tbody>
		  </table>
		  
		  <div style="float:right">
	    	  <button type="button" style="background-color: #172A41; color:white; border:solid 1px gray;">상품후기쓰기</button>
	      </div>
	      <br>
		
		  <div style=" display: grid; place-items: center;">
		    <div style="inline">
		    
			    <button type="button" class="btn btn-white"> << </button>
			    <button type="button" class="btn btn-white"><</button>
			    <button type="button" class="btn btn-outline-secondary">1</button>
			    <button type="button" class="btn btn-outline-secondary">2</button>
			    <button type="button" class="btn btn-outline-secondary">3</button>
			    <button type="button" class="btn btn-white">></button>
			    <button type="button" class="btn btn-white">>></button>
			</div>
		  </div>		
		</div>
			
			
			
			
       <div id="prdQuestion" style="width:90%; margin: 0 auto; position:relative; top:500px;">			
		  <h5 style="text-align:left;">상품 문의</h5>
		  <table class="table table" style="text-align:center; width:100%">
			<colgroup>
				<col style="width:70px;">
				<col style="width:135px;">
				<col style="width:300px;">
				<col style="width:84px;">
				<col style="width:80px;">
				<col style="width:55px;">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">
				<tr>
					<td>1</td>
					<td>취소 / 변경	</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				<tr>
					<td>1</td>
					<td>취소 / 변경	</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>				
		    </tbody>
		  </table>
		  
		  <div style="float:right">
	    	  <button type="button" style="background-color: #172A41; color:white; border:solid 1px gray;">상품문의하기</button>
	      </div>
	      	      
	      <br>

		  <div style=" display: grid; place-items: center;">
		    <div style="inline">
		    
			    <button type="button" class="btn btn-white"> << </button>
			    <button type="button" class="btn btn-white"><</button>
			    <button type="button" class="btn btn-outline-secondary">1</button>
			    <button type="button" class="btn btn-outline-secondary">2</button>
			    <button type="button" class="btn btn-outline-secondary">3</button>
			    <button type="button" class="btn btn-white">></button>
			    <button type="button" class="btn btn-white">>></button>
			</div>
		  </div>			
		</div>	
			
			
			
			
			
			
			
			
			
			
						  			  
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
	
	
</div>



<jsp:include page="../hyerin/footer.jsp"></jsp:include>

</body>
</html>