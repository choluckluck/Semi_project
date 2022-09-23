<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% 
 	String ctxPath = request.getContextPath(); 
 %>
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

		// //클릭시 보이게 한다
		$("button#header_search_btn").click(function(){
			const input_text = $("input#header_search").val().trim();
			if(input_text == ""){ //header_search의 input값이 비어있을때, 즉 문서 로딩시 검색버튼을 클릭을 했을 때
				$("input#header_search").toggle();
			}
			else if (input_text != ""){ //header_search에 값을 입력했을 때, 즉 검색 값을 입력했을 때
				// input#header_search 값을 submit한다
			}
		});//end of $("button#header_search_btn").click

		
		//네비게이션 서브바를 처음엔 숨김
		$("div.real_subbar").hide();

		//네비게이션 메인바에서 a태그 경계 마우스오버 이벤트
		$("ul#nav_bar_category").find("a").mouseenter(function(e){
			$("div.real_subbar").hide();

			const target = $(e.target);
			const index = target.parent().index();

			const sub_target = $("nav").find("div.real_subbar"+index);
			sub_target.show();

			//네비게이션바의 경계 마우스아웃 이벤트 => 네비게이션 서브바를 숨김
			$("nav").mouseleave(function(event){
				$("div.real_subbar").hide();
			});
		});//end of ("ul#nav_bar_category").find("a").mouseenter


	});//end of ready
	</script>
</head>
<body>
	<div id="header">
		<%-- login information --%>
		<div id="header_login_container" align="right" class="mt-3 pl-3 pr-3">
			<span><a class="mx-2" href="#" style="text-decoration:none; font-size:12px; color: gray;">로그인</a></span>
			<span><a class="mx-2" href="#" style="text-decoration:none; font-size:12px; color: gray;">회원가입</a></span>
			<span><a class="mx-2"href="#" style="text-decoration:none; font-size:12px; color: gray;">고객센터</a></span>
		</div>
		<%-- logo --%>
		<div class="container-fluid mb-4 pr-4" >
			<div class="text-center">
				<img src="<%= ctxPath%>/images/hyerin/logo.png" alt="Logo" href="#" style="width:15%;" class="logo">
			</div>
			<%-- 검색, 마이페이지, 장바구니 --%>
			<div id="header_search_container" align="right" >
				<%-- 검색 --%>
				<form name="header_search_form" style="display:inline-block; margin-right: 20px;">
					<span>
						<input type="text" id="header_search" name="header_search"/>
						<button type="button" id="header_search_btn" name="header_search_btn" style="border:none; background-color: transparent;">
							<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
						</button>
					</span>	
				</form>
				<%-- 마이페이지 --%>
				<a href="#" style="margin-right: 20px;"><img src="<%= ctxPath%>/images/hyerin/user_icon.png" width="25px" /></a>
				<%-- 장바구니 --%>
				<a href="#"><img src="<%= ctxPath%>/images/hyerin/cart.png" width="30px"/></a>
			</div>
		</div>
		<%-- 퀵뷰 --%>
		<div id="quickView" style="width:60px; height:230px; background-color:#172A41; position:fixed; bottom:50px; right:30px; z-index:100;">
			<div id="" type="button" style="text-align:center; margin-top:20px;">
			   <img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px">
			   <br>
			   <span style="font-size:10pt; color:#ff99bb;">11개</span>
			</div>
			<div  id="" type="button" style="text-align:center; margin-top:20px;">
			   <img src="<%= ctxPath%>/images/hyerin/timer.png" width="22px" class="" alt="..." style="">
			</div>
			<div  id="" type="button" style="text-align:center; margin-top:20px;">
			   <a href="#"><img src="<%= ctxPath%>/images/hyerin/up_arrow.png" width="15px" class="" alt="..." style=""></a>
			</div>
			<div  id="" type="button" style="text-align:center; margin-top:20px;">
			   <a href=""><img src="<%= ctxPath%>/images/hyerin/down_arrow.png" width="15px" class="" alt="..." style=""></a>
			</div>
		 </div>
	</div>
	
	<%-- nav bar --%>	
	<nav class="navbar nav_bar sticky-top container-fluid" style="padding:0px;">
		<ul id="nav_bar_category" class="w-100">
			<li class="ml-3 mr-4">
				<a id="main_best" href="#" class="">BEST</a>
			</li>
			<li class="mr-4">
				<a id="main_new" href="#" class="">NEW</a>
			</li>
			<li class="mr-4">
				<a id="main_event" href="#" class="">SALE</a>
			</li>
			<li class="mr-4">
				<span style="color:white;">|</span>
			</li>
			<li class="mr-4">
				<a id="main_flat" href = "#" class="main_bar">플랫/로퍼</a>
			</li>
			<li class="mr-4">
				<a id="main_hill" href = "#" class="main_bar">힐/펌프스</a>
				
			</li>
			<li class="mr-4">
				<a id="main_ankle" href = "#" class="main_bar">앵클/부츠</a>
				
			</li>
			<li class="mr-4">
				<a id="main_snk" href = "#" class="main_bar">스니커즈</a>
				 
			</li>
			<li class="mr-4">
				<a id="main_sling" href = "#" class="main_bar">슬링백/뮬</a>
				 
			</li>
			<li class="mr-4">
				<a id="main_sandle" href = "#" class="main_bar">샌들</a>
				
			</li>
		</ul>
		<div class="real_subbar real_subbar4 w-100">
			<span><a href="#">플랫</a></span>
			<span><a href="#">로퍼</a></span>
			<span><a href="#">블로퍼</a></span>
		</div>
		<div class="real_subbar real_subbar5 w-100">
			<span><a href="#">4~6cm</a></span>
			<span><a href="#">7cm</a></span>
		</div>
		<div class="real_subbar real_subbar6 w-100">
			<span><a href="#">앵클1~6cm</a></span>
			<span><a href="#">앵클1~6cm</a></span>
			<span><a href="#">롱부츠</a></span>
		</div>
		<div class="real_subbar real_subbar7 w-100">
			<span><a href="#">캔버스</a></span>
			<span><a href="#">골프화</a></span>
			<span><a href="#">어글리 스니커즈</a></span>
			<span><a href="#">스니커즈</a></span>
		</div>
		<div class="real_subbar real_subbar8 w-100">
			<span><a href="#">슬링백 1cm~3cm</a></span>
			<span><a href="#">슬링백 4cm~</a></span>
			<span><a href="#">뮬 1cm~3cm</a></span>
			<span><a href="#">뮬 4cm~</a></span>
		</div>
		<div class="real_subbar real_subbar9 w-100">
			<span><a href="#">플랫샌들</a></span>
			<span><a href="#">힐샌들</a></span>
			<span><a href="#">뮬 1cm~3cm</a></span>
			<span><a href="#">슬리퍼</a></span>
		</div>
	</nav> 
	<%-- 헤더~네비바 끝 --%>