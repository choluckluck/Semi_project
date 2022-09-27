<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
    
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		
		//로그인 버튼 클릭이벤트
		$("button#login_button").click(function(){
<<<<<<< HEAD
			goLogin(); //로그인 시도
			
		});
		$("input#logininput_pwd").bind("keydown", function(event){
			if(event.keyCode == 13) { // 암호입력란에 엔터를 했을 경우 
				goLogin(); // 로그인 시도한다.
			}
=======
			location.href="<%= ctxPath%>/main.sue";
>>>>>>> branch 'main' of https://github.com/choluckluck/Semi_project.git
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
		
	});
	
	function goLogin(){
		//	alert("로그인 시도함");
		
			const loginUserid = $("input#logininput_id").val().trim();
		    const loginPwd = $("input#logininput_pwd").val().trim();
		    
		    if(loginUserid == "") {
		    	alert("아이디를 입력하세요!!");
		    	$("input#logininput_id").val("");
		    	$("input#logininput_id").focus();
		    	return; // goLogin() 함수 종료
		    }
		    
		    if(loginPwd == "") {
		    	alert("암호를 입력하세요!!");
		    	$("input#logininput_pwd").val("");
		    	$("input#logininput_pwd").focus();
		    	return; // goLogin() 함수 종료
		    }
		    
		    if( $("input:checkbox[id='id_save']").prop("checked") ){
		    	localStorage.setItem('id_save', $("input#logininput_id").val());	
		    }
		    else{
		    	localStorage.removeItem('id_save');
		    }
		    

		    
		    
	}
	
	
	
</script>

<div id="container" class="container-fluid">
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
					<td colspan="4" style="padding-top:20px;"><input id="logininput_id" class="login_input" type="text" placeholder="아이디" style="border-bottom: solid 1px black"/></td>
				</tr>
				<tr>
					<td colspan="4"><input id="logininput_pwd" class="login_input" type="password" placeholder="비밀번호" style="border-bottom: solid 1px black"/></td>
				</tr>
				<tr>
					<td>
						<input type="checkbox" id="id_save" name="id_save" class="agree_chx">
						<label for="id_save" class="description_text">아이디 저장</label>
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
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>