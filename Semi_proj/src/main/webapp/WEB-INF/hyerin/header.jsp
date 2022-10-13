<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	String ctxPath = request.getContextPath(); 
 %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>우리꺼~~</title>
	
	<%-- Bootstrap CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 
	
	<%-- Font Awesome 5 Icons --%>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
	
	<%-- 직접 만든 CSS --%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hyerin_style.css" />
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/main_style.css" />
	
	<%-- Optional JavaScript --%>
	<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 
	
	<%-- jQueryUI CSS--%>
	<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
	<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>
	
	<script>
	$(document).ready(function(){
		//header_search 입력박스는 처음에 안보이게 한다
		$("input#header_search").hide();
		
		$("input#header_search").keyup((e)=>{
			if(e.keyCode==13){
				productSearch();
			}
		});
		
		// 
		$("button#header_search_btn").click(function(){
			const input_text = $("input#header_search").val().trim();
			if(input_text == ""){ //header_search의 input값이 비어있을때, 즉 문서 로딩시 검색버튼을 클릭을 했을 때
				$("input#header_search").toggle();
			}
			else if (input_text != ""){ //header_search에 값을 입력했을 때, 즉 검색 값을 입력했을 때
				productSearch();
			}
		});//end of $("button#header_search_btn").click

		
		//네비게이션 서브바를 처음엔 숨김
		$("div.real_subbar, div.real_subbar_right").hide();

		//네비게이션 메인바에서 a태그 경계 마우스오버 이벤트
		$("ul#nav_bar_category").find("a").mouseenter(function(e){
			$("div.real_subbar, div.real_subbar_right").hide();

			const target = $(e.target);
			const index = target.parent().index();

			const sub_target = $("nav").find("div.real_subbar"+index);
			sub_target.show();

			//네비게이션바의 경계 마우스아웃 이벤트 => 네비게이션 서브바를 숨김
			$("nav").mouseleave(function(event){
				$("div.real_subbar, div.real_subbar_right").hide();
			});
		});//end of ("ul#nav_bar_category").find("a").mouseenter
		
		
		
		
		///////////////////////////////////////////////////////////////////////////
		//헤더이미지(전체) 클릭이벤트
		$("#header_logo_container").click(function(){
			location.href="<%= ctxPath%>/main.sue";
		});
		
		///////////////////////////////////////////////////////////////////////////

		//스크롤 상단으로 이동		
	
		  $('#go-top').click(function (e) {
			 // $('html, body').animate({scrollTop:0}, '1000'); //부드럽게 이동하려면
			  $('html, body').scrollTop( 0);
			
		  });
		  
		//스크롤 하단으로 이동	  
	  $("#go-bottom").click(function(){
			$('html, body').scrollTop( $(document).height() );
		});
		  
	});//end of ready
	
	
	/////////////////////////////////////////////////////////////////
	function productSearch(){
		const search_frm = document.header_search_form;
		search_frm.action="hyerin.sue";
		search_frm.header_search.val = $("input#header_search").val(); //input 값을 같이 넘겨주기
		search_frm.submit();
	};
	
	function goSubmitProdict() {
		
		const Product_frm = document.SelectProduct
		Product_frm.action="<%= ctxPath%>/jihee/product/productHp.sue";
		Product_frm.submit();
		
	}
	
	function functi(html){
		alert(html);
	}

	</script>
</head>
<body>
	<div id="header" style="margin:0;">

	<%@ include file="/WEB-INF/hyerin/index2.jsp" %>		
		
		<%-- header logo --%>
		<div id="header_logo_container" class="container-fluid pr-4" style="height: 120px; width:70%; cursor:pointer;">
			<div class="text-center" style="height:120px;">
				<img src="<%= ctxPath%>/images/jihee/슈샵2.png" alt="Logo" style="width:17%; position:relative; top:20px;" class="logo">
			</div>
		</div>
		<%-- 검색, 마이페이지, 장바구니 --%>
		<span style="float: right; position:relative; bottom: 100px; right: 20px;"> 
			<%-- 검색 --%>
			<form name="header_search_form" style="display:inline-block; margin-right: 20px;" class="header_search_contents">
					<input type="text" id="header_search" name="prod_name"/>
					<a id="a_header_search_btn" href="#">
						<button type="button" id="header_search_btn" name="header_search_btn" style="border:none; background-color: transparent;">
							<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
						</button>
					</a>
			</form>
	<%@ include file="/WEB-INF/hyerin/mypage.jsp" %>		



		</span> 
		
		<%-- 퀵뷰 --%>
		 <c:if test="${sessionScope.loginuser != null}">
		<div id="quickView" style="width:60px; height:190px; background-color:#172A41; position:fixed; bottom:50px; right:30px; z-index:100;">
			<div id="" style="text-align:center; margin-top:20px;">
			   <a href="<%=ctxPath%>/seongmin/member/interestPrd.sue"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px"></a>
			   <br>
			   <span style="font-size:10pt; color:#ff99bb;">${requestScope.QlikeProdCount}개</span>
			</div>
			<div type="button" style="text-align:center; margin-top:20px;" id="go-top">
			    <img src="<%= ctxPath%>/images/hyerin/up_arrow.png" width="15px" class="" alt="..." style="">
			</div>
			<div  id="go-bottom" type="button" style="text-align:center; margin-top:20px;">
			   <img src="<%= ctxPath%>/images/hyerin/down_arrow.png" width="15px" class="" alt="..." style="">
			</div>
		 </div>
		 </c:if>
	</div>
	
	<%-- nav bar --%>	
	
		<nav class="navbar nav_bar sticky-top container-fluid" style="padding:0px;">
			<ul id="nav_bar_category" class="w-100">
				<li class="ml-3 mr-4">
					<a id="main_best" href="<%=ctxPath%>/jihee/product/productBest.sue" class="">BEST</a>
				</li>
				<li class="mr-4">
					<a id="main_new" href="<%=ctxPath%>/jihee/product/productNew.sue" class="">NEW</a>
				</li>
				<li class="mr-4">
					<a id="main_event" href="<%=ctxPath%>/jihee/product/productSale.sue" class="">SALE</a>
				</li>
				<li class="mr-4">
					<span style="color:white;">|</span>
				</li>
				<li class="mr-4">
					<a id="main_flat" href = "<%=ctxPath%>/jihee/product/productFLB.sue" class="main_bar" >플랫/로퍼</a>
				</li>
				<li class="mr-4">
				
					<a id="main_hill" href = "<%=ctxPath%>/jihee/product/productHp.sue" class="main_bar" >힐/펌프스</a>
					                                                       
				</li>
				<li class="mr-4">
					<a id="main_ankle" href = "<%=ctxPath%>/jihee/product/productAb.sue" class="main_bar">앵클/부츠</a>
					
				</li>
				<li class="mr-4">
					<a id="main_snk" href = "<%=ctxPath%>/jihee/product/productSn.sue" class="main_bar">스니커즈</a>
					 
				</li>
				<li class="mr-4">
					<a id="main_sling" href = "<%=ctxPath%>/jihee/product/productSm.sue" class="main_bar">슬링백/뮬</a>
				</li>
				<li style="float:right; position: relative; right: 20px;">
					<a id="main_community" href = "<%=ctxPath%>/heajun/community/notice.sue" class="main_bar">커뮤니티</a>
				</li>
				<c:if test="${sessionScope.loginuser != null and sessionScope.loginuser.userid eq 'admin'}">
					<li style="float:right; position: relative; right: 40px;">
						<a id="main_admin" href="<%=ctxPath%>/hyerin/admin/adminProductList.sue" class="main_bar">관리자</a>
					</li>
				</c:if>
				<%--
				<li class="mr-4">
					<a id="main_sandle" href = "<%=ctxPath%> class="main_bar">샌들</a>
					
				</li>
				 --%>
			</ul>
			<div class="real_subbar real_subbar4 w-100">
				<span><a href="<%=ctxPath%>/jihee/product/productFlat.sue">플랫</a></span>
				<span><a href="<%=ctxPath%>/jihee/product/productLoafer.sue">로퍼</a></span>
				<span><a href="<%=ctxPath%>/jihee/product/productBloafer.sue">블로퍼</a></span>
			</div>
			<div class="real_subbar real_subbar5 w-100">
				<span><a href="<%=ctxPath%>/jihee/product/productHp4cm.sue">4~6cm</a></span>
				<span><a href="<%=ctxPath%>/jihee/product/productHp7cm.sue">7cm</a></span>
			</div>
			<div class="real_subbar real_subbar6 w-100">
				<span><a href="<%=ctxPath%>/jihee/product/productAnkle4cm.sue">앵클1~6cm</a></span>
				<span><a href="<%=ctxPath%>/jihee/product/productAnkle7cm.sue">앵클1~6cm</a></span>
				<span><a href="<%=ctxPath%>/jihee/product/productBoots.sue">롱부츠</a></span>
			</div>
			<div class="real_subbar real_subbar7 w-100">
			</div>
			<div class="real_subbar real_subbar8 w-100">
				<span><a href="<%=ctxPath%>/jihee/product/productSlingback.sue">슬링백 1cm~4cm</a></span>
				<span><a href="<%=ctxPath%>/jihee/product/productMule.sue">뮬 4cm~</a></span>
			</div>
			<div class="real_subbar real_subbar9 w-100">
				<span><a href="<%=ctxPath%>/heajun/community/notice.sue">공지사항</a></span>
			</div>
			<%--
			<div class="real_subbar real_subbar9 w-100">
				<span><a href="#">플랫샌들</a></span>
				<span><a href="#">힐샌들</a></span>
				<span><a href="#">뮬 1cm~3cm</a></span>
				<span><a href="#">슬리퍼</a></span>
			</div>
			 --%>
		</nav> 
	
	<%-- 헤더~네비바 끝 --%>