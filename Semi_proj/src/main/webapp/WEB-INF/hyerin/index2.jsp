<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    


<script type="text/javascript">

	var member = "${sessionScope.loginuser}";

	function goLogOut() {
		alert("로그아웃.");
		// 로그아웃을 처리해주는 페이지로 이동
		location.href="<%= request.getContextPath()%>/hyerin/login/logout.sue";
		
	}// end of function goLogOut()-------------------------- 


</script>

		<%-- login information --%>
<div id="header_login_container" align="right" class="mt-3 pl-3 pr-3">
		
	<c:choose>
		<c:when test="${empty sessionScope.loginuser}">
			<span><a class="mx-2" href="<%= request.getContextPath()%>/hyerin/login/login.sue" style="text-decoration:none; font-size:10pt; color: gray;">로그인</a></span> 
 			<span><a class="mx-2" href="<%= request.getContextPath()%>/hyerin/member/agreement.sue" style="text-decoration:none; font-size:10pt; color: gray;">회원가입</a></span>
			<span><a class="mx-2"href="#" style="text-decoration:none; font-size:10pt; color: gray;">고객센터</a></span>
    	</c:when>
    	<c:otherwise>
			<span style="text-decoration:none; font-size:10pt; color: gray;">${sessionScope.loginuser.name} 님 환영합니다.</span> 
			<span><a class="mx-2" onclick="goLogOut();" style="cursor:pointer; text-decoration:none; font-size:10pt; color: gray;">로그아웃</a></span>
			<span><a class="mx-2"href="#" style="text-decoration:none; font-size:10pt; color: gray;">고객센터</a></span>
    	</c:otherwise>
    </c:choose>	
		</div>