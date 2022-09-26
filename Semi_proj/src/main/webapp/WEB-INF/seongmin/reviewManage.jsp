<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String ctxPath = request.getContextPath();
    	// ctxPath ==> /JSPServletBegin
	
     %>

</style>
<jsp:include page="../hyerin/header.jsp"></jsp:include>
<jsp:include page="sideMenu.jsp" />

	   <div class="col-10">

		<br><br>
		<h5>리뷰&문의 내역 관리</h5>
		<br><br>
		
		

		  <h6 style="display:inline">분류 선택</h6>
		    <select id="" name="" onchange="">
			  <option value="">작성 일자별</option>
			  <option value="">분류별</option>
		    </select>		
			
			
		
		
	
		<br><br>		
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:70px;">
				<col style="width:135px;">
				<col style="width:300px;">
				<col style="width:84px;">
				<col style="width:80px;">
				<col style="width:55px;">
			</colgroup>
			<thead>
  			  <tr>
				<th scope="col">번호</th>
				<th scope="col">분류</th>
				<th scope="col">제목</th>
				<th scope="col">작성자</th>
				<th scope="col">작성일</th>
				<th scope="col">조회</th>
			  </tr>
			</thead>
			
			
			<tbody style="font-size:12pt; height:40px;">
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_re.gif" alt="답변" class="">&nbsp;&nbsp;<img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>
				
				<tr>
					<td>1</td>
					<td>문의하기</td>
					<td style="text-align:left;"><img src="http://img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_lock.gif"  class="">	    <button type="button" class="" style="border:none; background-color: white;">상품문의</button></td>
					<td>김*****</td>
					<td>2022-09-14</td>
					<td>8</td>
				</tr>				
		    </tbody>
		  </table>
	      
	      <br>

  <div style=" display: grid; place-items: center;">
    <div style="inline">
    
	    <button type="button" class="btn btn-white"> << </button>
	    <button type="button" class="btn btn-white"><</button>
	    <button type="button" class="btn btn-outline-secondary">1</button>
	    <button type="button" class="btn btn-outline-secondary">2</button>
	    <button type="button" class="btn btn-outline-secondary">3</button>
	    <button type="button" class="btn btn-white">></button>
	    <button type="button" class="btn btn-white">>></button>
	</div>
  </div>
	   <br><br>

	




	   
	   </div>
     </div>
   </div>
	
<jsp:include page="../hyerin/footer.jsp"></jsp:include>
	
  </body>
</html>