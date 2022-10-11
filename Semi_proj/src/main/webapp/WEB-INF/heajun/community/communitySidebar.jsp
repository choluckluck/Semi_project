<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%
    String ctxPath = request.getContextPath();
%>
   
<div id="sidebar" class="col-2 pl-5 ml-2">
	<div id="sidebar_community" style="font-weight: bold; font-size:20px;">고객센터</div>
	<br><br>
	<div id="sidebar_notice"  style="color:gray; font-size:13pt;  href="<%=ctxPath%>/heajun/community/notice.sue">notice</div>
	<hr style="margin-top: 125px;">
	<div class="sidebar_info" style="font-size:9pt;" ><span class="font-weight-bold">평일</span>10:00 - 18:00 / <span class="font-weight-bold">점심</span>12:00-13:00</div>
	<div class="sidebar_info" style="font-size:9pt;"><span class="font-weight-bold">주말, 공휴일 휴무</span></div>
</div>