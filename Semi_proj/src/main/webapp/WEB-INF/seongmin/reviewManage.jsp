<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
    
<!DOCTYPE html>
<html>
<head>



<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<jsp:include page="../hyerin/header.jsp"></jsp:include>
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
  
  table {
     border-top : solid 1px gray;
     width:80%;
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



   </script>



<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
</head>
<body>


 <header></header>
  
       <br><br>
       
  <div id="container">
    <div class="row">
       <div class="col-2">
        <jsp:include page="sideMenu.jsp" />      
      </div>
      <div class="col-10">

      <h3 style="margin-top:1px;">리뷰 관리</h3>
      <br><br>
      
      

      
         
      
      
   
      <br><br>      
      
        <table class="table table" style="text-align:left; width:90%">
         <colgroup>
            <col style="width:70px;">
            <col style="width:70px;">
            <col style="width:200px;">
            <col style="width:80px;">
            <col style="width:55px;">
         </colgroup>
         <thead>
             <tr>
            <th scope="col">번호</th>
            <th scope="col">제품 번호</th>
            <th scope="col" style="text-align:center">제목</th>
            <th scope="col">별점</th>
            <th scope="col">작성일</th>
           </tr>
         </thead>
         
         
         <tbody style="font-size:12pt; height:40px;">
         <c:choose>
            <c:when test="${not empty requestScope.reviewList}">               
               <c:forEach var="rvo" items="${requestScope.reviewList}" varStatus="status">
                  
                  <tr>
                     <td>${rvo.rnum}</td>
                     <td>${rvo.fk_prod_code}</td>
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
              <nav class="my-5">
         <div style="display: flex; width: 80%">
            <ul class="pagination" style="margin: auto">${requestScope.pageBar1}</ul>
         </div>
        </nav>

   




      
      </div>
     </div>
   </div>
   
<jsp:include page="../hyerin/footer.jsp"></jsp:include>
   
  </body>
</html>