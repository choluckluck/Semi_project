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
     border-bottom : solid 1px gray;
     width:80%;
  }
  
   img#likeimg {
     width: 100px;
     height: 120px;
     object-fit: cover;
   }
     
     
   td.tbl_td {
      vertical-align:middle;
   }  
</style>

<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link ghref="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
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

      <h3 style="margin-top:1px;">관심 상품</h3>
      <br><br>
      
        <table class="table table" style="text-align:center; vertical-align:middle; width:90%">
         <colgroup>
            <col style="width:70px;">
            <col style="width:100px;">
            <col style="width:230px;">
            <col style="width:90px;">
            <col style="width:100px;">
            <col style="width:100px;">
            <col style="width:100px;">
         </colgroup>
         <thead>
           <tr>
            <th scope="col"><input type="checkbox"/></th>
            <th scope="col" colspan="2">상품 정보</th>
            <th scope="col">정가</th>
            <th scope="col">적립금</th>
            <th scope="col">구매가</th>
            <th scope="col">선택</th>
           </tr>
         </thead>
         <tbody>
            <c:choose>
               <c:when test="${not empty requestScope.likeList1}">               
                  <c:forEach var="pvo" items="${requestScope.likeList1}">
                    <tr >
                      <td class="tbl_td"><input type="checkbox"/></td>
                      <td class="tbl_td"><a href=# ><img id="likeimg" src="<%=request.getContextPath() %>/images/product/${pvo.prod_image}"></a></td>
                      <td class="tbl_td" style="text-align:left">
                         <a class = "prd" href="/product/detail.html?product_no=3833&amp;cate_no=28" >${pvo.prod_name}</a>
                      </td>
                      <td class="tbl_td">${pvo.prod_price}</td>
                      <td class="tbl_td"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">${pvo.prod_point}원</td>
                      <td class="tbl_td">${pvo.prod_saleprice}원</td>
                      <td class="tbl_td">
                      <div class="">
                        <button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
                        <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">장바구니<br>담기</button>
                        <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
                     </div>            
                      </td>
                     </tr>
                  </c:forEach>
               </c:when>            
               <c:otherwise>
                  <tr style="vertical-align: middle">
                     <td colspan="5">최근 주문내역이 없습니다.</td>
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

         
         
      <div class="row" style="width:90%;">
         <div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
         <button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;">삭제하기</button>
      </div>
   
         <div class="col-2" style="border:solid 1px gray; margin-left:20px; display: flex; align-items: center; justify-content: center;">
         <button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;">장바구니 담기</button>
         </div>
   
         <div class="col-2" style="border:solid 1px gray; margin-left:280px; display: flex; align-items: center; justify-content: center;">
         <button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;">전체상품주문</button>
         </div>
   
         <div class="col-2" style="border:solid 1px gray; margin-left:20px; display: flex; align-items: center; justify-content: center;">
         <button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center; ">관심상품 비우기</button>
         </div>
   
      </div>
      
      <br><br>


    </div>
      



      
      </div>
     </div>
     <jsp:include page="../hyerin/footer.jsp"></jsp:include>   
     

   
  </body>
</html>