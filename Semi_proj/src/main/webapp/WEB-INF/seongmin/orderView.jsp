<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<%
	String ctxPath = request.getContextPath();
    //     
%>
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

	img#recentorderimg {
	  width: 100px;
	  height: 120px;
	  object-fit: cover;
	}
	
	td.recentordertd {
		vertical-align: middle;
	}
	
</style>


<script type="text/javascript">

	$(document).ready (function(){
		
		// === jQuery UI 의 datepicker === //
		$("input.datepicker").datepicker({
                 dateFormat: 'yy/mm/dd'  //Input Display Format 변경
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
//         $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
		 /////////////////////////////////////////////////////
		
		 
         // === 전체 datepicker 옵션 일괄 설정하기 ===  
		 //     한번의 설정으로 $("input#fromDate"), $('input#toDate')의 옵션을 모두 설정할 수 있다.
         $(function() {
             //모든 datepicker에 대한 공통 옵션 설정
             $.datepicker.setDefaults({
                  dateFormat: 'yy/mm/dd' //Input Display Format 변경
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
             $("input#startDate").datepicker();                    
             $("input#endDate").datepicker();
             
             //From의 초기값을 오늘 30일 전으로 설정
//          $('input#startDate').datepicker('setDate', '-30D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
             
             //To의 초기값을 3일후로 설정
//           $('input#endDate').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)     
         
         });
         

         
/*          $("select#order_state").bind("change", function (){
        	 goSearch();     	 
         })//end of  $("select#order_state").bind("change"
 */
 
/*     	   if("${requestScope.startDate}" != ""){ //검색어가 비어있지 않을때만 값을 넣어줌
    		   $("input#startDate").val("${requestScope.startDate}");
    	   };
    	   
    	   if("${requestScope.endDate}" != ""){ //검색어가 비어있지 않을때만 값을 넣어줌
    		   $("input#endDate").val("${requestScope.endDate}");
    	   }; */
    	   
    	   var today = new Date();
    	   var year = today.getFullYear();
    	   var month = ('0' + (today.getMonth() + 1)).slice(-2);
    	   var day = ('0' + today.getDate()).slice(-2);
    	   today.setDate(today.getDate() - 7);
    	   
    	   var dateString = year + '/' + month  + '/' + day;

    	   $("a#today00").click( function(){
	             $('input#startDate').val(dateString); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
			})
 
			$("a#today07").click( function(){
	             $('input#startDate').val( ); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
			})
			
			$("a#today30").click( function(){
	             $('input#startDate').val(dateString); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
			})
			
			$("a#today90").click( function(){
	             $('input#startDate').datepicker('setDate', '-90D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
			})
			
			$("a#today180").click( function(){
	             $('input#startDate').datepicker('setDate', '-180D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
			})
			
			
 
	 
          		
         $("input#endDate").bind("keyup", (e)=>{
  		   if(e.keyCode == 13) { // 검색어에서 엔터를 치면 검색하러 가도록 한다.
  			   goSearch();	   
  		   }
  	     });		 
         
         $('input[name=startDate]').attr("readonly",true);
         $('input[name=endDate]').attr("readonly",true);
     
  
			
    	   if("${requestScope.order_state}" != ""){ //검색어가 비어있지 않을때만 값을 넣어줌
    		   $("select#order_state").val("${requestScope.order_state}");
    	   };
    	   
      	   if("${requestScope.startDate}" != ""){ //검색어가 비어있지 않을때만 값을 넣어줌
    		   $("input#startDate").val("${requestScope.startDate}");
    	   };
    	   
      	   if("${requestScope.endDate}" != ""){ //검색어가 비어있지 않을때만 값을 넣어줌
    		   $("input#endDate").val("${requestScope.endDate}");
    	   };
    	   
/* 	   $("input#startDate").bind("change", function (){
		   $("input#startDate").val("${requestScope.startDate}");
	   });
	   
	   $("input#endDate").bind("change", function (){
		   $("input#endDate").val("${requestScope.endDate}");
	   }); */
	   
	   
	   if(${requestScope.sizePerPage} != null) { // 또는 "${requestScope.sizePerPage}" != ""
		   $("select#sizePerPage").val("${requestScope.sizePerPage}");
	   };

	   
	   
				 
	});//end of docu~
	
	   function goSearch() {
//		   alert($("input#startDate").val());
			const frm = document.OrderHistoryForm;
		   frm.action = "<%=ctxPath %>/seongmin/member/orderView.sue";
		   frm.method = "GET";
		   frm.submit(); 
	   }


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
	      <h3 style="margin-top:1px;">주문조회</h3>
	      <br>

	      <div id=buttons>
	      	<div class="row" style="height:40px;">	      
		      <button type="button" class="cabtn btn-lg col-3" style = "background-color:#172a41; color:white; font-size: 15px; border:solid 1px gray"><div style="text-align:center; font-weight:bold">주문내역 조회 (00)</div></button>
		      <button type="button" class="cabtn btn-lg col-3" style = "color:gray; font-size: 15px; border:solid 1px gray"><div style="text-align:center; font-weight:bold">취소/반품/교환 내역 (00)</div></button>
		      <button type="button" class="cabtn btn-lg col-3" style = "color:gray; font-size: 15px; border:solid 1px gray"><div style="text-align:center; font-weight:bold">이전 주문내역 (00)</div></button>
			</div>
	      </div>
	      
		  <br><br>
		  
		 <form method="GET" id="OrderHistoryForm" name="OrderHistoryForm" style="width:90%">
		  <fieldset>
			<legend>검색기간설정</legend>
			  <div class="stateSelect" style="display:inline;">
				<select id="order_state" name="order_state" class="fSelect">
					<option value="all">전체 주문처리상태</option>
					<option value="1">입금전</option>
					<option value="2">결제확인</option>
					<option value="3">상품준비중</option>
					<option value="4">배송중</option>
					<option value="5">배송완료</option>
					<option value="6">취소</option>
					<option value="7">교환</option>
					<option value="8">반품</option>
				</select>
   			  </div>
			<span class="period">
				<a class="prd" id="today00" href="#" days="00"><span>오늘</span></a>
				<a class="prd" id="today07"  href="#" days="07"><span>1주일</span></a>
				<a class="prd" id="today30"  href="#" days="30"><span>1개월</span></a>
				<a class="prd" id="today90"  href="#" days="90"><span>3개월</span></a>
				<a class="prd" id="today180"  href="#" days="180"><span>6개월</span></a>
			</span>
			
			<div class="daterange" style="display:inline">
			   <input type="text" class="datepicker" id="startDate" name="startDate">
				~
			   <input type="text" class="datepicker" id="endDate" name="endDate">
			</div>
			
			<span class="submit-bt" style="width:50px; position:relative; left:10px;">
				<input alt="" id="order_search_btn" type="image" src="//img.echosting.cafe24.com/skin/admin_ko_KR/myshop/btn_search.gif" onclick="goSearch();">					
			</span>
  		  </fieldset>
			<br>
		  <ul class="guide">
				<li> ※기본적으로 최근 3개월간의 자료가 조회되며, 기간 검색시 지난 주문내역을 조회하실 수 있습니다.</li>
				<li>※주문번호를 클릭하시면 해당 주문에 대한 상세내역을 확인하실 수 있습니다.</li>
		  </ul>
		</form>

		<br><br>

		<h5>주문 상품 정보</h5>

		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:210px;">
				<col style="width:75px;">
				<col style="width:250px;">
				<col style="width:80px;">
				<col style="width:120px;">
				<col style="width:120px;">
				<col style="width:160px;">
			</colgroup>
			<thead>
			  <tr>
				<th scope="col">주문일 / 주문번호</th>
				<th scope="col" colspan="2">주문내역</th>
				<th scope="col">수량</th>
				<th scope="col">금액</th>
				<th scope="col">주문상태</th>
				<th scope="col">취소/교환/반품</th>
			  </tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${not empty requestScope.recentOrderList}">
					
						<c:forEach var="rovo" items="${requestScope.recentOrderList}">
							<tr >
								<td class="recentordertd">${rovo.orderdate}<br>
								<a class="orderview" href=#>[${rovo.order_code}]</a></td>
								<td class="recentordertd"><a href="#"><div><img id="recentorderimg" src="<%=request.getContextPath() %>/images/product/${rovo.pvo.prod_kind}/${rovo.pvo.prod_image}"></div></a></td>
								<td class="recentordertd"style="text-align: left">
								<a class="prd" href="#">${rovo.pvo.prod_name}</a></td>
								<td class="recentordertd">${rovo.odvo.order_buy_count}</td>
								<td class="recentordertd"><fmt:formatNumber value="${rovo.odvo.order_price}" pattern="#,###"/>원</td>
								<td class="recentordertd">${rovo.order_state}</td>
							</tr>
						</c:forEach>
					</c:when>				
					<c:otherwise>
						<tr style="vertical-align: middle">
							<td colspan="5">최근 주문내역이 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>				
		   	 </tbody>		   	 
		  </table>   
	   </div>
	   		  <nav class="my-5">
			<div style="display: flex; width: 80%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar}</ul>
			</div>
		  </nav>
     </div>
   </div>
   
   
<jsp:include page="../hyerin/footer.jsp"></jsp:include>	
	
  </body>
</html>