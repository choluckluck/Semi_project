<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){

		//인증하기
        $("button#btnConfirmCode").click(function(){
       	const frm = document.verifyCertificationFrm;
       	frm.userCertificationCode.value = $("#input_confirmCode").val();
 
       	frm.action = "<%= ctxPath%>/hyerin/login/verifyCertification.sue";
       	frm.method = "post";
       	frm.submit();
        });
		
		// 다시 조회하기
        $("button#searhBack").click(function(){
        	location.href="<%= ctxPath%>/hyerin/login/pwdFind.sue";
		});
	});
</script>

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-4"></div>
	<div class="col-4">
		<table id="idfindResult_table" class="container mb-5">
			<tr>
				<td colspan="4" id="idfind_text" class="pb-2">
					<div>비밀번호 찾기</div>
					<c:choose>
						<c:when test="${requestScope.isUserExist eq false}">
						<div style="font-weight:normal; font-size:11pt;"> 해당 정보로 조회된 고객 정보가 없습니다.</div>
						</c:when>
						<c:otherwise>
						<div style="font-weight:normal; font-size:11pt;">저희 쇼핑물을 이용해주셔서 감사합니다.</div>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td><hr width="100%"></td>
			</tr>
			<tr>
				<c:choose>
					<c:when test="${requestScope.isUserExist eq false}">	
					<td class="pt-1 pb-4">
						<div>조회 이름: ${requestScope.name}</div>
						<div>조회 아이디: ${requestScope.userid}</div>
						<div>조회 이메일: ${requestScope.email}</div>		
					<tr>
					<td colspan="5" class="pt-2"><button type="button" id="searhBack" class="black w-100">다시 조회하기</button></td>
					</tr></td>	
					</c:when>
					<c:otherwise>
					<td class="pt-1 pb-4">
						<div>${requestScope.userid}회원님, 임시 비밀번호 설정을 위한 인증코드를</div>
						<div>${requestScope.email}으로 보내드렸습니다.</div>
						<input type="text" name="input_confirmCode" id="input_confirmCode" class="mt-3 mr-2" required />
						<br><br>
						<button type="button" class="btn btn-info text-center" id="btnConfirmCode" font-size:15px;">인증하기</button>
					</td>
					</c:otherwise>
				</c:choose>
			</tr>
			
			<%-- user는 존재하지만 메일이 제대로 전송되지 못한 경우 --%>
			<c:if test="${requestScope.isUserExist eq true && requestScope.sendMailSuccess == false}">
            <tr>
            	<span style="font-size: 10pt; color: red;">메일 발송이 실패하였습니다.</span><br>
        	</tr>
        	</c:if>
				
		</table>
	</div>	

<%-- 인증하기 form --%>
<form name="verifyCertificationFrm">
	<input type="hidden" name="userid" value="${requestScope.userid}"/>
	<input type="hidden" name="userCertificationCode"/>
</form>

</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>