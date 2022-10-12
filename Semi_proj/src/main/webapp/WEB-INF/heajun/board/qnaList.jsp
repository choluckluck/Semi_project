<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
    String ctxPath = request.getContextPath();
%>

<meta charset="utf-8">
	<title>상품문의</title>
	
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
	
	#productQna_search_container{
		float:right;
	}
	#productQna_sort_container{
		position: relative;
		top:5px;
	}
	
	.review_search, .review_search_date{
		border: none;
		border-bottom: solid 1px black;
		width : 100px;
	}
	
	.productQna_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
	}
	
	.productQna_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom:solid 1px black;
	}
	
	.productQna_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#productQna_btn{
		float: right;
		width:150px;
		height:40px;
	}
	
		
	
	
	
</style>

<script>
	$(document).ready(function(){
		
		
		//글쓰기 글씨 클릭 이벤트
		$("button#reivewWrite").click(function(){
			const frm = document.productQnaFrm;
			frm.action="review_write.sue";
			frm.method = "get";
			frm.submit();
		});
		
	
	
	
		
		--%>
		/////////////////////////////////////////////////////
		
		
		$("input#qna_searchWord").keyup(function(e){
			if(e.keyCode == 13){
				selectQnaList();
			}	
		});
		
		$("button#qna_search_btn").click(function(){
			selectQnaList();
		});
		
		if("${requestScope.qna_searchWord}" != ""){
			$("#qna_sortType").val("${requestScope.qna_sortType}");
			$("#qna_searchWord").val("${requestScope.qna_searchWord}");
		}

	    });
	
	/////////////////////////////////////////////////////////////////////////////
	
	
	
  });
	

</script>




<div class="row container-fluid mt-5">
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productQna">
		
			<form name = "productQnaFrm">
		
				<span class="mr-3 mt-1" style="font-size:20pt; font-weight:bold">상품문의</span>
				<span id="productQna_search_container" style="font-size:10pt; display:inline-block;">
					<div id="productQna_sort_container" class="mt-1">
					
						<select id="review_sortType" name="review_sortType" class="mr-2 productQna_sort" >
							<option value="all" selected>전체</option>
							<option value="fk_userid">아이디</option>
						</select>
						
						<span class="mt-1" style="float:right;">
							<input type="text" id="qna_searchWord" class="qna_search" name="qna_searchWord" placeholder="검색" style="width:160px;"/>
							<button type="button" id="qna_search_btn" name="qna_search_btn" style="border:none; background-color: transparent;">
								<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
							</button>
						</span>
						
					</div>
				</span>
				
				
				<table id="prod_Review" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> 
				
					<thead>
						<tr>
							<th width="10%" height="50px" class="productQna_th text-center">No</th>
							<th width="10%" class="productQna_th text-center">카테고리</th>
							<th width="40%" class="productQna_th text-center">제목</th>
							<th width="5%" class="productQna_th text-center">아이디</th>
							<th width="10%" class="productQna_th text-center">작성일자</th>
						</tr>
					</thead>
					
					
				
					<tbody>
						<c:forEach var="qvo" items="${requestScope.qvoList}">
							<tr class="qvoList">
								<td height="60px" id="review_code" class=" productQna_tbody text-center">${qvo.review_code}</td>
								
								<td class=" text-center productQna_tbody">${qvo.fk_userid}</td>
								<td class="text-center productQna_tbody">
									<div class="btn" data-toggle="collapse" data-target="#demo">${qvo.subject}</div>
									<div id="demo" class="collapse">${qvo.contents}</div>
								</td>
								
								<td class="text-center productQna_tbody">${qvo.registerday }</td>
							</tr>
						</c:forEach>
						<c:if test="${empty requestScope.qvoList}">
							<tr><td colspan="8" class="py-3 text-center">조회된 리뷰가 없습니다.</td></tr>
						</c:if>
					</tbody> 
					
			
				
	
				
					
				
				
					
					
				</table>
				
				 <div style="float:right" class="mt-4">
	    	            <button type="button" id="qnaWrite" style="background-color: black; color:white; border:solid 1px gray;">상품후기쓰기</button>
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
