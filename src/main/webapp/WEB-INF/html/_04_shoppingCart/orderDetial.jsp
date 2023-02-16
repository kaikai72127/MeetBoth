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

								<!-- 訂單編號 -->
								<table style="padding-bottom: 20px; width: 100%;font-size:20px" >
									<tbody>
										<tr>
											<th colspan="2"
												style="background: #ce7777; height: 34px; color: #fff; text-align: left; padding-left: 10px; border: 1px #ce7777 solid;">
												訂購資訊</th>
										</tr>

										<tr>
											<td
												style="width: 20%; background: #efefef; border: 1px #dedede solid; padding: 8px;">
												訂購人姓名</td>
											<td style="padding: 8px; border: 1px #dedede solid">${orderBean.memberbuy.memName}</td>
										</tr>

										<tr>
											<td
												style="width: 20%; background: #efefef; border: 1px #dedede solid; padding: 8px;">
												訂購編號</td>
											<td style="padding: 8px; border: 1px #dedede solid">${orderBean.orderUID}</td>
										</tr>

										<tr>
											<td
												style="width: 20%; background: #efefef; border: 1px #dedede solid; padding: 8px;">
												訂購日期</td>
											<td style="padding: 8px; border: 1px #dedede solid">
												${orderBean.orderDate}</td>
										</tr>
										<tr>
											<td
												style="width: 20%; background: #efefef; border: 1px #dedede solid; padding: 8px;">
												收件人姓名</td>
											<td style="padding: 8px; border: 1px #dedede solid">${orderBean.shippingName}</td>
										</tr>
										<tr>
											<td
												style="width: 20%; background: #efefef; border: 1px #dedede solid; padding: 8px;">
												收件人電話</td>
											<td style="padding: 8px; border: 1px #dedede solid">${orderBean.shippingPhone}</td>
										</tr>
										<tr>
											<td
												style="width: 20%; background: #efefef; border: 1px #dedede solid; padding: 8px;">
												收件人地址</td>
											<td style="padding: 8px; border: 1px #dedede solid">${orderBean.shippingAddress}</td>
										</tr>
									</tbody>
								</table>

								<!-- 訂單明細 -->

								<br>

								<table style="padding-bottom: 20px; width: 100%;font-size:20px">
									<tbody>
										<tr>
											<th colspan="6"
												style="background: #ce7777; height: 34px; color: #fff; text-align: left; padding-left: 10px; border: 1px #ce7777 solid;">
												訂購明細</th>
										</tr>

										<tr>
											<td
												style="border: 1px #dedede solid; padding: 8px; background: #efefef">
												商品照片</td>
											<td
												style="border: 1px #dedede solid; padding: 8px; background: #efefef">
												商品名稱</td>
											<td
												style="border: 1px #dedede solid; padding: 8px; background: #efefef">
												數量</td>
											<td
												style="border: 1px #dedede solid; padding: 8px; background: #efefef">
												金額</td>
											<td
												style="border: 1px #dedede solid; padding: 8px; background: #efefef">
												小計</td>
										</tr>
										<c:forEach var="items" items="${items}">
											<tr>
												<td style="padding: 8px; border: 1px #dedede solid"><a
													href="/MeetBoth/_03_product.PathToProductDetail.controller?id=${items.prodItem.prodID}"><img
														src="<c:url value='/_03_product.showPicture.controller?id=${items.prodItem.prodID}' />"
														alt="" style="width: 100px; float: left;"></a></td>
												<td style="padding: 8px; border: 1px #dedede solid">${items.prodItem.prodName}</td>
												<td style="padding: 8px; border: 1px #dedede solid">${items.qty}</td>
												<td style="padding: 8px; border: 1px #dedede solid">${items.prodItem.prodPrice}</td>
												<td style="padding: 8px; border: 1px #dedede solid">${items.itemTotal}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3"
												style="padding: 8px; border: 1px #dedede solid; text-align: center">
												折扣金額</td>
											<td colspan="2"
												style="padding: 8px; border: 1px #dedede solid">${orderBean.discount.discountPrice}</td>
										</tr>

										<tr>
											<td colspan="3"
												style="padding: 8px; border: 1px #dedede solid; text-align: center">
												總計金額</td>
											<td colspan="2"
												style="padding: 8px; border: 1px #dedede solid">${orderBean.totalAmount}</td>
										</tr>
									</tbody>
								</table>

								<div align="center">
									<a href="<c:url value='/memberOrdersList.controller' />"
										class="btn border"
										style="font-size: 20px; color: #ce7777; font-weight: 1000;">
										<i class="fa-regular fa-circle-left"></i>返回
									</a>
								</div>
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
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
		google.charts.load('current', {
			'packages' : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);

		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Year', 'Sales', 'Expenses' ], [ '2004', 1000, 400 ],
					[ '2005', 1170, 460 ], [ '2006', 660, 1120 ],
					[ '2007', 1030, 540 ] ]);

			var options = {
				title : '圖表2',
				curveType : 'function',
				legend : {
					position : 'bottom'
				}
			};

			var chart = new google.visualization.LineChart(document
					.getElementById('curve_chart'));

			chart.draw(data, options);
		}
	</script>
	<script type="text/javascript">
		google.charts.load("current", {
			packages : [ "corechart" ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization.arrayToDataTable([
					[ 'Dinosaur', 'Length' ],
					[ 'Acrocanthosaurus (top-spined lizard)', 12.2 ],
					[ 'Albertosaurus (Alberta lizard)', 9.1 ],
					[ 'Allosaurus (other lizard)', 12.2 ],
					[ 'Apatosaurus (deceptive lizard)', 22.9 ],
					[ 'Archaeopteryx (ancient wing)', 0.9 ],
					[ 'Argentinosaurus (Argentina lizard)', 36.6 ],
					[ 'Baryonyx (heavy claws)', 9.1 ],
					[ 'Brachiosaurus (arm lizard)', 30.5 ],
					[ 'Ceratosaurus (horned lizard)', 6.1 ],
					[ 'Coelophysis (hollow form)', 2.7 ],
					[ 'Compsognathus (elegant jaw)', 0.9 ],
					[ 'Deinonychus (terrible claw)', 2.7 ],
					[ 'Diplodocus (double beam)', 27.1 ],
					[ 'Dromicelomimus (emu mimic)', 3.4 ],
					[ 'Gallimimus (fowl mimic)', 5.5 ],
					[ 'Mamenchisaurus (Mamenchi lizard)', 21.0 ],
					[ 'Megalosaurus (big lizard)', 7.9 ],
					[ 'Microvenator (small hunter)', 1.2 ],
					[ 'Ornithomimus (bird mimic)', 4.6 ],
					[ 'Oviraptor (egg robber)', 1.5 ],
					[ 'Plateosaurus (flat lizard)', 7.9 ],
					[ 'Sauronithoides (narrow-clawed lizard)', 2.0 ],
					[ 'Seismosaurus (tremor lizard)', 45.7 ],
					[ 'Spinosaurus (spiny lizard)', 12.2 ],
					[ 'Supersaurus (super lizard)', 30.5 ],
					[ 'Tyrannosaurus (tyrant lizard)', 15.2 ],
					[ 'Ultrasaurus (ultra lizard)', 30.5 ],
					[ 'Velociraptor (swift robber)', 1.8 ] ]);

			var options = {
				title : '圖表1',
				legend : {
					position : 'none'
				},
			};

			var chart = new google.visualization.Histogram(document
					.getElementById('chart_div'));
			chart.draw(data, options);
		}
	</script>
	<script>
		$(document).ready(function() {
			//以ul li包子選單
			$('.cart>li>a').click(function(event) {
				event.preventDefault();
				$(this).toggleClass('active');
				$(this).siblings('ul').slideToggle(500);
			});
			//html以div h3 h5包子選單
			$('.list h3').click(function(event) {
				$(this).toggleClass('active');
				$(this).siblings('h5').slideToggle(500);
			});

		});
	</script>
	<script>
		var ctx = document.getElementById("example"), example = new Chart(ctx,
				{
					// 參數設定[註1]
					type : "bar", // 圖表類型
					data : {
						labels : [ "Red", "Green", "Blue" ], // 標題
						datasets : [ {
							label : "# of Votes", // 標籤
							data : [ 12, 19, 3 ], // 資料
							backgroundColor : [ // 背景色
							"#FF0000", "#00FF00", "#0000FF", ],
							borderWidth : 1
						// 外框寬度
						} ]
					}
				});
	</script>
</body>
</html>