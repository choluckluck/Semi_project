<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>

	.dateSearch, .priceSearch, .nameSearch{
		border: none;
		border-bottom: solid 1px black;
		width : 150px;
	}

	
	#productOrder_search_container{
		font-size: 10pt;
	}
	
	.productOrder_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
		font-size: 10pt;
	}
	
	.admin_productOrder_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom:solid 1px black;
	}
	
	.admin_productOrder_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#searchbtn{
		width:50px;
		height:40px;
	}
	
	
	
</style>

<script>
	$(document).ready(function(){
		$(".productOrder_dateSearch").datepicker({
			 dateFormat: 'yy-mm-dd'  //Input Display Format 변경
			,showOtherMonths: true   //빈 공간에 현재월의 앞뒤월의 날짜를 표시
			,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
			,changeYear: true        //콤보박스에서 년 선택 가능
			,changeMonth: true       //콤보박스에서 월 선택 가능                
			,showOn: "both"          //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
			,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
			,buttonImageOnly: true   //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
			,buttonText: "선택"       //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
			,yearSuffix: "년"         //달력의 년도 부분 뒤에 붙는 텍스트
			,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
			,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
			,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
			,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
			//,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
			//,maxDate: "+1M" //최대 선택일자(+1D:하루후, +1M:한달후, +1Y:일년후)                
		});                    
		
		//초기값을 오늘 날짜로 설정
		$('.productOrder_dateSearch').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
		
		$(".ui-datepicker-trigger").hide();
		
		
		////////////////////////////////////////////////////////
		
		$(".search").hide();
		
		
		$("#searchBy").change(function(){
			$(".search").hide();
			
			const ordercolname = $(this).val();
			if(ordercolname != "all"){
				if(ordercolname == "orderdate"){
					$(".dateSearch").show();
				}
				else if(ordercolname == "total_order_amount"){
					$(".priceSearch").show();
				}
				else if(ordercolname =="order_code" || ordercolname == "fk_userid"){
					$(".searchword").show();
				}
				
				$("#searchbtn").show();
			}
		});
		
		
		
	});
	
	function order_edit(){
		// 나의 정보 수정하기 팝업창 띄우기
		const url = "<%= ctxPath%>/hyerin/admin/adminOrderEdit.sue";
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "orderEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	}
	

</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productOrder">
			<form name="productOrder_form" class="mt-2 productOrder_searchForm">
				<span class="mr-3 mt-1" style="font-size:20pt; font-weight: bold;">주문관리</span>
				<span>
					<select id="orderBy" name="orderstate" class="mt-1 mr-2 productOrder_sort">
						<option value="all" selected>주문상태별</option>
						<option>입금대기</option>
						<option>결제확인</option>
						<option>상품준비중</option>
						<option>배송중</option>
						<option>배송완료</option>
						<option>취소</option>
						<option>교환</option>
						<option>반품</option>
					</select>
				</span>
				<span id="productOrder_search_container">
					<span class="mr-2">
						<select id="searchBy" name="searchBy" class="mt-1 productOrder_sort">
							<option value="all" selected>전체선택</option>
							<option value="orderdate">날짜별</option>
							<option value="total_order_amount">주문금액별</option>
							<option value="order_code">주문코드</option>
							<option value="fk_userid">아이디</option>
						</select>
					</span>
					
					<input type="text" id="dateSearch_min" class="dateSearch search" name="min_date" placeholder="날짜"/>
					<span class="dateSearch search" style="border: none;">~</span>
					<input type="text" id="dateSearch_max" class="dateSearch search" name="max_date" placeholder="날짜"/>
					
					<input type="text" id="priceSearch_min" class="priceSearch search" name="min_price" placeholder="최소금액"/>
					<span class="priceSearch search" style="border:none;">~</span>
					<input type="text" id="priceSearch_max" class="priceSearch search" name="max_price" placeholder="최대금액"/>
					
					<input type="text" id="searchword" class="searchword search" name="searchword" placeholder="검색"/>
					
					<button type="button" id="searchbtn" class="searchbtn search" name="productOrder_nameSearch_btn" style="border:none; background-color: transparent;">
						<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
					</button>
				</span>
			</form>
		</div>
		<table id="admin_productOrder" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
			<thead>
				<tr>
					<th width="5%" class="admin_productOrder_th text-center" ><input type="checkbox" id=""/></th>
					<th width="15%" height="50px" class="admin_productOrder_th text-center">No</th>
					<th width="5%" class="admin_productOrder_th text-center">아이디</th>
					<th width="10%" class="admin_productOrder_th text-center">주문일자</th>
					<th width="10%" class="admin_productOrder_th text-center">주문상태</th>
					<th width="10%" class="admin_productOrder_th text-center">주문금액</th>
					<th width="10%" class="admin_productOrder_th text-center">실결제금액</th>
					<th width="5%" class="admin_productOrder_th text-center">더보기</th>
					<th width="5%" class="admin_productOrder_th text-center">삭제</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="admin_productOrder_tbody text-center" style="border-top:none;"><input type="checkbox" id=""/></td>
					<td height="70px" class="admin_productOrder_tbody text-center">!주문코드</td>
					<td class="text-center admin_productOrder_tbody">!주문일자</td>
					<td class="text-center admin_productOrder_tbody">!주문상태</td>
					<td class="text-center admin_productOrder_tbody">!주문금액</td>
					<td class="text-center admin_productOrder_tbody">!상품명</td>
					<td class="text-center admin_productOrder_tbody">!회원명</td>
					<td class="text-center admin_productOrder_tbody">!수령인</td>
					<td class="text-center admin_productOrder_tbody"><button id="admin_productedit_btn" type="button" class="white" style="width:90%; height:30px;" onclick="order_edit();">수정</button></td>
					<td class="text-center admin_productOrder_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="width:90%; height:30px;">삭제</button></td>
				</tr>
			</tbody>
		</table>
		<div class="mt-3">
			<span >
				<select class="mr-2 productOrder_sort">
					<option value="productOrder_default" selected>주문상태변경</option>
					<option value="productOrder_confirm">입금대기</option>
					<option value="productOrder_confirm">입금확인요청</option>
					<option value="productOrder_confirm">결제확인</option>
					<option value="productOrder_prepare">상품준비중</option>
					<option value="productOrder_delivery_ing">배송중</option>
					<option value="productOrder_delivery_complete">배송완료</option>
					<option value="productOrder_cancel">취소</option>
					<option value="productOrder_exchange">교환</option>
					<option value="productOrder_return">반품</option>
				</select>
			</span>
			<span class="mr-2"><button type="button" id="" class="white" style="height:30px;">선택일괄변경</button></span>
			<span><button type="button" id="" class="black" style="height:30px;">선택삭제</button></span>
		</div>
	</div>
	</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>