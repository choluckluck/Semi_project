<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//로그인버튼 클릭이벤트
		$("button#pwdfindResult_login").click(function(){
			location.href="<%= ctxPath%>/hyerin/login.sue";
		});
		
		
	});
	
</script>

<div id="registerwrite_container" class="container-fluid row mt-5">
	<div class="col-3"></div>
	<div class="col-6">
		<table id="idfindResult_table" class="container mb-5">
			<tr>
				<td colspan="4" id="idfind_text">
					<div>비밀번호 찾기</div>
					<div style="font-weight:normal; font-size:11pt;">임시 비밀번호가 고객님 메일로 전송되었습니다.</div>
				</td>
			</tr>
			<tr>
				<td><hr width="100%"></td>
			</tr>
			<tr>
				<td class="pt-1 pb-4">
					<div>저희 쇼핑물을 이용해주셔서 감사합니다.</div>
					<div>!아이디 회원님, 임시 비밀번호를</div>
					<div>!메일 으로 보내드렸습니다.</div>
					<div>즐거운 쇼핑 하세요!</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="pb-5"><button type="button" id="pwdfindResult_login" class="black w-100">로그인</button></td>
			</tr>
		</table>
	</div>
	<div class="col-3"></div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>