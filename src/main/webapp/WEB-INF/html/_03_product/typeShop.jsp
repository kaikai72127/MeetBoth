<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/css/main.css";
%>
<%
String pathimg = request.getContextPath();
String basePathimg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathimg
		+ "/html/images/meatball-icon.png";
%>
<%
String basePathimg2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/images/meatball-200.png";
%>

<!-- 引入共同的頁首 -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />

<style>
.star-off {
	color: black;
}

.work-item.illustration.webdesign{
	height: 175px;
	padding: 0 15px 15px 0;
	}
.work-title{
	font-size:25px;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<!-- 		<div class="page-loader"> -->
		<!-- 			<div class="loader">Loading...</div> -->
		<!-- 		</div> -->
		<!--       頂端列 -->

		<div class="main" style="background-color: #F0F0F0;">
			
			<!-- 			上方按鈕導覽 -->
			<div class="container" style="padding: 10px 10px 20px 20px;">
				<input type="button" value="返回首頁" class="btn btn-info btn-circle"
					style="font-size: 17px; color: black;"
					onclick="window.location='/MeetBoth/_03_product.searchAllProduct.controller'">
				&nbsp; <input type="button" value="隨便看看"
					class="btn btn-success btn-circle"
					style="font-size: 17px; color: black;"
					onclick="window.location='/MeetBoth/_03_product.searchRandomProduct.controller'">
				&nbsp; <input type="button" value="新增商品"
					class="btn btn-warning btn-circle"
					style="font-size: 17px; color: black;"
					onclick="window.location='/MeetBoth/_03_product.pathToInsertProduct.controller'">
			</div>
			<!-- 			上方導覽 -->
			<!-- 			中間按鈕導覽 -->
			<div class="container" style="padding: 10px 10px 20px 20px;">
				<ul class="works-grid works-grid-4 works-hover-w" id="works-grid">
					<li class="work-item illustration webdesign" id="typeBlock">
							<a
								href="/MeetBoth/_03_product.searchProductByType.controller?type=1">
						<span class="work-image"  onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=1'"
							style="width: 100%; height: 100%;">
								<img style="height:100%" src="html/assets/images/shop/文具.jpg"
								alt="Portfolio Item" />
								<span class="work-caption font-alt">
									<span class="work-title"><img style="" src="html/assets/images/shop/seesee.png"
								alt="Portfolio Item" /></span>
								</span>
						</span>
							</a>
					</li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=2">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=2'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/教具.png"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=3">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=3'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/運動用品.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=4">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=4'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/學生用品.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=5">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=5'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/全新教科書.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=6">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=6'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/全新好書.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=7">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=7'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/二手教科書.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=8">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=8'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/二手好書.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=9">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=9'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/桌上小物.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=10">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=10'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/教室用品.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=11">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=11'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/3c.png"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					<li class="work-item illustration webdesign" id="typeBlock"><a
						href="/MeetBoth/_03_product.searchProductByType.controller?type=12">
							<span class="work-image"
							onclick="window.location='/MeetBoth/_03_product.searchProductByType.controller?type=12'"
							style="width: 100%; height: 100%;"> <img
								style="height: 100%;" src="html/assets/images/shop/益智小物.jpg"
								alt="Portfolio Item" /> <span class="work-caption font-alt">
									<span class="work-title"><img style=""
										src="html/assets/images/shop/seesee.png" alt="Portfolio Item" /></span>
							</span>
						</span>
					</a></li>
					
				</ul>
			</div>
			<!-- 			中間導覽 -->
			<hr class="divider-w">
			<div class="container">
				<div class="row multi-columns-row">
					<div class="row">
						<div class="col-sm-12">
							<img src="html/assets/images/shop/全部商品橫幅.jpg"
								alt="Title of Image" />
						</div>
					</div>
				</div>
			</div>

			<hr class="divider-w">
			<!--         商品陳列 -->
			<!--       動態搜尋列 -->
			<section class="module-small" style="padding-top: 20px;padding-bottom:0px;">
				<div class="container" style="">
					<form class="row"
						action="<c:url value='/_03_product.searchProductWithCondition.controller'/>"
						method="post">
						<div class="col-sm-4 mb-sm-20"
							style="width: 17%; padding-right: 0;">
							<select name="case" class="form-control"
								style="padding-right: 0; font-size: 17px">
								<option value="1">預設排序</option>
								<option value="2">依價格由大到小</option>
								<option value="3">依價格由小到大</option>
								<option value="4">依上架日期排序</option>
								<option value="5">依更新日期排序</option>
							</select>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 15%; padding-right: 0;">
							<select name="typecase" class="form-control"
								style="font-size: 17px">
								<option value="0">全部類別</option>
								<option value="1">文具</option>
								<option value="2">教具</option>
								<option value="3">運動用品</option>
								<option value="4">學生用品</option>
								<option value="5">全新教科書</option>
								<option value="6">全新好書</option>
								<option value="7">二手教科書</option>
								<option value="8">二手好書</option>
								<option value="9">桌上小物</option>
								<option value="10">教室小物</option>
								<option value="11">3c小物</option>
								<option value="12">益智小物</option>
							</select>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 9.5%; padding: 0px 0px 0px 0px;">
							<p align="right" style="font-size: 17px; color: black;">價格區間:&ensp;</p>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 10%; padding-left: 0;">
							<input class="form-control input-sm" type="text" name="lowprice"
								placeholder="0" value="0"
								style="text-align: center; font-size: 17px"
								onkeyup="value=value.replace(/[^\d]/g,'') " />
						</div>
						<div class="col-sm-2 mb-sm-20" style="width: 0.5%; padding: 0px;">
							<p align="right" style="font-size: 17px">~</p>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 10%; padding-right: 0;">
							<input class="form-control input-sm" type="text" name="highprice"
								placeholder="999999" value="999999"
								style="text-align: center; font-size: 17px"
								onkeyup="value=value.replace(/[^\d]/g,'') " />
						</div>
						<div class="col-sm-2 mb-sm-20" style="width: 25%">
							<input class="form-control" type="text" name="searchName"
								style="font-size: 17px" placeholder="搜尋名稱" />
						</div>
						<div class="col-sm-3" style="width: 10%">
							<button class="btn btn-d btn-round" type="submit"
								style="font-size: 17px">搜尋</button>
						</div>
					</form>
				</div>
			</section>
			<!--         商品陳列 -->
			<section class="module-small" style="padding-top:0px;">
				<div class="container">
					<div class="row multi-columns-row">
						<c:forEach var="bean" items="${allprodlist}">
							<div class="col-sm-6 col-md-3 col-lg-3"
								style="padding-bottom: 10px;">
								<div class="shop-item">
									<div id="shop-item-image"
										style="height: 282px; width: 210px; margin: auto; display: flex; justify-content: center; align-items: center;">
										<img style="padding: auto;" alt="${bean.prodName}"
											src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodID}' />">
										<div class="shop-item-detail">
											<a
												href="/MeetBoth/_03_product.PathToProductDetail.controller?id=${bean.prodID}"
												class="btn btn-round btn-b" style="font-size: 14px;"><span
												class="icon-heart">進入商品頁面</span><span class="icon-heart"></span></a>
										</div>
									</div>
									<div id="prodName">
										<strong style="font-size: 16px">${bean.prodName}</strong>
									</div>
									<div id="scoreAVG">
										<c:forEach var="commentBean" items="${bean.productComment}">
											<input type="hidden" id="starAVG"
												value="${commentBean.prodScore}">
										</c:forEach>
										<div id="starAVGDiv" style="font-size: 17px;"></div>
									</div>
									<div id="price">
										<strong style="font-size: 16px">價格 :
											NT$${bean.prodPrice}</strong>
									</div>
									<div id="invt">
										<strong style="font-size: 16px">庫存 :
											${bean.inventory}</strong>
									</div>
									<div id="soldout">
										<strong style="font-size: 16px">已售出 : 0</strong>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="pagination font-alt">
								<a href="#"><i class="fa fa-angle-left"></i></a><a
									class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a
									href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a>
							</div>
						</div>
					</div>
				</div>
			</section>
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<%
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/jquery.min.js";
	%>

	<%
	String basePath2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/browser.min.js";
	%>

	<%
	String basePath3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/breakpoints.min.js";
	%>

	<%
	String basePath4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/util.js";
	%>

	<%
	String basePath5 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/main.js";
	%>
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
	<script>
		function roundToTwo(num) {
			return +(Math.round(num + "e+2") + "e-2");
		}

		const score = document.querySelectorAll("#starAVG");

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const scores = document
									.querySelectorAll("#scoreAVG");
							for (let i = 0; i < scores.length; i++) {
								const score = scores[i];
								const starAVGs = score
										.querySelectorAll("#starAVG");
								let totalScore = 0;
								for (let j = 0; j < starAVGs.length; j++) {
									const starNum = starAVGs[j].value;
									totalScore += Number(starNum);
								}
								let avgScore = roundToTwo(totalScore
										/ starAVGs.length);
								let stars = '';
								if (isNaN(avgScore)) {
									stars = '&nbsp;(0)';
								} else {
									stars = '&nbsp;(' + avgScore + ')';
								}
								let onstar = '<span><i class="fa fa-star star"></i></span>';
								let offstar = '<span><i class="fa fa-star star-off"></i></span>';
								for (var k = 0; k < 5; k++) {
									if (k < avgScore) {
										stars += onstar;
									} else {
										stars += offstar;
									}
								}
								stars += '&nbsp;(' + starAVGs.length + '則評論)'
								score.querySelector("#starAVGDiv").innerHTML = stars;
							}
						});
	</script>
	<script>
	window.onload = function() {
		  window.scroll({
		    top: document.body.scrollHeight / 2.65,
		    behavior: 'smooth'
		  });
		};
</script>

</body>
</html>