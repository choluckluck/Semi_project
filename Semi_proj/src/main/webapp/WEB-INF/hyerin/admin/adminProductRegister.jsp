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
	
	#option_plus:hover, .option_minus:hover {
		cursor: pointer;
	}
</style>

<script>
	$(document).ready(function(){
		$(".register_warning").hide();
		$(".register_approval").hide();
		
		$(".option_minus").click(function(e){
			const target = $(e.target);
			target.parent().parent().remove();
			
		});//end of $(".option_minus").click
		
		
		var i = 1;
		// 옵션추가 + 버튼 클릭 이벤트(행추가)
		$("#option_plus").click(function(e){
			
			var html = '<tr>'+
							'<td>'+
								'<input type="checkbox" id="option'+i+'"/>'+
							'</td>'+
							'<td>'+
								'<input type="text" id="option_color'+i+'" name="option_color'+i+'" class="option_input"/>'+
							'</td>'+
							'<td>'+
								'<input type="text" id="option_size'+i+'" name="option_size'+i+'" class="option_input"/>'+
							'</td>'+
							'<td>'+
								'<input type="number" id="prod_stock" name="prod_stock" class="option_input"/>'+
							'</td>'+
							'<td>'+
								'<button type="button" id="delete_option" class="black" style="width:80%;height:30px; ">삭제</button>'+
							'</td>'+
							'<td>'+
								'<span class="option_minus">-</span>'+
							'</td>'+
						'</tr>';
			
			$("#option_contents").append(html);
			i++;
		
			// 옵션추가 - 버튼 클릭이벤트 (행삭제)
			$(".option_minus").click(function(e){
				const target = $(e.target);
				target.parent().parent().remove();
				
			});//end of $(".option_minus").click
			
			
		});//end of $("#option_plus").click
		
	});//end of ready

	
	//////////////////////////////////////////////////////////////////////////////////////////
	
	//function declaration
	
	//입력받은 상품등록정보 전송
	<%-- function fn_submit(){
		const frm = document.admin_productRegister_frm;
		
		
		frm.action = "<%= ctxPath%>/hyerin/admin/adminProductRegisterEnd.sue";
		frm.method = "get";
		
	}//end of fn_submit()
 --%>
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-10">
		<form name="admin_productRegister_frm">
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
					</td>
					<td>
						<select id="product_kind" class="register_phoneselect">
							<option value="all" selected>전체</option>
							<c:forTokens var="kind" items="${requestScope.prodKind}" delims=",">
								<option value="${kind}">${kind}</option>
							</c:forTokens>
						</select>
						<div id="id_warning" class="register_warning">상품종류를 선택해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						상품명
					</td>
					<td>
						<input type="text" name="member_id" class="register_input w-100"/>
						<div id="id_approval" class="register_approval">!상품명 는 사용가능한 상품명입니다.</div>
						<div id="id_warning" class="register_warning">상품명을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						굽높이
					</td>
					<td>
						<input type="text" id="product_high" name="product_high" class="register_input"/> cm
						<div id="id_warning" class="register_warning">굽높이를 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td class="align-baseline"><span class="font-weight-bold">옵션</span> (색상, 사이즈)</td>
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
										재고
									</td>
									<td>
										삭제
									</td>
									<td>
										<span id="option_plus">+</span>
									</td>
								</tr>
							</thead>
							<tbody id="option_contents">
								<tr>
									<td>
										<input type="checkbox" id="option1"/>
									</td>
									<td>
										<input type="text" id="option_color1" name="option_color" class="option_input"/>
									</td>
									<td>
										<input type="text" id="option_size1" name="option_size1" class="option_input"/>
									</td>
									<td>
										<input type="number" class="option_input"/>
									</td>
									<td>
										<button type="button" id="delete_option" class="black" style="width:80%;height:30px;">삭제</button>
									</td>
									<td>
										<span class="option_minus">-</span>
									</td>
								</tr>
							</tbody>
							<tr>
								<td colspan="6"><button type="button" class="black" style="width:70px; height:30px;">일괄삭제</button></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						정가
					</td>
					<td>
						<input type="text" name="prod_price" class="register_input w-100"/>
						<div id="id_warning" class="register_warning">가격을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						판매가
					</td>
					<td>
						<input type="text" name="prod_saleprice" class="register_input w-100"/>
						<div id="id_warning" class="register_warning">가격을 입력해주세요.</div>
					</td>
				</tr>
				<tr>
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						이미지
					</td>
					<td class="pt-2">
						<input type="file" name="member_id" class="w-100"/>
						<div id="id_warning" class="register_warning">이미지 파일을 첨부해주세요.</div>
					</td>
				</tr>
				<tr>	
					<td width="15%" class="font-weight-bold align-baseline pt-2">
						메인	노출 여부
					</td>
					<td class="pt-2"> 
						<input type="checkbox" id="md_pick_yn" name="md_pick_yn"/>
					</td>
				</tr>
				<tr>
					<td colspan="2" class="pt-5 pb-2"><button type="button" id="join_btn" class="black" style="width:100%;">등록</button></td>
				</tr>
				<tr>
					<td colspan="2" class="pb-5"><button type="button" id="cancel_btn" class="white" style="width:100%;">취소</button></td>
				</tr>
			</table>
		</form>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>