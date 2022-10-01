<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="../hyerin/header.jsp"></jsp:include>
<style type="text/css">

  div#container {
  	margin: 0 auto;
  	width : 95%;
  }
     
  div.col-10 {
  	/* border:solid 1px gray;  */
  	margin : 0 auto;
  }

  button.btn-gray {
  	text-align:left;
  }
  
  a.prd {
  	text-decoration-line: none;
  	color:black;
  }
  
  a.prd:hover {
  	color:gray;
  }
  
  table {
  	border-top : solid 1px gray;
  	width:80%;
  }
  
    a.orderview {
    text-decoration-line: none;
  	color:black;
  }
  
  a.orderview:hover {
  	color:gray;
  }
   
  div#buttons {
  	font-size: 14px;
  }

  div.sel:hover {
  	cursor:pointer;
  }
  
  div.cabtn:active {
  	background-color:black;
  	color:white;
  }

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


<script type="text/javascript">

	$(document).ready (function(){
		
		// === jQuery UI 의 datepicker === //
		$("input.datepicker").datepicker({
                 dateFormat: 'yy-mm-dd'  //Input Display Format 변경
                ,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true        //콤보박스에서 년 선택 가능
                ,changeMonth: true       //콤보박스에서 월 선택 가능                
                ,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true   //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택"       //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                ,yearSuffix: "년"        //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
              //,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
              //,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)                
         });                    
            
         //초기값을 오늘 날짜로 설정
         $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
		 /////////////////////////////////////////////////////
		
		 
         // === 전체 datepicker 옵션 일괄 설정하기 ===  
		 //     한번의 설정으로 $("input#fromDate"), $('input#toDate')의 옵션을 모두 설정할 수 있다.
         $(function() {
             //모든 datepicker에 대한 공통 옵션 설정
             $.datepicker.setDefaults({
                  dateFormat: 'yy-mm-dd' //Input Display Format 변경
                 ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                 ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                 ,changeYear: true //콤보박스에서 년 선택 가능
                 ,changeMonth: true //콤보박스에서 월 선택 가능                
              // ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
              // ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
              // ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
              // ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
                 ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                 ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                 ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                 ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                 ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
              // ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
              // ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)                    
             });
  
             //input을 datepicker로 선언
             $("input#fromDate").datepicker();                    
             $("input#toDate").datepicker();
             
             //From의 초기값을 오늘 날짜로 설정
             $('input#fromDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
             
             //To의 초기값을 3일후로 설정
             $('input#toDate').datepicker('setDate', '+3D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
         });
	});
	


	</script>



<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>


 <header></header>
  
 	   <br><br>
 	   
  <div id="container">
 	<div class="row">
 	   <div class="col-2">
 		 <jsp:include page="sideMenu.jsp" />	   
	   </div>
	   
	   <div class="col-10">

		<h3 style="margin-top:1px;">COUPON</h3>

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