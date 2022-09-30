<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
// /SemiProject
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1문의 답변</title>
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

span.button {
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




    </style>  
  </head>



  <body>
  
  <script type="text/javascript">

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
  
<tr id="re-title">
<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;제목<span id="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.qvo.qna_subject}</span></th>
  <td>배송관련 </td>
 </tr>
  <hr>
<tr id="re-writer">
<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자<span id="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${requestScope.qvo.qna_id}</span></th>
   <td>JINNY KIM </td>
</tr>
          
  <hr>
<tr id="re-writeday">
   
 <td><span class="date">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성일</span><span class="txtNum">&nbsp;&nbsp;날짜</span></td>  
</tr>
  <hr>
 
    <tr id="re-content">
	   <td style="width:750px; height:200px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용</td>
	</tr>
	<p>문의</p>

  <hr>

 <span class="button">	
		         <a href="<%=ctxPath%>/board/qnalist.go">목록</a> 
</span>
   
</div>
</div>




   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
   
  </body>
</html>