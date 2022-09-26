<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    	String ctxPath = request.getContextPath();
    	// ctxPath ==> /JSPServletBegin
	
     %>
<jsp:include page="../hyerin/header.jsp"></jsp:include>

<jsp:include page="sideMenu.jsp" />

	   <div class="col-10">

		<br><br>
		<h5>Address</h5>
		<br><br>
		
		  <table class="table table" style="text-align:center; width:90%">
			<colgroup>
				<col style="width:60px">
				<col style="width:120px">
				<col style="width:120px">
				<col style="width:120px">
				<col style="width:160px">
				<col style="width:160px">
				<col style="width:auto">
				<col style="width:76px">
			</colgroup>
			<thead>
			  <tr>
				<th scope="col">
				<span class="">
				<input id="allCheck" onclick="myshopAddr.checkAll(this)" value="" type="checkbox">
				</span>
				</th>
				<th scope="col">주소록 고정</th>
				<th scope="col">배송지명</th>
				<th scope="col">수령인</th>
				<th scope="col">일반전화</th>
				<th scope="col">휴대전화</th>
				<th scope="col">주소</th>
				<th scope="col">수정</th>
			  </tr>
			</thead>
					
			<tbody>
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
				<tr class="">
					<td><input type="checkbox" name="" value="" ></td>
					<td>
					  <button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999"><span class="">해제</span><span class="">고정</span></button>
					</td>
					<td>
					  <span class="bt-sm orange displaynone">기본</span><span>미지정</span>
					</td>
					<td><span>하하</span></td>
					<td><span>031-0000-0001</span></td>
					<td><span>010-1111-1111</span></td>
					<td class="" style="text-align:left;">(<span>06241</span>) <span>서울특별시 강남구 역삼동 826</span> <span>소만마을 1005호</span></td>
					<td><button type="button" style="border:solid 1px #d8d8d8; background-color: #f8f8f8; color:#999999">수정</a></button>
				</tr>
					
	
		    </tbody>
		  </table>
			<br>
			
		  <div style="width:85%; display: grid; place-items: center;">
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
		  
		  	      
	      
		<div class="row" style="width:90%;">
			<div class="col-2" style="border:solid 1px gray; font-size:15pt; display: flex; align-items: center; justify-content: center;">
			<button type="button" style="width: 200px; height:40px; border:none; background-color:white; font-size:12pt; color:gray; text-align:center;">선택 주소록 삭제</button>
			</div>
	
	
			<div class="col-2" style="border:solid 1px #172a41; background-color: #172a41; color: white; margin-left:700px; display: flex; align-items: center; justify-content: center;">
			<button type="button" style="width: 200px; height:40px; border:none; background-color:#172a41; font-size:12pt; color:white; text-align:center;">배송지 등록</button>
			</div>
		</div>
		
		<br><br>



		  <br><br>
	   



	   
	   </div>
     </div>
   </div>
	<jsp:include page="../hyerin/footer.jsp"></jsp:include>
	
  </body>
</html>