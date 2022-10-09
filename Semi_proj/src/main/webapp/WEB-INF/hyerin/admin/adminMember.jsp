<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>
<style>
	
	#member_searchInfo_container{
		float:right;
	}
	
	#searchword{
		border: none;
		border-bottom: solid 1px black;
		font-size: 10pt;
	}
	
	#memberSort{
		border: solid 1px #d9d9d9;
		height: 30px;
		font-size: 10pt;
	}
	
	.admin_member_th{
		font-weight:normal;
		border-top:solid 1px black;
		border-bottom: solid 1px black;
	}
	
	.admin_member_tbody{
		border-bottom: solid 1px #d9d9d9;
	}
	
	#admin_member_btn{
		float:right;
		width:150px;
		height:40px;
	}
	
	#member_contents tr:hover {
		cursor : pointer;
	}
	
	
</style>

<script>
	$(document).ready(function(){
		
		selectMember();
		
		$("#searchword").keyup(function(e){
			if(e.keyCode == 13){
				selectMember();
			}
		});

		
		$("#member_search_btn").click(function(){
			selectMember();
		})
		
		
		
	});//end of ready
	
	
	///////////////////////////////////////////////////////////////////////////////
	
	//function declaration
	function selectMember(num){
		window.scrollTo(0,0);
		$("#member_contents").empty();
		$("#pageBar").empty();
		var memberSortJson = $("#memberSort").val();
		var searchwordJson = $("#searchword").val();
		
		var currentShowPageNoJson = num;
		$("#currentPage").val(currentShowPageNoJson);
		
		$.ajax({
			url : "<%= ctxPath%>/hyerin/admin/adminMemberJson.sue",
			type : "get",
			data : {"memberSort":memberSortJson,
					"searchword":searchwordJson,
					"currentShowPageNo":currentShowPageNoJson},
			dataType : "JSON",
			success:function(json){
				console.log(json);
				
				
				let html = '';
				if( json.length > 1){
					
					$.each(json, function(index, item){
						//index가 0인 경우 => 페이징처리를 위해 값 넣어주기
						if(index == 0){
							//console.log(item.currentShowPageNo);
							$("#pageBar").html(item.pageBar);
						}
						//회원정보 조회
						else {
							
							//성별 처리
							var genderStr = "";
							if(item.gender == "1"){
								genderStr = "남";
							}
							else{
								genderStr = "여";
							}
							
							
							//탈퇴회원 => 탈퇴처리버튼 비활성화, 체크박스 비활성화
							var statushtml = '';
							var chxhtml = '';
							if(item.status == "0"){
								statushtml = '<td class="text-center admin_member_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="height:30px; background-color:#f2f2f2; border: solid 1px #f2f2f2; color:black;" disabled>탈퇴한회원</button></td>';
								chxhtml = '<td height="70px" class="admin_member_tbody text-center" onclick="event.stopPropagation();"><input type="checkbox" id="'+item.userid+'" name="member_chx" disabled/></td>';
							}
							else{
								statushtml = '<td class="text-center admin_member_tbody"><button id="admin_productDelete_btn" type="button" class="black" style="height:30px;" onclick="member_resign(\''+item.userid+'\');">탈퇴처리</button></td>';
								chxhtml = '<td height="70px" class="admin_member_tbody text-center" onclick="event.stopPropagation();"><input type="checkbox" id="'+item.userid+'" name="member_chx" class="check" value="'+item.userid+'"/></td>';
							}
							
							html += '<tr id="'+item.userid+'">'+
										chxhtml+
										'<td class="admin_member_tbody text-center">'+item.userid+'</td>'+
										'<td class="text-center admin_member_tbody">'+item.name+'</td>'+
										'<td class="text-center admin_member_tbody">'+item.email+'</td>'+
										'<td class="text-center admin_member_tbody">'+item.mobile+'</td>'+
										'<td class="text-center admin_member_tbody">'+genderStr+'</td>'+
										'<td class="text-center admin_member_tbody">'+item.registerday+'</td>'+
										//'<td class="text-center admin_member_tbody"><button id="admin_productRevise_btn" type="button" class="white" style="height:30px;" onclick="member_edit(\''+item.userid+'\');">더보기</button></td>'+
										statushtml+
									'</tr>';
							
						}//end of else (회원정보조회)
					
					});//end of $.each
					
					//조회한 회원정보 넣어주기
					$("#member_contents").append(html);
					
					
					$("#member_contents > tr").click(function(){
						
						var user_id = $(this).attr('id');
						member_edit(user_id);
						
					});
					
					
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
					
					
				}//end of if
				
				//조회된 회원이 없을 경우
				else {
					html += '<tr><td colspan="8">조회된 회원이 없습니다.</td></tr>';
					$("#member_contents").html(html);
				}
				
			},
			error: function(request, status, error){
				alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
			}
			
			
		}); //end of ajax
		
	}//end of selectMember
	
	
	
	function member_edit(userid){
		// 나의 정보 수정하기 팝업창 띄우기
		const url = "<%= ctxPath%>/hyerin/admin/adminMemberEdit.sue?userid="+userid;
		
		//너비 800, 높이 600인 팝업창을 화면 가운데 위치시키기
		
		const pop_width = 800; //팝업 px은 생략가능 (더하기 할 경우 => 생략)
		const pop_height = 600;
		const pop_left = Math.ceil( (window.screen.width - pop_width)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		const pop_top = Math.ceil( (window.screen.height - pop_height)/2 ); //Math.ceil(1.5) => 2가 나옴 (1.5보다 큰 최소의 정수) Math.floor(1.5) => 1이 나옴 (1.5보다 작은 최대의 정수)
		
		
		window.open(url, "memberEdit",
				    "left="+pop_left+", top="+pop_top+", width="+pop_width+", height="+pop_height);
	}//end of member_edit
	
	
	// 회원탈퇴처리
	function member_resign(userid){
		event.stopPropagation();
		
		if(confirm(userid + "님을 탈퇴처리 하시겠습니까?") == true){
			//비동기방식으로 userid에 해당하는 멤버의 status를 0으로 바꿔주기
			$.ajax({
				url : "<%= ctxPath%>/hyerin/admin/adminMemberResignJson.sue?userid="+userid,
				type: "get",
				data:{"userid":userid},
				dataType:"JSON",
				success:function(json){
					
					alert(json.message);
					selectMember($("#currentPage").val());
					
				},
				
				error: function(request, status, error){
					alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
				}
			});// end of ajax
			
		} else{
			return false;
		}
		
	}//end of member_resign
	
	
	// 선택한 회원탈퇴처리
	function memberChecked_resign(){
		
		const checkCnt = $("input:checkbox[name='member_chx']:checked").length;
		
		if (checkCnt < 1){
			alert("탈퇴처리할 회원을 1명 이상 선택해주세요.");
			return;
		}
		else{
			
			const allCnt = $("input:checkbox[name='member_chx']").length;
			const useridArr = new Array();
			
			for(var i=0; i<allCnt; i++){
			 
				if($("input:checkbox[name='member_chx']").eq(i).is(":checked")){
					useridArr.push( $("input:checkbox[name='member_chx']").eq(i).val() );
				}
			}//end of for
			
			const useridJoin = useridArr.join();
			
			if(confirm("선택한 회원들을 모두 탈퇴처리 하시겠습니까?") == true){
				//비동기방식으로 userid에 해당하는 멤버의 status를 0으로 바꿔주기
				$.ajax({
					url : "<%= ctxPath%>/hyerin/admin/adminMemberCheckedResign.sue",
					type: "get",
					data:{"useridJoin":useridJoin},
					dataType:"JSON",
					success:function(json){
						
						alert(json.message);
						selectMember($("#currentPage").val());
						
					},
					
					error: function(request, status, error){
						alert("code: "+request.status+"\n"+"message: "+request.responseText+"\n"+"error: "+error);
					}
				});// end of ajax
				
			} else{
				return false;
			}
		}//end of else
		
	}//end of member_resign
	
	
</script>

<div class="row container-fluid mt-5">
	<jsp:include page="/WEB-INF/hyerin/admin/adminSidebar.jsp" />
	<div id="contents" class="col-9 ml-5 mt-3 mb-5">
		<div id="member">
			<form name="admin_member_frm" onsubmit="return false">
				<span class="mr-3 mt-1" style="font-size:20pt; font-weight:bold;">회원관리</span>
				<span id="member_searchInfo_container">
					<span class="pt-2 mr-2">
						<select id="memberSort" class="mt-1">
							<option value="all" selected>전체선택</option>
							<option value="userid">아이디</option>
							<option value="name">회원명</option>
							<option value="email">이메일</option>
						</select>
					</span>
					<span class="mt-2">
						<input type="text" id="searchword" name="searchword" placeholder="검색"/>
						<button type="button" id="member_search_btn" style="border:none; background-color: transparent;">
							<img src="<%= ctxPath%>/images/hyerin/search_icon.png" width="25px"/>
						</button>
					</span>
				</span>
				<table id="admin_member" class="mt-4 w-100" style="font-size:10pt; border-right:none; border-left:none;"> <%-- 글은 10개까지만 보여주고 그 이상은 다음페이지로 넘기기 --%>
					<thead>
						<tr>
							<th width="5%" height="50px" class="admin_member_th text-center"><input type="checkbox" id="chxAll"/></th>
							<th width="5%" class="admin_member_th text-center">아이디</th>
							<th width="15%" class="admin_member_th text-center">이름</th>
							<th width="15%" class="admin_member_th text-center">이메일</th>
							<th width="10%" class="admin_member_th text-center">휴대전화</th>
							<th width="5%" class="admin_member_th text-center">성별</th>
							<th width="10%" class="admin_member_th text-center">가입일자</th>
							<th width="10%" class="admin_member_th text-center">삭제</th>
						</tr>
					</thead>
					<tbody id="member_contents">
					</tbody>
				</table>
				<div class="mt-3">
					<span><button type="button" id="" class="black" style="height:30px;" onclick="memberChecked_resign();">선택탈퇴처리</button></span>
				</div>
				<nav aria-label="Page navigation">
				  <ul id="pageBar" class="pagination justify-content-center pagination-sm my-5">
				  	
				  </ul>
				  <input type="hidden" name='curPage' value="1"/>
				</nav>
				<input type="hidden" id="currentPage" value=""/>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>