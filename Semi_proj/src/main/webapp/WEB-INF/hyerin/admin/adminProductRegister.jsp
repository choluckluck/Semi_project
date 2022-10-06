<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	.option_input{
		border: solid 1px #d9d9d9;
		height: 30px;
		width: 150px;
	}
	
</style>

<script>
	$(document).ready(function(){
		$(".register_warning").hide();
		$(".register_approval").hide();
		
		// 재고수량에 스피너 달아주기
		$("input#spinnerPqty").spinner({
			  spin:function(event,ui){
					if(ui.value > 20) {
						$(this).spinner("value", 20);
						return false;
					}
					else if(ui.value < 0) {
						$(this).spinner("value", 0);
						return false;
					}
			  }
		});// end of $("input#spinnerPqty").spinner()
		
		  
		// 스피너 이벤트
		$("input#spinnerPqty").bind("spinstop", function() {
			let html = '';
			const cnt = $(this).val();
			const appnedVal = 
			
			html += '<tr>'+
					'<td>'+
						'<input type="checkbox" id="option'+cnt+'"/>'+
					'</td>'+
					'<td>'+
						'<input type="text" id="prod_color'+cnt+'" name="prod_color'+cnt+'" class="option_input"/>'+
					'</td>'+
					'<td>'+
						'<input type="text" id="prod_size'+cnt+'" name="prod_size'+cnt+'" class="option_input"/>'+
					'</td>'+
					'<td>'+
						'<input type="number" id="prod_stock'+cnt+'" name="prod_stock'+cnt+'" class="option_input prod_stock"/>'+
					'</td>'+
				'</tr>';
			  
			//옵션 일괄삭제하는 버튼 삽입
			let deleteAll = '<tr>' + 
									'<td colspan="6"><button type="button" class="black" style="width:70px; height:30px;">일괄삭제</button></td>' +
								'</tr>';
			  
			$("#option_contents").append(html);
			$("#option_contents").append(deleteAll);
			  
			if(cnt == 0){
				$("#option_contents").html("");
			}
			  
			$("input#attachCount").val(cnt);
			  
			  
			  
			// input#prod_stock 이벤트
			$("input.prod_stock").keyup(function(){
				if($(this).val() <0 ){
					$(this).val(0);
				} 
			});
			  
			$("input.prod_stock").change(function(){
				if($(this).val() <0 ){
					$(this).val(0);
				} 
				  
			});
			  
			 
		});//end of spinner spinstop
		

		
		// md_pick에 값을 넣어주기
		$("#md_pick_yn").change(function(){
			
			if($(this).is(":checked")){
				$("#md_pick_yn_check").val("Y");
			}
			else{
				$("#md_pick_yn_check").val("N");
			}
			
		});
		
		////////////////////////////////////////////////////////////////////
		
		// 필수입력사항 검사하기
		
		let kindflag = false;
		let nameflag = false;
		let decriptionflag = false;
		let highflag = false;
		let priceflag = false;
		let salepriceflag = false;
		let imageflag = false;
		let d_imageflag = false;
		let pointflag = false;
		
		// 상품종류 변경 이벤트 => 추가 선택시 텍스트인풋박스 뜨게함
		$("select#prod_kind").change(function(){
			
			if($(this).val()=="all" || $(this).val() == null){ //null이거나 all을 선택했을 때
				kindflag = true;
				$("#kind_warning").show();
			}
			else {
				$("#kind_warning").hide();
				if($(this).val()=="add"){
					
					addHtml = '<span><input type="text" id="addKind" name="addKind" class="register_input"/></span>';
					$(this).parent().append(addHtml);
				}
				else{
					$("input#addKind").remove();
				}
				
			}
		});//end of $("select#prod_kind").change
		
		
		//prod_name 입력검사
		$("#prod_name").blur(function(){
			
			if($(this).val().trim() == ""){
				nameflag = true;
				$("#name_warning").show();
			}
			else{
				$("#name_warning").hide();
			}
		});
		
		
		//prod_description 입력검사
		$("#prod_description").blur(function(){
			
			if($(this).val().trim() == ""){
				decriptionflag = true;
				$("#description_warning").show();
			}
			else{
				$("#description_warning").hide();
			}
		});
		
		
		//prod_high 입력검사
		$("#prod_high").blur(function(){
			
			if($(this).val().trim() == ""){
				highflag = true;
				$("#high_warning").show();
			}
			else{
				$("#high_warning").hide();
			}
		});
		
		
		//prod_price 입력검사
		$("#prod_price").blur(function(){
			
			if($(this).val().trim() == ""){
				priceflag = true;
				$("#price_warning").show();
			}
			else{
				$("#price_warning").hide();
			}
		});
		
		
		//prod_saleprice 입력검사
		$("#prod_saleprice").blur(function(){
			
			if($(this).val().trim() == ""){
				salepriceflag = true;
				$("#saleprice_warning").show();
			}
			else{
				$("#saleprice_warning").hide();
			}
		});
		
		//prod_image 입력검사
		$("#prod_image").blur(function(){
			
			if($(this).val().trim() == ""){
				imageflag = true;
				$("#image_warning").show();
			}
			else{
				$("#image_warning").hide();
			}
		});
		
		//prod_image 입력검사
		$("#product_image_file").blur(function(){
			
			if($(this).val().trim() == ""){
				d_imageflag = true;
				$("#image_file_warning").show();
			}
			else{
				$("#image_file_warning").hide();
			}
		});
		
		//prod_point 입력검사
		$("#prod_point").blur(function(){
			
			if($(this).val().trim() == ""){
				pointflag = true;
				$("#point_warning").show();
			}
			else{
				$("#point_warning").hide();
			}
		});
		
		
		
	});//end of ready

	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	//function declaration
	
	//입력받은 상품등록정보 전송
	function fn_submit(){
		const frm = document.admin_productRegister_frm;
		frm.action = "<%= ctxPath%>/hyerin/admin/adminProductRegister.sue";
		frm.method = "post";
		frm.submit();
		
	}//end of fn_submit()
	
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-10">
		<form name="admin_productRegister_frm" enctype="multipart/form-data">
			<table id="register_table" class="container register_table">
				<tr>
					<td colspan="4" id="register_text">상품등록</td>
				</tr>
				<tr>
					<td colspan="4" id="necessary_index" class="text-right">
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						상품종류
						<span class="necessary">*</span>
					</td>
					<td>
						<select id="prod_kind" name="prod_kind" class="register_phoneselect" style="width:100px;">
							<option value="all">전체</option>
							<c:forTokens var="kind" items="${requestScope.prodKind}" delims=",">
								<option>${kind}</option>
							</c:forTokens>
							<option value="add">추가...</option>
						</select>
						<div id="kind_warning" class="register_warning">상품종류를 선택해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						상품명
						<span class="necessary">*</span>
					</td>
					<td>
						<input type="text" id="prod_name" name="prod_name" class="register_input w-100"/>
						<div id="name_warning" class="register_warning">상품명을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						상품설명
						<span class="necessary">*</span>
					</td>
					<td>
						<textarea id="prod_description" name="prod_description" class="register_input w-100" style="height:100px; border:solid 1px #d9d9d9;"></textarea>
						<div id="description_warning" class="register_warning">상품설명을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						굽높이
						<span class="necessary">*</span>
					</td>
					<td>
						<input type="text" id="prod_high" name="prod_high" class="register_input"/> cm
						<div id="high_warning" class="register_warning">굽높이를 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td class="align-baseline">
						<span class="font-weight-bold">옵션</span> (색상, 사이즈)
						<div><input id="spinnerPqty" name="pqty" value="0" style="width:70px;"/>
							<input type="hidden" id="attachCount" name="attachCount" value=""/>
						</div>
					</td>
					<td>
						<table class="table">
							<thead>
								<tr>
									<td>
										<input type="checkbox" id="selectAll"/>
									</td>
									<td>
										색상
									</td>
									<td>
										사이즈
									</td>
									<td>
										재고수량
									</td>
								</tr>
							</thead>
							<tbody id="option_contents">
								
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						정가
						<span class="necessary">*</span>
					</td>
					<td>
						<input type="text" id="prod_price" name="prod_price" class="register_input w-100"/>
						<div id="price_warning" class="register_warning">가격을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						판매가
						<span class="necessary">*</span>
					</td>
					<td>
						<input type="text" id="prod_saleprice" name="prod_saleprice" class="register_input w-100"/>
						<div id="saleprice_warning" class="register_warning">가격을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						대표이미지
						<span class="necessary">*</span>
					</td>
					<td class="pt-2">
						<input type="file" id="prod_image" name="prod_image" class="w-100"/>
						<div id="image_warning" class="register_warning">이미지 파일을 첨부해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						상품상세이미지
						<span class="necessary">*</span>
					</td>
					<td class="pt-2">
						<input type="file" id="product_image_file" name="product_image_file" class="w-100"/>
						<div id="image_file_warning" class="register_warning">이미지 파일을 첨부해주세요.</div>
					</td>
				</tr>
				<tr>	
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						MD	노출 여부
					</td>
					<td class="pt-2">
						<input type="checkbox" id="md_pick_yn"/>
						<input type="hidden" id="md_pick_yn_check" name="md_pick_yn_check" value="N"/>
					</td>
				</tr>
				<tr>	
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						상품포인트
						<span class="necessary">*</span>
					</td>
					<td class="pt-2"> 
						<input type="text" id="prod_point" name="prod_point" class="register_input"/>
						<div id="point_warning" class="register_warning">상품포인트를 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="pt-5 pb-2"><button type="button" id="join_btn" class="black" style="width:100%;" onclick="fn_submit();">등록</button></td>
				</tr>
				<tr>
					<td colspan="2" class="pb-5"><button type="button" id="cancel_btn" class="white" style="width:100%;">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>