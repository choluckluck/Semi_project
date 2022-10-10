<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	.optioninput{
		border: solid 1px #d9d9d9;
		height: 30px;
		width: 150px;
	}
	
</style>

<script>
	$(document).ready(function(){
		
		//유효성검사 숨기기
		$(".register_warning").hide();
		$(".register_approval").hide();
		$("#deleteOptionbtn").hide();
		
		// md_pick에 값을 넣어주기
		$("#md_pick_yn").change(function(){
			
			if($(this).is(":checked")){
				$("#md_pick_yn_check").val("Y");
			}
			else{
				$("#md_pick_yn_check").val("N");
			}
			
		});
		
		//////////////////////////////////////////////////////////////////////////////////
		
		//유효성검사 해주기 
		let flag = false;
		
		// 상품종류 변경 이벤트 => 추가 선택시 텍스트인풋박스 뜨게함
		$("select#prod_kind").change(function(){
			
			if($(this).val()=="all" || $(this).val() == null){ //null이거나 all을 선택했을 때
				flag = true;
				$("#kind_warning").show();
				$(this).focus();
			}
			else {
				flag = false;
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
				flag = true;
				$("#name_warning").show();
				$(this).focus();
			}
			else{
				flag = false;
				$("#name_warning").hide();
			}
		});
		
		//prod_description 입력검사
		$("#prod_description").blur(function(){
			
			if($(this).val().trim() == ""){
				flag = true;
				$("#description_warning").show();
				$(this).focus();
			}
			else{
				flag = false;
				$("#description_warning").hide();
			}
		});
		
		
		//prod_high 입력검사
		$("#prod_high").blur(function(){
			const high = $(this).val().trim();
			if(high.trim() == ""){
				flag = true;
				$("#high_warning").show();
				$(this).focus();
			}
			else{
				flag = false;
				$("#high_warning").hide();
				
				const reg = /[0-9]|[0-9]\.[0-9]$/;
				const regResult = reg.test(high);
				if(!regResult){
					flag = true;
					$("#high_regwarning").show();
					$(this).focus();
				}
				else{
					flag = false;
					$("#high_regwarning").hide();
					$("#prod_high").val(high);
				}
			}
			
		});
		
		
		//prod_price 입력검사
		$("#prod_price").blur(function(){
			
			$("#price_numberwarning").hide();
			const price = $(this).val();
			
			if(price.trim() == ""){
				flag = true;
				$("#price_warning").show();
				$(this).focus();
			}
			else{
				flag = false;
				$("#price_warning").hide();
				if(isNaN(price)){
					flag = true;
					$("#price_numberwarning").show();
					$(this).focus();
				}
				else{
					flag = false;
					$("#price_numberwarning").hide();
					$("#prod_price").val(price.trim());
				}
			}
		});
		
		
		//prod_saleprice 입력검사
		$("#prod_saleprice").blur(function(){
			
			$("#saleprice_numberwarning").hide();
			const saleprice = $(this).val().trim();
			
			if(saleprice == ""){
				flag = true;
				$("#saleprice_warning").show();
				$(this).focus();
			}
			else{
				flag = false;
				$("#saleprice_warning").hide();
				if(isNaN(saleprice)){
					flag = true;
					$("#saleprice_numberwarning").show();
					$(this).focus();
				}
				else{
					flag = false;
					$("#saleprice_numberwarning").hide();
					$("#prod_saleprice").val(saleprice.trim());
				}
				
			}
		});
		
		
		//prod_point 입력검사
		$("#prod_point").blur(function(){
			
			$("#point_numberwarning").hide();
			const point = $(this).val().trim();
			
			if(point == ""){
				flag = true;
				$("#point_warning").show();
				$(this).focus();
			}
			else{
				flag = false;
				$("#point_warning").hide();
				if(isNaN(point)){
					flag = true;
					$("#point_numberwarning").show();
					$(this).focus();
				}
				else{
					flag = false;
					$("#point_numberwarning").hide();
					$("#prod_point").val(point.trim());
				}
			}
		});
		
		//////////////////////////////////////////////////////////////////////////////////		
		
	});//end of ready

	
//////////////////////////////////////////////////////////////////////////////////////////



//function declaration

// 옵션입력칸 추가해주는 함수
function addOption(){
	var i = $("#attachCount").val();
	var addhtml = '<tr id="detail_option'+i+'" class="detail_option">'+
					'<td><input type="checkbox" id="optionCheck'+i+'" name="optionCheck"/></td>'+
					'<td><input id="prod_color'+i+'" class="prod_color optioninput" type="text"/></td>'+
					'<td><input id="prod_size'+i+'" class="prod_size optioninput" type="text"/><div class="font-weight-bold register_warning" style="display:none;">숫자로 입력해주세요.</div></td>'+								
					'<td><input id="prod_stock'+i+'" class="prod_stock optioninput" type="text"/><div class="font-weight-bold register_warning" style="display:none;">숫자로 입력해주세요.</div></td>'+						
					'<td><button type="button" id="deltebtn_'+i+'" class="black deleteOneOption" style="width: 70px; height: 30px;" onclick="deleteOption('+i+');">삭제</button></td>'+							
				'</tr>';
	i++;
	$("#attachCount").val(i);
	$("#option_contents").append(addhtml);
	
	if(i == 0){
		$("#deleteOptionbtn").hide();
	}
	else{
		$("#deleteOptionbtn").show();
	}
	
	// 옵션 => 숫자입력 유효성 검사
	$(".prod_size").blur(function(){
		const val = $(this).val();
		if(isNaN(val)){
			$(this).next().show();
			$(this).focus();
		}
		else{
			$(this).next().hide();
		}
	}); 
	
	$(".prod_stock").blur(function(){
		const val = $(this).val();
		if(isNaN(val)){
			$(this).next().show();
			$(this).focus();
		}
		else{
			$(this).next().hide();
		}
	}); 
	
	
}//end of addOption

//옵션입력칸 지워주는 함수
function deleteOption(num){
	var i = $("#attachCount").val();
	i--;
	$("#attachCount").val(i);
	$("#detail_option"+num).remove();
	if(i == 0){
		$("#deleteOptionbtn").hide();
	}
	else{
		$("#deleteOptionbtn").show();
	}
}

//이름을 다시 정렬해주는 함수
function rename(){
	$(".prod_color").each(function(index, item){
		$(item).attr("name","prod_color"+index);
	});
	$(".prod_size").each(function(index, item){
		$(item).attr("name","prod_size"+index);
	});
	$(".prod_stock").each(function(index, item){
		$(item).attr("name","prod_stock"+index);
	});
	
}//end of rename




//입력받은 상품등록정보 전송
function fn_submit(){
	//이름을 다시 정렬해주기
	rename(); 
	
	//////////////////////////////////////////////////////////////////////////////////
	//유효성검사 해주기
	let flag = false;
	
	//prod_kind 입력검사
	if($("#prod_kind").val()=="all" || $("#prod_kind").val() == null){
		flag = true;
		$("#kind_warning").show();
		$("#prod_kind").focus();
		return;
	}
	
	//prod_name 입력검사
	if($("#prod_name").val().trim() == ""){
		flag = true;
		$("#name_warning").show();
		$("#prod_name").focus();
		return;
	}
	else{
		$("#name_warning").hide();
	}
	
	
	//prod_description 입력검사
	if($("#prod_description").val().trim() == ""){
		flag = true;
		$("#description_warning").show();
		$("#prod_description").focus();
		return;
	}
	else{
		flag = false;
		$("#description_warning").hide();
	}
	
	//prod_high 입력검사
	const high = $("#prod_high").val().trim();
	if(high.trim() == ""){
		flag = true;
		$("#high_warning").show();
		$("#prod_high").focus();
	}
	else{
		flag = false;
		$("#high_warning").hide();
		
		const reg = /[0-9]|[0-9]\.[0-9]$/;
		const regResult = reg.test(high);
		if(!regResult){
			flag = true;
			$("#high_regwarning").show();
			$("#prod_high").focus();
		}
		else{
			flag = false;
			$("#high_regwarning").hide();
			$("#prod_high").val(high);
		}
	}
	
	
	
	//prod_price 입력검사
	$("#price_numberwarning").hide();
	const price = $("#prod_price").val();
	
	if(price.trim() == ""){
		flag = true;
		$("#price_warning").show();
		$("#prod_price").focus();
		return;
	}
	else{
		flag = false;
		$("#price_warning").hide();
		if(isNaN(price)){
			flag = true;
			$("#price_numberwarning").show();
			$("#prod_price").focus();
			return;
		}
		else{
			flag = false;
			$("#price_numberwarning").hide();
			$("#prod_price").val(price.trim());
		}
	}
	
	
	//prod_saleprice 입력검사
	$("#saleprice_numberwarning").hide();
	const saleprice = $("#prod_saleprice").val().trim();
	
	if(saleprice == ""){
		flag = true;
		$("#saleprice_warning").show();
		$("#prod_saleprice").focus();
		return;
	}
	else{
		flag = false;
		$("#saleprice_warning").hide();
		if(isNaN(saleprice)){
			flag = true;
			$("#saleprice_numberwarning").show();
			$("#prod_saleprice").focus();
			return;
		}
		else{
			flag = false;
			$("#saleprice_numberwarning").hide();
			$("#prod_saleprice").val(saleprice.trim());
		}
		
	}
	
	
	//prod_point 입력검사
	$("#point_numberwarning").hide();
	const point = $("#prod_point").val().trim();
	
	if(point == ""){
		flag = true;
		$("#point_warning").show();
		$("#point_numberwarning").focus();
		return;
	}
	else{
		flag = false;
		$("#point_warning").hide();
		if(isNaN(point)){
			flag = true;
			$("#point_numberwarning").show();
			$("#point_numberwarning").focus();
			return;
		}
		else{
			flag = false;
			$("#point_numberwarning").hide();
			$("#prod_point").val(point.trim());
		}
	}
	
	
	//prod_image 입력검사
	if($("#prod_image").val().trim() == ""){
		flag = true;
		$("#image_warning").show();
		$("#prod_image").focus();
		return;
	}
	else{
		$("#image_warning").hide();
	}
	
	//product_image_file 입력검사
	if($("#product_image_file").val().trim() == ""){
		flag = true;
		$("#image_file_warning").show();
		$("#product_image_file").focus();
		return;
	}
	else{
		$("#image_file_warning").hide();
	}
	
	//////////////////////////////////////////////////////////////////////////////////
	
	if(!flag){
		const frm = document.admin_productRegister_frm;
		frm.action = "<%= ctxPath%>/hyerin/admin/adminProductRegister.sue";
		frm.method = "post";
		frm.submit();
	}
	
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
						<div id="high_regwarning" class="register_warning">굽높이를 숫자 또는 형식(예>5.5)대로 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td class="align-baseline">
						<span class="font-weight-bold">옵션</span> (색상, 사이즈)
						<input type="hidden" id="attachCount" name="attachCount" value="0"/>
					</td>
					<td>
						<table class="table">
							<thead>
								<tr>
									<td><input type="checkbox" id="optionCheckAll" name="optionCheck"/></td>
									<td>
										색상
									</td>
									<td>
										사이즈
									</td>
									<td>
										재고수량
									</td>
									<td>
										삭제
									</td>
								</tr>
							</thead>
							<tbody id="option_contents">
							</tbody>
						</table>
						<table id="optionBtn">
							<tr id="deleteOption"> 
								<td class="pr-2"><button id="addOptionbtn" type="button" class="white" style="width:70px; height:30px;" onclick="addOption();">추가</button></td>
								<td><button id="deleteOptionbtn" type="button" class="black" style="width:70px; height:30px;">선택삭제</button></td>
							</tr>
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
						<div id="price_numberwarning" class="register_warning">가격을 숫자로 입력해주세요.</div>
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
						<div id="saleprice_numberwarning" class="register_warning">가격을 숫자로 입력해주세요.</div>
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
						<div id="point_numberwarning" class="register_warning">상품포인트를 숫자로 입력해주세요.</div>
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