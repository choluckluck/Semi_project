<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<!-- CSS -->
 <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2209081131">
 <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2209081131">
<!-- JavaScript -->
 <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2209081131"></script>
 <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2209081131"></script>
 <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2209081131"></script>
<style type="text/css">

   
   a.btn:hover{ 
      background-color:#1c284a;
      color:white;
    }
 div.board{
   position:relative;
   left: 400px;
   bottom:100px;
}

h4 {
   color:gray;
}

div.board-menu{
   position:relative;
   left: 100px;
   top:200px;
}
ul{
   
    list-style-type: none;
    position:relative;
    right: 20px;
  }

p{
   font-size: 9pt;
}

a{
  text-decoration-line : none;
  color:black;
  
}

button#list {
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

button#delete {
	width: 90px;
	height: 31px;
	border: 1px solid #8c8c8c;
	background-color: #1c284a;
    float: right;
    text-align: center;
    font-size: 9pt;
    padding: 5px;
    margin-right: 10px;
    color: #ffffff;
}
button#edit {
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
  </head>



  <body>
  
  <script type="text/javascript">
  $(document).ready(function(){
		
		$("span.button").click(function(){
			
			if("${requestScope.userid}"=="no"){
				alert("로그인 후 이용 가능합니다");
			}
			else if("${requestScope.userid}"!="${requestScope.qvo.qna_id}"){
				alert("다른작성자의 게시글 수정은 불가 합니다.");
			}
			else{
				 var frm = document.goEdit;
				 frm.action = "qnaEdit.go";
				 frm.method = "post";
				 frm.submit();
			}
			
		}); // end of $("span.button").click(function()-------------------------------
		
		$("button#btn").click(function(){
			
			if("${requestScope.userid}"=="no"){
				alert("로그인 후 이용 가능합니다");
			}
			else if("${requestScope.userid}"!="${requestScope.qvo.qna_id}"){
				alert("다른작성자의 게시글 삭제는 불가 합니다.");
			}
			else{
				 var frm = document.delFrm;
				 frm.action = "qnaDelete.go";
				 frm.method = "post";
				 frm.submit();
			}
		});
		
		$("button#reply").click(function(){
			
				 var frm = document.goReply;
				 frm.action = "qnaReply.go";
				 frm.method = "post";
				 frm.submit();
		});
	});// end of $(document).ready(function(){})-------------------------------------------
		
</script>

   <div class="detail row-my-3">

   <div class="board-menu col-md-2" id="customer_menu">
      <h3>고객센터</h3>
      <br>
      <ul><li type="button"><a href="">문의하기</a></li>
         <li type="button"><a href="">NOTICE</a></li>
      </ul>
      <hr>
   
   <p class="tel" style="display:none;">1600-1858</p>
   <p class="time">
            평일 10:00 - 18:00 / 점심 12:00 - 13:00<br/>
            주말,공휴일 휴무			
         </p>
   </div>




<div class="board col-md-8" align="left">

   <h4 class="text-center" >문의하기</h4>
   <br><br>
   <div class=" gap-2 col-10 mx-auto"  >

      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">상품문의</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">배송문의</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">교환 / 반품</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">취소 / 변경</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">AS 문의</a>
      <a class="btn  btn-outline-dark col-md-1" href="#" role="button">FAQ</a>

    </div>

<br><br>
  <hr>

 <tr id="top">
<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목<span id="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목</span></th>
  
 </tr>
  <hr>
<tr id="mid">
<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자<span id="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디</span></th>
   
</tr>
          
  <hr>
<tr id="mid2">   
 <td><span class="date">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</span><span class="txtNum">&nbsp;&nbsp;날짜</span></td>  
</tr>
  <hr>
 
<tr id="btt">
<td style="width:750px; height:200px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용</td>
</tr>
<p>문의</p>
    
 

  <hr>

   <button id="list" type="button" onclick="javascript:history.back();">목록</button>
  
   
   <button id="delete" type="button" onclick="">삭제</button>
   <button id="edit" >수정</button>
   <button id="reply" type="button">답글</button>	
</div>
</div>


   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
  </body>
</html>