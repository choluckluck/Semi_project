<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
    String ctxPath = request.getContextPath();
%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		$("button#btnUpdate").click(function(){
			const pwd = $("input#pwd").val();
			const pwd2 = $("input#pwd2").val();
			
			//const regExp = /^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g;
			// 또는
			const regExp = new RegExp(/^.*(?=^.{8,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9]).*$/g);
			// 숫자/문자/특수문자 포함 형태의 8~15자리 이내의 암호 정규표현식 객체 생성
			
			const bool = regExp.test(pwd);
			
			if(!bool){ //정규표현식에 맞지 않는 경우
				alert("암호는 8글자 이상 15글자 이하에 영문자,숫자,특수기호가 혼합되어야만 합니다.");
				$("input#pwd").val("");
				$("input#pwd2").val("");
				return; //함수 종료
			}
			else if(bool && pwd != pwd2){ //정규표현식은 맞지만 암호와 암호확인이 같지 않은 경우
				alert("암호가 일치하지 않습니다.");
				$("input#pwd").val("");
				$("input#pwd2").val("");
				return; //함수 종료
			}
			else{
				const frm = document.pwdUpdateRealEndFrm;
				frm.action = "<%= ctxPath%>/hyerin/login/pwdUpdateRealEnd.sue"; 
				frm.method = "post";
				frm.submit();
			}
			
		});
	}); //end of ready

</script>

<form name="pwdUpdateRealEndFrm">

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-4"></div>
	<div class="col-4">
		<table class="container mb-5">
			<tr>
				<td colspan="4" id="pwdfind_text" class="pb-2">
				<div>비밀번호 변경하기</div>
				<div style="font-weight:normal; font-size:11pt;"> 새롭게 이용할 비밀번호를 입력해 주세요. </div>
				</td>
			</tr>
			<tr>
				<td><hr width="100%"></td>
			</tr>
			<tr>
				<td>
					<div class="mt-4">
						<span align="center">새암호</span><br/> 
		   				<input type="password" class="newpwd_input_text" name="pwd" id="pwd" placeholder="비밀번호 입력" required />
					</div>
					
					<div class="mt-3">
					   <span>새암호확인</span><br/>
					   <input type="password" class="newpwd_input_text"  id="pwd2" placeholder="비밀번호 재입력" required />
					</div>
	
					<input type="hidden" name="userid" value="${requestScope.userid}"/>
				</td>
			</tr>
			<tr>
				<td class="pt-5">
				<button type="button" id="btnUpdate" class="black w-100">암호 변경하기</button>
				</td>
			</tr>
<%-- 					<c:if test="${requestScope.method == 'POST' && requestScope.n == 1}">
						<div id="div_updateResult" align="center">
							사용자 ID ${requestScope.userid}님의 암호가 새로이 변경되었습니다.<br>
						</div>
					</c:if> --%>

		</table>
	</div>	
 
	</div>

</form>

<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>
