<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
 
 
<script>
	
	
	function Loginalert(){
		alert("로그인이 필요한 페이지입니다. 로그인을 해주세요.");
		
	}
	
	
</script>    
    <%-- 마이페이지 --%>
  	<c:choose>
		<c:when test="${not empty sessionScope.loginuser}">   
			<a href="<%= request.getContextPath()%>/seongmin/member/mypage_Main.sue" class="header_search_contents" style="margin-right: 20px;"><img src="<%= request.getContextPath()%>/images/hyerin/user_icon.png" width="25px" /></a>
    	</c:when>
    		
    	<c:otherwise>
    		<a href="<%= request.getContextPath()%>/hyerin/login/login.sue" class="header_search_contents" style="margin-right: 20px;"><img src="<%= request.getContextPath()%>/images/hyerin/user_icon.png" onclick="Loginalert()" width="25px" /></a>
    	</c:otherwise>
    </c:choose>	


			<%-- 장바구니 --%>
  	<c:choose>
		<c:when test="${not empty sessionScope.loginuser}">   
			<a href="<%= request.getContextPath()%>/jihee/bag/bag.sue" class="header_search_contents"><img src="<%= request.getContextPath()%>/images/hyerin/cart.png" width="30px" /></a>
    	</c:when>
    		
    	<c:otherwise>
			<a href="<%= request.getContextPath()%>/hyerin/login/login.sue" class="header_search_contents"><img src="<%= request.getContextPath()%>/images/hyerin/cart.png" width="30px" onclick="Loginalert()" /></a>
    	</c:otherwise>
    </c:choose>	





    
