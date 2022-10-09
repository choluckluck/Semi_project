<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	
	.qna_search{
		border: none;
		border-bottom: solid 1px black;
		width : 100px;
	}
	
	form[name='productQna_search_form']{
		font-size: 10pt;
	}
	
	.productqna_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
		font-size: 10pt;
	}
	
	.admin_qna_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom:solid 1px black;
	}
	
	.admin_qna_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	
	#admin_qna_btn{
		float: right;
		width:150px;
		height:40px;
	}
	
	.admin_answer_btn{
		width: 80%;
		height:30px;
	}
	
	
	
</style>

<script>
	$(document).ready(function(){
	

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
		    $(".qna_search").datepicker();                    

		    //From의 초기값을 오늘 날짜로 설정
		    $("input#qna_search_min").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후)
		    $("input#qna_search_max").datepicker('setDate', 'today');
		   
		});
		
		goSearch();
		
	});
	
	
	
	// 답변하기 팝업
	function qna_answer(){
		const url = "<%= ctxPath%>/hasol/admin/adminQnaAnswer.sue";
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "qnaAnswer",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	}
	
	// 답변수정하기 팝업
	function qna_answerEdit(){
		
		// 나의 정보 수정하기 팝업창 띄우기
		const url = "<%= ctxPath%>/hasol/admin/adminQnaAnswer.sue";
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "qnaAnswer",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	}
	
	
	// "검색" 버튼 클릭
	function goSearch(num) {
		
		$("#qnaList").empty();
		$("#pageBar").empty();
		
		let searchType = $("#searchType").val();
		let searchWord = $("#searchWord").val().trim();
		let qna_search_min = $("#qna_search_min").val();
		let qna_search_max = $("#qna_search_max").val();
		
		console.log(qna_search_min);
		
		let currentPageNo = num;
		$("#currentPageNo").val(currentPageNo);
		
		$.ajax({
			url: "<%= ctxPath%>/hasol/admin/adminQnaListJSON.sue",
			data: { "searchType": searchType,
					"searchWord": searchWord,
					"qna_search_min" : qna_search_min,
					"qna_search_max" : qna_search_max,
					"currentPageNo" : currentPageNo },
			dataType: "JSON",
			success: function(json){
				
				console.log(json);
				
				let html = "";
				if (json.length > 1){
					
					$.each(json, function(index, item){
						//index가 0인 경우 => 페이징처리를 위해 값 넣어주기
						if(index == 0){
							console.log(item.currentPageNo);
							$("#pageBar").html(item.pageBar);
						}

						else{
							html += '<tr>'+
							   		'<td class="admin_qna_tbody text-center" style="border-top:none;"> '+
							   		'<input type="checkbox" name="checkQna" id="checkQna"/>' +
							   		'</td>'+
								    '<td height="160px" class="admin_qna_tbody text-center">'+item.prod_code+'</td>'+
								    '<td class="admin_qna_tbody" >'+
									   '<img id="'+item.prod_image+'" class="ml-4" height="100px" src="<%= ctxPath%>/images/product/'+item.prod_kind+'/'+item.prod_image+'">'+
									   '<span class="ml-2">'+item.prod_name+'</span>'+
							   	    '</td>' +
								    '<td class="text-center admin_qna_tbody">'+item.category+'</td>'+
								    '<td class="text-center admin_qna_tbody">'+item.fk_userid+'</td>'+
								    '<td class="text-center admin_qna_tbody">'+
									   '<a href="#">'+item.subject+'</a>'+
								    '</td>'+
								    '<td class="text-center admin_qna_tbody">'+item.registerday+'</td>'+
								    '<td class="text-center admin_qna_tbody">'+item.answer_yn+'</td>'+
								    '<td class="text-center admin_qna_tbody">'+
									   '<button type="button" class="white admin_answer_btn" onclick="qna_answer();">답변</button>'+
									   '<button type="button" class="white admin_answer_btn" onclick="qna_answerEdit();">답변수정</button>'+
								    '</td>'+
								    '<td class="text-center admin_qna_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="width:90%; height:30px;">삭제</button></td>'+
							    '</tr>';
						}
						
					});
					
					$("#qnaList").append(html);
				}
				else {
					html += '<td colspan ="10" class="w-100" style="text-align:center;"> 조회된 문의 글이 없습니다. </td>';
					$("#qnaList").html(html);
				}

			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}	
		});				
	}
	
	
	
	
	
	// Function Declaration
	

</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productqna" style="width:100%;">
		
		<!-- 여기 검색 창 옆으로 가게 하기.. -->
			<div class="w-100" style="font-weight:bold;">
			<span class="mr-3 mt-1" style="font-size:20pt;">문의관리</span>
				<form name="qnaSearchFrm" class="mt-3" style="width:100%; display:flex; flex-decoration:column; justify-content: betweeen-space;">
				<div>
					<input type="text" id="qna_search_min" class="qna_search" name="qna_search_min" placeholder="날짜"/>
					~
					<input type="text" id="qna_search_max" class="qna_search" name="qna_search_max" placeholder="날짜"/>
				</div>
				<div>
					<select class="productqna_sort" id="searchType" >
						<option value="All" selected>전체</option>
						<option value="fk_userid">회원명</option>
						<option value="qna_code">문의번호</option>
						<option value="fk_prod_code">상품코드</option>
					</select>
					<input type="text" class="ml-1" id="searchWord"  placeholder="검색 유형을 선택해 주세요" />
					<button type="button" id="qna_search_btn" name="qna_search_btn" onclick="goSearch()" style="border:none; background-color: transparent;">
						<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
					</button>
				</div>
				</form>
			</div>
			<form name="admin_qna_frm" >
				<div>
					<select class="mt-1 mr-2 productqna_sort" style="float: right;" id="searchType_yn" >
						<option value="All" selected>전체</option>
						<option value="답변완료">답변완료</option>
						<option value="답변대기">답변대기</option>
					</select>
				</div>
				<div id="admin_qnaList">						
					<table id="admin_qna" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;">
						<thead>
							<tr>
								<th width="5%" class="admin_qna_th text-center" ><input type="checkbox" id=""/></th>
								<th width="5%" height="50px" class="admin_qna_th text-center">No</th>
								<th width="15%" class="admin_qna_th text-center">상품정보</th>
								<th width="10%" class="admin_qna_th text-center">카테고리</th>
								<th width="5%" class="admin_qna_th text-center">회원명</th>
								<th width="25%" class="admin_qna_th text-center">제목</th>
								<th width="10%" class="admin_qna_th text-center">작성일자</th>
								<th width="5%" class="admin_qna_th text-center">답변상태</th>
								<th width="10%" class="admin_qna_th text-center">답변</th>
								<th width="10%" class="admin_qna_th text-center">삭제</th>
							</tr>
						</thead>
						<tbody id = "qnaList">	
						</tbody>
					</table>
				</div>
				<div class="mt-3" style="clear:both;">
					<span><button type="button" id="" class="black" style="height:30px;">선택삭제</button></span>
				</div>
				<!-- 페이지 바 -->
				<nav id ="pageBar"> </nav>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>