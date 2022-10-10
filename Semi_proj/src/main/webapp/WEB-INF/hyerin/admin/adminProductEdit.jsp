<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	String ctxPath = request.getContextPath(); 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품수정</title>

<%-- Bootstrap CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/bootstrap-4.6.0-dist/css/bootstrap.min.css" > 

<%-- Font Awesome 5 Icons --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<%-- 직접 만든 CSS --%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/hyerin_style.css" />
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/css/main_style.css" />

<%-- Optional JavaScript --%>
<script type="text/javascript" src="<%= ctxPath%>/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="<%= ctxPath%>/bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js" ></script> 

<%-- jQueryUI CSS--%>
<link rel="stylesheet" type="text/css" href="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.css" />
<script type="text/javascript" src="<%= ctxPath%>/jquery-ui-1.13.1.custom/jquery-ui.min.js"></script>

<style>
	.optioninput{
		border: solid 1px #d9d9d9;
		height: 30px;
		width: 80%;
	}
</style>

<script>
	$(document).ready(function(){
		
		//유효성검사 숨기기
		$(".register_warning").hide();
		
		//상품종류를 가져와서 해당하는 상품종류를 셀렉트박스에 선택해줌 
		$("#prod_kind").val("${requestScope.pvo.prod_kind}");
		
		//기존에 있는 상품의 옵션개수만큼 값을 넣어줌
		var optioncnt = Number("${requestScope.pdvosize}");
		$("#optionCnt").val(optioncnt);
		
		
		//mdpick이 Y인 경우 체크해주기
		var md_pick_check = "${requestScope.pvo.md_pick_yn}";
		if(md_pick_check == "Y"){
			$("#md_pick_yn").prop("checked",true);
			$("#md_pick_yn_check").val("Y");
		}
		else{
			$("#md_pick_yn_check").val("N");
		}
		
		// md_pick의 값이 바뀔때 값을 넣어주기
		$("#md_pick_yn").change(function(){
			
			if($(this).is(":checked")){
				$("#md_pick_yn_check").val("Y");
			}
			else{
				$("#md_pick_yn_check").val("N");
			}
			
		});
		
		
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
				
	});//end of ready

///////////////////////////////////////////////////////////////////////////////////////////

//function declaration
// 옵션입력칸 추가해주는 함수
function addOption(){
	var i = $("#optionCnt").val();
	var addhtml = '<tr id="detail_option'+i+'" class="detail_option">'+
					'<td><input type="checkbox" id="optionCheck'+i+'" name="optionCheck"/></td>'+
					'<td><input id="prod_color'+i+'" class="prod_color optioninput" type="text"/></td>'+
					'<td><input id="prod_size'+i+'" class="prod_size optioninput" type="text"/><div class="font-weight-bold register_warning" style="display:none;" >숫자로 입력해주세요.</div></td>'+								
					'<td><input id="prod_stock'+i+'" class="prod_stock optioninput" type="text"/><div class="font-weight-bold register_warning" style="display:none;" >숫자로 입력해주세요.</div></td>'+						
					'<td><button type="button" id="deltebtn_'+i+'" class="black deleteOneOption" style="width: 70px; height: 30px;" onclick="deleteOption('+i+');">삭제</button></td>'+							
				'</tr>';
	i++;
	$("#optionCnt").val(i);
	$("#option_contents").append(addhtml);
	
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
	var i = $("#optionCnt").val();
	i--;
	$("#optionCnt").val(i);
	$("#detail_option"+num).remove();
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


//상품 사이즈, 재고에 숫자만 입력해주게 하는 함수
function numberCheck(info,idx){
	alert(idx);
	if(info == "size"){
		const numberval = $(".prod_size").eq(idx).val();
		alert(numberval);
		/* 
		if(isNaN(numberval)){
			$(e.target).next().show();
			$(e.target).focus();
		}
		else{
			$(e.target).next().hide();
		}
		 */
	}
	
	
}//end of numberCheck


// 제품 수정을 등록해주는 함수
function editProd(){
	//name값을 정렬해준다
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
	
	
	//////////////////////////////////////////////////////////////////////////////////
	
	
	if(!flag){
		const frm = document.admin_prodEditfrm;
		frm.action = "adminProductEdit.sue";
		frm.method = "post";
		frm.submit();
	}
	
}


</script>


</head>
<body>
	<div id="contents" class="w-100" align="center">
	<form name="admin_prodEditfrm" enctype="multipart/form-data">
		<input type="hidden" name="prod_code" value="${requestScope.pvo.prod_code}"/>
		<input type="hidden" name="currPageNo" value="${requestScope.currPageNo}"/>
		<table id="register_table" class="container register_table">
			<tr>
				<td colspan="4" id="register_text">상품수정</td>
			</tr>
			<tr>
				<td colspan="4" id="necessary_index" class="text-right"></td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2 pr-4">
					상품종류
					<span class="necessary">*</span>
				</td>
				<td>
					<select id="prod_kind" name="prod_kind" class="register_phoneselect" style="width:100px;">
						<c:forTokens var="kind" items="${requestScope.prodKind}" delims=",">
							<option>${kind}</option>
						</c:forTokens>
						<option value="add">추가...</option>
					</select>
					<div id="kind_warning" class="register_warning">상품종류를 선택해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					상품명
					<span class="necessary">*</span>
				</td>
				<td>
					<input type="text" id="prod_name" name="prod_name" value="${requestScope.pvo.prod_name}" class="register_input w-100"/>
					<div id="name_warning" class="register_warning">상품명을 입력해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					상품설명
					<span class="necessary">*</span>
				</td>
				<td>
					<textarea id="prod_description" name="prod_description" class="register_input w-100" style="height:100px; border:solid 1px #d9d9d9;">${requestScope.pvo.prod_description}</textarea>
					<div id="description_warning" class="register_warning">상품설명을 입력해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					굽높이
					<span class="necessary">*</span>
				</td>
				<td>
					<input type="text" id="prod_high" name="prod_high" class="register_input" value="${requestScope.pvo.prod_high}"/> cm
					<div id="high_warning" class="register_warning">굽높이를 입력해주세요.</div>
					<div id="high_regwarning" class="register_warning">굽높이를 숫자 또는 형식(예>5.5)대로 입력해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="align-baseline">
					<span class="font-weight-bold">옵션</span> (색상, 사이즈)
					<div><input type="hidden" id="optionCnt" name="optionCnt" value="0" style="width:70px;"/>
					</div>
				</td>
				<td>
					<table class="table" style="border-spacing: 0px;">
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
							<c:forEach var="pd" items="${requestScope.pdvo}" varStatus="status">
								<tr id="detail_option${status.index}" class="detail_option">
									<td><input type="checkbox" id="optionCheck${status.index}" name="optionCheck"/></td>
									<td><input type="text" id="prod_color${status.index}" class="prod_color optioninput" value="${pd.prod_color}"/></td>									
									<td><input type="text" id="prod_size${status.index}" class="prod_size optioninput" value="${pd.prod_size}"/>
										<div class="font-weight-bold register_warning" >숫자로 입력해주세요.</div>
									</td>									
									<td><input type="text" id="prod_stock${status.index}" class="prod_stock optioninput" value="${pd.prod_stock}"/>
										<div class="font-weight-bold register_warning">숫자로 입력해주세요.</div>
									</td>							
									<td><button type="button" id="deltebtn_${pd.prod_detail_code}" class="black deleteOneOption" style="width: 70px; height: 30px;" onclick="deleteOption(${status.index});">삭제</button></td>							
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<table>
						<tr id="deleteOption"> 
							<td class="pr-2"><button id="addOptionbtn" type="button" class="white" style="width:70px; height:30px;" onclick="addOption();">추가</button></td>
							<td><button id="deleteOptionbtn" type="button" class="black" style="width:70px; height:30px;">선택삭제</button></td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					정가
					<span class="necessary">*</span>
				</td>
				<td>
					<input type="text" id="prod_price" name="prod_price" class="register_input w-100" value="${requestScope.pvo.prod_price }"/>
					<div id="price_warning" class="register_warning">가격을 입력해주세요.</div>
					<div id="price_numberwarning" class="register_warning">가격을 숫자로 입력해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					판매가
					<span class="necessary">*</span>
				</td>
				<td>
					<input type="text" id="prod_saleprice" name="prod_saleprice" class="register_input w-100" value="${requestScope.pvo.prod_saleprice }"/>
					<div id="saleprice_warning" class="register_warning">가격을 입력해주세요.</div>
					<div id="saleprice_numberwarning" class="register_warning">가격을 숫자로 입력해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					대표이미지
					<span class="necessary">*</span>
				</td>
				<td class="pt-2">
					<input type="file" id="prod_image" name="prod_image" class="w-100"/>
					<div id="image_warning" class="register_warning">이미지 파일을 첨부해주세요.</div>
				</td>
			</tr>
			<tr>
				<td class="font-weight-bold align-baseline pt-2">
					상품상세이미지
					<span class="necessary">*</span>
				</td>
				<td class="pt-2">
					<input type="file" id="product_image_file" name="product_image_file" class="w-100"/>
					<div id="image_file_warning" class="register_warning">이미지 파일을 첨부해주세요.</div>
				</td>
			</tr>
			<tr>	
				<td class="font-weight-bold align-baseline pt-2">
					MD	노출 여부
				</td>
				<td class="pt-2">
					<input type="checkbox" id="md_pick_yn"/>
					<input type="hidden" id="md_pick_yn_check" name="md_pick_yn_check"/>
				</td>
			</tr>
			<tr>	
				<td class="font-weight-bold align-baseline pt-2">
					상품포인트
					<span class="necessary">*</span>
				</td>
				<td class="pt-2"> 
					<input type="text" id="prod_point" name="prod_point" class="register_input" value="${requestScope.pvo.prod_point}"/>
					<div id="point_warning" class="register_warning">상품포인트를 입력해주세요.</div> 
					<div id="point_numberwarning" class="register_warning">상품포인트를 숫자로 입력해주세요.</div>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="pt-5 pb-2"><button type="button" id="join_btn" class="black" style="width:100%;" onclick="editProd();">등록</button></td>
			</tr>
			<tr>
				<td colspan="2" class="pb-5"><button type="button" id="cancel_btn" class="white" style="width:100%;" onclick="javascript:self.close();">닫기</button></td>
			</tr>
		</table>
	</form>
	</div>
</body>
</html>