<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script type="text/javascript">

	$(document).ready (function(){
		$("button#orderView").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/orderView.sue"
		});
		
		$("button#interestPrd").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/interestPrd.sue"
		});
		
		$("button#point").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/point.sue"
		});
		
		$("button#coupon").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/coupon.sue"
		});
		
		$("button#infoChange").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/infoChange.sue"
		});
		
		$("button#reviewManage").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/reviewManage.sue"
		});	
		
		$("button#mypagemain").click(function(){
			location.href="<%=request.getContextPath() %>/seongmin/member/mypage_Main.sue"			
		})

	});
	
	</script>
		
		

		   <h2 style="text-align:center;"><button type="button" id="mypagemain" style="border:none; background-color: white;">마이페이지</button></h2>
		    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>
		    <div class="btn-group-vertical" role="group" aria-label="Vertical button group">
			  <button id="orderView" type="button" class="btn btn-gray">주문조회</button>
			  <button id="interestPrd" type="button" class="btn btn-gray">관심 상품</button>
			  <button id="point" type="button" class="btn btn-gray">적립금</button>
			  <button id="coupon" type="button" class="btn btn-gray">쿠폰</button>
			  <button id="infoChange" type="button" class="btn btn-gray">회원정보 수정</button>
			  <button id="reviewManage" type="button" class="btn btn-gray">리뷰 & 문의내역 관리</button>
			</div>
	   
	   
