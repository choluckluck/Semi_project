<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		
		//로그인 버튼 클릭이벤트
		$("button#login_button").click(function(){
			goLogin();
		});
		
		
		$("input#loginPwd").bind("keydown", function(event){
			if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
				goLogin(); // 로그인 시도한다.
			}
		});
		

		//회원가입 버튼 클릭이벤트
		$("button#register_button").click(function(){
			location.href="<%= ctxPath%>/hyerin/member/agreement.sue";
		});
		
		//아이디찾기 클릭이벤트
		$("span#login_idfind").click(function(){
			location.href="<%= ctxPath%>/hyerin/login/idFind.sue";
		});
		
		//비밀번호찾기 클릭이벤트
		$("span#login_pwdfind").click(function(){
			location.href="<%= ctxPath%>/hyerin/login/pwdFind.sue";
		});
		
	}); //end of document.ready
	
	function goLogin() {
		const loginUserid = $("input#loginUserid").val().trim();
	    const loginPwd = $("input#loginPwd").val().trim();
	    
	    
	    // 아이디를 입력하지 않은 경우
	    if(loginUserid == "") {
	    	alert("아이디를 입력하세요!!");
	    	$("input#loginUserid").val("");
	    	$("input#loginUserid").focus();
	    	return; // goLogin() 함수 종료
	    }
	      
		// 비밀번호를 입력하지 않은 경우
	    if(loginPwd == "") {
	    	alert("암호를 입력하세요!!");
	    	$("input#loginPwd").val("");
	    	$("input#loginPwd").focus();
	    	return; // goLogin() 함수 종료
	    } //end of if
	    
	    
	    // 아이디 저장 박스에 체크된 경우
	    if( $("input:checkbox[id='saveid']").prop("checked") ) {
	    	localStorage.setItem('saveid', $("input#loginUserid").val());	
	    }
	    else {
	    	localStorage.removeItem('saveid');
	    }
	        
	    const frm = document.loginFrm; 
	    frm.action = "<%= request.getContextPath()%>/hyerin/login/login.sue";
	    frm.method = "post";
	    frm.submit();
	}
	

</script>



<div id="container" class="container-fluid">
  <form name="loginFrm">

	<div class="row mt-5">
		<div class="col-4"></div>
		
			<div class="col-4">
				<table id="login" class="container">
					<tr>
						<td colspan="4" id="login_text">로그인</td>
					</tr>
					
					<%-- <tr>
						<td colspan="4" class="kakao_log pl-2">
							<img class="login_img" src="<%= ctxPath%>/images/kakaotalk_login.png"/>
							<span class="kakao_log align-middle pl-2">카카오계정 로그인</span>
						</td>
					</tr>
					<tr class="naver_apple">
						<td width="50%" id="naver_login" class="login_box naver_log pl-2">
							<img class="login_img" src="<%= ctxPath%>/images/naver_login.png"/>
							<span class="naver_log align-middle">네이버 로그인</span>
						</td>
						<td width="50%" id="apple_login" class="login_box apple_log pl-2">
							<img class="login_img" src="<%= ctxPath%>/images/apple_login.png"/>
							<span class="apple_log align-middle">Apple 로그인</span>
						</td>
					</tr> --%>
					<tr>
						<td colspan="4" style="padding-top:20px;"><input id="loginUserid" name="userid" class="login_input" type="text" placeholder="아이디" style="border-bottom: solid 1px black"/></td>
					</tr>
					<tr>
						<td colspan="4"><input id="loginPwd" name="pwd" class="login_input" type="password" placeholder="비밀번호" style="border-bottom: solid 1px black"/></td>
					</tr>
					<tr>
						<td>
							<input type="checkbox" id="saveid" name="saveid" class="agree_chx">
							<label for="saveid" class="description_text">아이디 저장</label>
						</td>
					</tr>
					<tr>
						<td colspan="4" style="padding-top:20px;"><button type="button" id="login_button" class="black" style="width:100%">로그인</button></td>
					</tr>
					<tr>
						<td colspan="4"><button type="button" id="register_button" class="white" style="width:100%;">회원가입</button></td>
					</tr>
					<tr>
						<td class="description_text" colspan="4"> <span id="login_idfind" style="cursor:pointer;">아이디찾기</span><span class="mx-2">|</span><span id="login_pwdfind"  style="cursor:pointer;">비밀번호찾기</span></td>
					</tr>
					<tr>
						<td colspan="5" style="padding-bottom:100px;">이벤트이미지로고삽입</td>
					</tr>
					
				</table>
			</div>
			
		
		<div class="col-4"></div>
	</div>
  </form>
	
</div>

<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>