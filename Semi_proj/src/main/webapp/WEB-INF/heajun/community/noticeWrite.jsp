<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

 <jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include> 

<script>
	$(document).ready(function(){
		
	
		//에디터1은 중복이므로 숨긴다 (삭제하면 기능을 못함)
		$("div#editor1").hide(); 
		
		//커뮤니티사이드바_공지사항 클릭 이벤트
		$("div#sidebar_notice").click(function(){
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		//커뮤니티사이드바_커뮤니티 클릭 이벤트
		$("div#sidebar_qna").click(function(){
			location.href="<%= ctxPath%>/heajun/community/qnalist.sue";
		});
		
		
		const frm = document.notice_contents_form;
		//목록버튼 클릭이벤트
		$("button#notice_list").click(function(){
			
			frm.reset();
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
			
		});
		
		//등록버튼 클릭이벤트 => 자기가 작성한 글 페이지로
		$("input#fk_userid").val("${requestScope.userid}");
		$("button#notice_submit").click(function(){
			
			
			var frm = document.registerFrm;
			frm.action = "<%=ctxPath%>heajun/community/noticeView.sue";
			frm.method = "post";
			frm.submit();
			
		});
		

		
		
		
		
		
		
		//취소버튼 클릭이벤트
		$("button#notice_reset").click(function(){
			frm.reset();
			location.href="<%= ctxPath%>/heajun/community/notice.sue";
		});
		
		
		
		
	});
	
</script>

<div class="row container-fluid mt-5">
	 <jsp:include page="/WEB-INF/heajun/community/communitySidebar.jsp" /> 
	<div id="contents" class="col-9 ml-5">
		<form id="notice_contents_form" name="notice_contents_form">
			<div style="font-weight:bold;">NOTICE</div>	
			<table id="notice_write" class="table table-condensed mt-4" style="font-size:10pt;">
				<tr>
					<td class="col-1 align-middle">제목</td>
					<td class="col-11"><input name="subject" type="text" class="form-control" placeholder="제목을 입력하세요"/></td>
					
				</tr>
				<tr>
					<td colspan="2" class="clear">
		            <!-- CSS -->
		            <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/3.2.2/css/froala_editor.pkgd.min.css?vs=2209081131">
		            <link rel="stylesheet" href="//img.echosting.cafe24.com/editors/froala/css/themes/ec_froala.css?vs=2209081131">
		
		            <!-- HTML -->
		            <div id="editor1" class="fr-box fr-ltr ec-froala-theme fr-basic fr-top" role="application"><div class="fr-toolbar ec-froala-theme fr-ltr fr-desktop fr-top fr-basic"><div class="fr-btn-grp fr-float-left"><button id="paragraphFormat-1" type="button" tabindex="-1" role="button" aria-controls="dropdown-menu-paragraphFormat-1" aria-expanded="false" aria-haspopup="true" class="fr-command fr-btn fr-dropdown fr-selection" data-cmd="paragraphFormat" data-title="문단"><span style="width:80px">표준</span></button><div id="dropdown-menu-paragraphFormat-1" class="fr-dropdown-menu" role="listbox" aria-labelledby="paragraphFormat-1" aria-hidden="true"><div class="fr-dropdown-wrapper" role="presentation"><div class="fr-dropdown-content" role="presentation"><ul class="fr-dropdown-list" role="presentation"><li role="presentation"><p style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="paragraphFormat" data-param1="N" title="표준">표준</a></p></li><li role="presentation"><h1 style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="paragraphFormat" data-param1="H1" title="제목 1">제목 1</a></h1></li><li role="presentation"><h2 style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="paragraphFormat" data-param1="H2" title="제목 2">제목 2</a></h2></li><li role="presentation"><h3 style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="paragraphFormat" data-param1="H3" title="제목 3">제목 3</a></h3></li><li role="presentation"><h4 style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="paragraphFormat" data-param1="H4" title="제목 4">제목 4</a></h4></li><li role="presentation"><pre style="padding: 0 !important; margin: 0 !important;" role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="paragraphFormat" data-param1="PRE" title="코드">코드</a></pre></li></ul></div></div></div><button id="fontFamily-1" type="button" tabindex="-1" role="button" aria-controls="dropdown-menu-fontFamily-1" aria-expanded="false" aria-haspopup="true" class="fr-command fr-btn fr-dropdown fr-selection" data-cmd="fontFamily" data-title="글꼴"><span style="width:120px">Malgun Gothic</span></button><div id="dropdown-menu-fontFamily-1" class="fr-dropdown-menu" role="listbox" aria-labelledby="fontFamily-1" aria-hidden="true"><div class="fr-dropdown-wrapper" role="presentation"><div class="fr-dropdown-content" role="presentation"><ul class="fr-dropdown-list" role="presentation"><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Dotum,sans-serif" style="font-family: Dotum,sans-serif" title="Dotum">Dotum</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Gulim,sans-serif" style="font-family: Gulim,sans-serif" title="Gulim">Gulim</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Batang,sans-serif" style="font-family: Batang,sans-serif" title="Batang">Batang</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Gungsuh,sans-serif" style="font-family: Gungsuh,sans-serif" title="Gungsuh">Gungsuh</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Arial,Helvetica,sans-serif" style="font-family: Arial,Helvetica,sans-serif" title="Arial">Arial</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Tahoma,Geneva,sans-serif" style="font-family: Tahoma,Geneva,sans-serif" title="Tahoma">Tahoma</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Verdana,Geneva,sans-serif" style="font-family: Verdana,Geneva,sans-serif" title="Verdana">Verdana</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Fixedsys,sans-serif" style="font-family: Fixedsys,sans-serif" title="Fixedsys">Fixedsys</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="'Times New Roman',Times,serif" style="font-family: 'Times New Roman',Times,serif" title="Times New Roman">Times New Roman</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="helvetica,sans-serif" style="font-family: helvetica,sans-serif" title="Helvetica">Helvetica</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="sans-serif" style="font-family: sans-serif" title="Sans-serif">Sans-serif</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="palatino,sans-serif" style="font-family: palatino,sans-serif" title="Palatino">Palatino</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="'Comic Sans MS',sans-serif" style="font-family: 'Comic Sans MS',sans-serif" title="Comic Sans MS">Comic Sans MS</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="sand,sans-serif" style="font-family: sand,sans-serif" title="Sand">Sand</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="'Courier New',sans-serif" style="font-family: 'Courier New',sans-serif" title="Courier New">Courier New</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="courier,sans-serif" style="font-family: courier,sans-serif" title="Courier">Courier</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="monospace,sans-serif" style="font-family: monospace,sans-serif" title="Monospace">Monospace</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Georgia,serif" style="font-family: Georgia,serif" title="Georgia">Georgia</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="SimSun,sans-serif" style="font-family: SimSun,sans-serif" title="SimSun">SimSun</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="SimHei,sans-serif" style="font-family: SimHei,sans-serif" title="SimHei">SimHei</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="'MS PGothic',sans-serif" style="font-family: 'MS PGothic',sans-serif" title="MS PGothic">MS PGothic</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="'MS PMincho',sans-serif" style="font-family: 'MS PMincho',sans-serif" title="MS PMincho">MS PMincho</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="'MS UI PGothic',sans-serif" style="font-family: 'MS UI PGothic',sans-serif" title="MS UI PGothic">MS UI PGothic</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontFamily" data-param1="Meiryo,sans-serif" style="font-family: Meiryo,sans-serif" title="Meiryo">Meiryo</a></li></ul></div></div></div><button id="fontSize-1" type="button" tabindex="-1" role="button" aria-controls="dropdown-menu-fontSize-1" aria-expanded="false" aria-haspopup="true" class="fr-command fr-btn fr-dropdown fr-selection" data-cmd="fontSize" data-title="글꼴 크기"><span style="width:30px">12</span></button><div id="dropdown-menu-fontSize-1" class="fr-dropdown-menu" role="listbox" aria-labelledby="fontSize-1" aria-hidden="true"><div class="fr-dropdown-wrapper" role="presentation"><div class="fr-dropdown-content" role="presentation"><ul class="fr-dropdown-list" role="presentation"><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="8px" title="8">8</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="9px" title="9">9</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="10px" title="10">10</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="12px" title="12">12</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="14px" title="14">14</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="16px" title="16">16</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="18px" title="18">18</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="20px" title="20">20</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="22px" title="22">22</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="24px" title="24">24</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="26px" title="26">26</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="28px" title="28">28</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="fontSize" data-param1="30px" title="30">30</a></li></ul></div></div></div><button id="bold-1" type="button" tabindex="-1" role="button" aria-pressed="false" class="fr-command fr-btn" data-cmd="bold" data-title="굵게 (Ctrl+B)"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M15.25,11.8h0A3.68,3.68,0,0,0,17,9a3.93,3.93,0,0,0-3.86-4H6.65V19h7a3.74,3.74,0,0,0,3.7-3.78V15.1A3.64,3.64,0,0,0,15.25,11.8ZM8.65,7h4.2a2.09,2.09,0,0,1,2,1.3,2.09,2.09,0,0,1-1.37,2.61,2.23,2.23,0,0,1-.63.09H8.65Zm4.6,10H8.65V13h4.6a2.09,2.09,0,0,1,2,1.3,2.09,2.09,0,0,1-1.37,2.61A2.23,2.23,0,0,1,13.25,17Z"></path></svg><span class="fr-sr-only">굵게</span></button><button id="italic-1" type="button" tabindex="-1" role="button" aria-pressed="false" class="fr-command fr-btn" data-cmd="italic" data-title="기울임꼴 (Ctrl+I)"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M11.76,9h2l-2.2,10h-2Zm1.68-4a1,1,0,1,0,1,1,1,1,0,0,0-1-1Z"></path></svg><span class="fr-sr-only">기울임꼴</span></button><button id="moreText-1" data-group-name="moreText-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="moreText" data-title="글꼴 더보기"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M13.55,19h2l-5-14h-2l-5,14h2l1.4-4h5.1Zm-5.9-6,1.9-5.2,1.9,5.2Zm12.8,4.5a1.5,1.5,0,1,1-1.5-1.5A1.5,1.5,0,0,1,20.45,17.5Zm0-4a1.5,1.5,0,1,1-1.5-1.5A1.5,1.5,0,0,1,20.45,13.5Zm0-4A1.5,1.5,0,1,1,18.95,8,1.5,1.5,0,0,1,20.45,9.5Z"></path></svg><span class="fr-sr-only">글꼴 더보기</span></button></div><div class="fr-btn-grp fr-float-left"><div class="fr-btn-wrap"><button id="formatOL-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="formatOL" data-title="순서 있는 목록"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M2.5,16h2v.5h-1v1h1V18h-2v1h3V15h-3Zm1-7h1V5h-2V6h1Zm-1,2H4.3L2.5,13.1V14h3V13H3.7l1.8-2.1V10h-3Zm5-5V8h14V6Zm0,12h14V16H7.5Zm0-5h14V11H7.5Z"></path></svg><span class="fr-sr-only">순서 있는 목록</span></button> <button id="formatOLOptions-1" type="button" tabindex="-1" role="button" aria-controls="dropdown-menu-formatOLOptions-1" aria-expanded="false" aria-haspopup="true" class="fr-command fr-btn fr-dropdown fr-options" data-cmd="formatOLOptions" data-title="순서 있는 목록"></button><div id="dropdown-menu-formatOLOptions-1" class="fr-dropdown-menu" role="listbox" aria-labelledby="formatOLOptions-1" aria-hidden="true"><div class="fr-dropdown-wrapper" role="presentation"><div class="fr-dropdown-content" role="presentation"><ul class="fr-dropdown-list" role="presentation"><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatOL" data-param1="default" title="Default">기본</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatOL" data-param1="lower-alpha" title="Lower Alpha">알파벳 소문자</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatOL" data-param1="lower-greek" title="Lower Greek">그리스 소문자</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatOL" data-param1="lower-roman" title="Lower Roman">로마자</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatOL" data-param1="upper-alpha" title="Upper Alpha">알파벳 대문자</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatOL" data-param1="upper-roman" title="Upper Roman">로마자 대문자</a></li></ul></div></div></div>  </div><div class="fr-btn-wrap"><button id="formatUL-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="formatUL" data-title="순서 없는 목록"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M4,10.5c-0.8,0-1.5,0.7-1.5,1.5s0.7,1.5,1.5,1.5s1.5-0.7,1.5-1.5S4.8,10.5,4,10.5z M4,5.5C3.2,5.5,2.5,6.2,2.5,7  S3.2,8.5,4,8.5S5.5,7.8,5.5,7S4.8,5.5,4,5.5z M4,15.5c-0.8,0-1.5,0.7-1.5,1.5s0.7,1.5,1.5,1.5s1.5-0.7,1.5-1.5S4.8,15.5,4,15.5z   M7.5,6v2h14V6H7.5z M7.5,18h14v-2h-14V18z M7.5,13h14v-2h-14V13z"></path></svg><span class="fr-sr-only">순서 없는 목록</span></button> <button id="formatULOptions-1" type="button" tabindex="-1" role="button" aria-controls="dropdown-menu-formatULOptions-1" aria-expanded="false" aria-haspopup="true" class="fr-command fr-btn fr-dropdown fr-options" data-cmd="formatULOptions" data-title="순서 없는 목록"></button><div id="dropdown-menu-formatULOptions-1" class="fr-dropdown-menu" role="listbox" aria-labelledby="formatULOptions-1" aria-hidden="true"><div class="fr-dropdown-wrapper" role="presentation"><div class="fr-dropdown-content" role="presentation"><ul class="fr-dropdown-list" role="presentation"><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatUL" data-param1="default" title="Default">기본</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatUL" data-param1="circle" title="Circle">빈 단추형 목록</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatUL" data-param1="disc" title="Disc">단추형 목록</a></li><li role="presentation"><a class="fr-command" tabindex="-1" role="option" data-cmd="formatUL" data-param1="square" title="Square">네모형 목록</a></li></ul></div></div></div>  </div><button id="alignLeft-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="alignLeft" data-title="왼쪽정렬"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M3,18h6v-2H3V18z M3,11v2h12v-2H3z M3,6v2h18V6H3z"></path></svg><span class="fr-sr-only">왼쪽정렬</span></button><button id="alignCenter-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="alignCenter" data-title="가운데정렬"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M9,18h6v-2H9V18z M6,11v2h12v-2H6z M3,6v2h18V6H3z"></path></svg><span class="fr-sr-only">가운데정렬</span></button><button id="alignRight-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="alignRight" data-title="오른쪽정렬"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M15,18h6v-2h-6V18z M9,11v2h12v-2H9z M3,6v2h18V6H3z"></path></svg><span class="fr-sr-only">오른쪽정렬</span></button><button id="moreParagraph-1" data-group-name="moreParagraph-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="moreParagraph" data-title="문단 더보기"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M7.682,5a4.11,4.11,0,0,0-4.07,3.18,4,4,0,0,0,3.11,4.725h0l.027.005a3.766,3.766,0,0,0,.82.09v6h2V7h2V19h2V7h2V5ZM5.532,9a2,2,0,0,1,2-2v4A2,2,0,0,1,5.532,9Zm14.94,8.491a1.5,1.5,0,1,1-1.5-1.5A1.5,1.5,0,0,1,20.472,17.491Zm0-4a1.5,1.5,0,1,1-1.5-1.5A1.5,1.5,0,0,1,20.472,13.491Zm0-4a1.5,1.5,0,1,1-1.5-1.5A1.5,1.5,0,0,1,20.472,9.491Z"></path></svg><span class="fr-sr-only">문단 더보기</span></button></div><div class="fr-btn-grp fr-float-left"><button id="moreRich-1" data-group-name="moreRich-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="moreRich" data-title="더 많은 내용 삽입"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M16.5,13h-6v6h-2V13h-6V11h6V5h2v6h6Zm5,4.5A1.5,1.5,0,1,1,20,16,1.5,1.5,0,0,1,21.5,17.5Zm0-4A1.5,1.5,0,1,1,20,12,1.5,1.5,0,0,1,21.5,13.5Zm0-4A1.5,1.5,0,1,1,20,8,1.5,1.5,0,0,1,21.5,9.5Z"></path></svg><span class="fr-sr-only">더 많은 내용 삽입</span></button></div><div class="fr-btn-grp fr-float-right"><button id="undo-1" type="button" tabindex="-1" role="button" aria-disabled="false" title="실행 취소 (Ctrl+Z)" class="fr-command fr-btn" data-cmd="undo"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M10.4,9.4c-1.7,0.3-3.2,0.9-4.6,2L3,8.5v7h7l-2.7-2.7c3.7-2.6,8.8-1.8,11.5,1.9c0.2,0.3,0.4,0.5,0.5,0.8l1.8-0.9  C18.9,10.8,14.7,8.7,10.4,9.4z"></path></svg><span class="fr-sr-only">실행 취소</span></button><button id="redo-1" type="button" tabindex="-1" role="button" aria-disabled="true" title="되돌리기 (Ctrl+Shift+Z)" class="fr-command fr-btn fr-disabled" data-cmd="redo"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M13.6,9.4c1.7,0.3,3.2,0.9,4.6,2L21,8.5v7h-7l2.7-2.7C13,10.1,7.9,11,5.3,14.7c-0.2,0.3-0.4,0.5-0.5,0.8L3,14.6  C5.1,10.8,9.3,8.7,13.6,9.4z"></path></svg><span class="fr-sr-only">되돌리기</span></button><button id="moreMisc-1" data-group-name="moreMisc-1" type="button" tabindex="-1" role="button" class="fr-command fr-btn" data-cmd="moreMisc" data-title="기타 더보기"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M13.5,17c0,0.8-0.7,1.5-1.5,1.5s-1.5-0.7-1.5-1.5s0.7-1.5,1.5-1.5S13.5,16.2,13.5,17z M13.5,12c0,0.8-0.7,1.5-1.5,1.5 s-1.5-0.7-1.5-1.5s0.7-1.5,1.5-1.5S13.5,11.2,13.5,12z M13.5,7c0,0.8-0.7,1.5-1.5,1.5S10.5,7.8,10.5,7s0.7-1.5,1.5-1.5 S13.5,6.2,13.5,7z"></path></svg><span class="fr-sr-only">기타 더보기</span></button></div><div class="fr-newline"></div><div class="fr-more-toolbar" data-name="moreText-1" style="padding-left: 245px;"><button id="underline-1" type="button" tabindex="-1" role="button" aria-pressed="false" title="밑줄 (Ctrl+U)" class="fr-command fr-btn" data-cmd="underline"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M19,20v2H5V20Zm-3-6.785a4,4,0,0,1-5.74,3.4A3.75,3.75,0,0,1,8,13.085V5.005H6v8.21a6,6,0,0,0,8,5.44,5.851,5.851,0,0,0,4-5.65v-8H16ZM16,5v0h2V5ZM8,5H6v0H8Z"></path></svg><span class="fr-sr-only">밑줄</span></button><button id="strikeThrough-1" type="button" tabindex="-1" role="button" aria-pressed="false" title="취소선 (Ctrl+S)" class="fr-command fr-btn" data-cmd="strikeThrough"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M3,12.20294H21v1.5H16.63422a3.59782,3.59782,0,0,1,.34942,1.5929,3.252,3.252,0,0,1-1.31427,2.6997A5.55082,5.55082,0,0,1,12.20251,19a6.4421,6.4421,0,0,1-2.62335-.539,4.46335,4.46335,0,0,1-1.89264-1.48816,3.668,3.668,0,0,1-.67016-2.15546V14.704h.28723v-.0011h.34149v.0011H9.02v.11334a2.18275,2.18275,0,0,0,.85413,1.83069,3.69,3.69,0,0,0,2.32836.67926,3.38778,3.38778,0,0,0,2.07666-.5462,1.73346,1.73346,0,0,0,.7013-1.46655,1.69749,1.69749,0,0,0-.647-1.43439,3.00525,3.00525,0,0,0-.27491-.17725H3ZM16.34473,7.05981A4.18163,4.18163,0,0,0,14.6236,5.5462,5.627,5.627,0,0,0,12.11072,5,5.16083,5.16083,0,0,0,8.74719,6.06213,3.36315,3.36315,0,0,0,7.44006,8.76855a3.22923,3.22923,0,0,0,.3216,1.42786h2.59668c-.08338-.05365-.18537-.10577-.25269-.16064a1.60652,1.60652,0,0,1-.65283-1.30036,1.79843,1.79843,0,0,1,.68842-1.5108,3.12971,3.12971,0,0,1,1.96948-.55243,3.04779,3.04779,0,0,1,2.106.6687,2.35066,2.35066,0,0,1,.736,1.83258v.11341h2.00317V9.17346A3.90013,3.90013,0,0,0,16.34473,7.05981Z"></path></svg><span class="fr-sr-only">취소선</span></button><button id="textColor-1" type="button" tabindex="-1" role="button" title="글꼴 색" class="fr-command fr-btn" data-cmd="textColor" data-popup="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M15.2,13.494s-3.6,3.9-3.6,6.3a3.65,3.65,0,0,0,7.3.1v-.1C18.9,17.394,15.2,13.494,15.2,13.494Zm-1.47-1.357.669-.724L12.1,5h-2l-5,14h2l1.43-4h2.943A24.426,24.426,0,0,1,13.726,12.137ZM11.1,7.8l1.86,5.2H9.244Z"></path></svg><span class="fr-sr-only">글꼴 색</span></button><button id="backgroundColor-1" type="button" tabindex="-1" role="button" title="배경 색" class="fr-command fr-btn" data-cmd="backgroundColor" data-popup="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M9.91752,12.24082l7.74791-5.39017,1.17942,1.29591-6.094,7.20747L9.91752,12.24082M7.58741,12.652l4.53533,4.98327a.93412.93412,0,0,0,1.39531-.0909L20.96943,8.7314A.90827.90827,0,0,0,20.99075,7.533l-2.513-2.76116a.90827.90827,0,0,0-1.19509-.09132L7.809,11.27135A.93412.93412,0,0,0,7.58741,12.652ZM2.7939,18.52772,8.41126,19.5l1.47913-1.34617-3.02889-3.328Z"></path></svg><span class="fr-sr-only">배경 색</span></button><button id="subscript-1" type="button" tabindex="-1" role="button" aria-pressed="false" title="아래 첨자" class="fr-command fr-btn" data-cmd="subscript"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M10.4,12l3.6,3.6L12.6,17L9,13.4L5.4,17L4,15.6L7.6,12L4,8.4L5.4,7L9,10.6L12.6,7L14,8.4L10.4,12z M18.31234,19.674  l1.06812-1.1465c0.196-0.20141,0.37093-0.40739,0.5368-0.6088c0.15975-0.19418,0.30419-0.40046,0.432-0.617  c0.11969-0.20017,0.21776-0.41249,0.29255-0.6334c0.07103-0.21492,0.10703-0.43986,0.10662-0.66621  c0.00297-0.28137-0.04904-0.56062-0.1531-0.82206c-0.09855-0.24575-0.25264-0.46534-0.45022-0.6416  c-0.20984-0.18355-0.45523-0.32191-0.72089-0.40646c-0.63808-0.19005-1.3198-0.17443-1.94851,0.04465  c-0.28703,0.10845-0.54746,0.2772-0.76372,0.49487c-0.20881,0.20858-0.37069,0.45932-0.47483,0.73548  c-0.10002,0.26648-0.15276,0.54838-0.15585,0.833l-0.00364,0.237H17.617l0.00638-0.22692  c0.00158-0.12667,0.01966-0.25258,0.05377-0.37458c0.03337-0.10708,0.08655-0.20693,0.15679-0.29437  c0.07105-0.08037,0.15959-0.14335,0.25882-0.1841c0.22459-0.08899,0.47371-0.09417,0.7018-0.01458  c0.0822,0.03608,0.15559,0.08957,0.21509,0.15679c0.06076,0.07174,0.10745,0.15429,0.13761,0.24333  c0.03567,0.10824,0.05412,0.22141,0.05469,0.33538c-0.00111,0.08959-0.0118,0.17881-0.0319,0.26612  c-0.02913,0.10428-0.07076,0.20465-0.124,0.29893c-0.07733,0.13621-0.1654,0.26603-0.26338,0.38823  c-0.13438,0.17465-0.27767,0.34226-0.42929,0.50217l-2.15634,2.35315V21H21v-1.326H18.31234z"></path></svg><span class="fr-sr-only">아래 첨자</span></button><button id="superscript-1" type="button" tabindex="-1" role="button" aria-pressed="false" title="위 첨자" class="fr-command fr-btn" data-cmd="superscript"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M10.4,12,14,15.6,12.6,17,9,13.4,5.4,17,4,15.6,7.6,12,4,8.4,5.4,7,9,10.6,12.6,7,14,8.4Zm8.91234-3.326,1.06812-1.1465c.196-.20141.37093-.40739.5368-.6088a4.85745,4.85745,0,0,0,.432-.617,3.29,3.29,0,0,0,.29255-.6334,2.11079,2.11079,0,0,0,.10662-.66621,2.16127,2.16127,0,0,0-.1531-.82206,1.7154,1.7154,0,0,0-.45022-.6416,2.03,2.03,0,0,0-.72089-.40646,3.17085,3.17085,0,0,0-1.94851.04465,2.14555,2.14555,0,0,0-.76372.49487,2.07379,2.07379,0,0,0-.47483.73548,2.446,2.446,0,0,0-.15585.833l-.00364.237H18.617L18.62338,5.25a1.45865,1.45865,0,0,1,.05377-.37458.89552.89552,0,0,1,.15679-.29437.70083.70083,0,0,1,.25882-.1841,1.00569,1.00569,0,0,1,.7018-.01458.62014.62014,0,0,1,.21509.15679.74752.74752,0,0,1,.13761.24333,1.08893,1.08893,0,0,1,.05469.33538,1.25556,1.25556,0,0,1-.0319.26612,1.34227,1.34227,0,0,1-.124.29893,2.94367,2.94367,0,0,1-.26338.38823,6.41629,6.41629,0,0,1-.42929.50217L17.19709,8.92642V10H22V8.674Z"></path></svg><span class="fr-sr-only">위 첨자</span></button><button id="clearFormatting-1" type="button" tabindex="-1" role="button" title="서식 제거" class="fr-command fr-btn" data-cmd="clearFormatting"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M11.48,10.09l-1.2-1.21L8.8,7.41,6.43,5,5.37,6.1,8.25,9,4.66,19h2l1.43-4h5.14l1.43,4h2l-.89-2.51L18.27,19l1.07-1.06L14.59,13.2ZM8.8,13l.92-2.56L12.27,13Zm.56-7.15L9.66,5h2l1.75,4.9Z"></path></svg><span class="fr-sr-only">서식 제거</span></button></div><div class="fr-more-toolbar" data-name="moreParagraph-1" style="padding-left: 591px;"><button id="outdent-1" type="button" tabindex="-1" role="button" title="내어쓰기 (Ctrl+[)" class="fr-command fr-btn fr-disabled" data-cmd="outdent" aria-disabled="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M3,12l3,3V9L3,12z M3,19h18v-2H3V19z M3,7h18V5H3V7z M9,11h12V9H9V11z M9,15h12v-2H9V15z"></path></svg><span class="fr-sr-only">내어쓰기</span></button><button id="indent-1" type="button" tabindex="-1" role="button" title="들여쓰기 (Ctrl+])" class="fr-command fr-btn" data-cmd="indent"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M3,9v6l3-3L3,9z M3,19h18v-2H3V19z M3,7h18V5H3V7z M9,11h12V9H9V11z M9,15h12v-2H9V15z"></path></svg><span class="fr-sr-only">들여쓰기</span></button><button id="alignJustify-1" type="button" tabindex="-1" role="button" title="양쪽정렬" class="fr-command fr-btn" data-cmd="alignJustify"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M3,18h18v-2H3V18z M3,11v2h18v-2H3z M3,6v2h18V6H3z"></path></svg><span class="fr-sr-only">양쪽정렬</span></button><button id="lineHeight-1" type="button" tabindex="-1" role="button" aria-controls="dropdown-menu-lineHeight-1" aria-expanded="false" aria-haspopup="true" title="행간" class="fr-command fr-btn fr-dropdown" data-cmd="lineHeight"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M6.25,7h2.5L5.25,3.5,1.75,7h2.5V17H1.75l3.5,3.5L8.75,17H6.25Zm4-2V7h12V5Zm0,14h12V17h-12Zm0-6h12V11h-12Z"></path></svg><span class="fr-sr-only">행간</span></button><div id="dropdown-menu-lineHeight-1" class="fr-dropdown-menu" role="listbox" aria-labelledby="lineHeight-1" aria-hidden="true"><div class="fr-dropdown-wrapper" role="presentation"><div class="fr-dropdown-content" role="presentation"><ul class="fr-dropdown-list" role="presentation"><li role="presentation"><a class="fr-command Default" tabindex="-1" role="option" data-cmd="lineHeight" data-param1="" title="기본">기본</a></li><li role="presentation"><a class="fr-command Single" tabindex="-1" role="option" data-cmd="lineHeight" data-param1="1" title="1.0">1.0</a></li><li role="presentation"><a class="fr-command 1.15" tabindex="-1" role="option" data-cmd="lineHeight" data-param1="1.15" title="1.15">1.15</a></li><li role="presentation"><a class="fr-command 1.5" tabindex="-1" role="option" data-cmd="lineHeight" data-param1="1.5" title="1.5">1.5</a></li><li role="presentation"><a class="fr-command Double" tabindex="-1" role="option" data-cmd="lineHeight" data-param1="2" title="2.0">2.0</a></li></ul></div></div></div></div><div class="fr-more-toolbar" data-name="moreRich-1" style="padding-left: 637px;"><button id="insertTable-1" type="button" tabindex="-1" role="button" title="표 삽입" class="fr-command fr-btn" data-cmd="insertTable" data-popup="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M20,5H4C2.9,5,2,5.9,2,7v2v1.5v3V15v2c0,1.1,0.9,2,2,2h16c1.1,0,2-0.9,2-2v-2v-1.5v-3V9V7C22,5.9,21.1,5,20,5z M9.5,13.5v-3  h5v3H9.5z M14.5,15v2.5h-5V15H14.5z M9.5,9V6.5h5V9H9.5z M3.5,7c0-0.3,0.2-0.5,0.5-0.5h4V9H3.5V7z M3.5,10.5H8v3H3.5V10.5z M3.5,17  v-2H8v2.5H4C3.7,17.5,3.5,17.3,3.5,17z M20.5,17c0,0.3-0.2,0.5-0.5,0.5h-4V15h4.5V17z M20.5,13.5H16v-3h4.5V13.5z M16,9V6.5h4  c0.3,0,0.5,0.2,0.5,0.5v2H16z"></path></svg><span class="fr-sr-only">표 삽입</span></button><button id="insertLink-1" type="button" tabindex="-1" role="button" title="링크 삽입 (Ctrl+K)" class="fr-command fr-btn" data-cmd="insertLink" data-popup="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M11,17H7A5,5,0,0,1,7,7h4V9H7a3,3,0,0,0,0,6h4ZM17,7H13V9h4a3,3,0,0,1,0,6H13v2h4A5,5,0,0,0,17,7Zm-1,4H8v2h8Z"></path></svg><span class="fr-sr-only">링크 삽입</span></button><button id="insertHR-1" type="button" tabindex="-1" role="button" title="구분선" class="fr-command fr-btn" data-cmd="insertHR"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M5,12h14 M19,11H5v2h14V11z"></path></svg><span class="fr-sr-only">구분선</span></button><button id="emoticons-1" type="button" tabindex="-1" role="button" title="이모티콘" class="fr-command fr-btn" data-cmd="emoticons" data-popup="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M11.991,3A9,9,0,1,0,21,12,8.99557,8.99557,0,0,0,11.991,3ZM12,19a7,7,0,1,1,7-7A6.99808,6.99808,0,0,1,12,19Zm3.105-5.2h1.503a4.94542,4.94542,0,0,1-9.216,0H8.895a3.57808,3.57808,0,0,0,6.21,0ZM7.5,9.75A1.35,1.35,0,1,1,8.85,11.1,1.35,1.35,0,0,1,7.5,9.75Zm6.3,0a1.35,1.35,0,1,1,1.35,1.35A1.35,1.35,0,0,1,13.8,9.75Z"></path></svg><span class="fr-sr-only">이모티콘</span></button><button id="specialCharacters-1" type="button" tabindex="-1" role="button" title="특수 문자" class="fr-command fr-btn" data-cmd="specialCharacters" data-popup="true"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M15.77493,16.98885a8.21343,8.21343,0,0,0,1.96753-2.57651,7.34824,7.34824,0,0,0,.6034-3.07618A6.09092,6.09092,0,0,0,11.99515,5a6.13347,6.13347,0,0,0-4.585,1.79187,6.417,6.417,0,0,0-1.756,4.69207,6.93955,6.93955,0,0,0,.622,2.97415,8.06587,8.06587,0,0,0,1.949,2.53076H5.41452V19h5.54114v-.04331h-.00147V16.84107a5.82825,5.82825,0,0,1-2.2052-2.2352A6.40513,6.40513,0,0,1,7.97672,11.447,4.68548,4.68548,0,0,1,9.07785,8.19191a3.73232,3.73232,0,0,1,2.9173-1.22462,3.76839,3.76839,0,0,1,2.91241,1.21489,4.482,4.482,0,0,1,1.11572,3.154,6.71141,6.71141,0,0,1-.75384,3.24732,5.83562,5.83562,0,0,1-2.22357,2.25759v2.11562H13.0444V19h5.54108V16.98885Z"></path></svg><span class="fr-sr-only">특수 문자</span></button></div><div class="fr-more-toolbar" data-name="moreMisc-1" style="padding-left: 942px;"><button id="fullscreen-1" type="button" tabindex="-1" role="button" aria-pressed="false" title="전체 화면" class="fr-command fr-btn" data-cmd="fullscreen"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M7,14H5v5h5V17H7ZM5,10H7V7h3V5H5Zm12,7H14v2h5V14H17ZM14,5V7h3v3h2V5Z"></path></svg><span class="fr-sr-only">전체 화면</span></button><button id="html-1" type="button" tabindex="-1" role="button" aria-pressed="false" title="코드보기" class="fr-command fr-btn" data-cmd="html"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M9.4,16.6,4.8,12,9.4,7.4,8,6,2,12l6,6Zm5.2,0L19.2,12,14.6,7.4,16,6l6,6-6,6Z"></path></svg><span class="fr-sr-only">코드보기</span></button><button id="print-1" type="button" tabindex="-1" role="button" title="인쇄" class="fr-command fr-btn" data-cmd="print"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M16.1,17c0-0.6,0.4-1,1-1c0.6,0,1,0.4,1,1s-0.4,1-1,1C16.5,18,16.1,17.6,16.1,17z M22,15v4c0,1.1-0.9,2-2,2H4  c-1.1,0-2-0.9-2-2v-4c0-1.1,0.9-2,2-2h1V5c0-1.1,0.9-2,2-2h7.4L19,7.6V13h1C21.1,13,22,13.9,22,15z M7,13h10V9h-4V5H7V13z M20,15H4  v4h16V15z"></path></svg><span class="fr-sr-only">인쇄</span></button><button id="selectAll-1" type="button" tabindex="-1" role="button" title="전체선택" class="fr-command fr-btn" data-cmd="selectAll"><svg class="fr-svg" focusable="false" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M5,7h2V5C5.9,5,5,5.9,5,7z M5,11h2V9H5V11z M9,19h2v-2H9V19z M5,11h2V9H5V11z M15,5h-2v2h2V5z M17,5v2h2C19,5.9,18.1,5,17,5  z M7,19v-2H5C5,18.1,5.9,19,7,19z M5,15h2v-2H5V15z M11,5H9v2h2V5z M13,19h2v-2h-2V19z M17,11h2V9h-2V11z M17,19c1.1,0,2-0.9,2-2h-2  V19z M17,11h2V9h-2V11z M17,15h2v-2h-2V15z M13,19h2v-2h-2V19z M13,7h2V5h-2V7z M9,15h6V9H9V15z M11,11h2v2h-2V11z"></path></svg><span class="fr-sr-only">전체선택</span></button></div></div><div class="fr-wrapper" dir="ltr"><iframe src="about:blank" frameborder="0" id="content_IFRAME" class="fr-iframe" style="height: 440px;"></iframe></div><div class="second-toolbar"><span class="fr-counter" style="bottom: 1px; margin-right: 2px;">문자 : 44</span></div></div><textarea style="width: 100%; display: none;" name="content" id="content" class="ec-fr-never-be-duplicated"></textarea>
		            <input type="hidden" id="content_hidden" fw-filter="isSimplexEditorFill" fw-label="내용" value="EC_FROALA_INSTANCE">
		                
		            <!-- JavaScript -->
		            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2209081131"></script>
		            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/3.2.2/js/froala_editor.pkgd.min.js?vs=2209081131"></script>
		            <script type="text/javascript" src="//img.echosting.cafe24.com/editors/froala/js/i18n/ko_KR.js?vs=2209081131"></script>
		        
		            <!-- Run Froala Script -->
		            <script>
		              var EC_FROALA_ID = null;
		              // isSimplexEditorFill 체크시에 필요함
		              var EC_FROALA_INSTANCE = null;
		              // scroll 버그 대응을 위해 필요.
		              var fScrollPosition = 0;
		              // 다중 이미지 삽입시 생기는 버그 대응
		              var iCheckedImageListCount  = 0;
		              var aCheckedImageList = [];
		              var aInsertedImageList = [];
		              var isBeforeImageRemove = false;
		              
		              (function() {
		                var d = "";
		                try {
		                    var o = {"key":"DUA2yF3G1E1A5A2A2pZGCTRSAPJWTLPLZHTQQe1JGZxC4B3A3E2B5A1E1E4I1C2==","toolbarSticky":false,"theme":"ec-froala","attribution":false,"htmlRemoveTags":["script"],"htmlAllowedEmptyTags":["*"],"iframe":true,"iframeStyle":".fr-view{font-size: 12px;}","iframeStyleFiles":["\/\/img.echosting.cafe24.com\/editors\/froala\/css\/froala_style.min.css?vs=2209081131"],"heightMin":400,"language":"ko_KR","paragraphFormatSelection":true,"fontFamilySelection":true,"fontSize":["8","9","10","12","14","16","18","20","22","24","26","28","30"],"fontSizeSelection":true,"linkInsertButtons":["linkBack"],"quickInsertButtons":["ul","ol","hr"],"codeMirror":false,"entities":"&#60;&#62;","imageEditButtons":["imageAlign","imageRemove","|","imageLink","linkOpen","linkEdit","linkRemove","-","imageDisplay","imageStyle","imageAlt","imageSize"],"tableEditButtons":[],"tableInsertHelper":false,"imageDefaultMargin":0,"imageDefaultWidth":0,"imageUpload":false,"imageInsertButtons":["imageUpload"],"imageMaxSize":5242880,"filesManagerMaxSize":5242880,"toolbarButtons":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":5},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":5},"moreRich":{"buttons":["insertTable","insertLink","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsSM":{"moreText":{"buttons":["paragraphFormat","fontFamily","fontSize","bold","italic","underline","strikeThrough","textColor","backgroundColor","subscript","superscript","clearFormatting"],"buttonsVisible":4},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight","outdent","indent","alignJustify","lineHeight"],"buttonsVisible":2},"moreRich":{"buttons":["insertTable","insertLink","insertHR","emoticons","specialCharacters"],"buttonsVisible":0},"moreMisc":{"buttons":["undo","redo","fullscreen","html","print","spellChecker","selectAll"],"align":"right","buttonsVisible":2}},"toolbarButtonsXS":{"moreText":{"buttons":["paragraphFormat","textColor","backgroundColor","bold","italic","underline","strikeThrough"],"buttonsVisible":1},"moreParagraph":{"buttons":["formatOL","formatUL","alignLeft","alignCenter","alignRight"],"buttonsVisible":0},"moreRich":{"buttons":["insertLink"]},"moreMisc":{"buttons":["undo","redo","html"],"buttonsVisible":0,"align":"right"}},"htmlDoNotWrapTags":["script","style","meta","link"],"htmlAllowedStyleProps":[".*"],"htmlAllowedTags":[".*"],"htmlAllowedAttrs":[".*"],"fontFamily":{"Dotum,sans-serif":"Dotum","Gulim,sans-serif":"Gulim","Batang,sans-serif":"Batang","Gungsuh,sans-serif":"Gungsuh","Arial,Helvetica,sans-serif":"Arial","Tahoma,Geneva,sans-serif":"Tahoma","Verdana,Geneva,sans-serif":"Verdana","Fixedsys,sans-serif":"Fixedsys","'Times New Roman',Times,serif":"Times New Roman","helvetica,sans-serif":"Helvetica","sans-serif":"Sans-serif","palatino,sans-serif":"Palatino","'Comic Sans MS',sans-serif":"Comic Sans MS","sand,sans-serif":"Sand","'Courier New',sans-serif":"Courier New","courier,sans-serif":"Courier","monospace,sans-serif":"Monospace","Georgia,serif":"Georgia","SimSun,sans-serif":"SimSun","SimHei,sans-serif":"SimHei","'MS PGothic',sans-serif":"MS PGothic","'MS PMincho',sans-serif":"MS PMincho","'MS UI PGothic',sans-serif":"MS UI PGothic","Meiryo,sans-serif":"Meiryo"},"colorsText":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"colorsBackground":["#FF0000","#FF6C00","#FFAA00","#FFEF00","#A6CF00","#009E25","#00B0A2","#0075C8","#3A32C3","#7820B9","#EF007C","#000000","#252525","#464646","#636363","#7D7D7D","#9A9A9A","#FFE8E8","#F7E2D2","#F5EDDC","#F5F4E0","#EDF2C2","#DEF7E5","#D9EEEC","#C9E0F0","#D6D4EB","#E7DBED","#F1E2EA","#ACACAC","#C2C2C2","#CCCCCC","#E1E1E1","#EBEBEB","#FFFFFF","#E97D81","#E19B73","#D1B274","#CFCCA2","#61B977","#53AEA8","#518FBB","#6A65BB","#9A54CE","#E573AE","#5A504B","#767B86","#951015","#6E391A","#785C25","#5F5B25","#4C511F","#1C4827","#0D514C","#1B496A","#2B285F","#45245B","#721947","#352E2C","#3C3F45"],"docId":"content"};
		                    // IE tableEditbuttons 이슈
		                    o["tableEditButtons"] = FroalaEditor.DEFAULTS.tableEditButtons.filter(function(tableEditButtonName) {
		                        return tableEditButtonName.indexOf("Style") === -1;
		                    });
		
		                    o["events"] = {
		                        "filesManager.beforeUpload": function(files) {
		                            this.opts.filesManagerUploadURL = getConvertUrlBeforeUpload(this.opts.filesManagerUploadURL);
		                        },
		                        "image.beforeUpload": function(images) {
		                            this.opts.imageUploadURL = getConvertUrlBeforeUpload(this.opts.imageUploadURL);
		                        },
		
		                        "image.inserted": function(oImage, response) {
		                            var sInstanceId = "content";
		                            // 파일업로더로 이미지가 넘어오는경우에는 itslog가 이미 생성된 이미지기때문에 처리하지않음.
		                            if ((sInstanceId === "product_description" || sInstanceId === "product_description_mobile") && typeof response !== "undefined") {
		                                oImage.attr("data-use_its", true);
		                            }
		                           
		                            if (iCheckedImageListCount >= 0) {
		                                iCheckedImageListCount++;
		                                aInsertedImageList.push(oImage);
		                                
		                                if (aCheckedImageList.length === iCheckedImageListCount || aCheckedImageList.length === 0) {
		                                    // 마지막 이미지
		                                    for (var i = 0; i < aInsertedImageList.length; i++) {
		                                        aInsertedImageList[i].after("<br>");
		                                    }
		                                    
		                                    // 리셋
		                                    iCheckedImageListCount = 0;
		                                    aCheckedImageList = [];
		                                    aInsertedImageList = [];
		                                }
		                            }
		                        },
		                        "image.error": function (error, response) {
		                            if (typeof JSON != "undefined") {
		                                r = JSON.parse(response);
		                                alert(r["error"]);
		                            }
		                        },
		                        "image.loaded": function($img) {
		                            // IE에서 이미지 로드 후, 커서 위치 재조정
		                            if (/(trident).+rv[:\s]([\w\.]{1,9}).+like\sgecko/i.test(navigator.userAgent)) {
		                                var _this = this;
		                                var _img = $img[0];
		                                setTimeout(function() {
		                                  _this.selection.setAfter(_img);
		                                  _this.selection.restore();
		                                }, 300);
		                            }
		                        },
		                        "filesManager.error": function (error, response) {
		                            if (typeof JSON != "undefined") {
		                                r = JSON.parse(response);
		                                alert(r["error"]);
		                            }
		                        },
		                        "commands.before": function(sCommand) {
		                            // 코드뷰 토글시
		                            if (sCommand === "html") {
		                                var sContent = this.el.innerHTML;
		                                sContent = sContent.replace(/<\/?null>/gi, "");
		                                this.el.innerHTML = getReplaceZeroWidthSpace(sContent);
		                                replaceToFroalaNewLine(this);
		                            }
		                            
		                            // 전체화면 모드 켜기
		                            if (sCommand === "fullscreen" && !this.fullscreen.isActive()) {
		                                this.$box[0].setAttribute("data-window-scroll-y", window.scrollY || window.pageYOffset);
		                            }
		                            // 다중 이미지 삽입
		                            if (sCommand === "insertAll") {
		                                var popup = this.popups.get("filesManager.insert");
		                                aCheckedImageList = popup.find(".fr-files-checkbox .fr-file-insert-check:checked")
		                            }
		
		                            if (sCommand === "insertSpecialCharacter") {
		                                setScrollPosition(this, getIframeCursorPoint(this));
		                            }
		                        },
		                        "commands.after": function(sCommand) {
		                            if (sCommand === "html") {
		                                removeFroalaNewLine(this);
		                            }
		                            
		                            if (sCommand === "insertFiles") {
		                                var enableButton= document.querySelector(".fr-trim-button.fr-plugins-enable");
		                                if (enableButton) enableButton.click();
		                            }
		                            
		                            if (sCommand === "selectAll") {
		                                this.el.focus();
		                            }
		                            
		                            // 전체 화면 토글시에 컨텐츠 높이를 정상적으로 반영하지못하는 이슈 대응
		                            if (sCommand === "fullscreen") {
		                                var _this = this;
		                                setTimeout(function() {
		                                    _this.size.syncIframe();
		                                }, 300);
		                                
		                                if (this.fullscreen.isActive() === false) {
		                                    window.scrollTo(0, this.$box[0].getAttribute("data-window-scroll-y"));
		                                }
		                            }
		                            
		                            if (sCommand === "insertSpecialCharacter") {
		                                this.$wp.get(0).scrollTop = fScrollPosition;
		                            }
		                        },
		                        "focus": function() {
		                            if (this.iframe_document) {
		                                var iframeHeight = this.iframe_document.body.scrollHeight;
		                                this.$iframe[0].style.height = iframeHeight + "px";
		                            }
		                            
		                            this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
		                        },
		
		                        "image.beforeRemove": function(aImage) {
		                            isBeforeImageRemove = true;
		                            var cursorPoint = aImage[0].offsetTop; // 제거 대상 이미지의 offsetTop 값으로 정의
		                            setScrollPosition(this, cursorPoint);
		                        },
		                        "image.removed": function() {
		                            if (isBeforeImageRemove === true) {
		                                this.$wp.get(0).scrollTop = fScrollPosition; // 에디터 자체 버그동작이 수행 된 후 계산 해 둔 값으로 스크롤 위치를 이동
		                            }
		                            isBeforeImageRemove = false;
		                        },
		                        "keydown": function(e) {
		                            if (isScrollFix(this, e) === true) {
		                                setScrollPosition(this, getIframeCursorPoint(this));
		                            }
		                        },
		                        "keyup": function(e) {
		                            if (isScrollFix(this, e) === true) {
		                                this.$wp.get(0).scrollTop = fScrollPosition;
		                            }
		                        },
		                        "paste.before": function() {
		                            if (this.fullscreen.isActive() === false) {
		                                setScrollPosition(this, getIframeCursorPoint(this));
		                            } 
		                        },
		                        "paste.after": function(e) {
		                            if (this.fullscreen.isActive() === false) {
		                                this.$wp.get(0).scrollTop = fScrollPosition;
		                            } 
		                        },
		                        "codeView.update": function() {
		                            this.el.innerHTML = getReplaceZeroWidthSpace(this.el.innerHTML);
		                            this.el.innerHTML = decodeUriAttribute(this.el.innerHTML);
		                        }
		                    };
		
		                    EC_FROALA_INSTANCE = new FroalaEditor("textarea#content.ec-fr-never-be-duplicated", o, function() {
		                        EC_FROALA_ID = this.id;
		                        if (d != "") {
		                            this.el.innerHTML = this.clean.html(d);
		                            // 타겟 textarea 태그에 change 트리거링
		                            this.undo.saveStep();
		                        }
		                        var script = document.createElement("script");
		                        script.src = "//img.echosting.cafe24.com/editors/froala/js/polyfill.min.js?vs=2209081131";
		                        this.$iframe.get(0).contentWindow.document.head.appendChild(script);
		                        if (this.el.innerHTML === "<br>") {
		                            this.el.innerHTML = "<p><br></p>";
		                        }
		                    });
		
		                    EC_FROALA_INSTANCE.$iframe[0].setAttribute("id", "content" + "_IFRAME");
		                    EC_FROALA_INSTANCE.$iframe[0].contentWindow.document.body.setAttribute("id", "content" + "_BODY");
		
		                    EC_FROALA_INSTANCE.isEmptyContent = function () {
		                        var c = getContentFromFroala(this.id);
		                        // 스페이스바만 입력 저장시, validation을 위해 처리
		                        var val = c.replace(/\<br\/?\>|\<\/?p\>|\s|&nbsp;/gi, "");
		                        if ("" == val) return true;
		                        return false;
		                    };
		
		                    EC_FROALA_INSTANCE.getContentFromFroala = function() {
		                        return getContentFromFroala(this.id);
		                    };
		
		                    EC_FROALA_INSTANCE.applyContentToFroala = function(content) {
		                        return applyContentToFroala(content, this.id);
		                    };
		
		                    EC_FROALA_INSTANCE.setValueBeforeSubmit = function(sSection) {
		                        return setValueBeforeSubmit(sSection, this.id);
		                    };
		
		                    if (typeof $Editor ===  "undefined") {
		                        $Editor = {};
		                    }
		                    $Editor["content"] = EC_FROALA_INSTANCE;
		                } catch (e) {
		                    document.getElementById("content").value = d;
		                    console.error(e);
		                } finally {
		                }
		              })();
		              
		              function decodeUriAttribute(content) {
		                  return content.replace(/(?:href=|src=)(?:"([^"]+)|'([^']+))[^>]/g, function (match, p1, p2) {
		                      var p = p1 ? p1 : p2;
		                      if (/%20|\s|%3A/g.test(p)) {
		                          try {
		                              return match.replace(p, decodeURIComponent(p).trim());
		                          } catch (e) {
		                              return match;
		                          }
		                      } else {
		                          return match;
		                      }
		                  });
		              }
		
		              //플로알라 에디터 내용 조회
		              function getContentFromFroala(id) {
		                  try {
		                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
		                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
		                      return instance.id === sFroalaId;
		                    });
		                    if (oEditor[0].codeView.isActive()) {
		                      oEditor[0].codeView.toggle();
		                    }
		
		                    oEditor[0].el.innerHTML = decodeUriAttribute(oEditor[0].el.innerHTML);
		                    
		                    return oEditor[0].el.innerHTML;
		
		                  } catch (e) {
		                    console.error(e);
		                    return false;
		                  }
		              }
		
		              //플로알라 에디터 내용 적용
		              function applyContentToFroala(content, id) {
		                  try {
		                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
		                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
		                      return instance.id === sFroalaId;
		                    });
		
		                    oEditor[0].el.innerHTML = oEditor[0].clean.html(content);
		
		                    // textarea 태그에 change 트리거링
		                    oEditor[0].undo.saveStep();
		                    return true;
		                  } catch (e) {
		                    console.error(e);
		                    return false;
		                  }
		              }
		
		              // useclasses 옵션 사용시, froala 커스텀 속성값 (fr-draggable) 제거
		              function setValueBeforeSubmit(sSection, id) {
		                try {
		                    var sFroalaId = (typeof id === "undefined") ? EC_FROALA_ID : id;
		                    var oEditor = FroalaEditor.INSTANCES.filter(function (instance) {
		                      return instance.id === sFroalaId;
		                    });
		
		                    var contents = oEditor[0].el.innerHTML;
		                    document.getElementById(sSection).value = contents.replace(/\sclass=("|')fr-draggable("|')|\s?fr-draggable\s?|<\/?null>/gi, "");
		
		                    return true;
		                  } catch (e) {
		                    console.error(e);
		                    return false;
		                  }
		              }
		
		              //플로알라 front reset CSS 가져오기
		              //Deprecated
		              function getFroalaResetCSS() {
		                return "//img.echosting.cafe24.com/editors/froala/css/froala_editor_reset.css?vs=2209081131;"
		              }
		
		              //플로알라 front style CSS 가져오기
		              function getFroalaStyleCSS() {
		                return "//img.echosting.cafe24.com/editors/froala/css/froala_style.min.css?vs=2209081131";
		              }
		
		              //플로알라 front style EC CSS 가져오기
		              function getFroalaECStyleCSS() {
		                return "//img.echosting.cafe24.com/editors/froala/css/froala_style_ec.min.css?vs=2209081131";
		              }
		
		              // 파일 업로드시 랜덤한 파라미터 값 추가
		              function getConvertUrlBeforeUpload(sUploadUrl) {
		                var aSplitUrl = sUploadUrl.split("?");
		                var oParam = getParameterUploadUrl(aSplitUrl[1]);
		
		                return decodeURIComponent(aSplitUrl[0] + "?" + "uploadPath=" + oParam["uploadPath"] + "&uploadId=" + Math.floor((Math.random() * 100000)).toString());
		              }
		
		             function getParameterUploadUrl(sQueryString) {
		                var aParam = {};
		
		                if (sQueryString) {
		                    var aFields = sQueryString.split("&");
		                    var aField  = [];
		                    for (var i=0; i<aFields.length; i++) {
		                        aField = aFields[i].split("=");
		                        aParam[aField[0]] = aField[1];
		                    }
		                }
		                return aParam;
		            }
		
		            // 스크롤 위치 수정해야하는지 확인
		            function isScrollFix (oEditor, event) {
		                if (oEditor.fullscreen.isActive() === true) {
		                    return false;
		                }
		                var sKey = event.key.toUpperCase();
		                var bResult = false;
		                if (sKey === "ENTER") {
		                    // 구문의 중간 지점의 엔터 입력만 요구 조건에 해당함
		                    bResult = oEditor.selection.get().focusNode !== oEditor.$el.get(0);
		                } else if (sKey === "BACKSPACE" || sKey === "DELETE") {
		                    bResult = true;
		                }
		                return bResult;
		            }
		            
		            // 스크롤 위치 수정
		            function setScrollPosition (oEditor, fCursorPoint) {
		                var oContentWrapper = oEditor.$wp.get(0); // 에디터 편집 영역 컨테이너
		                var fStartPoint = oContentWrapper.scrollTop; // 보여지는 편집 영역의 시작 지점
		                var fEndPoint = oContentWrapper.scrollTop + (oContentWrapper.clientHeight - 20); // 보여지는 편집 영역의 끝 지점 (여백 포함)
		 
		                if (fCursorPoint > 0 && fCursorPoint < fStartPoint) {
		                    // 커서가 보여지는 영역보다 위에 위치
		                    fScrollPosition = fCursorPoint;
		                } else if (fCursorPoint > 0 && fCursorPoint > fEndPoint) {
		                    // 커서가 보여지는 영역보다 아래에 위치
		                    fScrollPosition = fCursorPoint - (oContentWrapper.clientHeight - 20); // 여백 포함
		                } else {
		                    // 값이 0 이라서 무효화 됐거나, 보여지는 영역에 있는 경우 - 위치를 그대로 유지
		                    fScrollPosition = fStartPoint;
		                }
		            }
		            
		            // 커서 포인트 반환
		            function getIframeCursorPoint(editor) {
		                var iframeDocument = editor.$iframe.get(0).contentDocument;
		                var anchorNode = iframeDocument.getSelection().anchorNode;
		                var iframeRange = iframeDocument.createRange();
		                iframeRange.selectNode(anchorNode);
		                return iframeRange.getBoundingClientRect().top;
		            }
		   
		            // 폭없는 공백에서 폭과 줄바꿈 없는 공백으로 치환 (폭없는 공백은 플로알라버그로인해 지원하지않음)
		            function getReplaceZeroWidthSpace(sContent) {
		                return sContent.replace(/\u200B/g, "&#65279;");
		            }
		            
		            // \n 제거되는 사양에대한 대응 : 플로알라에서 코드뷰 토글시 줄바꿈되는 태그로 변경
		            function replaceToFroalaNewLine(oEditor) {
		                if (oEditor.codeView.isActive() === true) {
		                    return;
		                }
		                
		                var oWhiteSpacePreElements = oEditor.$el.get(0).querySelectorAll('*[style*="white-space: pre"], *[style*="white-space:pre"]');
		                for (var iIndex = 0; iIndex < oWhiteSpacePreElements.length; iIndex++) {
		                    oWhiteSpacePreElements[iIndex].innerHTML = oWhiteSpacePreElements[iIndex].innerHTML.replace(/\n/g, '<span class="fr-newline"></span>');
		                }
		            }            
		            
		            // \n 제거되는 사양에대한 대응 : 코드뷰 토글시 줄바꿈 태그 \n으로 변경
		            function removeFroalaNewLine(oEditor) {
		                if (oEditor.codeView.isActive() === false) {
		                    return;
		                }
		                
		                var sCodeViewValue;
		                if (typeof oEditor.opts.codeMirror === "function") {
		                    // 상품 등록/수정 에디터는 코드미러를 사용하기때문에 분기처리
		                    sCodeViewValue = oEditor.$wp.get(0).querySelector(".CodeMirror").CodeMirror.getValue();
		                    oEditor.$wp.get(0).querySelector(".CodeMirror").CodeMirror.setValue(sCodeViewValue.replace(/<span class=[',"]fr-newline[',"]><\/span>/g, '\n'));
		                } else {
		                    sCodeViewValue = oEditor.$wp.get(0).querySelector(".fr-code").value;
		                    oEditor.$wp.get(0).querySelector(".fr-code").value = sCodeViewValue.replace(/<span class=[',"]fr-newline[',"]><\/span>/g, '\n');
		                }
		            }
		            
		            </script>
		            </td>
              		</tr>
				<tr>
					<td>첨부파일1</td>
					<td><input name="file1" type="file"/></td>
				</tr>
				<tr>
					<td>첨부파일2</td>
					<td><input name="file2" type="file"/></td>
				</tr>
				<tr>
					<td>첨부파일3</td>
					<td><input name="file3" type="file"/></td>
				</tr>
			</table>
		</form>
		<div class="my-5">
			<span><button id="notice_list" type="button" class="white" style="height:40px;">목록</button></span>
			<span><button id="notice_reset" type="reset" class="float-right mr-2 white" style="height:40px;">취소</button></span>
			<span><button id="notice_submit" type="button" class="float-right mr-2 black" style="height:40px;">등록</button></span>
		</div>
	</div>
</div>
 <jsp:include page="/WEB-INF/hyerin/footer.jsp"/>