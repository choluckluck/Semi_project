<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	form[name='productList_search_form']{
		float:right;
	}
	
	
	#searchword{
		border: none;
		border-bottom: solid 1px black;
		font-size: 10pt;
	}
	
	.productSort {
		border: solid 1px #d9d9d9;
		height: 30px;
		font-size: 10pt;
	}
	
	.productSortDetail{
		border: solid 1px #d9d9d9;
		height: 25px;
		font-size: 10pt;
		float: top;
	
	}
	
	.admin_productList_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom: solid 1px black;
	}
	
	.admin_productList_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	
	
	#productSearch_btn{
		float: right;
		width:150px;
		height:40px;
	}
</style>

<script>
	$(document).ready(function(){
		
		
		selectProduct();
		
		$("#byKind").change(function(){
			$("#searchword").val("");
			selectProduct();
		});
		
		$("#searchword").keyup(function(e){
			if(e.keyCode == 13){
				selectProduct();
			}
		});
		
		
		$("#product_search_btn").click(function(){
			selectProduct();
		})
		
		
	});//end of ready
	
	/////////////////////////////////////////////////////////////////////////////////////////////////
	
	//function declarartion
	function selectProduct(num){
		
		window.scrollTo(0,0);
		$("#chxAll").prop("checked",false);
		
		$("#productList_content").empty();
		$("#pageBar").empty();
		var productSortJson = $("#byKind").val();
		var searchwordJson = $("#searchword").val();
		
		var currentShowPageNoJson = num;
		$("#currentPage").val(currentShowPageNoJson); // 페이지 바꿔주기
		
		$.ajax({
			url : "<%=request.getContextPath()%>/hyerin/admin/adminProductListJson.sue",
			type: "get",
			data:{"prodSortbyKind":productSortJson,
				  "searchword":searchwordJson,
				  "currentShowPageNo":currentShowPageNoJson},
			dataType:"JSON",
			success:function(json){
				
				console.log(json);
				let html = '';
				//첫화면이거나 조회된 상품정보가 있는 경우
				if ( json.length > 1 ){
					//상품정보 조회해오기
					$.each(json, function(index, item){
						if(index == 0){
							$("#pageBar").html(item.pageBar);
						}
						else{
							
							html += '<tr>'+
										'<td height="160px" class="admin_productList_tbody text-center"><input type="checkbox" id="'+item.prod_code+'_chx" class="check" name="productList_chx" value="'+item.prod_code+'"/></td>'+
										'<td height="160px" class="admin_productList_tbody text-center">'+item.prod_code+'</td>'+
										'<td class="text-center admin_productList_tbody">'+item.prod_kind+'</td>'+
										'<td class="text-center admin_productList_tbody"><img id="admin_product_img_1" height="150px" src="/Semi_proj/images/product/'+item.prod_image+'"/></td>'+
										'<td class="text-center admin_productList_tbody">'+item.prod_name+'</td>'+
										'<td class="text-center admin_productList_tbody">'+Number(item.prod_price).toLocaleString('en')+'원</td>'+
										'<td class="text-center admin_productList_tbody">'+Number(item.prod_saleprice).toLocaleString('en')+'원</td>';
							
							//색상 디테일이 있는 경우
							if(item.prod_color != null){
								//prod_color => ,로 잘라서 배열에 담아주기
								var prod_color = item.prod_color;
								var prod_colorList = prod_color.split(",");
								
								var colorHtml = '';
								for(var value of prod_colorList){
									colorHtml += '<option value="'+value+'">'+value+'</option>';
								}
								
								html += '<td class="text-center admin_productList_tbody">'+
												'<div><select id="color_'+item.prod_code+'" class="productSortDetail prod_color_select">'+
												'<option value="prod_color" selected>색상</option>'+
													colorHtml + 
												'</select></div>'+
											'<div><select id="size_'+item.prod_code+'" class="productSortDetail prod_size_select mt-1">'+
												'<option value="prod_size" selected>사이즈</option>'+
											'</select></div>'+
											'<div id="stock_'+item.prod_code+'" class="mt-1"></div>';
							}
							else {
								html += '<td class="text-center admin_productList_tbody">정보없음</td>';
							}
							
							
							var chxhtml = '';
							//md_pick 보여주기
							
							if(item.md_pick_yn == "Y"){
								chxhtml = '<td class="text-center admin_productList_tbody"><input type="checkbox" id="'+item.prod_code+'" name="'+item.prod_code+'" checked disabled/></td>';
							}
							else{
								chxhtml = '<td class="text-center admin_productList_tbody"><input type="checkbox" id="'+item.prod_code+'" name="'+item.prod_code+'" disabled/></td>';
							}
							
							
							html += chxhtml +
									'<td class="text-center admin_productList_tbody"><button id="admin_productedit_btn" type="button" class="white" style="height:30px; width:80%;" onclick="product_edit(\''+item.prod_code+'\');">수정</button></td>'+
									'<td class="text-center admin_productList_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="height:30px; width:80%;" onclick="product_delete(\''+item.prod_code+'\')">삭제</button></td>'+
								'</tr>';
									
						}
						
					});//end of $.each
					
					
					//조회해온 상품정보를 테이블에 추가해주기
					$("#productList_content").append(html);
					
					
					//체크박스 하나라도 해제되면 전체 해제되게 만들기
					$(".check").click(function(){
					   var bFlag = false;
					   $(".check").each(function(){
					      var bChecked = $(this).prop("checked");
					      if(!bChecked) {
					         $("#chxAll").prop("checked",false);
					         bFlag = true;
					         return false;
					      }
					   });
					   
					   if(!bFlag) {
					      $("#chxAll").prop("checked",true);
					   }
					   
					});//end of $(".check").click
					
					
					//체크박스 체크 이벤트
					$("#chxAll").click(function(){
						var bool = $(this).is(":checked");
						$(".check").prop("checked", bool);
					});
					
					
					//컬러셀렉트 체인지이벤트
					$(".prod_color_select").change(function(e){
						var selectedProdcode = $(this).attr('id').substr(6);
						var selectedColor = $(this).val();
						var sizeselecthtml = $(this).parent().parent().find("select.prod_size_select");
						
						$("#stock_"+selectedProdcode).empty();
						
						if($(this).val() != "prod_color"){
							sizeselecthtml.empty();						
							goSelectSize(selectedProdcode, selectedColor);
						}
						else{
							sizeselecthtml.empty();
							sizeselecthtml.append('<option value="prod_size" selected>사이즈</option>');
						}
					});
					
					//사이즈셀렉트 체인지이벤트
					$(".prod_size_select").change(function(e){
						var selectedProdcode = $(this).attr('id').substr(5);
						var selectedColor = $("#color_"+selectedProdcode).val();
						var selectedSize = $(this).val();
						
						if(selectedSize == "prod_size"){
							$("#stock_"+selectedProdcode).empty();
						}
						
						if(selectedSize != "prod_size"){
							goSelectStock(selectedProdcode, selectedColor, selectedSize);
						}
						
					});
					
					
				}//end of if
				
				// 조회된 상품정보가 없을 경우
				else if (json.length == 1){
					html += '<tr><td colspan="11">조회된 상품정보가 없습니다.</td></tr>';
					$("#productList_content").html(html);
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});// end of ajax
		
	}//end of selectBySort
	
	
	////////////////////////////////////////////////////////////////////////
	
	
	
	//사이즈를 알아오는 에이젝스
	function goSelectSize(pcode, pcolor){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/hyerin/admin/adminProductListSizeJson.sue",
			type: "get",
			data:{"pcode":pcode,
				  "pcolor":pcolor},
			dataType:"JSON",
			success:function(json2){
				
				if(json2.length > 0){

					var sizehtml = '<option value="prod_size" selected>사이즈</option>';
					$.each(json2, function(index, item){
						sizehtml += '<option value="'+item.psize+'">'+item.psize+'</option>';
					});//end of $.each
					
					// 해당 컬러의 사이즈 옵션값을 넣어준다
					$("#size_"+pcode).append(sizehtml);
					
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});// end of ajax
				
	}//end of goSelectSize;
	
	
	//재고를 알아오는 ajax
	function goSelectStock(p_code, p_color, p_size){
		
		$.ajax({
			url : "<%=request.getContextPath()%>/hyerin/admin/adminProductListStockJson.sue",
			type: "get",
			data:{"p_code":p_code,
				  "p_color":p_color,
				  "p_size":p_size},
			dataType:"JSON",
			success:function(json3){
				
				var stock = json3.p_stock;
				// 해당 컬러의 사이즈 옵션값을 넣어준다
				$("#stock_"+p_code).html(stock+"개");
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
		});// end of ajax
		
	}//end of goSelectStock
	
	
	
	var popup;	
	//상품정보를 수정하는 팝업창 띄우는 함수
	function product_edit(prod_code){
		// 상품정보 수정하기 팝업창 띄우기
		const currPageNo = $("#currentPage").val();
		const url = "<%= ctxPath%>/hyerin/admin/adminProductEdit.sue?prod_code="+prod_code+"&currPageNo="+currPageNo;
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		popup = window.open(url, "productEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
		
		//팝업창이 닫히면 부모창을 새로고침해준다
		popup.addEventListener('beforeunload', function() {
			selectProduct(currPageNo);
			
			
		});
		
		
	};//end of product_edit
	
	
	
	// 상품을 삭제하는 함수
	function product_delete(prod_code){
		if(confirm("상품번호 " + prod_code + "를 삭제하시겠습니까?") == true){
			//비동기방식으로 prod_code에 해당하는 상품을 삭제하기
			$.ajax({
				url : "<%= ctxPath%>/hyerin/admin/adminProductDelete.sue?prod_code="+prod_code,
				type: "get",
				data:{"prod_code":prod_code},
				dataType:"JSON",
				success:function(json){
					
					alert(json.message);
					selectProduct($("#currentPage").val());
					
				},
				
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});// end of ajax
			
		} else{
			return false;
		}
	}
	
	//선택된 상품들을 모두 삭제하는 함수
	function product_deleteMulti(){
		const checkCnt = $("input:checkbox[name='productList_chx']:checked").length;
		 if(checkCnt < 1){
			 alert("삭제할 상품을 선택해주세요.");
			 return;
		 }
		 else{
			
			const allCnt = $("input:checkbox[name='productList_chx']").length;
			const prod_codeArr = new Array();
			
			for(var i=0; i<allCnt; i++){
			 
				if($("input:checkbox[name='productList_chx']").eq(i).is(":checked")){
					prod_codeArr.push( $("input:checkbox[name='productList_chx']").eq(i).val() );
				}
			}//end of for
			
			const prod_codeJoin = prod_codeArr.join();
			//console.log(prod_codeJoin);
			
			const bool = confirm("상품코드 " + prod_codeJoin + "을 모두 삭제하시겠습니까?");
			if(bool){
				
				$.ajax({
					url : "<%= ctxPath%>/hyerin/admin/adminProductDelete.sue",
					type : "post",
					data : {"prod_codeJoin" : prod_codeJoin},
					dataType : "json",
					success : function(json){
						alert(json.message);
						selectProduct($("#currentPage").val());
					},
					error : function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
					
					
				});//end of ajax
				
			}
			
			 
		 }
	}//end of product_deleteMulti
	
	
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		
		<div id="productList">
			<div style="font-weight:bold;" class="mt-1">
				<form name="prodSelectFrm" onsubmit="return false">
					<span class="mr-3" style="font-size:20pt;">상품목록</span>
					<%-- 
					<span class="mr-1">
						<select id="byRegisterdayOrders" name="byRegisterdayOrders" class="productSort">
							<option value="latest" selected>최신순</option>
							<option value="orders">주문수</option>
						</select>
					</span>
					 --%>
					<span>
						<select id="byKind" name="byKind" class="productSort">
							<option value="product_kind" selected>상품종류별</option>
							<option value="flat">플랫</option>
							<option value="loafer">로퍼</option>
							<option value="pumps">펌프스</option>
							<option value="ankle">앵클</option>
							<option value="boots">부츠</option>
							<option value="sneakers">스니커즈</option>
							<option value="slingback">슬링백</option>
							<option value="mule">뮬</option>
						</select>
					</span>
					<span id="productSearch" style="float:right;" class="mt-3">
						<span><input type="text" id="searchword" name="searchword" placeholder="상품명으로 검색"/></span>
						<span><button type="button" id="product_search_btn" style="border:none; background-color: transparent;">
							<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
						</button></span>
					</span>
				</form>
			</div>
			<form name="admin_productList_frm">
				<table id="admin_productList" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
					<thead>
						<tr>
							<th width="5%" height="50px" class="admin_productList_th text-center"><input type="checkbox" id="chxAll" name=""/></th>
							<th width="10%" height="50px" class="admin_productList_th text-center">No</th>
							<th width="5%" class="admin_productList_th text-center">상품 종류</th>
							<th width="15%" class="admin_productList_th text-center">상품 이미지</th>
							<th width="10%" class="admin_productList_th text-center" >상품명</th>
							<th width="10%" class="admin_productList_th text-center" >정상가</th>
							<th width="10%" class="admin_productList_th text-center" >판매가</th>
							<th width="10%" class="admin_productList_th text-center" >재고 수량</th>
							<th width="5%" class="admin_productList_th text-center" >메인노출</th>
							<th width="5%" class="admin_productList_th text-center" >수정</th>
							<th width="5%" class="admin_productList_th text-center" >삭제</th>
						</tr>
					</thead>
					<tbody id="productList_content">
					</tbody>
				</table>
				<div class="mt-3">
					<span><button type="button" id="" class="black" style="height:30px;" onclick="product_deleteMulti();">선택삭제</button></span>
				</div>
			</form>
			<nav aria-label="Page navigation">
			  <ul id="pageBar" class="pagination justify-content-center pagination-sm my-5">
			  	
			  </ul>
			</nav>
			<input type="hidden" id="currentPage" value=""/>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>