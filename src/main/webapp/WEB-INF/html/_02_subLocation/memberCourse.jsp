<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

h1 {
	font-size: 18px;
	font-weight: 700;
	text-align: center;
	margin: 20px 0;
}

.cart>li>a {
	border: 1px solid gray;
	border-radius: 10px;
	color: gray;
	font-weight: 600;
	font-size: 16px;
	padding: 10px;
	text-align: center;
}

.cart>li {
	padding-bottom: 10px;
}

.cart>li>ul>li>a {
	border: solid 1px black;
	border-radius: 10px;
	height: 35px;
	text-align: center;
	font-size: 18px;
}

.cart>li>ul>li>a:hover, .cart>li>ul>li>a.active {
	background: gray;
	color: #fff;
}

.cart>li>a:hover, .cart>li>a.active {
	background: gray;
	color: #fff;
}

.cart a {
	display: block;
	text-decoration: none;
}

.cart ul {
	display: none;
}

.cart ul li {
	margin: 10px;
}

.cart ul li a {
	color: #000;
}

<<<<<<<
HEAD
#ChartData>div>div>div>div>svg>g>text {
	font-size: 22px;
}

#ChartData>div>div>div>div>svg>g>g>g>text {
	font-size: 17px;
	#
	ChartData
	>div>div>div>div>svg>g>text{
	font-size
	:
	22px;
}

#ChartData>div>div>div>div>svg>g>g>g>text {
	font-size: 17px;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		<div class="main">

			<section class="module" style="padding-top: 10px;">
				<div class="container">
<!-- 					<div class="row"> -->
<!-- 						<div class="col-sm-4 col-md-3 sidebar" -->
<!-- 							style="position: sticky; top: 100px;"> -->
<!-- 							<img src="/MeetBoth/html/assets/images/shop/賣家中心.png" -->
<!-- 								style="padding-bottom: 10px;"> -->

<!-- 							<ul class="cart"> -->
<!-- 								<li><a href="#">商品管理&ensp;<i -->
<!-- 										class="fa-solid fa-angle-double-down"></i></a> -->
<!-- 									<ul style=""> -->
<!-- 										<li><a -->
<%-- 											href="<c:url value='/_03_product/pathToMyPDP.controller'/>">我的商品</a></li> --%>
<!-- 										<li><a -->
<%-- 											href="<c:url value='/_03_product.pathToInsertProduct.controller'/>">新增商品</a></li> --%>
<!-- 									</ul></li> -->
<!-- 								<li><a href="#" style="">訂單管理&ensp;<i -->
<!-- 										class="fa-solid fa-angle-double-down"></i></a> -->
<!-- 									<ul style=""> -->
<!-- 										<li><a href="#">我的銷售</a></li> -->
<!-- 										<li><a href="#">待付款訂單</a></li> -->
<!-- 										<li><a href="#">待出貨訂單</a></li> -->
<!-- 										<li><a href="#">已完成訂單</a></li> -->
<!-- 									</ul></li> -->
<!-- 								<li><a href="#">賣場管理&ensp;<i -->
<!-- 										class="fa-solid fa-angle-double-down"></i></a> -->
<!-- 									<ul style=""> -->
<!-- 										<li><a href="#">賣場評價</a></li> -->
<!-- 										<li><a href="#">賣場介紹</a></li> -->
<!-- 									</ul></li> -->
<!-- 								<li><a href="#">財務管理&ensp;<i -->
<!-- 										class="fa-solid fa-angle-double-down"></i></a> -->
<!-- 									<ul style=""> -->
<!-- 										<li><a href="#">子選單3-1</a></li> -->
<!-- 										<li><a href="#">子選單3-2</a></li> -->
<!-- 										<li><a href="#">子選單3-3</a></li> -->
<!-- 									</ul></li> -->
<!-- 								<li><a href="#">數據中心&ensp;<i -->
<!-- 										class="fa-solid fa-angle-double-down"></i></a> -->
<!-- 									<ul style=""> -->
<!-- 										<li><a href="#">賣家數據中心</a></li> -->
<!-- 										<li><a href="#">營運表現</a></li> -->
<!-- 									</ul></li> -->
<!-- 							</ul> -->
<!-- 						</div> -->
<!-- 					</div> -->
					<div class="col-sm-8 col-sm-offset-1" style="margin-left: 20px;">
						<div class="post">
							<div class="post-thumbnail">
								<img src="/MeetBoth/html/assets/images/shop/個人賣場.jpg"
									style="padding-bottom: 10px;">

							</div>
							<div class="post-header font-alt" style="display: flex;">
								<img style="" src="/MeetBoth/html/assets/images/shop/兔年海報.jpg"
									style="padding-bottom: 10px;">
							</div>

							<!-- 							動態搜尋列 -->
							<section class="module-small" style="padding-bottom: 10px;">
								<div class="container">
									<form class="row"
										action="<c:url value='/searchCourseWithCondition.controller'/>"
										method="post">
										<div class="col-sm-4 mb-sm-20"
											style="width: 20%; padding-right: 0;">
											<select name="case" class="form-control"
												style="padding-right: 0;">
												<option value="1">預設排序</option>
												<option value="2">依價格由大到小</option>
												<option value="3">依價格由小到大</option>
												<option value="4">依上架日期排序</option>
												<option value="5">依更新日期排序</option>
											</select>
										</div>
										<div class="col-sm-2 mb-sm-20"
											style="width: 20%; padding-right: 0;">
											<select name="typecase" class="form-control" style="">
												<option value="0">全部類別</option>
												<option value="1">語言學習</option>
												<option value="2">升學補習</option>
												<option value="3">專業科目</option>
												<option value="4">人文課程</option>
												<option value="5">程式課程</option>
											</select>
										</div>
										<div class="col-sm-2 mb-sm-20"
											style="width: 7.5%; padding: 0px 0px 0px 0px;">
											<p align="right" style="font-size: 17px;">價格區間:&ensp;</p>
										</div>
										<div class="col-sm-2 mb-sm-20"
											style="width: 10%; padding-left: 0;">
											<input class="form-control input-sm" type="text"
												name="lowprice" placeholder="0" value="0"
												style="text-align: center;"
												onkeyup="value=value.replace(/[^\d]/g,'') " />
										</div>
										<div class="col-sm-2 mb-sm-20"
											style="width: 0.5%; padding: 0px;">
											<p align="right" style="">~</p>
										</div>
										<div class="col-sm-2 mb-sm-20"
											style="width: 10%; padding-right: 0;">
											<input class="form-control input-sm" type="text"
												name="highprice" placeholder="999999" value="999999"
												style="text-align: center;"
												onkeyup="value=value.replace(/[^\d]/g,'') " />
										</div>
										<div class="col-sm-2 mb-sm-20" style="width: 22%">
											<input class="form-control" type="text" name="searchName"
												style="" placeholder="搜尋名稱" />
										</div>
										<div class="col-sm-3" style="width: 10%">
											<button class="btn btn-p btn-round" type="submit" style="">搜尋</button>
										</div>
									</form>
								</div>
							</section>




							<!-- 			返回首頁 隨便看看 新增商品 -->
							<div class="container" style="padding: 10px 10px 20px 20px;">
								<input type="button" value="返回首頁"
									class="btn btn-info btn-circle"
									style="font-size: 17px; color: black;"
									onclick="window.location='/MeetBoth/PathToMemberCourse.controller?id=${bean.memberID}'">
								&nbsp; <input type="button" value="新增商品"
									class="btn btn-warning btn-circle"
									style="font-size: 17px; color: black;"
									onclick="window.location='/MeetBoth/pathToInsertCourse.controller'">
							</div>
							<!-- 			返回首頁 隨便看看 新增商品 -->
							<hr class="divider-w">
							<!--         商品陳列 -->
							<div class="post-entry"
								style="overflow-y: scroll; overflow-x: hidden; width: 110%; height: 720px;">
								<div class="widget">
									<ul class="widget-posts">
										<c:forEach var="bean" items="${courseBean}">
											<div class="col-sm-6 col-md-3 col-lg-3"
												style="padding-bottom: 10px;">
												<div class="shop-item">
													<div id="shop-item-image"
														style="height: 282px; width: 210px; margin: auto; display: flex; justify-content: center; align-items: center;">
														<img style="padding: auto;" alt="${bean.courseName}"
															src="<c:url value='/showCoursePicture.controller?id=${bean.courseID}' />">
														<div class="shop-item-detail">
															<a
																href="/MeetBoth/PathToMemberCourseDetail.controller?id=${bean.courseID}"
																class="btn btn-round btn-p" style="font-size: 14px;"><span
																class="icon-heart">進入商品頁面</span><span class="icon-heart"></span></a>
														</div>
													</div>
													<div id="memberName">
														<strong style="font-size: 16px">賣家 :
															${bean.memberID}</strong>
													</div>
													<div id="courseName">
														<strong style="font-size: 16px">${bean.courseName}</strong>
													</div>
													<div id="price">
														<strong style="font-size: 16px">價格 :
															NT$${bean.coursePrice}</strong>
													</div>
													<div id="soldout">
														<strong style="font-size: 16px">已售出 : 0</strong>
													</div>
												</div>
											</div>
										</c:forEach>
									</ul>
								</div>
							</div>
							
						</div>
						<!--訂單管理 -->
										<div class="post-header font-alt" style="display: flex;">
											<img src="/MeetBoth/html/assets/images/shop/兔年海報2.jpg"
												style="padding-bottom: 10px;">
										</div>
										<div class="row mt-70" style="margin-top: 0px !important;">
											<div class="col-sm-12">
												<ul class="nav nav-tabs font-alt" role="tablist">
													<li class="active"><a href="#description" data-toggle="tab"><span
																class="icon-tools-2"></span>Description</a></li>
													<li><a href="#data-sheet" data-toggle="tab"><span
																class="icon-tools-2"></span>Data sheet</a></li>
													<li><a href="#reviews" data-toggle="tab"><span
																class="icon-tools-2"></span>Reviews (2)</a></li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="description">
														<p>Everyone realizes why a new common language would be
															desirable: one could refuse to pay expensive translators. To
															achieve this, it would be necessary to have uniform grammar,
															pronunciation and more common words. If several languages
															coalesce, the grammar of the resulting language is more
															simple and regular than that of the individual languages.
														</p>
														<p>The European languages are members of the same family.
															Their separate existence is a myth. For science, music,
															sport, etc, Europe uses the same vocabulary. The languages
															only differ in their grammar, their pronunciation and their
															most common words.</p>
													</div>
													<div class="tab-pane" id="data-sheet">
														<table class="table table-striped ds-table table-responsive">
															<tbody>
																<tr>
																	<th>Title</th>
																	<th>Info</th>
																</tr>
																<tr>
																	<td>Compositions</td>
																	<td>Jeans</td>
																</tr>
																<tr>
																	<td>Size</td>
																	<td>44, 46, 48</td>
																</tr>
																<tr>
																	<td>Color</td>
																	<td>Black</td>
																</tr>
																<tr>
																	<td>Brand</td>
																	<td>Somebrand</td>
																</tr>
															</tbody>
														</table>
													</div>
													<div class="tab-pane" id="reviews">
														<div class="comments reviews">
															<div class="comment clearfix">
																<div class="comment-avatar">
																	<img src="" alt="avatar" />
																</div>
																<div class="comment-content clearfix">
																	<div class="comment-author font-alt">
																		<a href="#">John Doe</a>
																	</div>
																	<div class="comment-body">
																		<p>The European languages are members of the
																			same
																			family. Their separate existence is a myth.
																			For science,
																			music, sport, etc, Europe uses the same
																			vocabulary. The
																			European languages are members of the same
																			family. Their
																			separate existence is a myth.</p>
																	</div>
																	<div class="comment-meta font-alt">
																		Today, 14:55 -<span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star-off"></i></span>
																	</div>
																</div>
															</div>
															<div class="comment clearfix">
																<div class="comment-avatar">
																	<img src="" alt="avatar" />
																</div>
																<div class="comment-content clearfix">
																	<div class="comment-author font-alt">
																		<a href="#">Mark Stone</a>
																	</div>
																	<div class="comment-body">
																		<p>Europe uses the same vocabulary. The European
																			languages are members of the same family.
																			Their separate
																			existence is a myth.</p>
																	</div>
																	<div class="comment-meta font-alt">
																		Today, 14:59 -<span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star"></i></span><span><i
																				class="fa fa-star star-off"></i></span><span><i
																				class="fa fa-star star-off"></i></span>
																	</div>
																</div>
															</div>
														</div>
														<div class="comment-form mt-30">
															<h4 class="comment-form-title font-alt">Add review</h4>
															<form method="post">
																<div class="row">
																	<div class="col-sm-4">
																		<div class="form-group">
																			<label class="sr-only"
																				for="name">Name</label> <input
																				class="form-control" id="name"
																				type="text" name="name"
																				placeholder="Name" />
																		</div>
																	</div>
																	<div class="col-sm-4">
																		<div class="form-group">
																			<label class="sr-only"
																				for="email">Name</label> <input
																				class="form-control" id="email"
																				type="text" name="email"
																				placeholder="E-mail" />
																		</div>
																	</div>
																	<div class="col-sm-4">
																		<div class="form-group">
																			<select class="form-control">
																				<option selected>Rating</option>
																				<option value="1">1</option>
																				<option value="2">2</option>
																				<option value="3">3</option>
																				<option value="4">4</option>
																				<option value="5">5</option>
																			</select>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<div class="form-group">
																			<textarea class="form-control" id="" name=""
																				rows="4"
																				placeholder="Review"></textarea>
																		</div>
																	</div>
																	<div class="col-sm-12">
																		<button class="btn btn-round btn-d"
																			type="submit">Submit
																			Review</button>
																	</div>
																</div>
															</form>
														</div>
													</div>
												</div>
											</div>
										</div>
										<!--       賣場管理列 -->
										<div class="post-header font-alt" style="display: flex;">
											<img src="/MeetBoth/html/assets/images/shop/兔年海報3.jpg"
												style="padding-bottom: 10px;">
										</div>
										<div class="container" style="padding: 0px 10px 0px 20px;">
											<input type="button" value="商品上架" class="btn btn-info btn-circle"
												style="font-size: 17px; color: black;" onclick="#">
											&nbsp; <input type="button" value="商品下架" class="btn btn-warning btn-circle"
												style="font-size: 17px; color: black;" onclick="#">
										</div>
										<hr class="divider-w pt-20">
										<div class="row">
											<div class="col-sm-12">
												<table class="table table-striped table-border checkout-table">
													<tbody>
														<tr>
															<th></th>
															<th>商品名稱</th>
															<th>商品類別</th>
															<th class="hidden-xs">價格</th>
															<th>庫存</th>
															<th>狀態</th>
														</tr>
														<tr>
															<td class="hidden-xs"
																style="text-align: center; vertical-align: middle;">
																<input type="checkbox" id="coding" name="interest"
																	value="coding" />
																<label for="coding"></label>
															</td>
															<td>
																<h5 class="product-title font-alt">書包</h5>
															</td>
															<td class="hidden-xs">
																<h5 class="product-title font-alt">學生用品</h5>
															</td>
															<td>
																<h5 class="product-title font-alt">NT$299</h5>
															</td>
															<td>
																<h5 class="product-title font-alt">10</h5>
															</td>
															<td>
																<h5 class="product-title font-alt" style="color: Blue;">
																	上架</h5>
															</td>
														</tr>
														<tr>
															<td class="hidden-xs"
																style="text-align: center; vertical-align: middle;">
																<input type="checkbox" id="coding" name="interest"
																	value="coding" />
																<label for="coding"></label>
															</td>
															<td>
																<h5 class="product-title font-alt">金魚也能懂得css</h5>
															</td>
															<td class="hidden-xs">
																<h5 class="product-title font-alt">二手參考書</h5>
															</td>
															<td>
																<h5 class="product-title font-alt">NT$599</h5>
															</td>
															<td>
																<h5 class="product-title font-alt">10</h5>
															</td>
															<td>
																<h5 class="product-title font-alt" style="color: red;">
																	下架</h5>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<!--       賣場管理列 -->
										<!--訂單管理 -->
										<div class="post-header font-alt" style="display: flex;">
											<img src="/MeetBoth/html/assets/images/shop/兔年海報4.jpg"
												style="padding-bottom: 10px;">
										</div>
										<!-- 數據中心 -->
										<div class="row">
											<div class="col-sm-12" style="display: flex;" id="ChartData">
												<div id="chart_div" style="width: 50%; height: 500px;"></div>
												<div id="curve_chart" style="width: 50%; height: 500px;"></div>
											</div>
										</div>

										<!-- 數據中心 -->
					</div>
				</div>
			</section>
			<!-- Footer -->
			<!-- 引入共同的footerMVC -->
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
		</div>


	</main>
	<!--  
    JavaScripts
    =============================================
    -->
				<% String basePath1=request.getScheme() + "://" + request.getServerName() + ":" +
					request.getServerPort() + path + "/html/assets/js/jquery.min.js" ; %>

					<% String basePath2=request.getScheme() + "://" + request.getServerName() + ":" +
						request.getServerPort() + path + "/html/assets/js/browser.min.js" ; %>

						<% String basePath3=request.getScheme() + "://" + request.getServerName() + ":" +
							request.getServerPort() + path + "/html/assets/js/breakpoints.min.js" ; %>

							<% String basePath4=request.getScheme() + "://" + request.getServerName() + ":" +
								request.getServerPort() + path + "/html/assets/js/util.js" ; %>

								<% String basePath5=request.getScheme() + "://" + request.getServerName() + ":" +
									request.getServerPort() + path + "/html/assets/js/main.js" ; %>
									<script src=<%=basePath1%>></script>
									<script src=<%=basePath2%>></script>
									<script src=<%=basePath3%>></script>
									<script src=<%=basePath4%>></script>
									<script src=<%=basePath5%>></script>
									<script src="https://kit.fontawesome.com/25590258af.js"
										crossorigin="anonymous"></script>
									<!-- SweetAlert js -->
									<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
									<!-- SweetAlert js -->
									<script type="text/javascript"
										src="https://www.gstatic.com/charts/loader.js"></script>
									<script>
											$(function () {
												$('.deleteThisProduct').click(function () {
													let id = $(this).attr("name");
													Swal.fire({
														title: '你確定要刪除嗎?',
														text: "將無法恢復此筆訂單!!!",
														icon: 'warning',
														//icon:  "success", "error", "warning", "info" or "question" 這幾種選項
														showCancelButton: true,
														confirmButtonColor: '#f7d966',
														cancelButtonColor: '#3d3b39',
														cancelButtonText: '取消',
														confirmButtonText: '確定刪除'
													}).then((result) => {
														if (result.isConfirmed) {
															$.ajax({
																//專案名稱+servlet
																url: '/MeetBoth/_03_product.deleteProductById.controller',
																method: "post",
																dataType: "text",
																//對應name設定的名稱 並非value的名稱
																data: { "id": id },
															})
																.done(function () {
																	window.location = '/MeetBoth/_03_product.searchAllProduct.controller'
																	console.log("delete")
																})//done
																.fail(function (error) {
																	console.log(error)
																})//fail end
														}//if
													})//then
												})//click end
											});
        //function end
									</script>
									<script>
										function roundToTwo(num) {
											return +(Math.round(num + "e+2") + "e-2");
										}
										const score = document.querySelectorAll("#starAVG");
										document
											.addEventListener(
												"DOMContentLoaded",
												function () {
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
									<script type="text/javascript">
										google.charts.load('current', { 'packages': ['corechart'] });
										google.charts.setOnLoadCallback(drawChart);
										function drawChart() {
											var data = google.visualization.arrayToDataTable([
												['Year', 'Sales', 'Expenses'],
												['2004', 1000, 400],
												['2005', 1170, 460],
												['2006', 660, 1120],
												['2007', 1030, 540]
											]);
											var options = {
												title: '圖表2',
												curveType: 'function',
												legend: { position: 'bottom' }
											};
											var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));
											chart.draw(data, options);
										}
									</script>
									<script type="text/javascript">
										google.charts.load("current", { packages: ["corechart"] });
										google.charts.setOnLoadCallback(drawChart);
										function drawChart() {
											var data = google.visualization.arrayToDataTable([
												['Dinosaur', 'Length'],
												['Acrocanthosaurus (top-spined lizard)', 12.2],
												['Albertosaurus (Alberta lizard)', 9.1],
												['Allosaurus (other lizard)', 12.2],
												['Apatosaurus (deceptive lizard)', 22.9],
												['Archaeopteryx (ancient wing)', 0.9],
												['Argentinosaurus (Argentina lizard)', 36.6],
												['Baryonyx (heavy claws)', 9.1],
												['Brachiosaurus (arm lizard)', 30.5],
												['Ceratosaurus (horned lizard)', 6.1],
												['Coelophysis (hollow form)', 2.7],
												['Compsognathus (elegant jaw)', 0.9],
												['Deinonychus (terrible claw)', 2.7],
												['Diplodocus (double beam)', 27.1],
												['Dromicelomimus (emu mimic)', 3.4],
												['Gallimimus (fowl mimic)', 5.5],
												['Mamenchisaurus (Mamenchi lizard)', 21.0],
												['Megalosaurus (big lizard)', 7.9],
												['Microvenator (small hunter)', 1.2],
												['Ornithomimus (bird mimic)', 4.6],
												['Oviraptor (egg robber)', 1.5],
												['Plateosaurus (flat lizard)', 7.9],
												['Sauronithoides (narrow-clawed lizard)', 2.0],
												['Seismosaurus (tremor lizard)', 45.7],
												['Spinosaurus (spiny lizard)', 12.2],
												['Supersaurus (super lizard)', 30.5],
												['Tyrannosaurus (tyrant lizard)', 15.2],
												['Ultrasaurus (ultra lizard)', 30.5],
												['Velociraptor (swift robber)', 1.8]]);
											var options = {
												title: '圖表1',
												legend: { position: 'none' },
											};
											var chart = new google.visualization.Histogram(document.getElementById('chart_div'));
											chart.draw(data, options);
										}
									</script>
									<script>
										$(document).ready(function () {
											//以ul li包子選單
											$('.cart>li>a').click(function (event) {
												event.preventDefault();
												$(this).toggleClass('active');
												$(this).siblings('ul').slideToggle(500);
											});
											//html以div h3 h5包子選單
											$('.list h3').click(function (event) {
												$(this).toggleClass('active');
												$(this).siblings('h5').slideToggle(500);
											});
										});
									</script>
									<script>
										var ctx = document.getElementById("example"),
											example = new Chart(ctx, {
												// 參數設定[註1]
												type: "bar", // 圖表類型
												data: {
													labels: ["Red", "Green", "Blue"], // 標題
													datasets: [{
														label: "# of Votes", // 標籤
														data: [12, 19, 3], // 資料
														backgroundColor: [ // 背景色
															"#FF0000",
															"#00FF00",
															"#0000FF",
														],
														borderWidth: 1 // 外框寬度
													}]
												}
											});
									</script>

</body>
</html>