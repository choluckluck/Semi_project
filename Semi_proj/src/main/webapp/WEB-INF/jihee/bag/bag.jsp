<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    String ctxPath = request.getContextPath();
    //     /MyMVC
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<!-- Optional JavaScript -->
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<!-- jQueryUI CSS-->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<!-- Font Awesome 5 Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">



<style type="text/css">

   thead#notice_thead{
      border: none; 
   }
   
   th[name='notice_th']{
      font-weight: normal;
   }
   
   ul {
   	list-style:none
   }
   
   a:link {
	  color : black;
	}

	a:hover {
	  color : black;
	}
	a:active {
	  color : green
	}
	
		
</style>

<script>
   $(document).ready(function(){
      //선택상품 주문 클릭시
      $("button#orderSelect").click(function(){
         const frm = document.bag_form;
         frm.action="<%= ctxPath%>/product/productNew.sue";
         frm.method = "get";
         frm.submit();
      });
      
      
    //전체상품 주문 클릭시
      $("button#orderAll").click(function(){
         const frm = document.bag_form;
         frm.action="<%= ctxPath%>/product/productNew.sue";
         frm.method = "get";
         frm.submit();
      });
   
      $("li[name='shname']").click(function(){
    	  
          const frm = document.bag_form;
          frm.action="<%= ctxPath%>/product/productNew.sue";
          frm.method = "get";
          frm.submit();
       });
      
     
      
      $("a#detail").click(e => {
    	alert("하하하");  
      })
    
    // 주문하기 클릭시
      $("button#doOrder").click(function(){
         const frm = document.bag_form;
         frm.action="<%= ctxPath%>/product/productNew.sue";
         frm.method = "get";
         frm.submit();
      });
      

      
      //공지사항 클릭 이벤트
      $("div#notice_text").click(function(){
         location.href="<%= ctxPath%>/community/notice.sue";
      });
      
      
      // 타이틀 => 게시글 클릭이벤트
      $("tbody > tr > td:nth-child(2)").click(function(){
         
      });
      
   });//$(document).ready(function(){})-------
   
   //관심상품에 담고 장바구니에서는 없애주기 
   function goHide() {
	   alert("확인용");
   	};
   	
  //관심상품에 담고 장바구니에서는 없애주기 
    function goDelete() {
 	   alert("선택하신상품을 삭제하시겠습니까?");
    	};
   	
  	//상세페이지로 이동
    function goDetail() {
  	  alert("확인용");
  	  
    }
   	
</script>

</head>
<body>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
	
	


 
   <div id="container2" style="margin-left: 5%;">
   	<p style="font-size: 30px; margin-top: 5%;" >장바구니</p>
      <div >      
         <div id="contents" class="col-lg-11">
            <form name="bag_form">
               <div class="fst-normal" style="text-align: left; font-size: 20px;">JINNY KIM</div>   
               <table id="notice_list" class="table table-condensed mt-4" style="font-size:15px; border-collapse: collapse; vertical-align: middle;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
                  <thead id="notice_thead">
                     <tr>
                        <th name="bag_th" class="w-10" style="border-top:solid 1px black; border-bottom:solid 1px black;">전체선택</th>
                        
                        <th name="bag_th" class="w-30" style="text-align:center; border-top:solid 1px black; border-bottom:solid 1px black;">상품정보</th>
                        <th name="bag_th" class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">수량</th>
                        <th name="bag_th" class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">적립금</th>
                        <th name="bag_th"class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">배송비</th>
                        <th name="bag_th"class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">합계</th>
                        <th name="bag_th"class="w-20" style="border-top:solid 1px black; border-bottom:solid 1px black;">선택</th>

                     </tr>
                  </thead>
                  <tbody id="notice_tbody">
                     <tr style="vertical-align:middle; height : 150px;">
                        <td style="border:none;"> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" style="margin-left: 1%"></td>
                        <td style="border:none;">
                         <div class="row">
                         	<div class="col-lg-2">
                       	 	<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" style="margin-left: 10%;">
                       	 	</div >
                       	 	<div class="col-lg-10">
                       	 	<ul style="float: left;">
                       	 		<li name ="shname" id="shname"  style="cursor: pointer">신발이름(코딩)</li>
                       	 		<li style="color:gray; margin-top: 2%;">[옵션(코딩): BLACK/245]</li>
                       	 		<li>
                       	 	
                       	 		<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal"  style="padding: 1%px; margin-top: 2%; border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
									옵션변경
									</button>
								</li>
							</ul>		
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header" style="background-color: navy;">
									        <h6 class="modal-title" id="exampleModalLabel" style="color: white;">옵션변경</h6>
									        <button type="button" class="btn-close-outline-light" data-bs-dismiss="modal" aria-label="Close" ></button>
									      </div>
									      <div class="modal-body">
									    	<ul>
									    		<li class="fw-bolder">코딩</li>
									    		<li>코딩</li>
									    	</ul>
									    	
									    	<hr style=" background: black; height: 1px; background: black; border : 0px;">
									    	<ul>
									    		<li class="fw-bolder">상품옵션</li>
									    		
									    		<li style="margin-top: 1%;"> 
									    		<div class="row">
									    		<p class="col-md-2 fst-normal"> COLOR</p> 
										    		<select class="form-select form-select-sm col-md-9" aria-label=".form-select-sm example">
													  <option selected>Open this select menu</option>
													  <option value="1">One</option>
													  <option value="2">Two</option>
													  <option value="3">Three</option>
													</select>
												</div>	
									    		</li>
									    		
									    		<li style="margin-top: 1%;"> 
									    		<div class="row">
									    		<p class="col-md-2 fst-normal"> SIZE</p> 
										    		<select class="form-select form-select-sm col-md-9" aria-label=".form-select-sm example">
													  <option selected>Open this select menu</option>
													  <option value="1">One</option>
													  <option value="2">Two</option>
													  <option vlue="3">Three</option>
													</select>
												</div>	
									    		</li>									   
									    	</ul>	
									      <div>		    	
									    </div>      
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									        <button type="button" class="btn btn-primary">Save changes</button>
									      </div>
									    </div>
									  </div>
									</div>
								    <!-- Modal 끝 -->                     	 
                       	 	</div>
                       	 
                       	 </div>
                        
                        </td>
                        <td style="border:none;">
                        <div class="row">
                        	<button type="button" class="col-lg-1" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
                           	-
                           	</button>
                           	<input type="text" class="col-lg-2" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt; padding: 0px;" name="quantity" id="quantity"/>
                           	 
                           
                           	<button type="button" class="col-lg-1" onclick="location.href='.jsp'" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
                           	+
                           	</button>
                        </div>   	
                        </td>
                        <td style="border:none;">
                        <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원
                        </td>
                        <td style="border:none;">배송비 코딩</td>
                        <td style="border:none;">합계 코딩</td>
                        <td style="border:none;">
	                     <div>
			 		 		<button type="button" id="doOrder" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
			 		 	 </div>	
			 		 	 <div>
			 		 		 <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;" onclick="goHide()">관심상품</button>
			 		 	 </div>	
			 		 	 <div>	
			 		 		 <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;" onclick="goDelete()">삭제</button>
						 </div>
                        </td>
                     </tr>
                     
                     
                     
                     <tr>
                        <td style="border:none;"> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" style="margin-left: 1%"></td>
                        <td style="border:none;">
                         <div class="row">
                         	<div class="col-lg-2">
                       	 	<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" style="margin-left: 10%;">
                       	 	</div >
                       	 	<div class="col-lg-10">
                       	 	<ul style="float: left;">
                       	 		<li><a>신발이름(코딩)</a></li>
                       	 		<li style="color:gray; margin-top: 2%;">[옵션(코딩): BLACK/245]</li>
                       	 		<li>
                       	 	
                       	 		<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal"  style="padding: 1%px; margin-top: 2%; border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
									옵션변경
									</button>
								</li>
							</ul>		
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header" style="background-color: navy;">
									        <h6 class="modal-title" id="exampleModalLabel" style="color: white;">옵션변경</h6>
									        <button type="button" class="btn-close-outline-light" data-bs-dismiss="modal" aria-label="Close" ></button>
									      </div>
									      <div class="modal-body">
									    	<ul>
									    		<li class="fw-bolder">코딩</li>
									    		<li>코딩</li>
									    	</ul>
									    	
									    	<hr style=" background: black; height: 1px; background: black; border : 0px;">
									    	<ul>
									    		<li class="fw-bolder">상품옵션</li>
									    		
									    		<li style="margin-top: 1%;"> 
									    		<div class="row">
									    		<p class="col-md-2 fst-normal"> COLOR</p> 
										    		<select class="form-select form-select-sm col-md-9" aria-label=".form-select-sm example">
													  <option selected>Open this select menu</option>
													  <option value="1">One</option>
													  <option value="2">Two</option>
													  <option value="3">Three</option>
													</select>
												</div>	
									    		</li>
									    		
									    		<li style="margin-top: 1%;"> 
									    		<div class="row">
									    		<p class="col-md-2 fst-normal"> SIZE</p> 
										    		<select class="form-select form-select-sm col-md-9" aria-label=".form-select-sm example">
													  <option selected>Open this select menu</option>
													  <option value="1">One</option>
													  <option value="2">Two</option>
													  <option value="3">Three</option>
													</select>
												</div>	
									    		</li>									   
									    	</ul>	
									      <div>		    	
									    </div>      
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									        <button type="button" class="btn btn-primary">Save changes</button>
									      </div>
									    </div>
									  </div>
									</div>
								    <!-- Modal 끝 -->                     	 
                       	 	</div>
                       	 
                       	 </div>
                        
                        </td>
                        <td style="border:none;">
                        <div class="row">
                        	<button type="button" class="col-lg-1" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
                           	-
                           	</button>
                           	<input type="text" class="col-lg-2" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt; padding: 0px;" name="quantity" id="quantity"/>
                            
                           	 
                           
                           	<button type="button" class="col-lg-1" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
                           	+
                           	</button>
                        </div>   	
                        </td>
                        <td style="border:none;">
                        <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원
                        </td>
                        <td style="border:none;">배송비 코딩</td>
                        <td style="border:none;">합계 코딩</td>
                        <td style="border:none;">
	                     <div>
			 		 		<button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
			 		 	 </div>	
			 		 	 <div>
			 		 		 <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">관심상품</button>
			 		 	 </div>	
			 		 	 <div>	
			 		 		 <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
						 </div>
                        </td>
                     </tr>
                     
                     <tr >
                        <td style="border:none;"> <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" style="margin-left: 1%"></td>
                        <td style="border:none;">
                         <div class="row">
                         	<div class="col-lg-2">
                       	 	<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" style="margin-left: 10%;">
                       	 	</div >
                       	 	<div class="col-lg-10">
                       	 	<ul style="float: left;">
                       	 		<li><a href="link">신발이름(코딩)</a></li>
                       	 		<li style="color:gray; margin-top: 2%;">[옵션(코딩): BLACK/245]</li>
                       	 		<li>
                       	 	
                       	 		<!-- Button trigger modal -->
									<button type="button" class="btn btn-outline-secondary btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModal"  style="padding: 1%px; margin-top: 2%; border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
									옵션변경
									</button>
								</li>
							</ul>		
									<!-- Modal -->
									<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
									  <div class="modal-dialog">
									    <div class="modal-content">
									      <div class="modal-header" style="background-color: navy;">
									        <h6 class="modal-title" id="exampleModalLabel" style="color: white;">옵션변경</h6>
									        <button type="button" class="btn-close-outline-light" data-bs-dismiss="modal" aria-label="Close" ></button>
									      </div>
									      <div class="modal-body">
									    	<ul>
									    		<li class="fw-bolder">코딩</li>
									    		<li>코딩</li>
									    	</ul>
									    	
									    	<hr style=" background: black; height: 1px; background: black; border : 0px;">
									    	<ul>
									    		<li class="fw-bolder">상품옵션</li>
									    		
									    		<li style="margin-top: 1%;"> 
									    		<div class="row">
									    		<p class="col-md-2 fst-normal"> COLOR</p> 
										    		<select class="form-select form-select-sm col-md-9" aria-label=".form-select-sm example">
													  <option selected>Open this select menu</option>
													  <option value="1">One</option>
													  <option value="2">Two</option>
													  <option value="3">Three</option>
													</select>
												</div>	
									    		</li>
									    		
									    		<li style="margin-top: 1%;"> 
									    		<div class="row">
									    		<p class="col-md-2 fst-normal"> SIZE</p> 
										    		<select class="form-select form-select-sm col-md-9" aria-label=".form-select-sm example">
													  <option selected>Open this select menu</option>
													  <option value="1">One</option>
													  <option value="2">Two</option>
													  <option value="3">Three</option>
													</select>
												</div>	
									    		</li>									   
									    	</ul>	
									      <div>		    	
									    </div>      
									      </div>
									      <div class="modal-footer">
									        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
									        <button type="button" class="btn btn-primary">Save changes</button>
									      </div>
									    </div>
									  </div>
									</div>
								    <!-- Modal 끝 -->                     	 
                       	 	</div>
                       	 
                       	 </div>
                        
                        </td>
                        <td style="border:none;">
                        <div class="row">
                        	<button type="button" class="col-lg-1" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
                           	-
                           	</button>
                           	<input type="text" class="col-lg-2" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt; padding: 0px;" name="quantity" id="quantity"/>
                           	 
                           
                           	<button type="button" class="col-lg-1" style="border:solid 1px gray; background-color:white; color:gray; margin:20px 0px; text-align:center; font-size:11pt">
                           	+
                           	</button>
                        </div>   	
                        </td>
                        <td style="border:none;">
                        <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif" alt="적립금" style="margin-bottom:2px;">600원
                        </td>
                        <td style="border:none; text-align: center;">배송비 코딩</td>
                        <td style="border:none;">합계 코딩</td>
                        <td style="border:none;">
	                     <div>
			 		 		<button type="button" class="btn btn-gray" style="background-color:gray; color:white; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">주문하기</button>
			 		 	 </div>	
			 		 	 <div>
			 		 		 <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">관심상품</button>
			 		 	 </div>	
			 		 	 <div>	
			 		 		 <button type="button" class="btn btn-gray" style="border:solid 1px gray; color:gray; margin-bottom:2px; font-size:11pt; width:90px; text-align:center;">삭제</button>
						 </div>
                        </td>
                     </tr>
                     
                     <tr style="vertical-align: baseline;" >
                      	<td colspan="6" style="text-align: right;"> 상품 (코딩) + 배송비 (코딩) = </td>
                      	<td class="fw-bolder" style="font-size: 20px;"> 총금액 코딩</td>
                     </tr> 
                  </tbody>
               </table>
               
            </form>
            
            <div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
			<button class="btn btn-lg" style="font-size:10pt; color:gray; text-align:center;">선택상품 삭제</button>
			</div>
			
			
         
            
         </div>
      </div>
      
      <hr class="col-lg-11" style="margin-top: 5%; margin-bottom: 3%">
      
      <div class="row" style="text-align: center; font-size: 10pt">
       <p class="col-3"></p>
       <p class="col-1">총 상품금액</p>
       <p class="col-1"></p>
       <p class="col-1">총 배송금액</p>
       <p class="col-1"></p>
       <p class="col-2">결재예정금액</p> 
       <p class="col-3"></p>   
      </div>
      
      <div class="row" style="text-align: center; font-size: 15pt">
      <p class="col-3"></p>
       <p class="col-1 fw-bolder">금액코딩</p>
       <p class="col-1">+</p>
       <p class="col-1 fw-bolder">금액코딩</p>
       <p class="col-1">=</p> 
       <p class="col-2 fw-bolder">금액코딩</p>    
       <p class="col-3"></p> 
      </div>
	  
	  <hr class="col-lg-11"style="margin-top: 3%; margin-bottom: 5%">
	  
      <div class="row" style="flex: center;">
      		
     	 <div class="col-lg-1"></div>
     	  <div class="col-lg-2"></div>
	      <div class="col-lg-3" style="border:solid 1px black; display: flex; align-items: center; justify-content: center; margin-right: 10px;">
		  <button class="btn btn-lg" id="orderSelect" style="font-size:15pt; color:black; text-align:center; ">선택상품 주문</button>
		  </div>
				
		    <div class="col-lg-3" style="border:solid 1px #000033; display: flex; align-items: center; justify-content: center; background-color: #000033;">
		  <button class="btn btn-lg" id="orderAll" style="font-size:15pt; color:white; text-align:center;">전체상품 주문</button>
		  </div>
		  <div class="col-lg-2"></div>
		   <div class="col-lg-1"></div> 
      </div>
      
      <div>
      <p class="fw-bolder" style="font-size: 20pt; padding-left: 5%; padding-top: 5%">For you</p>
      </div>
      
	<!-- 캐러셀 시작 -->
	
	<div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-touch="false" data-bs-interval="false">
	 
	  <div class="carousel-inner">
	    <div class="carousel-item active" data-bs-interval="10000">
	       
	       <!-- 이미지부분 카드 시작 -->
	        <div class="row">
			<div class="col-lg-2"></div>
		     <div class="col-lg-2" id="bottomSideinfo1">
		  		<div class="card" >
		  			<a href="#"><img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="..."></a>
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>	    				
		  				</div>
				</div>
		     	</div>
		    
		
		       <div class="col-lg-2" id="bottomSideinfo2">
		  		<div class="card">
		  			<a href="#"><img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="..."></a>
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		  				</div>
				</div>
		     	</div>
		     	
		     
		      <div class="col-lg-2" id="bottomSideinfo3">
		  		<div class="card" >
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		  				</div>
				</div>
		     	</div>
		          
		      <div class="col-lg-2" id="bottomSideinfo4">
		  		<div class="card">
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		  				</div>
				</div>
		     </div>
		     <div class="col-lg-2"></div>
		  	</div>
		  	<!-- 이미지부분 카드 끝-->
	      <div class="carousel-caption d-none d-md-block">
	      </div>
	    </div>
	    
	    
	    <div class="carousel-item" data-bs-interval="2000">
	      	       <!-- 이미지부분 카드 시작 -->
	        <div class="row">
			<div class="col-lg-2"></div>
		     <div class="col-lg-2" id="bottomSideinfo1">
		  		<div class="card" >
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="..."> 
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		    				
		  				</div>
				</div>
		     </div>
		  	
		
		      <div class="col-lg-2" id="bottomSideinfo2">
		  		<div class="card">
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		  				</div>
				</div>
		     	</div>
		     
		      <div class="col-lg-2" id="bottomSideinfo3">
		  		<div class="card" >
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    			
		  				</div>
				</div>
		     	</div>
		          
		      <div class="col-lg-2" id="bottomSideinfo4">
		  		<div class="card">
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    			
		  				</div>
				</div>
		     </div>
		     <div class="col-lg-2"></div>
		  	</div>
		  	<!-- 이미지부분 카드 끝-->
	      <div class="carousel-caption d-none d-md-block">     
	      </div>
	    </div>
	    
	    <!-- 다음캐러셀 -->
	    <div class="carousel-item">
	      	       <!-- 이미지부분 카드 시작 -->
	        <div class="row">
			<div class="col-lg-2"></div>
		     <div class="col-lg-2" id="bottomSideinfo1">
		  		<div class="card" >
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		  				</div>
				</div>
		     </div>
		  	
		
		      <div class="col-lg-2" id="bottomSideinfo2">
		  		<div class="card">
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    			
		  				</div>
				</div>
		     	</div>
		     
		      <div class="col-lg-2" id="bottomSideinfo3">
		  		<div class="card" >
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    				
		  				</div>
				</div>
		     	</div>
		          
		      <div class="col-lg-2" id="bottomSideinfo4">
		  		<div class="card">
		  			<img src="<%= ctxPath%>/images/jihee/card.png" class="card-img-top" alt="...">
		  				<div class="card-body">
		    				
		    				<p class="card-text">체니로퍼(3cm) <br> 62,800</p>
		    			
		  				</div>
				</div>
		     </div>
		     <div class="col-lg-2"></div>
		  	</div>
		  	<!-- 이미지부분 카드 끝-->
	      <div class="carousel-caption d-none d-md-block">

	      </div>
	    </div>
	  </div>
	  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Previous</span>
	  </button>
	  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="visually-hidden">Next</span>
	  </button>
	  
	  <!--  아래 버튼 
	   <div class="carousel-indicators">
	    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
	    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
	  </div>
	  -->
	  
	</div>
	
	
	
	
	
	
	
	
	      
   </div>
   
	

    
<div style="margin-top: 10%">
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
</div>  



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

</body>
</html>