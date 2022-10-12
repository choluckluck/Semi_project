<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
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

</style>


<script type="text/javascript">

	$(document).ready (function(){
		

	});
	
	function reviewshow() {
		
//		alert("sdfsd");
		$(this).parent().find(".collapse").hide();		
		$(this).next().show();

	}

	function goreviewwrite() {
		
		location.href:"<%= request.getContextPath()%>/heajun/board/review_write.sue"
	}

	</script>

	<div style="width : 70%; margin-left : 80px;">		
		<h3 style="margin-top:1px;">상품 리뷰</h3>
		
		  <table class="table table" style="text-align:left; border-bottom:solid 1px gray;">
			<colgroup>
				<col style="width:70px;">
				<col style="width:200px;">
				<col style="width:70px;">
				<col style="width:80px;">
				<col style="width:55px;">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col" style="text-align:center">제목</th>
				<th scope="col">별점</th>
				<th scope="col">아이디</th>
				<th scope="col">작성일</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">
			<c:choose>
				<c:when test="${not empty requestScope.reviewList}">					
					<c:forEach var="rvo" items="${requestScope.reviewList}" varStatus="status">
						
						<tr>
							<td>${rvo.rnum}</td>
							<td style="text-align:center;">
								<div class="btn" data-toggle="collapse" data-target="#demo${status.index}" onclick="reviewshow()">${rvo.review_subject}</div>
								<div id="demo${status.index}" class="collapse" style="text-align:left">${rvo.review_contents}</div>
							</td>
							<td>
								<c:if test="${rvo.review_grade == '1'}">★☆☆☆☆</c:if>
								<c:if test="${rvo.review_grade == '2'}">★★☆☆☆</c:if>
								<c:if test="${rvo.review_grade == '3'}">★★★☆☆</c:if>
								<c:if test="${rvo.review_grade == '4'}">★★★★☆</c:if>
								<c:if test="${rvo.review_grade == '5'}">★★★★★</c:if>							
							</td>
							<td>${rvo.fk_userid}</td>							
							<td>${rvo.review_registerday}</td>
						</tr>
					</c:forEach>
				</c:when>				
				<c:otherwise>
							<tr>
								<td colspan="6">리뷰 내역이 없습니다.</td>
							</tr>
				</c:otherwise>
			</c:choose>				
		    </tbody>
		  </table>
		  
		  			 <div style="text-align:right;  width:100%;" class="">
	    	            <button type="button" id="reivewWrite" style="background-color: black; color:white; border:solid 1px gray;" onclick=" goreviewwrite()">상품후기쓰기</button>
	          </div>
	</div>
	
	
	
	
	   		  <nav class="my-5">
			<div style="display: flex; width: 80%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar1}</ul>
			</div>
		  </nav>

	



