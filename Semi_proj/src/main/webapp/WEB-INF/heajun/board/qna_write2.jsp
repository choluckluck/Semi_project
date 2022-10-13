<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
    
<%
    String ctxPath = request.getContextPath();
%>


<meta charset="UTF-8">
<title>리뷰 작성</title>
 
             
<style type="text/css">

   

button#review {
	width: 90px;
	height: 30px;
    float: left;
    text-align: center;
    margin-right: 5px;
    background-color: #ffffff;
    padding: 6px;
    border: 1px solid #8c8c8c;
    font-size: 9pt;
}

button#cancel {
	width: 90px;
	height: 31px;
	border: 1px solid #8c8c8c;
	background-color: black;
    float: right;
    text-align: center;
    font-size: 9pt;
    padding: 5px;
    margin-right: 10px;
    color: #ffffff;
}
button#gowrite {
	width: 90px;
	height: 31px;
	border: 1px solid #8c8c8c;
	background-color: #ffffff;
    float: right;
    text-align: center;
    font-size: 9pt;
    padding: 5px;
    margin-right: 10px;
}

	img#reviewimg {
	  width: 100px;
	  height: 120px;
	  object-fit: cover;
	  
	}
	
	
	

    </style>  
 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script type="text/javascript">
	$(document).ready(function(){
		
//		$("div.prod_info").hide();
		
		
		$("input#fk_userid").val("${requestScope.userid}");
		
		//에디터1은 중복이므로 숨긴다 (삭제하면 기능을 못함)
		
		
		//목록버튼 클릭이벤트
		$("button#review").click(function(){
			location.href="<%= ctxPath%>/heajun/board/review.sue";
		});
		
		
		/* 
		  //등록버튼 클릭이벤트 
		  $("button#write").click(function(){
			  
			  let flag = false;
			  
			  $(".infoData").each(function(){
				  const val = $(this).val().trim();
				  if(val == "") {
					  $(this).next().show();
					  flag = true;
					  return false;
				  }
			  });
			  
			  if(!flag) {
				  const frm = document.reviewFrm;
				  frm.submit();
			  }
			  
		  });
		   */


			  //등록버튼 클릭이벤트 
				
				
		$("button#gowrite").click(function(){
			    var boolFlag = false;
			    
				$(".requiredInfo").each(function(){
					var data = $(this).val().trim();
					if(data == "") {
						alert("필수입력사항은 모두 입력하셔야 합니다.");
						boolFlag = true;
						return false; // break; 라는 뜻이다.
					}
				});
				
				if(boolFlag) {
					return; // 종료
				}
				
				alert("문의 등록이 완료되었습니다.");
 				var myQnaFrm = document.myQnaFrm;
 				myQnaFrm.action = "<%= ctxPath%>/seongmin/member/qnaResult.sue";
 				myQnaFrm.method = "post";
 				myQnaFrm.submit();
 			});

		
		//취소버튼 클릭이벤트
		$("button#cancel").click(function(){
			location.href="<%= ctxPath%>/seongmin/member/mypage_Main.sue";
		});
		
		
		
		 
		  
	});
	
	function showimage() {
		let prod_image = $("select[name=prod_image]").val();
//		alert(prod_code);
		const imghtml = '<img id="reviewimg" alt="" src="<%= ctxPath%>/images/product/'+prod_image+'">';
//		alert(imghtml);
		$("div.prod_info").html(imghtml);
	
	}
	
</script>

<div class="row container-fluid mt-5">
	<div id="contents" class="col-9 ml-5">
	
	
      
    <form name="myQnaFrm">
      <div style="font-weight:bold;">문의하기</div>	
      
			<table id="notice_write" class="table table-condensed mt-4" style="font-size:10pt;">
			
			
			   <tr>
			      <td class="col-1 subject infoData">아이디</td>
			      <td style="text-align: left;">
				      <input type="text" name="userid" id="userid" class=" form-control" style="width:30%" value="${sessionScope.loginuser.userid}" readonly/>
				      <span id="idcheckResult"></span>				      
			      </td> 
			   </tr>
			   
				<tr style= "height:50px;">
					<td class="col-1 subject infoData">분류</td>
					<td class="col-11">
						<select name="category" style="width:height:40px" onchange="">
							<option value="prod" selected >product </option>
							<option value="e/r">e/r</option>
							<option value="c/c">c/c</option>
							<option value="a/s">a/s</option>
						</select>
					</td>					
				</tr>
			   
				<tr>
			      <td class="col-1 subject infoData">제품명</td>
			      <td>
				      <select name="prod_image" onchange="showimage()">
				      		<option value="-">-</option>				      
				      	<c:forEach var="rovo" items="${requestScope.prod_infoList2}" varStatus="status">
				      		<option value="${rovo.prod_image}">${rovo.prod_name}</option>
				        </c:forEach>

				      </select>
				      <br>
				      <div class="prod_info"></div>
				      
			      </td>
			      
			      
<%-- 			      <td style="text-align: left;">
			      	  <div style="display:inline-block; width:150px; " ><img id="reviewimg" alt="" src="<%= ctxPath%>/images/product/${requestScope.prod_image}"/></div>
				      <div style=" font-size:15pt; margin-top:20px;">${requestScope.prod_name}</div>
				      <input type="hidden" name="prod_code" id="prod_code" class=" form-control" style="width:30%" value="${requestScope.prod_code}" readonly/>
			      </td>  --%>
				</tr>			   
				<tr>
				</tr>			   
				<tr>
					<td class="col-1 subject infoData">제목</td>
					<td class="col-11">
					<input name="subject" id="qna_subject" type="text" class="requiredInfo form-control" placeholder="제목을 입력하세요"/> 
					</td>					
				</tr>			  	
              	 <tr>
			      <td >내용&nbsp;</td>
			      <td style="text-align: left;">
			         <textarea name="contents" id="qna_contents" class="requiredInfo form-control" style="width:1000px; height:250px;"></textarea>
			        
			      </td>
			   </tr>					
			</table>
		</form>			
			 <div class="mt-3 mb-5 ">
			     
<!-- 			  <span><button id="review" type="button" >목록</button></span>
 -->			  <span><button id="cancel" type="button" >취소</button></span>
			  <span><button id="gowrite" type="button" >등록</button></span>
   
		    </div>

	 </div>
</div>
  <br>
  <br>
  <br>

