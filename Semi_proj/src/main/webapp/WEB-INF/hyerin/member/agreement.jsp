<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		
		// ** 회원가입 버튼 클릭이벤트
		$("button#register_btn").click((e)=>{
			
			// 필수 동의 약관이 모두 동의되지 않으면
			if(!$("input:checkbox[id=agree_1_chx]").is(":checked")
				|| !$("input:checkbox[id=agree_2_chx]").is(":checked")){
				
				alert("필수 동의 약관을 모두 체크해 주세요!");
			}
			else{
				location.href="<%= ctxPath%>/hyerin/member/registerWrite.sue";
			}
			
		}); // end of $("button#register_btn").click(function() ------------
		
		
		// ** 전체 동의하기 체크박스 이벤트 
		$("#Allagree_chx").click((e)=>{
			
			// 전체 선택/전체 해제
		    if($('#Allagree_chx').is(':checked')){
			       $("input.agree_chx").prop('checked',true);     
			}
			else {        
				$("input.agree_chx").prop('checked',false);     
			} 
		});
		
		// ** 각 체크박스 별 이벤트(전체동의하기 체크 선택/해제)
		$("input[name=agree_chx]").click(function() {
			const total = $("input[name=agree_chx]").length;
			const checked = $("input[name=agree_chx]:checked").length;

			if(total != checked) { $("#Allagree_chx").prop("checked", false); }
			else { $("#Allagree_chx").prop("checked", true); }
		});
		

		
		// ** 취소 버튼 클릭이벤트
		$("button#reset_btn").click(function(){
			location.href="<%= ctxPath%>/main.sue";
		});
		
	});
	
	function checkAll() {
		if($("#Allagree_chx").is(":checked")) {
			$("input.agree_chx").prop("checked", true);
		} else {
			$("input.agree_chx").prop("checked", false);
		}
	}
	
</script>

	<div id="container" class="container-fluid">
		<div class="row mt-5">
			<div class="col-3"></div>
			<div class="col-6">
				<form name="agree_form" action="/WEB-INF/hyerin/member/agreement.jsp" method="post">
					<table id="login" class="container">
						<tr>
							<td colspan="4" id="login_text">회원가입</td>
						</tr>
						<tr>
							<td colspan="4" id="Allagree">
								<input id="Allagree_chx" type="checkbox" name="Allagree_chx"class="agree_chx" value="1" />
								<label for="Allagree_chx" class="font-weight-bold">전체동의</label>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pt-1">
								<table class="agreebox">
									<tr>
										<td colspan="2" class="pt-4 px-4">
											<input id="agree_1_chx" type="checkbox" name="agree_chx" class="agree_chx" />
											<label for="agree_1_chx" class="font-weight-bold">이용약관 동의(필수)</label>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="pt-2 pb-4 px-3"><iframe id="agree_1" class="agree w-100" src="../../agreement/agree_1.html" height="300px"></iframe></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="4" class="pt-3 pb-3">
								<table class="agreebox">
									<tr>
										<td colspan="2" class="pt-4 px-4">
											<input id="agree_2_chx" type="checkbox" name="agree_chx2" class="agree_chx"/>
											<label for="agree_2_chx" class="font-weight-bold">개인정보 수집 및 이용(필수)</label>
										</td>
									</tr>
									<tr>
										<td colspan="2" class="pt-2 pb-4 px-3"><iframe id="agree_2" class="agree w-100" src="../../agreement/agree_2.html" height="300px"></iframe></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="4" style="padding-top:20px;"><button type="button" id="register_btn" class="black" style="width:100%">회원가입</button></td>
						</tr>
						<tr>
							<td colspan="4"><button type="reset" id="reset_btn" class="white mb-5" style="width:100%;">취소</button></td>
						</tr>
					</table>
				</form>
			</div>
			<div class="col-3"></div>
		</div>
	</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"/>