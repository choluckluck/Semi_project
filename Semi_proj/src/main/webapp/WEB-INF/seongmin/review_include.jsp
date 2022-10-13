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

let isOrderOK = false;
let isRegistered = false;

	$(document).ready (function(){
		
		   $.ajax({
			   url:"<%= request.getContextPath()%>/seongmin/member/isOrder.sue",
			   type:"GET",
			   data:{"fk_userid":"${sessionScope.loginuser.userid}",
				     "fk_prod_code":"${requestScope.pvo2.prod_code}" },
			   dataType:"JSON",
			   
			   async:false, // 동기처리
		    //  async:true,  // 비동기처리(기본값임)
			   
			   success:function(json) {
				   // json ==> {isOrder:true} 또는 {isOrder:false}
				   isOrderOK = json.isOrder;
				// json.isOrder 값이 true  이면 로그인한 사용자가 해당 제품을 구매한 경우이고
			   	// json.isOrder 값이 false 이면 로그인한 사용자가 해당 제품을 구매하지 않은 경우이다.
			   },
			   error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			   }
		   });
		
		   
		   
		   
		   
		   $.ajax({
			   url:"<%= request.getContextPath()%>/seongmin/member/isRegistered.sue",
			   type:"GET",
			   data:{"fk_userid":"${sessionScope.loginuser.userid}",
				     "fk_prod_code":"${requestScope.pvo2.prod_code}" },
			   dataType:"JSON",
			   
			//   async:false, // 동기처리
		     async:true,  // 비동기처리(기본값임)
			   
			   success:function(json1) {
				   // json1 ==> {isOrder:true} 또는 {isOrder:false}
				   isRegistered = json1.isRegistered;
				// json.isOrder 값이 true  이면 로그인한 사용자가 해당 제품을 구매한 경우이고
			   	// json.isOrder 값이 false 이면 로그인한 사용자가 해당 제품을 구매하지 않은 경우이다.
			   },
 			   error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		   } 
		   
		   });
				   
		   
		   
		   
		   
		$("button#reivewWrite").click(function(e){
//			alert("하하");
			reviewwrite();
			
			
		}) //end of $("button#reivewWrite").click(function(e)
		
		

	});
	
	function reviewwrite(){
		// 리뷰 쓰기 페이지로 이동
		
		if(${sessionScope.loginuser != null} && isOrderOK == true && isRegistered == true) {
	<%-- 		const url = "<%= request.getContextPath()%>/heajun/board/review_write.sue?userid="+"${sessionScope.loginuser.userid}";
			
			//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
			
			const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
			const pop_height = 650;
			const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); // Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
			const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
			
			
			window.open(url, "reviewrite",
					    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
			} --%>
			alert("리뷰 작성 페이지로 이동합니다.");
			const reviewForm = document.reviewForm;
			reviewForm.action="<%=request.getContextPath() %>/heajun/board/review_write.sue";
			reviewForm.method = "GET";
			reviewForm.submit(); 

	}		
		
		else if (${sessionScope.loginuser != null} && isOrderOK == false && isRegistered == true) {
			alert("리뷰는 해당 제품을 구매한 회원에 한하여 작성 가능합니다. ");
			return;
		}

		else if (${sessionScope.loginuser != null} && isOrderOK == true && isRegistered == false) {
			alert("해당 제품에 대한 리뷰를 이미 작성하셨습니다. ");
			return;
		}
		
		else {
			alert("로그인이 필요합니다. 로그인 페이지로 이동합니다.");
			location.href="<%=request.getContextPath() %>/hyerin/login/login.sue"
		}
		
	}//end of goEditPersonal
		
		
		
		
		
		
		
		
		
		
	// 토글 하나만 보여주는 함수.	
	function reviewshow() {
		
//		alert("sdfsd");
		$(this).parent().find(".collapse").hide();		
		$(this).next().show();
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
	    	            <button type="button" id="reivewWrite" style="background-color: black; color:white; border:solid 1px gray;">상품후기쓰기</button>
	          </div>
	</div>
	
	
	
	
	   		  <nav class="my-5">
			<div style="display: flex; width: 80%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar1}</ul>
			</div>
		  </nav>
<form name="reviewForm">
	<input type="hidden" id="fk_prod_code" name="fk_prod_code" value="${requestScope.pvo2.prod_code}" />   
	<input type="hidden" id="fk_userid" name="fk_userid" value="${sessionScope.loginuser.userid}" />   
</form>


