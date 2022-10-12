<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
button#write {
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


    </style>  
 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script>
	$(document).ready(function(){
		
		$("input#fk_userid").val("${requestScope.userid}");
		
		//에디터1은 중복이므로 숨긴다 (삭제하면 기능을 못함)
		$("div#editor1").hide(); 
		
		
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
				
				
		$("button#write").click(function(){
			
				var frm = document.registerFrm;
				frm.action = "review.sue";
				frm.method = "post";
				frm.submit();  
			});

		
		//취소버튼 클릭이벤트
		$("button#cancel").click(function(){
	      var boolFlag = false;
			
			$("input.requiredInfo").each(function(){
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
			location.href="<%= ctxPath%>/heajun/board/review.sue";
		});
		
		
		
		 
		  
	});
	
</script>

<div class="row container-fluid mt-5">
	<div id="contents" class="col-9 ml-5">
	
	
      
    <form name="reviewFrm">
      <div style="font-weight:bold;">Review</div>	
      
			<table id="notice_write" class="table table-condensed mt-4" style="font-size:10pt;">
			
			
			   <tr>
			      <td class="col-1 subject infoData">아이디</td>
			      <td style="text-align: left;">
				      <input type="text" name="fk_userid" id="fk_userid" class="requiredInfo form-control" style="width:30%" />
				      <span id="idcheckResult"></span>
				      
			      </td> 
			   </tr>
			   
			   
				<tr>
					<td class="col-1 subject infoData">제목</td>
					<td class="col-11">
					<input name="subject"  id="subject" type="text" class="requiredInfo form-control" placeholder="제목을 입력하세요"/> 
					</td>
					
				</tr>
				
			
              	
              	 <tr>
			      <td >내용&nbsp;</td>
			      <td style="text-align: left;">
			         <input type="text" name="board_content" id="board_content" class="requiredInfo form-control" style="width:1000px; height:250px;"/>
			        
			      </td>
			   </tr>	
              		
						
			    </table>
			
			 <div class="mt-3 mb-5 ">
			     
			  <span><button id="review" type="button" >목록</button></span>
			  <span><button id="cancel" type="button" >취소</button></span>
			  <span><button id="write" type="button" >등록</button></span>
   
		    </div>
		</form>
	 </div>
</div>
  <br>
  <br>
  <br>

