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
	div#container{
		width:90%;
		margin: 0 auto;
	}
	
		/* 혜택정보 */
	.pur_benefit_info {
		margin:0 auto;
	    border: solid 1px lightgray;
	    padding:5px;
	}
	
	.tbl_pur_benefit_info {
	    width: 100%;
	}
	
	.tbl_pur_benefit_info tr:first-child td:first-child {
	    border-right: solid 1px lightgray;
	    width:14%;
	    font-weight: bold;
	    text-align: center;
	    margin-left: 10%;
	}
	
	
	.tbl_pur_benefit_info tr td:nth-child(3) {
	    padding: 10px 0;
	    border-bottom: solid 1px lightgray;
	    font-size: 15px;
	}
	
</style>



<script type="text/javascript">

	
	
	

</script>


</head>
<body>
<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<div id="container" style="position:relative;">
	<h2> 주문 완료</h2>
	        <!-- 혜택 정보 -->
      <div class="pur_benefit_info">
         <table class="tbl_pur_benefit_info">
            <tr>
                    <td rowspan='2'>혜택정보</td>
                    <td rowspan='2' width:10px style="padding: 0 3px;"></td>
                    <td>{userid} 님은 [WELCOME] 회원입니다. <br>
                        1원 이상 구매시 0% 추가적립 받으실 수 있습니다. (최대 100,000원)
                    </td>
                </tr>
                <tr> 
                    <td><a href="#" style="color:black;">가용적립금: 100원</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="#" style="color:black;">쿠폰: 0개</a> </td>
                </tr>
         </table>
      </div>
      
      
      
      <br>
      <div>
		주문내역 및 배송에 관한 안내는 <a href="#" style="color:black; text-decoration: underline; font-size:13pt; font-weight:bold;">주문조회</a> 를 통하여 확인 가능합니다. <br>
		<br>
		주문번호 : <span>20220923-0000264</span> 
		<br>
		주문일자 : <span>2022-09-23 15:52:30</span>
	  </div>
	  <br><br>
	  
	  

	   <div class="">
		<h5>결제정보</h5>

		<br>
		
		  <table class="table table" style="text-align:center; width:100%">
			<colgroup>
				<col style="width:300px;">
				<col style="width:auto;">

			</colgroup>
			<thead>
			  <tr>
				<td scope="col" style="font-weight:bold;">최종결제금액</td>
				<td scope="col" style="text-align:left; "><span>32,800원</span></td>
			  </tr>
			</thead>
			<tbody>
			  <tr>
				<td style="text-align:center; font-weight:bold;">결제수단</td>
				<td style="text-align:left;"><div><span>무통장입금</span><br>입금자 : <span>ooo</span><br> 계좌번호: 하나은행 0000000 ((주)지니킴) <button type="button" style="background-color:white; color:black; font-size:10pt; border:solid 1px gray;">인터넷뱅킹 바로가기</button><br>현금영수증 발행 : <span style="font-size:bold">신청안함</span></div></td>
		      </tr>
			  <tr>
			  </tr>
		    </tbody>
		  </table>
	      <hr style="width:100%;">
	      
		<div class="row" style="width:100%;">
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;">현금영수증 신청</button>	
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;">거래명세서 발행</button>
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:480px;">쇼핑 계속하기</button>
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;">주문 확인하기기</button>
		</div>
		<br><br>
		
		<h5>주문상품 정보</h5>
	   <div id="prd-info" >
	   		  <table class="table table" style="text-align:center; width:100%">
			<colgroup>
				<col style="width:100px;">
				<col style="width:auto;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">
				<col style="width:100px;">

			</colgroup>
			<thead>
			  <tr>
				<th colspan="2">상품정보</th>
				<th scope="col">판매가</th>
				<th scope="col">수량</th>
				<th scope="col">적립금</th>
				<th scope="col">배송구분</th>
				<th scope="col">합계</th>
			  </tr>
			</thead>
			<tbody>
			  <tr style="">
			  	<td>
			  		<div style=" height:100px; width:75px;"><img src="./images/uh.jpg;" style="width:100%; height:100%; object-fit:cover;"/></div>
			  	</td>
			  	<td style="text-align:left; vertical-align:middle;">
					<div style="">
					<a href="#" style="color:black;"><span>(특가) 띠아모 플랫(1.5cm)</span></a><br><span>[옵션: blue / 240mm ]</span>
					</div> 			  	
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>29,800원</span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>1</span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>300원</span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>기본배송</span>
			  	</td>
			  	<td style="text-align:center; vertical-align:middle;">
			  		<span>29,800원</span>
			  	</td>			  	
		      </tr>
		      <tr>
		      	<td style="text-align:left;"><span>[기본배송]</span></td>
		      	<td colspan="6" style="text-align:right;">
		      		상품구매금액 <span>29,800</span> + 배송비 <span>3,000</span> + 지역별배송비 <span>0</span> = 합계 : <span>32,800원</span>
		      	</td>
		      </tr>		      
		    </tbody>
		  </table>
	   	  <hr style="width:100%;">	   	
	   	<br><br><br>
	   	
	   	<div id="total">
	   	  <table class="table table" style=" width:100%">
			<colgroup>
				<col style="width:50%;">
				<col style="width:50%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col" style=" text-align:center;">총 주문금액</th>
					<th scope="col" style=" text-align:center;">총 적립금</th>	
				</tr>
			</thead>
			<tbody>
	      	  <tr>
				<td style="font-weight:bold; text-align:center;"><span>149,600원</span></td>
				<td style="font-weight:bold; text-align:center;"><span>2,900원</span></td>
	      	  </tr>
		    </tbody>
		  </table>
		</div>
		  <hr style="width:100%;">
		  <br><br><br>
		  
	   	
	   	
	   	
	   	<div id="addr_info"><h5>배송지 정보</h5></div>
	   	
	   	<br>	   	
	   	<table class="table table" style=" width:100%">
			<colgroup>
				<col style="width:200px;">
				<col style="width:auto;">
			</colgroup>
			<tbody>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">받으시는분</td>
				<td scope="col"><span>하하</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">우편번호</td>
				<td scope="col"><span>06241</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">주소</td>
				<td scope="col"><span>서울특별시 ~~</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">일반전화</td>
				<td scope="col"><span>-</span></td>
			  </tr>
	      	  <tr>
				<td scope="col" style="font-weight:bold; color:gray;">휴대전화</td>
				<td scope="col"><span>010 - </span></td>
	      	  <tr >
				<td scope="col" style="font-weight:bold; color:gray;">배송메시지</td>
				<td scope="col" style="vertical-align:middle;"><span >경비실 앞에 놔주세요.</span></td>
			  </tr>
		    </tbody>
		  </table>
		  <hr style="width:100%;">
		  
		  
		<div class="row" style="width:100%;">
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;">현금영수증 신청</button>	
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;">거래명세서 발행</button>
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:480px;">쇼핑 계속하기</button>
			<button type="button" style="border:solid 1px gray; font-size:12pt; color:gray; text-align:center; background-color:white; width:15%; height:50px; margin-left:20px;">주문 확인하기기</button>
		</div>
		  
	   </div>



	   
	   </div>
	  </div>
	  
	  
	  	


<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>


</body>
</html>