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

#ChartData>div>div>div>div>svg>g>text {
	font-size: 22px;
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
					<div class="row">
						<!-- 						左邊欄位開始 -->
						<jsp:include page="/WEB-INF/html/fragment/memCenterSideBar.jsp" />
						<!-- 						左邊欄位結束 -->
						<div class="col-sm-8 col-sm-offset-1" style="margin-left: 20px;">
							<div class="post">
								<div class="post-thumbnail">
									<img src="/MeetBoth/html/assets/images/shop/我的平台.jpg"
										style="padding-bottom: 10px;">
								</div>
								<div class="post-header font-alt" style="display: flex;">
									<img style="" src="/MeetBoth/html/assets/images/shop/兔年海報.jpg"
										style="padding-bottom: 10px;">
								</div>
								<!--       動態搜尋列 -->
								<section class="module-small"
									style="padding-top: 20px; padding-bottom: 0px;">
									<div class="container" style="">
										<form class="row"
											action="<c:url value='/_03_product.searchProductWithCondition3.controller'/>"
											method="post">
											<div class="col-sm-4 mb-sm-20"
												style="width: 17%; padding-right: 0;">
												<select name="case" class="form-control"
													style="padding-right: 0; font-size: 17px">
													<option value="1">預設排序</option>
													<option value="6">依瀏覽次數排序</option>
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
											<div class="col-sm-2 mb-sm-20" style="width: 25%">
												<input class="form-control" type="text" name="searchName"
													style="font-size: 17px" placeholder="搜尋名稱" />
											</div>
											<input type="hidden" name="lowprice" value="0" /> <input
												type="hidden" name="highprice" value="9999999" />
											<div class="col-sm-3" style="width: 10%">
												<button class="btn btn-d btn-round" type="submit"
													style="font-size: 17px">搜尋</button>
											</div>
										</form>
									</div>
								</section>
								<!--       動態搜尋列 -->
								<!--       按鈕列 -->
								<div class="container" style="padding: 0px 10px 0px 20px;">
									<input type="button" value="返回首頁"
										class="btn btn-info btn-circle"
										style="font-size: 17px; color: black;"
										onclick="window.location='/MeetBoth/_03_product.searchAllProduct.controller/1'">
									&nbsp; <input type="button" value="新增商品"
										class="btn btn-warning btn-circle"
										style="font-size: 17px; color: black;"
										onclick="window.location='/MeetBoth/_03_product.pathToInsertProduct.controller'">
								</div>
								<!--       按鈕列 -->
								<!--       商品列 -->
								<div class="post-entry"
									style="overflow-y: scroll; overflow-x: hidden; width: 110%; height: 720px;">
									<div class="widget">
										<ul class="widget-posts" id="prodList">
											<c:forEach var="prodBean" items="${memberBean.product}">
												<li class="clearfix"
													style="background-image: url('/MeetBoth/html/assets/images/shop/backgroundimg.jpg'); background-size: cover; padding-left: 10px; height: 322.5px;">
													<div class="widget-posts-image"
														style="height: 300px; width: 200px; margin: auto; display: flex; justify-content: center; align-items: center; margin-right: 15px;">
														<a
															href="<c:url value='/_03_product.PathToProductDetail.controller?id=${prodBean.prodID}' />"
															style="margin: auto; display: flex; justify-content: center; align-items: center;"><img
															style="padding: auto;"
															src="<c:url value='/_03_product.showPicture.controller?id=${prodBean.prodID}' />" /></a>
													</div>
													<div class="widget-posts-body" style="font-size: 22px;">
														<div class="widget-posts-title">
															<a
																href="<c:url value='/_03_product.PathToProductDetail.controller?id=${prodBean.prodID}' />">商品名稱
																: ${prodBean.prodName}</a>
														</div>
														<div class="widget-posts-meta"
															style="display: flex; height: 38px;">
															商品狀態 : ${prodBean.prodState}
															<div
																style="position: relative; left: 280; bottom: 30; display: grid;">
																<button class="btn btn-b btn-circle"
																	style="font-size: 17px; margin-bottom: 10px;"
																	onclick="window.location='/MeetBoth/_03_product.catchSingleProductDate.controller?id=${prodBean.prodID}'">修改</button>
																<button class="btn btn-b btn-circle deleteThisProduct"
																	name="${prodBean.prodID}" style="font-size: 17px;">刪除</button>
															</div>
														</div>
														<div class="widget-posts-meta" style="display: flex">
															商品價格 : NT$${prodBean.prodPrice}</div>
														<div class="widget-posts-meta">商品庫存 :
															${prodBean.inventory}</div>
														<div class="widget-posts-meta">商品瀏覽次數 :
															${prodBean.prodCheck}</div>
														<div id="scoreAVG" class="widget-posts-meta">
															<c:forEach var="commentBean"
																items="${prodBean.productComment}">
																<input type="hidden" id="starAVG"
																	value="${commentBean.prodScore}">
															</c:forEach>
															<div id="starAVGDiv" style="font-size: 17px;"></div>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
							</div>
							<!--       商品列 -->
							<!--       賣場管理列 -->
							<div class="post-header font-alt" style="display: flex;">
								<img src="/MeetBoth/html/assets/images/shop/兔年海報3.jpg"
									style="padding-bottom: 10px;">
							</div>
							<form method="Post"
								action="<c:url value='/_03_product.updateProductState.controller' />">
								<div class="container" style="padding: 0px 10px 0px 20px;">
									<input type="submit" value="商品上架"
										class="btn btn-info btn-circle"
										style="font-size: 17px; color: black;" onclick="#">
									&nbsp; <input type="submit" value="商品下架"
										class="btn btn-warning btn-circle"
										style="font-size: 17px; color: black;" onclick="#">
								</div>
								<hr class="divider-w pt-20">
								<div class="row">
									<div class="col-sm-12">
										<table class="table table-striped table-border checkout-table">
											<tbody>
												<tr>
													<th style="text-align: center;"></th>
													<th style="text-align: center;">商品名稱</th>
													<th style="text-align: center;">商品類別</th>
													<th style="text-align: center;" class="hidden-xs">價格</th>
													<th style="text-align: center;">庫存</th>
													<th style="text-align: center;">狀態</th>
												</tr>
												<tr id="tr1" style="text-align: center;"></tr>
												<c:forEach var="prodBean" items="${memberBean.product}">
													<tr>
														<td class="hidden-xs"
															style="text-align: center; vertical-align: middle;">
															<input type="checkbox" name="selectForUpdateState"
															value="${prodBean.prodID}" /> <label for="check"></label>
														</td>
														<td>
															<h5 class="product-title font-alt">${prodBean.prodName}</h5>
														</td>
														<td class="hidden-xs">
															<h5 class="product-title font-alt">${prodBean.prodtype.prodClassName}</h5>
														</td>
														<td>
															<h5 class="product-title font-alt">NT$${prodBean.prodPrice}</h5>
														</td>
														<td>
															<h5 class="product-title font-alt">${prodBean.inventory}</h5>
														</td>
														<td>
															<h5 class="product-title font-alt" style="color: Blue;">${prodBean.prodState}</h5>
														</td>
													</tr>
												</c:forEach>
											</tbody>
										</table>
									</div>
								</div>
							</form>
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
	<!-- SweetAlert js -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- SweetAlert js -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
		window.onload = function () {
			var body = document.getElementById("prodList")
			var body2 = document.getElementById("tr1")
			if (body.innerHTML.trim() === '') {
				body.innerHTML = "<span style='font-size:30px;margin-left:50px;'>目前沒有商品</span>";
				var str = '';
				str += "<td style='font-size:30px;margin-left:50px;'>目</td>";
				str += "<td style='font-size:30px;margin-left:50px;'>前</td>";
				str += "<td style='font-size:30px;margin-left:50px;'>沒</td>";
				str += "<td style='font-size:30px;margin-left:50px;'>有</td>";
				str += "<td style='font-size:30px;margin-left:50px;'>商</td>";
				str += "<td style='font-size:30px;margin-left:50px;'>品</td>";
				body2.innerHTML = str;
			}
		};
		</script>
	<script>
	
        $(function(){
        	$('.deleteThisProduct').click(function(){
                let id=$(this).attr("name");
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
                         url:'/MeetBoth/_03_product.deleteProductById.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/_03_product.searchAllProduct.controller/1'
                                console.log("delete")
                             })//done
                             .fail(function(error) {
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