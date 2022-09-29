<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	form[name='productList_search_form']{
		float:right;
	}
	
	
	#product_search{
		border: none;
		border-bottom: solid 1px black;
		font-size: 10pt;
	}
	
	#admin_productList_sort{
		border: solid 1px #d9d9d9;
		height: 30px;
		font-size: 10pt;
	}
	
	.admin_productList_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom: solid 1px black;
	}
	
	.admin_productList_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#admin_productList_btn{
		float: right;
		width:150px;
		height:40px;
	}
</style>

<script>
	$(document).ready(function(){
		/* //product_search 입력박스는 처음에 안보이게 한다
		$("input#product_search").hide();
		
		//product_search는 btn 클릭시 보이게 한다
		$("button#product_search_btn").click(function(){
			const input_text = $("input#product_search").val().trim();
			if(input_text == ""){ //product_search의 input값이 비어있을때, 즉 문서 로딩시 검색버튼을 클릭을 했을 때
				$("input#product_search").toggle();
			}
			else if (input_text != ""){ //product_search에 값을 입력했을 때, 즉 검색 값을 입력했을 때
				// input#product_search 값을 submit한다
			}
		});//end of $("button#header_search_btn").click */
		
		
	});

	function product_revise(){
		// 나의 정보 수정하기 팝업창 띄우기
		const url = "<%= ctxPath%>/hyerin/admin/adminProductEdit.sue";
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "productEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
	};
	
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="productList">
			<div style="font-weight:bold;">
				<span class="mr-3" style="font-size:20pt;">상품목록</span>
				<span id="productList_sort">
					<select id="admin_productList_sort">
						<option value="latest" selected>최신순</option>
						<option value="order_quantity">주문수</option>
						<option value="product_kind">상품종류</option>
					</select>
				</span>
				<form name="productList_search_form" class="mt-2" style="display:inline-block;">
					<input type="text" id="product_search" name="product_search" placeholder="상품명으로 검색"/>
					<button type="button" id="product_search_btn" name="product_search_btn" style="border:none; background-color: transparent;">
						<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
					</button>
				</form>
			</div>
			<form name="admin_productList_frm">
				<table id="admin_productList" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
					<thead>
						<tr>
							<th width="5%" height="50px" class="admin_productList_th text-center"><input type="checkbox" id="productAll" name="productList_chx"/></th>
							<th width="10%" height="50px" class="admin_productList_th text-center">No</th>
							<th width="10%" class="admin_productList_th text-center">상품 종류</th>
							<th width="15%" class="admin_productList_th text-center">상품 이미지</th>
							<th width="15%" class="admin_productList_th text-center" >상품명</th>
							<th width="10%" class="admin_productList_th text-center" >상품 가격</th>
							<th width="10%" class="admin_productList_th text-center" >상품 수량</th>
							<th width="5%" class="admin_productList_th text-center" >메인노출</th>
							<th width="5%" class="admin_productList_th text-center" >수정</th>
							<th width="5%" class="admin_productList_th text-center" >삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td height="160px" class="admin_productList_tbody text-center"><input type="checkbox" id="product_1" name="productList_chx"/></td>
							<td height="160px" class="admin_productList_tbody text-center">!상품코드</td>
							<td class="text-center admin_productList_tbody">!상품 분류</td>
							<td class="text-center admin_productList_tbody"><img id="admin_product_img_1" height="150px" src="<%= ctxPath%>/images/hyerin/best_img_3.jpg"></td>
							<td class="text-center admin_productList_tbody">!상품명</td>
							<td class="text-center admin_productList_tbody">!상품 가격</td>
							<td class="text-center admin_productList_tbody">!상품 수량</td>
							<td class="text-center admin_productList_tbody"><input type="checkbox" id="mdPick_chx" name="mdPick_chx"/></td>
							<td class="text-center admin_productList_tbody"><button id="admin_productRevise_btn" type="button" class="white" style="height:30px; width:80%;" onclick="product_revise();">수정</button></td>
							<td class="text-center admin_productList_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="height:30px; width:80%;">삭제</button></td>
						</tr>
						<tr>
							<td height="160px" class="admin_productList_tbody text-center"><input type="checkbox" id="product_2" name="productList_chx"/></td>
							<td height="160px" class="admin_productList_tbody text-center">!상품코드</td>
							<td class="text-center admin_productList_tbody">!상품 분류</td>
							<td class="text-center admin_productList_tbody"><img id="admin_product_img_2" height="150px" src="<%= ctxPath%>/images/hyerin/best_img_2.jpg"></td>
							<td class="text-center admin_productList_tbody">!상품명</td>
							<td class="text-center admin_productList_tbody">!상품 가격</td>
							<td class="text-center admin_productList_tbody">!상품 수량</td>
							<td class="text-center admin_productList_tbody"><input type="checkbox" id="mdPick_chx" name="mdPick_chx"/></td>
							<td class="text-center admin_productList_tbody"><button id="admin_productRevise_btn" type="button" class="white" style="height:30px; width:80%;" onclick="product_revise();">수정</button></td>
							<td class="text-center admin_productList_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="height:30px; width:80%;">삭제</button></td>
						</tr>
					</tbody>
				</table>
				<div class="mt-3">
					<span><button type="button" id="" class="white" style="height:30px;">선택노출/숨김</button></span>
					<span><button type="button" id="" class="black" style="height:30px;">선택삭제</button></span>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>