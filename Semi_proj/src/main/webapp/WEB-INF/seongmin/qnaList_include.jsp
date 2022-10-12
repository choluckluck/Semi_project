<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<style type="text/css">

  table {
  	border-top : solid 1px gray;
  	width:80%;
  }
</style>


		<h3 style="margin-top:1px;">문의내역 관리</h3>
		<br><br>
		
	
		<br><br>		
		
		  <table class="table table" style="text-align:left; width:90%">
			<colgroup>
				<col style="width:70px;">
				<col style="width:70px;">
				<col style="width:250px;">
				<col style="width:84px;">
				<col style="width:80px;">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">

			<c:choose>
				<c:when test="${not empty requestScope.qnaList}">					
					<c:forEach var="qvo" items="${requestScope.qnaList}" varStatus="status">
						
						<tr>
							<td>${qvo.rnum}</td>
							<td>${qvo.category}</td>
							<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">${qvo.subject}</button></td>
							<td>${sessionScope.loginuser.name }</td>
							<td>${qvo.registerday}</td>
						</tr>
					</c:forEach>
				</c:when>				
				<c:otherwise>
							<tr>
								<td colspan="6">문의 내역이 없습니다.</td>
							</tr>
				</c:otherwise>
			</c:choose>				
		    </tbody>
		  </table>
	   		  <nav class="my-5">
			<div style="display: flex; width: 80%">
				<ul class="pagination" style="margin: auto">${requestScope.pageBar1}</ul>
			</div>
		  </nav>
		      