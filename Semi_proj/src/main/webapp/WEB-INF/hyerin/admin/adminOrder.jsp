<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>

	.search{
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
		height:30px;
	}
	
	
	
</style>

<script>
	$(document).ready(function(){
		
		orderList();
		
		
		$("#orderBy").change(function(){
			if($("#searchBy").val() == "all"){
				orderList();
			}
		});
		
		$("#searchbtn").click(function(){
			orderList();
		});
		
		
		$(".dateSearchInput").datepicker({
			
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
		
		});//end of datepicker                    
		
		//초기값을 오늘 날짜로 설정
		$('#dateSearch_max').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
		$("img.ui-datepicker-trigger").hide();
		
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
		
		
		
	});//end of ready
	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	//function declaration
	
	//주문조회하는 함수
	function orderList(num){
		window.scrollTo(0,0);
		$("#orderList_contents").empty();
		$("#chxAll").prop("checked",false);
		
		//페이징처리
		$("#pageBar").empty();
		var currentShowPageNo = num;
		$("#currentPage").val(currentShowPageNo);
		
		//json으로 넘겨줄 값
		var orderstate = $("#orderBy").val(); //첫화면 all
		var searchBy = $("#searchBy").val(); //첫화면 all
		var mindate = $("#dateSearch_min").val(); //첨부터 값이 들어감 (sysdate)
		var maxdate = $("#dateSearch_max").val(); //첨부터 값이 들어감 (sysdate)
		var minprice = $("#priceSearch_min").val();
		var maxprice = $("#priceSearch_max").val();
		var searchword = $("#searchword").val(); 
		var updateorderstate = $("#updateOrderstate").val(); //첫화면 all
		
		//console.log(orderstate + " " + searchBy + " " + mindate + " " + maxdate + " " + minprice + " " + maxprice + " " + searchword + " " + updateorderstate);
		
		$.ajax({
			url : "<%= ctxPath%>/hyerin/admin/adminOrderJson.sue",
			type : "get",
			data : {"orderstate":orderstate,
					"searchBy":searchBy,
					"mindate":mindate,
					"maxdate":maxdate,
					"minprice":minprice,
					"maxprice":maxprice,
					"searchword":searchword,
					"updateorderstate":updateorderstate,
					"currentShowPageNo":currentShowPageNo},
			dataType : "JSON",
			success:function(json){
				
				console.log(json);
				
				var html = '';
				
				if(json.length > 1){
					
					$.each(json, function(index, item){
						if(index == 0){
							$("#pageBar").html(item.pageBar);
						}
						else {
							//order_code, fk_userid, orderdate, fk_order_state_name, total_order_amount, real_amount
							html += '<tr>'+
										'<td class="admin_productOrder_tbody text-center" style="border-top:none;"><input type="checkbox" class="check" name="order_chx" value="'+item.order_code+'"/></td>'+
										'<td height="70px" class="admin_productOrder_tbody text-center">'+item.order_code+'</td>'+
										'<td class="text-center admin_productOrder_tbody">'+item.fk_userid+'</td>'+
										'<td class="text-center admin_productOrder_tbody">'+item.orderdate+'</td>'+
										'<td class="text-center admin_productOrder_tbody">'+item.fk_order_state_name+'</td>'+
										'<td class="text-center admin_productOrder_tbody">'+item.total_order_amount.toLocaleString('en')+'원</td>'+
										'<td class="text-center admin_productOrder_tbody">'+item.real_amount.toLocaleString('en')+'원</td>'+
										'<td class="text-center admin_productOrder_tbody"><button id="admin_productedit_btn" type="button" class="white" style="width:90%; height:30px;" onclick="order_edit(\''+item.order_code+'\');">더보기</button></td>'+
										'<td class="text-center admin_productOrder_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="width:90%; height:30px;" onclick="deleteOneOrder(\''+item.order_code+'\')">삭제</button></td>'+
									'</tr>';
						}
						
					});//end of $.each
					
					// 조회한 주문정보 넣어주기
					$("#orderList_contents").append(html);
					
					
					//체크박스 하나라도 해제되면 전체 해제되게 만들기
					$(".check").click(function(){
					   var bFlag = false;
					   $(".check").each(function(){
					      var bChecked = $(this).prop("checked");
					      if(!bChecked) {
					         $("#chxAll").prop("checked",false);
					         bFlag = true;
					         return false;
					      }
					   });
					   
					   if(!bFlag) {
					      $("#chxAll").prop("checked",true);
					   }
					   
					});//end of $(".check").click
					
					
					//체크박스 체크 이벤트
					$("#chxAll").click(function(){
						var bool = $(this).is(":checked");
						$(".check").prop("checked", bool);
					});
					
					
					
					
				}
				else{ //조회된 주문이 없을 경우
					html += '<tr><td colspan="9">조회된 주문정보가 없습니다.</td></tr>';
					$("#orderList_contents").html(html);
				}
				
				
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
		}); //end of ajax
			
		
	}//end of orderList
	
	var popup;
	//자세한 주문정보 팝업창
	function order_edit(order_code){
		// 주문정보 자세히 보는 팝업창 띄우기
		const url = "<%= ctxPath%>/hyerin/admin/adminOrderEdit.sue?order_code="+order_code;
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		popup = window.open(url, "orderEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
		popup.addEventListener('beforeunload', function() {
			orderList($("#currentPage").val());
		});
		
	}//end of order_edit
	
	
	//해당하는 주문코드를 삭제해주는 함수
	function deleteOneOrder(deletenum){
		
		const bool = confirm("주문코드 '" + deletenum +"'을 삭제하시겠습니까?");
		if(bool){
			$.ajax({
				url : "<%= ctxPath%>/hyerin/admin/adminOrderDelete.sue",
				type: "get",
				data:{"order_code":deletenum},
				dataType:"JSON",
				success:function(json){
					
					alert(json.message);
					orderList($("#currentPage").val());
					
				},
				
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});//end of ajax
		}
		
	}//end of deleteOneOrder
	
	
	
	//선택한 주문코드의 배열을 알려주는 함수
	function getOrdercodeArr(){
		const allCnt = $("input:checkbox[name='order_chx']").length;
		const order_codeArr = new Array();
		
		for(var i=0; i<allCnt; i++){
		 
			if($("input:checkbox[name='order_chx']").eq(i).is(":checked")){
				order_codeArr.push( $("input:checkbox[name='order_chx']").eq(i).val() );
			}
		}//end of for
		
		const order_codeJoin = order_codeArr.join();
		return order_codeJoin;
	}//end of getOrdercodeArr
	
	
	
	
	//선택한 주문정보의 주문상태를 모두 변경하는 함수
	function updateChecked(){
		const updateVal = $("#updateOrderstate").val();
		const checkCnt = $("input:checkbox[name='order_chx']:checked").length;
		
		if(updateVal == "all"){
			alert("변경할 주문상태를 선택해 주세요.");
			return;
		}
		else if (checkCnt < 1){
			alert("변경할 주문을 1개 이상 선택해주세요.");
			return;
		}
		else{
			
			const bool = confirm("선택한 주문들의 주문상태를 '" + updateVal + "'으로 변경하시겠습니까?");
			
			if(bool){
				if(updateVal == "입금전"){$("#updatestate_checked").val("1");}
				if(updateVal == "결제확인"){$("#updatestate_checked").val("2");}
				if(updateVal == "상품준비중"){$("#updatestate_checked").val("3");}
				if(updateVal == "배송중"){$("#updatestate_checked").val("4");}
				if(updateVal == "배송완료"){$("#updatestate_checked").val("5");}
				if(updateVal == "취소"){$("#updatestate_checked").val("6");}
				if(updateVal == "교환"){$("#updatestate_checked").val("7");}
				if(updateVal == "반품"){$("#updatestate_checked").val("8");}
				
				
				const updateOrderstate = $("#updatestate_checked").val();
				const order_codeJoin = getOrdercodeArr();
				
				$.ajax({
					url : "<%= ctxPath%>/hyerin/admin/adminOrderChecked.sue",
					type: "get",
					data:{"updateOrderstate":updateOrderstate,
						  "order_codeJoin":order_codeJoin},
					dataType:"JSON",
					success:function(json){
						
						alert(json.message);
						orderList($("#currentPage").val());
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});//end of ajax
				
			}
		}
		
	}//end of updateChecked
	
	//선택한 주문정보를 모두 삭제하는 이벤트
	function deleteChecked(){
		const checkCnt = $("input:checkbox[name='order_chx']:checked").length;
		
		if (checkCnt < 1){
			alert("삭제할 주문을 1개 이상 선택해주세요.");
			return;
		}
		else{
			
			const deleteCheckedbool = confirm("선택한 주문들을 전부 삭제하시겠습니까?");
			
			if(deleteCheckedbool){
				const order_codeJoin = getOrdercodeArr();
				
				$.ajax({
					url : "<%= ctxPath%>/hyerin/admin/adminOrderChecked.sue",
					type: "post",
					data:{"order_codeJoin":order_codeJoin},
					dataType:"JSON",
					success:function(json){
						
						alert(json.message);
						orderList($("#currentPage").val());
						
					},
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});//end of ajax
			}
		}
		
	}//end of deleteChecked
	

</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<form name="productOrder_form" class="mt-2 productOrder_searchForm">
			<div id="productOrder">
				<span class="mr-3 mt-1" style="font-size:20pt; font-weight: bold;">주문관리</span>
				<span>
					<select id="orderBy" name="orderstate" class="mt-1 mr-2 productOrder_sort">
						<option value="all" selected>주문상태별</option>
						<option>입금전</option>
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
							<option value="all" selected>검색조건..</option>
							<option value="orderdate">날짜별</option>
							<option value="total_order_amount">주문금액별</option>
							<option value="order_code">주문코드</option>
							<option value="fk_userid">아이디</option>
						</select>
					</span>
					
					<input type="text" id="dateSearch_min" class="dateSearch dateSearchInput search" name="min_date" placeholder="날짜"/>
					<span class="dateSearch search" style="border: none;">~</span>
					<input type="text" id="dateSearch_max" class="dateSearch dateSearchInput search maxdate" name="max_date" placeholder="날짜"/>
					
					<input type="text" id="priceSearch_min" class="priceSearch search" name="min_price" placeholder="최소금액"/>
					<span class="priceSearch search" style="border:none;">~</span>
					<input type="text" id="priceSearch_max" class="priceSearch search" name="max_price" placeholder="최대금액"/>
					
					<input type="text" id="searchword" class="searchword search" name="searchword" placeholder="검색"/>
					
					<button type="button" id="searchbtn" class="searchbtn search" name="productOrder_nameSearch_btn" style="border:none; background-color: transparent;">
						<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
					</button>
				</span>
			</div>
			<table id="admin_productOrder" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
				<thead>
					<tr>
						<th width="5%" class="admin_productOrder_th text-center" ><input type="checkbox" id="chxAll"/></th>
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
				<tbody id="orderList_contents">
					
				</tbody>
			</table>
			<div class="mt-3">
				<span >
					<select id="updateOrderstate" name="updateOrderstate" class="mr-2 productOrder_sort">
						<option value="all" selected>주문상태변경</option>
						<option>입금전</option>
						<option>결제확인</option>
						<option>상품준비중</option>
						<option>배송중</option>
						<option>배송완료</option>
						<option>취소</option>
						<option>교환</option>
						<option>반품</option>
					</select>
					<input type="hidden" id="updatestate_checked" name="updatestate_checked" value="0"/>
				</span>
				<span class="mr-2"><button type="button" id="" class="white" style="height:30px;" onclick="updateChecked()">선택일괄변경</button></span>
				<span><button type="button" id="" class="black" style="height:30px;" onclick="deleteChecked()">선택삭제</button></span>
			</div>
			<nav aria-label="Page navigation">
			  <ul id="pageBar" class="pagination justify-content-center pagination-sm my-5">
			  	
			  </ul>
			</nav>
			<input type="hidden" id="currentPage" value=""/>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>