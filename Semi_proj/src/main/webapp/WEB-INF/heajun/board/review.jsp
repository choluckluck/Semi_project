<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String ctxPath = request.getContextPath();
%>

<meta charset="utf-8">
	<title>리뷰</title>
	
	<%-- Bootstrap CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<%-- Font Awesome 5 Icons --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<%-- 직접 만든 CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hyerin_style.css" />
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/main_style.css" />
	
	<%-- Optional JavaScript --%>
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	
	<%-- jQueryUI CSS--%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
	<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
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
	
	.productReview_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom:solid 1px black;
	}
	
	.productReview_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#productReview_btn{
		float: right;
		width:150px;
		height:40px;
	}
	
		
	
	
	
</style>

<script>
	$(document).ready(function(){
		
		
		//글쓰기 글씨 클릭 이벤트
		$("button#reivewWrite").click(function(){
			const frm = document.productReviewFrm;
			frm.action="review_write.sue";
			frm.method = "get";
			frm.submit();
		});
		
	
		<%--
		 // 특정 리뷰를 클릭하면 그 리뷰의 상세정보를 보여주도록 한다.
		   $("tr.rvoList").click( (e)=>{
			   const $target = $(e.target);
			  const review_code = $target.parent().children(".review_code").text();
			   location.href="<%= ctxPath%>/heajun/board/reviewView.sue?review_code="+review_code+"&goBackURL=${requestScope.goBackURL}";
			 		   
		   });
	
	
		
		--%>
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

	 
	
	/////////////////////////////////////////////////////////////////////////////
	
	
	
  });
	

</script>




<div class="row container-fluid mt-5">
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productReview">
		
			<form name = "productReviewFrm">
		
				<span class="mr-3 mt-1" style="font-size:20pt; font-weight:bold">상품리뷰</span>
				<span id="productReview_search_container" style="font-size:10pt; display:inline-block;">
					<div id="productReview_sort_container" class="mt-1">
					
						<select id="review_sortType" name="review_sortType" class="mr-2 productReview_sort" >
							<option value="all" selected>전체</option>
							<option value="fk_userid">아이디</option>
						</select>
						
						<span class="mt-1" style="float:right;">
							<input type="text" id="review_searchWord" class="review_search" name="review_searchWord" placeholder="검색" style="width:160px;"/>
							<button type="button" id="review_search_btn" name="review_search_btn" style="border:none; background-color: transparent;">
								<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
							</button>
						</span>
						
					</div>
				</span>
				
				
				<table id="prod_Review" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> 
				
					<thead>
						<tr>
							<th width="10%" height="50px" class="productReview_th text-center">No</th>
							<th width="10%" class="productReview_th text-center">아이디</th>
							<th width="40%" class="productReview_th text-center">제목</th>
							<th width="5%" class="productReview_th text-center">평점</th>
							<th width="10%" class="productReview_th text-center">작성일자</th>
						</tr>
					</thead>
					
					
				
					<tbody>
						<c:forEach var="rvo" items="${requestScope.rvoList}">
							<tr class="rvoList">
								<td height="60px" id="review_code" class=" productReview_tbody text-center">${rvo.review_code}</td>
								
								<td class=" text-center productReview_tbody">${rvo.fk_userid}</td>
								<td class="text-center productReview_tbody">
									<div class="btn" data-toggle="collapse" data-target="#demo">${rvo.review_subject}</div>
									<div id="demo" class="collapse">${rvo.review_contents}</div>
								</td>
								<c:if test="${rvo.review_grade == 1}"><td class="text-center productReview_tbody">★☆☆☆☆</td></c:if>
								<c:if test="${rvo.review_grade == 2}"><td class="text-center productReview_tbody">★★☆☆☆</td></c:if>
								<c:if test="${rvo.review_grade == 3}"><td class="text-center productReview_tbody">★★★☆☆</td></c:if>
								<c:if test="${rvo.review_grade == 4}"><td class="text-center productReview_tbody">★★★★☆</td></c:if>
								<c:if test="${rvo.review_grade == 5}"><td class="text-center productReview_tbody">★★★★★</td></c:if>
								<td class="text-center productReview_tbody">${rvo.review_registerday }</td>
							</tr>
						</c:forEach>
						<c:if test="${empty requestScope.rvoList}">
							<tr><td colspan="8" class="py-3 text-center">조회된 리뷰가 없습니다.</td></tr>
						</c:if>
					</tbody> 
					
			
				
	
				
				
				
					
				
				
					
					
				</table>
				
				 <div style="float:right" class="mt-4">
	    	            <button type="button" id="reivewWrite" style="background-color: black; color:white; border:solid 1px gray;">상품후기쓰기</button>
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
