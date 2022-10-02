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
   left: 50px;
   top:150px;
}
ul{
    list-style-type: none;
    position:relative;
    right: 20px;
    color: black;
  }
p{
   font-size: 9pt;
}
.page-link {
  color: #000; 
  background-color: #fff;
  border: 1px solid #ccc; 
}

.page-item.active .page-link {
 z-index: 1;
 color: #555;
 font-weight:bold;
 background-color: #f1f1f1;
 border-color: #ccc;
 
}

.page-link:focus, .page-link:hover {
  color: #000;
  background-color: #fafafa; 
  border-color: #ccc;
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
      <ul><li type="button"><a>문의하기</a></li>
         <li type="button"><a>NOTICE</a></li>
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
   <div id="box" class=" gap-2 col-10 mx-auto"  >

      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">상품문의</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">배송문의</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">교환 / 반품</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">취소 / 변경</a>
      <a class="btn  btn-outline-dark col-md-2" href="#" role="button">AS 문의</a>
      <a class="btn  btn-outline-dark col-md-1" href="#" role="button">FAQ</a>

    </div>

<br><br>
   <table class="table">
      <thead></thead>
      <thead>
        <tr>
          <th scope="col">번호</th>
          <th scope="col">카테고리</th>
          <th scope="col">제목</th>
          <th scope="col">작성자</th>
          <th scope="col">작성일</th>
        </tr>
      </thead>

             
		   <tbody>
		         <c:forEach var="qvo" items="${requestScope.qnaList}">
		            <tr>
		               <td id="qna_num">${qvo.qna_code}</td>
		               <td id="qna_num">${qvo.category}</td>
		               <td id="qna_subject">${qvo.subject}</td>
		                <td id="qna_id">${qvo.fk_member_code}</td>
		               <td id="qna_date">${qvo.registerday}</td>
   					   <td style="display:none">${qvo.qna_code}</td>
		            </tr>
		         </c:forEach>
		     </tbody>  
		     
      <tbody>
        <tr>
          <th scope="row">10</th>
          <td>상품문의</td>
          <td>상품문의</td>
          <td>김**</td>
          <td>2022-09-16 17:50:36</td>
        </tr>
        <tr>
          <th scope="row">9</th>
          <td>상품문의</td>
          <td>상품문의</td>
          <td>김**</td>
          <td>2022-09-16 17:50:36</td>
        </tr>
        <tr>
          <th scope="row">8</th>
          <td>상품문의</td>
          <td>상품문의</td>
          <td>김**</td>
          <td>2022-09-16 17:50:36</td>
        </tr>
        <tr>
         <th scope="row">7</th>
         <td >상품문의</td>
         <td >상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
       <tr>
         <th scope="row">6</th>
         <td>상품문의</td>
         <td>상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
        <tr>
         <th scope="row">5</th>
         <td>상품문의</td>
         <td>상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
        <tr>
         <th scope="row">4</th>
         <td>상품문의</td>
         <td>상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
        <tr>
         <th scope="row">3</th>
         <td>상품문의</td>
         <td>상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
       <tr>
         <th scope="row">2</th>
         <td>상품문의</td>
         <td>상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
       <tr>
         <th scope="row">1</th>
         <td>상품문의</td>
         <td>상품문의</td>
         <td>김**</td>
         <td>2022-09-16 17:50:36</td>
       </tr>
      </tbody>
    </table>
    
<div class="page">
    <nav aria-label="Page navigation ">
      <ul class="pagination pagination-sm d-flex justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
          </a>
        </li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">4</a></li>
        <li class="page-item"><a class="page-link" href="#">5</a></li>
        <li class="page-item"><a class="page-link" href="#">6</a></li>
        <li class="page-item"><a class="page-link" href="#">7</a></li>
        <li class="page-item"><a class="page-link" href="#">8</a></li>
        <li class="page-item"><a class="page-link" href="#">9</a></li>
        <li class="page-item"><a class="page-link" href="#">10</a></li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>
</div>
</div>




   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

   
  </body>
</html>