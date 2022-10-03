<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	
	#productReview_search_container{
		float:right;
	}
	#productReview_sort_container{
		position: relative;
		top:5px;
	}
	
	.review_search, .review_search_date{
		border: none;
		border-bottom: solid 1px black;
		width : 100px;
	}
	
	.productReview_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
	}
	
	.admin_productReview_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom:solid 1px black;
	}
	
	.admin_productReview_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#admin_productReview_btn{
		float: right;
		width:150px;
		height:40px;
	}
	
	
	
</style>

<script>
	$(document).ready(function(){
		
		$(".review_search_date").datepicker({
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
		$(".review_search_date").datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, +1M:한달후, +1Y:일년후) 
		
		$(".ui-datepicker-trigger").hide();
		
		
		/////////////////////////////////////////////////////
		
		$(".review_search_date").hide();
		
		
		/////////////////////////////////////////////////////
		
		
		$("input#review_searchWord").keyup(function(e){
			if(e.keyCode == 13){
				selectReviewList();
			}	
		});
		
		$("button#review_search_btn").click(function(){
			selectReviewList();
		});
		
		if("${requestScope.review_searchWord}" != ""){
			$("#review_sortType").val("${requestScope.review_sortType}");
			$("#review_searchWord").val("${requestScope.review_searchWord}");
		}
		
		
	});//end of ready
	
	function selectReviewList(){
		
		const frm = document.productReviewFrm;
		frm.action = "adminProductReview.sue";
		frm.method = "get";
		frm.submit();
		
	};//end of selectReviewList

</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productReview">
			<span class="mr-3 mt-1" style="font-size:20pt; font-weight:bold">상품리뷰</span>
			<form name = "productReviewFrm">
				<div id="productReview_search_container" style="font-size:10pt; display:inline-block;">
					<span id="productReview_sort_container">
						<select id="review_sortType" name="review_sortType" class="mr-2 productReview_sort" >
							<option value="all" selected>전체</option>
							<option value="fk_userid">아이디</option>
							<option value="prod_name">상품명</option>
							<%-- 
							<option value="review_registerday">날짜별</option>
							 --%>
						</select>
					</span>
					<div class="mt-2" style="display:inline-block; float:right;">
						<input type="text" id="review_searchWord" class="review_search" name="review_searchWord" placeholder="검색" style="width:160px;"/>
						<%--
						<input type="text" id="review_search_min" class="review_search_date" name="review_search_min" placeholder="날짜"/>
						<span class="review_search_date">~</span>
						<input type="text" id="review_search_max" class="review_search_date" name="review_search_max" placeholder="날짜"/>
						 --%>
						<button type="button" id="review_search_btn" name="review_search_btn" style="border:none; background-color: transparent;">
							<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
						</button>
					</div>
				</div>
				<table id="admin_productReview" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
					<thead>
						<tr>
							<th width="5%" class="admin_productReview_th text-center" ><input type="checkbox" id=""/></th>
							<th width="10%" height="50px" class="admin_productReview_th text-center">No</th>
							<th width="15%" class="admin_productReview_th text-center">상품정보</th>
							<th width="10%" class="admin_productReview_th text-center">아이디</th>
							<th width="40%" class="admin_productReview_th text-center">제목</th>
							<th width="5%" class="admin_productReview_th text-center">평점</th>
							<th width="10%" class="admin_productReview_th text-center">작성일자</th>
							<th width="10%" class="admin_productReview_th text-center">삭제</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="rvo" items="${requestScope.rvoList}">
							<tr>
								<td class="admin_productReview_tbody text-center" style="border-top:none;"><input type="checkbox" id=""/></td>
								<td height="130px" class="admin_productReview_tbody text-center">${rvo.review_code}</td>
								<td class="admin_productReview_tbody" >
									<div align="center"><img id="admin_product_img_1" height="100px" src="<%= ctxPath%>/images/product/${rvo.pvo.prod_kind}/${rvo.pvo.prod_image}"/></div>
									<div align="center">${rvo.pvo.prod_name}</div>
								</td>
								<td class="text-center admin_productReview_tbody">${rvo.fk_userid}</td>
								<td class="text-center admin_productReview_tbody">
									<div>${rvo.review_subject}</div>
									<div>${rvo.review_contents}</div>
								</td>
								<td class="text-center admin_productReview_tbody">${rvo.review_grade }</td>
								<td class="text-center admin_productReview_tbody">${rvo.review_registerday }</td>
								<td class="text-center admin_productReview_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="width:90%; height:30px;">삭제</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="mt-3">
					<span class="mr-2"><button type="button" id="" class="white" style="height:30px;">선택확인</button></span>
					<span><button type="button" id="" class="black" style="height:30px;">선택삭제</button></span>
				</div>
				<nav aria-label="Page navigation">
					<ul	class="pagination justify-content-center pagination-sm my-5">
						${requestScope.pageBar}
					</ul>
				</nav>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>