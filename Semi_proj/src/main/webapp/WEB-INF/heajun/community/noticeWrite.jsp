<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<style type="text/css">

   

button#notice {
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
		
		 $("span.error").hide();
		
		//커뮤니티사이드바_공지사항 클릭 이벤트
		$("div#sidebar_notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		
		
		//목록버튼 클릭이벤트
		$("button#notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		

		  //등록버튼 클릭이벤트 
			
			
			 
			

		
		//취소버튼 클릭이벤트
		$("button#cancel").click(function(){
			$("span.error").hide();
			//frm.reset();
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		 
		  
	});
	
	function goWrite() {
		
		//alert("버튼 눌리나요");
		/* 
		 var boolFlag = false;
		
		$("input.error").each(function(){
			var data = $(this).val().trim();
			if(data == "") {
				alert("필수입력사항은 모두 입력하셔야 합니다.");
				boolFlag = true;
				return false; // break; 라는 뜻이다.
			}
		});
		
		if(boolFlag) {
			return; // 종료
		} */
		
	
			
		const frm = document.notice_contents_form;
		frm.action = "<%= ctxPath%>/heajun/community/noticeUpdate.sue";
		frm.method = "post";
		frm.submit();  
			
		<%--  location.href="<%= ctxPath%>/heajun/community/notice.sue";  --%>
	
  }	

	
	
</script>

<div class="row container-fluid mt-5">
	 <jsp:include page="/WEB-INF/heajun/community/communitySidebar.jsp" /> 
	<div id="contents" class="col-9 ml-5">
	
	
		
			
	<form name="notice_contents_form">
      
      <div style="font-weight:bold;">NOTICE</div>	
			<table id="notice_write" class="table table-condensed mt-4" style="font-size:10pt;">
			
				<tr>
					<td class="col-1 subject infoData">제목</td>
					<td class="col-11"><input name="subject" type="text" class="form-control" placeholder="제목을 입력하세요"/>
					<span class="error">필수입력</span>
					</td>
					
				</tr>
				
				
              	
              	 <tr>
			      <td >내용&nbsp;</td>
			      <td style="text-align: left;">
			         <input type="text" name="board_content" id="board_content" class="requiredInfo" style="width:1000px; height:250px;"/>
			         <span class="error">내용은 필수입력 사항입니다.</span>
			      </td>
			   </tr>	
              		
			
			  
						
			    </table>
			
			 <div class="mt-3 mb-5 ">
			     
			  <span><button id="notice" type="button"  >목록</button></span>
			  <span><button id="cancel" type="button" onclick="javascript:history.back();">취소</button></span>
			  <span><button id="write" type="button" onclick="goWrite();">등록</button></span>
   
		    </div>
		 </form>
	 </div>
</div>

	
 <jsp:include page="/WEB-INF/hyerin/footer.jsp"/>