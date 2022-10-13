<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//로그인버튼 클릭이벤트
		$("button#idfindResult_login").click(function(){
			location.href="<%= ctxPath%>/hyerin/login/login.sue";	
		});
		
		//비밀번호찾기 버튼 클릭이벤트
		$("button#idfindResult_pwdfind").click(function(){
			location.href="<%= ctxPath%>/hyerin/login/pwdFind.sue";
		});
		
	});
	
</script>

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-3"></div>
	<div class="col-6">
		<table id="idfindResult_table" class="container mb-5">
			<tr>
				<td colspan="4" id="idfind_text">
					<div>아이디 찾기</div>
					<div style="font-weight:normal; font-size:11pt;">고객님 아이디 찾기가 완료되었습니다.</div>
				</td>
			</tr>
			<tr>
				<td><hr width="100%"></td>
			</tr>
			<tr>
				<td>
					<div>저희 쇼핑물을 이용해주셔서 감사합니다.</div>
					<div>아래 정보를 확인해 주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="pt-4 pb-4">
						<div class="registermember_infobox py-4 px-4">
							<table width="100%">
								<tr style="height:30px;">
									<td width="25%">이름</td>
									<td>${requestScope.name}</td>
								</tr>
								<tr style="height:30px;">
									<td>이메일</td>
									<td>${requestScope.email}</td>
								</tr>
								<c:choose>
									<c:when test= "${empty requestScope.userid}">
									<tr >
										<td colspan="2" width="100%" style="padding-top: 15px;">※ 입력하신 정보로 조회된 회원 정보가 없습니다. </td>
									</tr>
									</c:when>
									<c:otherwise>
									<tr style="height:30px;">
										<td colspan="2" style="padding-top: 15px;" >
											<span id="id_result_value" name="id_result_value" style="color:blue;"> 조회된 ID: ${requestScope.userid}</span>
											<!-- <span id="id_result_info" name="id_result_info">(!개인회원, !가입일자)</span> -->
										</td>
									</tr>
									</c:otherwise>
								</c:choose>
							</table>
						</div>
					</td>				
			</tr>
			<tr>
				<td colspan="2" class="pt-2 pb-2"><button type="button" id="idfindResult_login" class="black w-100">로그인</button></td>
			</tr>
			<tr>
				<td colspan="2" class="pb-3"><button type="button" id="idfindResult_pwdfind" class="white w-100">비밀번호 찾기</button></td>
			</tr>
		</table>
	</div>
	<div class="col-3"></div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>