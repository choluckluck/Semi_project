<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<%-- 메인 캐러셀 --%>
<div id="main_carousel" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#main_carousel" data-slide-to="0" class="active"></li>
    <li data-target="#main_carousel" data-slide-to="1"></li>
    <li data-target="#main_carousel" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="<%= ctxPath%>/images/hyerin/test1.jpg" class="d-block w-100" alt="..."> <!-- d-block 은 display: block; 이고  w-100 은 width 의 크기는 <div class="carousel-item active">의 width 100% 로 잡으라는 것이다. -->
    </div>
    <div class="carousel-item">
      <img src="<%= ctxPath%>/images/hyerin/test2.jpg" class="d-block w-100" alt="...">
    </div>
    <div class="carousel-item">
     	<img src="<%= ctxPath%>/images/hyerin/test3.jpg" class="d-block w-100" alt="...">
    </div>
  </div>
  <a class="carousel-control-prev" href="#main_carousel" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#main_carousel" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>


 
<%-- 메인 내용 --%>
<div id="main_contents" style="margin:0; padding:0;" align="center" class="mb-5">
	<%-- 베스트 --%>
	<div height="100px;" align="center" style="font-size:25pt" class="pt-5 pb-4">BEST</div>
	
	<%-- 베스트 캐러셀 --%>
	<div id="best_carousel" class="carousel slide col-11" align="center" data-ride="carousel" data-interval="false">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	    	<table id="best_table" style="font-size:10pt; border-collapse: separate; border-spacing: 15px;">
				<tr>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">
								상품가격
								<span class="discount">할인%</span>
							</div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
				</tr>
			</table>
	    </div>
	    <div class="carousel-item">
	    	<table id="best_table_2" style="font-size:10pt; border-collapse: separate; border-spacing: 15px;">
				<tr>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_2.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">
								상품가격
								<span class="discount">할인%</span>
							</div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_2.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_2.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_2.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
				</tr>
			</table>
	    </div>
	    <div class="carousel-item">
	    	<table id="best_table_3" style="font-size:10pt; border-collapse: separate; border-spacing: 15px;">
				<tr>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_3.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">
								상품가격
								<span class="discount">할인%</span>
							</div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_3.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_3.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
					<td width="20%" class="pr-1">
						<a href="#"><img src="<%= ctxPath%>/images/hyerin/best_img_3.jpg" width="100%"/></a>
						<div class="mt-3">
							<span style="float:left;">
								<div class="best_color" style="background-color: white;"></div>
								<div class="best_color" style="background-color: blue;"></div>
							</span>
							<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
							<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
							<div class="pt-3" style="clear:both">상품명</div>
							<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
						</div>
					</td>
				</tr>
			</table>
	    </div>
	  </div>
	  <a class="carousel-control-prev" href="#best_carousel" role="button" data-slide="prev">
	    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	    <span class="sr-only">Previous</span>
	  </a>
	  <a class="carousel-control-next" href="#best_carousel" role="button" data-slide="next">
	    <span class="carousel-control-next-icon" aria-hidden="true"></span>
	    <span class="sr-only">Next</span>
	  </a>
	</div>
	
	<%-- 뉴어라이벌 --%>
	<div id="new_arrival" class="col-11" align="center" style="margin:0; padding:0;" class="mb-5">
		<table id="new_table" class="w-100" style="font-size:10pt; border-collapse: separate; border-spacing: 15px;">
			<tr>
				<td colspan="4" height="150px;" align="center" style="font-size:25pt" class="pt-5 pb-4">New Arrival</td>
			</tr>
			<tr>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/new_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/new_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/new_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/new_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
	<%-- 엠디픽 --%>
	<div id="md_pick" class="col-11" align="center" style="margin:0; padding:0;">
		<table id="new_table" class="w-100" style="font-size:10pt; border-collapse: separate; border-spacing: 15px;">
			<tr>
				<td colspan="4" height="150px;" align="center" style="font-size:25pt" class="pt-5 pb-4">MD's Pick</td>
			</tr>
			<tr>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/md_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/md_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/md_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
				<td width="20%" class="pr-1">
					<a href="#"><img src="<%= ctxPath%>/images/hyerin/md_img.jpg" width="100%"/></a>
					<div class="mt-3">
						<span style="float:left;">
							<div class="best_color" style="background-color: white;"></div>
							<div class="best_color" style="background-color: blue;"></div>
						</span>
						<span style="float:right; font-size:8pt;">리뷰 !(개수)</span>
						<a href="#" style="float:right; position:relative; bottom:50px; left:30px;"><img src="<%= ctxPath%>/images/hyerin/white_heart.png" width="25px;"></a>
						<div class="pt-3" style="clear:both">상품명</div>
						<div class="pt-1 pb-5">상품가격<span class="discount">할인%</span></div>
					</div>
				</td>
			</tr>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
