<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String ctxPath = request.getContextPath();
    	// ctxPath ==> /JSPServletBegin
	
     %>
<style type="text/css">
	input[type=text]#couponcode {
		vertical-align: middle;
	    display: inline-block;
	    width: 400px;
	    border: 1px solid #d9d9d9;
	    padding: 0 10px;
	    font-size: 18px;
	    color: #000;
	    line-height: 1;
	    height: 40px;
	}


</style>
<jsp:include page="../hyerin/header.jsp"></jsp:include>
<jsp:include page="sideMenu.jsp" />

	   <div class="col-10">

		<br><br>
		<h5>COUPON</h5>

		<br><br>		
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:80px">
				<col style="width:auto">
				<col style="width:160px">
				<col style="width:160px">
				<col style="width:160px">
				<col style="width:160px">
				<col style="width:170px">
			</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">쿠폰명</th>
						<th scope="col">쿠폰적용 상품</th>
						<th scope="col">구매금액</th>
						<th scope="col">결제수단</th>
						<th scope="col">쿠폰 혜택</th>
						<th scope="col">사용가능 기간</th>
					</tr>
				</thead>
			
			
			<tbody style="font-size:12pt; height:100px;">
				<tr>
					<td>12341234</td>
					<td>천원</td>
					<td>모두</td>
					<td>49,800원</td>
					<td>신용카드</td>
					<td>1000원 할인</td>
					<td>2022-09-30 까지</td>
				</tr>
				<tr>
					<td>12341234</td>
					<td>천원</td>
					<td>모두</td>
					<td>49,800원</td>
					<td>신용카드</td>
					<td>1000원 할인</td>
					<td>2022-09-30 까지</td>
				</tr>
				<tr>
					<td>12341234</td>
					<td>천원</td>
					<td>모두</td>
					<td>49,800원</td>
					<td>신용카드</td>
					<td>1000원 할인</td>
					<td>2022-09-30 까지</td>
				</tr>				
		    </tbody>
		  </table>
	      
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
	   <br><br>

	<h5>쿠폰인증번호 등록하기</h5>
	
	
	<div class="" style="border-top :solid 2px gray; border-bottom :solid 1px gray; width:90%;">
		<div class="">
		  
		</div>
	
		<div class="" style="text-align:center;">
		  <br>
	   	  <input type="text" id="couponcode" class="" maxlength="50" height="20" />
		  <button type="button" style="border:none; background-color:#172a41; color:white;">쿠폰번호 인증</button>
		  <br><br>
		  <p>반드시 쇼핑몰에서 발행한 쿠폰번호만 입력해주세요. (10~35자 일련번호 "-" 제외)</p>
		</div>
	</div>
	<br><br>

	   
	<div class="">
		<h5>쿠폰 이용 안내</h5>
		<div class="inner" style="width:90%;">
			<ol class="">
			  <li class=""><strong>쿠폰인증번호 등록하기</strong>에서 쇼핑몰에서 발행한 종이쿠폰/시리얼쿠폰/모바일쿠폰 등의 인증번호를 등록하시면 온라인쿠폰으로 발급되어 사용이 가능합니다. </li>
			  <li class="">쿠폰은 주문 시 1회에 한해 적용되며, 1회 사용 시 재 사용이 불가능합니다.</li>
			  <li class="">쿠폰은 적용 가능한 상품이 따로 적용되어 있는 경우 해당 상품 구매 시에만 사용이 가능합니다.</li>
			  <li class="">특정한 종이쿠폰/시리얼쿠폰/모바일쿠폰의 경우 단 1회만 사용이 가능할 수 있습니다.</li>
			</ol>
		</div>
	</div>	   



	   
	   </div>
     </div>
   </div>
	<jsp:include page="../hyerin/footer.jsp"></jsp:include>
	
  </body>
</html>