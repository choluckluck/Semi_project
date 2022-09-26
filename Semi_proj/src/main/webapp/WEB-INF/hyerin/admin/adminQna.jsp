<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	form[name='productQna_search_form']{
		float:right;
	}
	
	.qna_search{
		border: none;
		border-bottom: solid 1px black;
		width : 100px;
	}
	
	.productqna_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
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
		width: 90%;
		height:30px;
	}
	
	
	
</style>

<script>
	$(document).ready(function(){
		$(".qna_search").datepicker({
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
		$('.qna_search').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
		
		$(".ui-datepicker-trigger").hide();
		
	});

</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productqna">
			<div style="font-weight:bold;">
				<span class="mr-3 mt-1" style="font-size:20pt;">상품리뷰</span>
				<span>
					<select class="mt-1 mr-2 productqna_sort" >
						<option value="adminQna_all" selected>전체</option>
						<option value="adminQna_productKind">상품종류</option>
						<option value="adminQna_productName" selected>상품명</option>
					</select>
				</span>
				<form name="productQna_search_form" class="mt-2" style="display:inline-block;">
					<input type="text" id="qna_search_min" class="qna_search" name="qna_search_min" placeholder="날짜"/>
					~
					<input type="text" id="qna_search_max" class="qna_search" name="qna_search_max" placeholder="날짜"/>
					<button type="button" id="qna_search_btn" name="qna_search_btn" style="border:none; background-color: transparent;">
						<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
					</button>
				</form>
			</div>
			<form name="admin_qna_frm">
				<table id="admin_qna" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
					<thead>
						<tr>
							<th width="5%" class="admin_qna_th text-center" ><input type="checkbox" id=""/></th>
							<th width="5%" height="50px" class="admin_qna_th text-center">No</th>
							<th width="15%" class="admin_qna_th text-center">상품 이미지</th>
							<th width="10%" class="admin_qna_th text-center">상품명</th>
							<th width="10%" class="admin_qna_th text-center">회원명</th>
							<th width="30%" class="admin_qna_th text-center">제목</th>
							<th width="10%" class="admin_qna_th text-center">작성일자</th>
							<th width="5%" class="admin_qna_th text-center">답변상태</th>
							<th width="5%" class="admin_qna_th text-center">답변</th>
							<th width="5%" class="admin_qna_th text-center">삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="admin_qna_tbody text-center" style="border-top:none;"><input type="checkbox" id=""/></td>
							<td height="160px" class="admin_qna_tbody text-center">!상품코드</td>
							<td class="text-center admin_qna_tbody"><img id="admin_product_img_1" height="150px" src="<%= ctxPath%>/images/hyerin/best_img_2.jpg"></td>
							<td class="text-center admin_qna_tbody">!상품명</td>
							<td class="text-center admin_qna_tbody">!회원명</td>
							<td class="text-center admin_qna_tbody">
								<div>!제목</div>
								<div>!내용</div>
							</td>
							<td class="text-center admin_qna_tbody">!작성일자</td>
							<td class="text-center admin_qna_tbody">!Y/N</td>
							<td class="text-center admin_qna_tbody">
								<button type="button" class="white admin_answer_btn">답변</button>
								<button type="button" class="white admin_answer_btn">답변수정</button>
							</td>
							<td class="text-center admin_qna_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="width:90%; height:30px;">삭제</button></td>
						</tr>
					</tbody>
				</table>
				<div class="mt-3">
					<span class="mr-2"><button type="button" id="" class="white" style="height:30px;">선택확인</button></span>
					<span><button type="button" id="" class="black" style="height:30px;">선택삭제</button></span>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>