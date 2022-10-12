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
  
  a.prod_name {
  	text-decoration-line: none;
  	color:black;
  }
  
  a.prod_name:hover {
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

<script type="text/javascript">
	$(document).ready(function(){
	      $(".chkboxprod_code").click(function(){
	          
	          var bFlag = false;
	          $(".chkboxprod_code").each(function(){
	             var bChecked = $(this).prop("checked");
	             if(!bChecked) {
	                $("#allCheckOrNone").prop("checked",false);
	                bFlag = true;
	                return false;
	             }
	          });
	          
	          if(!bFlag) {
	             $("#allCheckOrNone").prop("checked",true);
	          }
	          
	       });
	      
	      
	      $(".btn_order").click(function(){
	    	  	alert($(this).val());
			});
	      
	      

	});

	
	   function allCheckBox() {
		   
		      var bool = $("#allCheckOrNone").is(":checked");
		      /*
		         $("#allCheckOrNone").is(":checked"); 은
		           선택자 $("#allCheckOrNone") 이 체크되어지면 true를 나타내고,
		           선택자 $("#allCheckOrNone") 이 체크가 해제되어지면 false를 나타내어주는 것이다.
		      */
		      
		      $(".chkboxprod_code").prop("checked", bool);
		   }// end of function allCheckBox()-------------------------
		   
		
		   // === 관심상품에서 선택한 상품 지우기 === //  
		   function goDel() {
		      
		      var $target = $(event.target);
		      var lname = $target.parent().parent().find("input.like_code").val();
		      alert(lname);
		      var prod_name = $target.parent().parent().find("input.prod_name").val();
 		      var bool = confirm("[" + prod_name + "] 상품을  관심상품에서 제거하시겠습니까?");
		   		
		      if(bool) {
		         
		         $.ajax({
		            url:"<%= request.getContextPath()%>/seongmin/member/likeListDel.sue",
		            type:"POST",
		            data:{"like_code":lname},
		            dataType:"JSON",
		            success:function(json){
		               if(json.n == 1) {
		            	  alert(prod_name + " 상품을 삭제했습니다.")
		                  location.href = "interestPrd.sue"; // 관심상품 보기는 페이징처리를 안함.
		               }
		            },
		            error: function(request, status, error){
		               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		            }
		         });
		         
		      }//end of if
		      else {
		         alert("관심상품에서 " +prod_name+ " 상품 삭제를 취소하셨습니다.");
		      }
		      
		   }// end of function goDel(cartno)---------------------------
		   
		   //버튼 클릭시 선택한 상품 장바구니로 이동
		   function goCart() {
				var $target = $(event.target);
			    var fk_prod_code = $target.parent().parent().find("input.fk_prod_code").val();
			    var prod_name = $target.parent().parent().find("input.prod_name").val();
			    var fk_prod_color = $target.parent().parent().find("input.fk_prod_color").val();
			    var fk_prod_size = $target.parent().parent().find("input.fk_prod_size").val();
	 		    
			    var bool = confirm("[" + prod_name + "] 상품을  장바구니에 추가하시겠습니까?");
			   	
			      if(bool) {
				         
				         $.ajax({
				            url:"<%= request.getContextPath()%>/seongmin/member/goCart.sue",
				            type:"POST",
				            data:{"fk_prod_code":fk_prod_code,
				            	  "prod_name":prod_name,
				            	  "fk_prod_color":fk_prod_color,
				            	  "fk_prod_size":fk_prod_size},
				            	  
				            dataType:"JSON",
				            success:function(json){
				               if(json.n == 1) {
				            	  alert(prod_name + " 상품을 장바구니에 추가했습니다.")
				                  location.href = "interestPrd.sue"; // 관심상품 보기는 페이징처리를 안함.
				               }
				            },
				            error: function(request, status, error){
				               alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				            }
				         });
				         
				      }//end of if
				      else {
				         alert("취소하셨습니다.");
				      }				      
		   }
		   
		   // 선택 상품 한 번에 삭제시
		   function goDelete() {
		       var checkCnt = $("input:checkbox[name=like_code]:checked").length;

		       if(checkCnt < 1) {
		           alert("삭제하실 제품을 선택하세요.");
		           return; // 종료 
		        }	
		       
		       else {
		            //// == 체크박스에서 체크된 value값(checked 속성이용) == ////
		            ///  == 체크가 된 것만 값을 읽어와서 배열에 넣어준다. /// 
		            var allCnt = $("input:checkbox[name=like_code]").length;
		            
		            var like_code_Arr = new Array();
		             
		             for(var i=0; i<allCnt; i++) {
		            	 /* $("input:checkbox[name=pnum]").eq(i).prop("checked") */
		                if( $("input:checkbox[name='like_code']").eq(i).is(":checked") ) {
		                	like_code_Arr.push( $("input:checkbox[name=like_code]").eq(i).val() ); 	
		               	}//end of if
		            }// end of for---------------------------
		               
		            for(var i=0; i<checkCnt; i++) {
		               console.log("확인용 관심상품코드 : " + like_code_Arr[i] );
		            /*
		                    확인용 제품번호: 3, 주문량: 3, 장바구니번호 : 14, 주문금액: 30000, 포인트: 15
		                    확인용 제품번호: 56, 주문량: 2, 장바구니번호: 13, 주문금액: 2000000, 포인트 : 120 
		                    확인용 제품번호: 59, 주문량: 3, 장바구니번호: 11, 주문금액: 30000, 포인트 : 300    
		            */
		            }// end of for---------------------------
		            
		            var like_codejoin = like_code_Arr.join();
	               
		               var bool = confirm("선택한 상품들을 관심상품 목록에서 삭제하시겠습니까?");
		               
		               if(bool) {
		               
		                  $.ajax({
		  		            url:"<%= request.getContextPath()%>/seongmin/member/likeListDel2.sue",
		                     type:"POST",
		                     data:{"like_codejoin":like_codejoin},
		                     dataType:"JSON",     
		                     success:function(json){
		                    	 alert(json.n);
		                        if(json.n == 1) {
		                        	alert("하하");
		                           location.href="interestPrd.sue";                     
		                        }
		                        <%-- else {
		                           location.href="<%= request.getContextPath()%>/shop/orderError.up";
		                        } --%>
		                     },
		                     error: function(request, status, error){
		                        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
		                     }
		                  });
		                  
		               }
		            }   
		       
		       
		      
		   }// end of function goDelete()----------------------
		   
		   //선택상품 장바구니에 푸시
<%-- 		   function selectCartList() {

			   var checkCnt = $("input:checkbox[name=like_code]:checked").length;
				
		       if(checkCnt < 1) {
		           alert("삭제하실 제품을 선택하세요.");
		           return; // 종료 
		        }	
		       
		       else {
								   
			   var allCnt = $("input:checkbox[name=like_code]").length;
	            
	            var fk_prod_code_Arr = new Array();
	            var prod_name_Arr = new Array();
	            var fk_prod_color_Arr = new Array();
	            var fk_prod_size_Arr = new Array();          
	            
	             for(var i=0; i<allCnt; i++) {
	            	 /* $("input:checkbox[name=pnum]").eq(i).prop("checked") */
	                if( $("input:checkbox[name='like_code']").eq(i).is(":checked") ) {
	                	like_code_Arr.push( $("input.fk_prod_code").eq(i).val() ); 	
	                	fk_prod_code_Arr.push( $ ()  )
	                }//end of if
	            }// end of for---------------------------
	               
	            for(var i=0; i<checkCnt; i++) {
	               console.log("확인용 관심상품코드 : " + like_code_Arr[i] );
	            /*
	                    확인용 제품번호: 3, 주문량: 3, 장바구니번호 : 14, 주문금액: 30000, 포인트: 15
	                    확인용 제품번호: 56, 주문량: 2, 장바구니번호: 13, 주문금액: 2000000, 포인트 : 120 
	                    확인용 제품번호: 59, 주문량: 3, 장바구니번호: 11, 주문금액: 30000, 포인트 : 300    
	            */
	            }// end of for---------------------------
	            
	            var like_codejoin = like_code_Arr.join();
               
	               var bool = confirm("선택한 상품들을 관심상품 목록에서 삭제하시겠습니까?");
	               
	               if(bool) {
	               
	                  $.ajax({
	  		            url:"<%= request.getContextPath()%>/seongmin/member/likeListDel2.sue",
	                     type:"POST",
	                     data:{"like_codejoin":like_codejoin},
	                     dataType:"JSON",     
	                     success:function(json){
	                    	 alert(json.n);
	                        if(json.n == 1) {
	                        	alert("하하");
	                           location.href="interestPrd.sue";                     
	                        }
	                        else {
	                           location.href="<%= request.getContextPath()%>/shop/orderError.up";
	                        }
	                     },
	                     error: function(request, status, error){
	                        alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
	                     }
	                  });
	                  
	               }
	            }   
			   
			   
		   }// end of function selectCartList()----------------------
 --%>		   
		   
		   
</script>


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
		<div class="row" style="width:90%;">
			<div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;" onclick="goDelete()">선택 삭제</button>
		</div>
	
			<div class="col-2" style="border:none; margin-left:20px; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;"></button>
			</div>
	
			<div class="col-2" style="border:none; margin-left:280px; display: flex; align-items: center; justify-content: center;">
			</div>
	
			<div class="col-2" style="border:solid 1px gray; margin-left:20px; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:12pt; color:gray; text-align:center;" onclick="selectCartList()">장바구니 담기</button>
			</div>
	
		</div>
		<br>		
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
				<th scope="col"><input type="checkbox" id="allCheckOrNone" onClick="allCheckBox();" /></th>
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
						<c:forEach var="pvo" items="${requestScope.likeList1}" varStatus="status">
						  <tr>
						 	<td class="tbl_td"><input type="checkbox" name = "like_code" class="chkboxprod_code" id="" value="${pvo.lvo.like_code}"/></td>
					 		<td class="tbl_td"><a href=# ><img id="likeimg" src="<%=request.getContextPath() %>/images/product/${pvo.prod_image}"></a></td>
					 		<td class="tbl_td" style="text-align:left">
					 			<a name="prd_name${status.index}" class = "prod_name" href="/product/detail.html?product_no=3833&amp;cate_no=28" value="${pvo.prod_name}">${pvo.prod_name}</a><br><br>
					 			색상 : <span>${pvo.pdvo.prod_color}</span>&nbsp;&nbsp; 사이즈 : [<span>${pvo.pdvo.prod_size}</span>mm]
					 		</td>
					 		<td name="prd_price${status.index}" class="tbl_td testzz" value="${pvo.prod_price}"><fmt:formatNumber value="${pvo.prod_price}" pattern="#,###"/>원</td>
					 		<td class="tbl_td"><img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;"><fmt:formatNumber value="${pvo.prod_point}" pattern="#,###"/>원</td>
					 		<td class="tbl_td" name="prd_saleprice${status.index}" value="${pvo.prod_price}"><fmt:formatNumber value="${pvo.prod_saleprice}" pattern="#,###"/>원</td>
					 		<td class="tbl_td">
						 		<div class="">
						 		  <%-- <button type="button" class="btn btn-gray btn_order" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;" value="${status.index}">주문하기</button> --%>
						 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;"  onclick="goCart()">장바구니<br>담기</button>
						 		  <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;" onclick="goDel()">삭제</button>
								</div>				
                              	<input type="hidden" class="like_code" value="${pvo.lvo.like_code}" /> 
                              	<input type="hidden" class="prod_name" value="${pvo.prod_name}" /> 
                              	<input type="hidden" class="fk_prod_code" value="${pvo.prod_code}" /> 
                              	<input type="hidden" class="fk_prod_size" value="${pvo.pdvo.prod_size}" /> 
                              	<input type="hidden" class="fk_prod_color" value="${pvo.pdvo.prod_color}" /> 
                              	
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

	      
	      

		
		<br><br>


 	</div>
	   



	   
	   </div>
     </div>
     <jsp:include page="../hyerin/footer.jsp"></jsp:include>	
     

	
  </body>
</html>