<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>faq</title>
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


    </style>  
  </head>

 

  <body>

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

   <h4 class="text-center" >FAQ</h4>
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
  <td>배송관련 </td>
 </tr>
  <hr>
<tr id="mid">
<th scope="row">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;작성자<span id="txt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;아이디</span></th>
   <td>JINNY KIM </td>
</tr>
                

  <hr>
<tr id="btt">
   <td style="width:750px; height:200px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;내용</td>
</tr>
  <section>
     
      <p>배송 지연이 왜 되는지?</p>
      <p>주문량이 많은 경우, 품절되어 오프라인 매장에서 출고확인을 하거나, 예약배송 상품의 경우 입고가 지연되어 배송이 늦어지게 됩니다.
        이렇게 지연 및 품절이 될 경우에는 전화나 문자로 안내해드립니다.</p>
      <p>간혹 이메일이나 전화번호가 잘못 기재되시어 연락을 못받으시는 분들이 계시니
        번거로우시겠지만 한번더 개인정보 확인부탁드립니다.</p>
      <p>배송 지연은 몇일이 걸리는 건가요?</p>
      <p>지연 및 품절시 안내 문자를 드립니다. 기다리시기가 불편하실 경우 다른 상품으로도 교환가능하시오니
        변경사항이 있으신 경우 저희쪽에 미리 연락을 주세요.</p>
      <p>주문건 배송지 변경은 어떻게 하나요?</p>
      <p>배송 전 상태에서 게시판 접수 또는 마이페이지에서 배송지 변경하여 주세요
        단, 배송이 시작된 상태에선 변경이 불가합니다.
        반드시 오후12시 이전으로 QnA 게시판 혹은 게시판으로 연락주셔야 합니다.
        
         (상품이 먼저 출고되고 나중에 배송문자 발송됩니다.
        배송준비중이라도 오후 12시 이 후엔 주소변경이 어려우시니 이점 착오 없으시길 바랍니다.)</p>
      <p>배송 준비중인데 취소가능한가요?</p>
      <p>오전 12시 이전 배송전 변경,취소는 마이페이지, 혹은 게시판으로 연락주세요.
        준비된 상품은 바로바로 출고과정을 거치기 때문에
         상품 취소를 하실경우 오전 12시 이전으로 알려주셔야 처리해드릴수 있습니다.
         (상품이 먼저 출고되고 나중에 배송문자 발송됩니다.
        배송준비중이라도 오전 12시 이후엔 취소가 어려우시니 이점 착오 없으시길 바랍니다.)
        </p>


 


  </section>

  <hr>

   <button id="list" type="button" onclick="javascript:history.back();">목록</button>

  
 
</div>
</div>



   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

   
  </body>
</html>