<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String ctxPath = request.getContextPath();
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<jsp:include page="/WEB-INF/hyerin/header.jsp"></jsp:include>

<script>
	$(document).ready(function(){
		//wish_heart가 회원DB의 관심상품에 있으면 빨간것으로, 아니면 하얀색으로 바꿔주기
		
	});//end of ready
	
	
</script>

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
	<div height="100px" align="center" style="font-size:25pt;" class="pt-5 pb-4">Best</div>
	
	<%-- 베스트 캐러셀 --%>
	<div id="best_carousel" class="carousel carousel-dark  slide col-11" align="center" data-ride="carousel" data-interval="false">
	  <div class="carousel-inner">
	    <div class="carousel-item active">
	    	<table id="best_table" style="font-size:11pt; border-collapse: separate; border-spacing: 15px;">
	    		<tr>
	    			<c:forEach var="best_pvo" items="${requestScope.best_pvoList}" begin="0" end="3" step="1">
						<td width="20%" class="pr-1">
							<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${best_pvo.prod_code}" style="text-decoration: none; color: black;">
								<img src="<%= ctxPath%>/images/product/${best_pvo.prod_image}" width="100%"/>
								<div class="mt-3">
									<span style="float:left;">
										<c:forTokens var="prod_color" items="${best_pvo.pdvo.prod_color}" delims=",">
											<div class="best_color" style="background-color: ${prod_color};"></div>
										</c:forTokens>
									</span>
									<span style="float:right; font-size:9pt;">리뷰 ${best_pvo.prod_review_count}개</span>
									<div class="pt-3" style="clear:both">${best_pvo.prod_name} <span>(${best_pvo.prod_high}cm)</span></div>
									<div class="pt-1 pb-5">
										<span class="mr-1">
											<fmt:formatNumber value="${best_pvo.prod_saleprice}" pattern="#,###"/>
										</span>
										<c:if test="${best_pvo.prod_saleprice ne best_pvo.prod_price}">
											<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${best_pvo.prod_price}" pattern="#,###"/></span>
										</c:if>
									</div>
								</div>
							</a>
						</td>
					</c:forEach>           
	    		</tr>
			</table>
	    </div>
	    <div class="carousel-item">
	    	<table id="best_table_2" style="font-size:11pt; border-collapse: separate; border-spacing: 15px;">
				<tr>
	    			<c:forEach var="best_pvo" items="${requestScope.best_pvoList}" begin="4" end="7" step="1">
						<td width="20%" class="pr-1">
							<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${best_pvo.prod_code}" style="text-decoration: none; color: black;">
								<img src="<%= ctxPath%>/images/product/${best_pvo.prod_image}" width="100%"/>
								<div class="mt-3">
									<span style="float:left;">
										<c:forTokens var="prod_color" items="${best_pvo.pdvo.prod_color}" delims=",">
											<div class="best_color" style="background-color: ${prod_color};"></div>
										</c:forTokens>
									</span>
									<span style="float:right; font-size:9pt;">리뷰 ${best_pvo.prod_review_count}개</span>
									<div class="pt-3" style="clear:both">${best_pvo.prod_name} <span>(${best_pvo.prod_high}cm)</span></div>
									<div class="pt-1 pb-5">
										<span class="mr-1">
											<fmt:formatNumber value="${best_pvo.prod_saleprice}" pattern="#,###"/>
										</span>
										<c:if test="${best_pvo.prod_saleprice ne best_pvo.prod_price}">
											<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${best_pvo.prod_price}" pattern="#,###"/></span>
										</c:if>
									</div>
								</div>
							</a>
						</td>
					</c:forEach>           
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
		<table id="new_table" class="w-100" style="font-size:11pt; border-collapse: separate; border-spacing: 15px;">
			<tr>
				<td colspan="4" height="150px;" align="center" style="font-size:25pt" class="pt-5 pb-4">New Arrival</td>
			</tr>
			<tr>
				<c:forEach var="new_pvo" items="${requestScope.new_pvoList}" begin="0" end="3" step="1">
					<td width="20%" class="pr-1">
						<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${new_pvo.prod_code}" style="text-decoration: none; color: black;">
							<img src="<%= ctxPath%>/images/product/${new_pvo.prod_image}" width="100%"/>
							<div class="mt-3">
								<span style="float:left;">
									<c:forTokens var="prod_color" items="${new_pvo.pdvo.prod_color}" delims=",">
										<div class="best_color" style="background-color: ${prod_color};"></div>
									</c:forTokens>
								</span>
								<span style="float:right; font-size:9pt;">리뷰 ${new_pvo.prod_review_count}개</span>
								<div class="pt-3" style="clear:both">${new_pvo.prod_name} <span>(${new_pvo.prod_high}cm)</span></div>
								<div class="pt-1 pb-5">
									<span class="mr-1">
										<fmt:formatNumber value="${new_pvo.prod_saleprice}" pattern="#,###"/>
									</span>
									<c:if test="${new_pvo.prod_saleprice ne new_pvo.prod_price}">
										<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${new_pvo.prod_price}" pattern="#,###"/></span>
									</c:if>
								</div>
							</div>
						</a>
					</td>
				</c:forEach>                                                                                                                             
			</tr>
			<tr>
				<c:forEach var="new_pvo" items="${requestScope.new_pvoList}" begin="4" end="7" step="1">
					<td width="20%" class="pr-1">
						<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${new_pvo.prod_code}" style="text-decoration: none; color: black;">
							<img src="<%= ctxPath%>/images/product/${new_pvo.prod_image}" width="100%"/>
							<div class="mt-3">
								<span style="float:left;">
									<c:forTokens var="prod_color" items="${new_pvo.pdvo.prod_color}" delims=",">
										<div class="best_color" style="background-color: ${prod_color};"></div>
									</c:forTokens>
								</span>
								<span style="float:right; font-size:9pt;">리뷰 ${new_pvo.prod_review_count}개</span>
								<div class="pt-3" style="clear:both">${new_pvo.prod_name} <span>(${new_pvo.prod_high}cm)</span></div>
								<div class="pt-1 pb-5">
									<span class="mr-1">
										<fmt:formatNumber value="${new_pvo.prod_saleprice}" pattern="#,###"/>
									</span>
									<c:if test="${new_pvo.prod_saleprice ne new_pvo.prod_price}">
										<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${new_pvo.prod_price}" pattern="#,###"/></span>
									</c:if>
								</div>
							</div>
						</a>
					</td>
				</c:forEach>                                                                                                                             
			</tr>
			<tr>
				<c:forEach var="new_pvo" items="${requestScope.new_pvoList}" begin="8" end="11" step="1">
					<td width="20%" class="pr-1">
						<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${new_pvo.prod_code}" style="text-decoration: none; color: black;">
							<img src="<%= ctxPath%>/images/product/${new_pvo.prod_image}" width="100%"/>
							<div class="mt-3">
								<span style="float:left;">
									<c:forTokens var="prod_color" items="${new_pvo.pdvo.prod_color}" delims=",">
										<div class="best_color" style="background-color: ${prod_color};"></div>
									</c:forTokens>
								</span>
								<span style="float:right; font-size:9pt;">리뷰 ${new_pvo.prod_review_count}개</span>
								<div class="pt-3" style="clear:both">${new_pvo.prod_name} <span>(${new_pvo.prod_high}cm)</span></div>
								<div class="pt-1 pb-5">
									<span class="mr-1">
										<fmt:formatNumber value="${new_pvo.prod_saleprice}" pattern="#,###"/>
									</span>
									<c:if test="${new_pvo.prod_saleprice ne new_pvo.prod_price}">
										<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${new_pvo.prod_price}" pattern="#,###"/></span>
									</c:if>
								</div>
							</div>
						</a>
					</td>
				</c:forEach>                                                                                                                             
			</tr>
			<tr>
				<c:forEach var="new_pvo" items="${requestScope.new_pvoList}" begin="12" end="15" step="1">
					<td width="20%" class="pr-1">
						<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${new_pvo.prod_code}" style="text-decoration: none; color: black;">
							<img src="<%= ctxPath%>/images/product/${new_pvo.prod_image}" width="100%"/>
							<div class="mt-3">
								<span style="float:left;">
									<c:forTokens var="prod_color" items="${new_pvo.pdvo.prod_color}" delims=",">
										<div class="best_color" style="background-color: ${prod_color};"></div>
									</c:forTokens>
								</span>
								<span style="float:right; font-size:9pt;">리뷰 ${new_pvo.prod_review_count}개</span>
								<div class="pt-3" style="clear:both">${new_pvo.prod_name} <span>(${new_pvo.prod_high}cm)</span></div>
								<div class="pt-1 pb-5">
									<span class="mr-1">
										<fmt:formatNumber value="${new_pvo.prod_saleprice}" pattern="#,###"/>
									</span>
									<c:if test="${new_pvo.prod_saleprice ne new_pvo.prod_price}">
										<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${new_pvo.prod_price}" pattern="#,###"/></span>
									</c:if>
								</div>
							</div>
						</a>
					</td>
				</c:forEach>                                                                                                                             
			</tr>
		</table>
	</div>
	
	
	<%-- 엠디픽 --%>
	<div id="md_pick" class="col-11" align="center" style="margin:0; padding:0;">
		<table id="new_table" class="w-100" style="font-size:11pt; border-collapse: separate; border-spacing: 15px;">
			<tr>
				<td colspan="4" height="150px;" align="center" style="font-size:25pt" class="pt-5 pb-4">MD's Pick</td>
			</tr>
			<tr>
				<c:forEach var="md_pvo" items="${requestScope.md_pvoList}">
					<td width="20%" class="pr-1">
						<a href="<%= ctxPath%>/heajun/product/productdetail.sue?prod_code=${md_pvo.prod_code}" style="text-decoration: none; color: black;">
							<img src="<%= ctxPath%>/images/product/${md_pvo.prod_image}" width="100%"/>
							<div class="mt-3">
								<span style="float:left;">
									<c:forTokens var="prod_color" items="${md_pvo.pdvo.prod_color}" delims=",">
										<div class="best_color" style="background-color: ${prod_color};"></div>
									</c:forTokens>
								</span>
								<span style="float:right; font-size:9pt;">리뷰 ${md_pvo.prod_review_count}개</span>
								<div class="pt-3" style="clear:both">${md_pvo.prod_name} <span>(${md_pvo.prod_high}cm)</span></div>
								<div class="pt-1 pb-5">
									<span class="mr-1">
										<fmt:formatNumber value="${md_pvo.prod_saleprice}" pattern="#,###"/>
									</span>
									<c:if test="${md_pvo.prod_saleprice ne md_pvo.prod_price}">
										<span style="color: #bfbfbf; text-decoration:line-through;"><fmt:formatNumber value="${md_pvo.prod_price}" pattern="#,###"/></span>
									</c:if>
								</div>
							</div>
						</a>
					</td>
				</c:forEach>                                                                                                                             
			</tr>
		</table>
	</div>
</div>
<jsp:include page="/WEB-INF/hyerin/footer.jsp"></jsp:include>
