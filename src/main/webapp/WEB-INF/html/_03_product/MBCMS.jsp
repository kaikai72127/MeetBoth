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
<%-- <jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" /> --%>
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
	border: solid 1px gray;
	border-radius: 10px;
	text-align: center;
	font-size: 18px;
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

.navbar.navbar-custom.navbar-fixed-top.headershadow {
	background-color: black;
	margin-bottom: 0;
}

.navbar.navbar-custom.navbar-fixed-top.headershadow>div>div>img {
	height: 70;
}

.nav.navbar-nav.navbar-right>li>a {
	color: white !important;
}

.fas.fa-shopping-cart.text-primary {
	color: white !important;
}

#ChartData>div>div>div>div>svg>g>text {
	font-size: 22px;
}

#ChartData>div>div>div>div>svg>g>g>g>text {
	font-size: 17px;
}

.navbar-brand {
	color: white !important;
}

span {
	color: white;
	font-size: 25px;
	font-weight: 550;
	margin: auto 10;
	line-height: 2.5;
}

a {
	color: white;
	font-size: 25px;
	font-width: 550;
}

.MBbtn {
	font-size: 25px;
	background-color: black;
	color: white;
	border: solid 1px white;
	border-radius: 50%;
	margin: auto 10px;
	transition: color 0.5s;
	text-align: center;
}

.MBbtn:hover {
	font-size: 25px;
	background-color: black;
	color: yellow;
	border: solid 1px yellow;
	margin: auto 10px;
	border-radius: 50%;
}

.MBinput {
	font-size: 25px;
	background-color: black;
	color: white;
	border: solid 1px white;
	margin: auto 10px;
	transition: color 0.5s;
	text-align: center;
}

.MBinput:hover {
	font-size: 25px;
	background-color: black;
	color: yellow;
	border: solid 1px yellow;
	margin: auto 10px;
}

#columnchart_values>div>div>div>svg>g>text {
	font-size: 25px;
}

a:hover {
	color: yellow;
	border-bottom: solid 1px yellow;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main" style="background-color: black;">
			<section class="module"
				style="padding-top: 10px; padding-bottom: 0px;">
				<div class="container" style="width: 100%; background-color: black;">
					<!-- 整頁 -->
					<div class="row">
						<!-- 整頁 -->
						<!-- 左邊欄位開始 -->
						<div class="col-sm-4 col-md-3 sidebar"
							style="width: 20%; padding-right: 0px;">
							<div class="widget">
								<a href="/MeetBoth/_03_product.index.controller"><img
									src="/MeetBoth/html/assets/images/shop/警告.jpg"
									style="padding-bottom: 10px;"></a>
								<ul class="cart">
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">會員管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有會員清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">商品管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a
												href="/MeetBoth/_03_product.productindex.controller"
												style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有商品清單</a></li>
												<li><a
												href="/MeetBoth/_03_product.MBinsertProd.controller"
												style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">新增商品</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">課程管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有課程清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">徵才管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有貼文清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">討論區管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="/MeetBoth/_06_halaAndQa.SelectAllHalaIndex.controller" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有貼文清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">購物車管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有購物單清單</a></li>
										</ul></li>
								</ul>
								<a href="#"><img
									src="/MeetBoth/html/assets/images/shop/警告2.jpg"
									style="padding-bottom: 10px;"></a>
							</div>
						</div>
						<!-- 左邊欄位結束 -->
						<!-- 						右邊欄位開始 -->
						<div class="col-sm-8 col-sm-offset-1"
							style="margin-left: 20px; width: 75%; border-left: solid 1px yellow;">
							<div class="col-sm-12">
								<img src="html/assets/images/shop/2023.png" alt="Title of Image" />
							</div>
							<div class="post">
								<!-- 							標題 -->
								<div class="post-thumbnail"
									style="padding-bottom: 0; margin-bottom: 0;">
									<h1
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">網站基本資料</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<div class="post-video embed-responsive embed-responsive-16by9"
										style="height: auto; padding-bottom: 100px;">
										<div>
											<span>網站名稱 :&ensp;</span><span id="MBSPAN">肉丸學習網
												MeetBoth</span> <input type="text" value="" class="MBinput"
												id="MBText" style="display: none;"> <input
												type="button" value="修改" class="MBbtn" id="MBUpDate">
											<input type="button" value="確認" class="MBbtn" id="MBCommit"
												style="display: none;">
										</div>
										<div>
											<span>網站首頁網址 :&ensp;</span><span><a href="#"
												id="webSPAN">MeetBoth/index.controller</a></span> <input
												type="text" value="" class="MBinput" id="webText"
												style="display: none; width: 500px;"> <input
												type="button" value="修改" class="MBbtn" id="webUpDate">
											<input type="button" value="確認" class="MBbtn" id="webCommit"
												style="display: none;">
										</div>
										<div style="display: flex;">
											<span>網站LOGO :&ensp;</span>
											<div
												style="height: 100px; width: 100px; background-color: white;">
												<img
													style="height: auto; width: auto; max-height: 100%; max-width: 100%;"
													src="/MeetBoth/html/images/meatball-200.png">
											</div>
										</div>
										<div>
											<span>網站理念 :&ensp;</span><span id="MBSPAN">打造一個最方便的學習網</span>
										</div>
										<div>
											<span>網站用戶人數(截至2023.01) :&ensp;</span><span id="MBSPAN">1742人</span>
										</div>
										<div>
											<div id="columnchart_values" style=""></div>
										</div>
										<div>
											<span>網站總瀏覽次數(2022.07至2023.01) :&ensp;</span><span
												id="MBSPAN">20,123次</span>
										</div>
										<div>
											<div id="chart_div"></div>
										</div>

									</div>
								</div>
								<!--       右邊第一部分結束 -->
								<hr class="divider-w pt-20">
							</div>
						</div>
						<!-- 		右邊欄位結束 -->
					</div>
				</div>
			</section>
			<%-- 			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" /> --%>
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
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
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
		// 		網站理念修改框
		// 		原本的文字框
		var p = document.getElementById("webSPAN");
		// 		原本的修改按鈕
		var q = document.getElementById("webUpDate");
		// 		要顯示出來的輸入框
		var r = document.getElementById("webText");
		// 		要顯示出來的確定按鈕
		var s = document.getElementById("webCommit");

		q.onclick = function() {
			r.value = p.innerHTML;
			q.style.display = "none";
			p.style.display = "none";
			s.style.display = "inline-block";
			r.style.display = "inline-block";
		};
		s.onclick = function() {
			p.innerHTML = r.value;
			s.style.display = "none";
			r.style.display = "none";
			q.style.display = "inline-block";
			p.style.display = "inline-block";
		};
	</script>
	<script>
		// 		網站理念修改框 closest寫法

		document.getElementById("MBUpDate").onclick = function() {
			var parent = this.parentNode;
			var MBText = parent.querySelector('#MBText');
			var MBCommit = parent.querySelector('#MBCommit');
			var MBSPAN = parent.querySelector('#MBSPAN');

			MBText.style.display = "inline-block";
			MBCommit.style.display = "inline-block";
			MBSPAN.style.display = "none";
			MBText.value = MBSPAN.innerHTML;
			this.style.display = "none";
		};

		document.getElementById("MBCommit").onclick = function() {
			var parent = this.parentNode;
			var MBText = parent.querySelector('#MBText');
			var MBCommit = parent.querySelector('#MBCommit');
			var MBSPAN = parent.querySelector('#MBSPAN');

			MBSPAN.innerHTML = MBText.value;
			MBSPAN.style.display = "inline-block";
			parent.querySelector('#MBUpDate').style.display = "inline-block";
			MBText.style.display = "none";
			this.style.display = "none";
		};
	</script>
	<script>
		// 		document.getElementById("MBUpDate").onclick = function() {
		// 			document.getElementById("MBUpDate").closest('#MBText').style.display = "inline-block";
		// 			document.getElementById("MBUpDate").closest('#MBCommit').style.display = "inline-block";
		// 			document.getElementById("MBUpDate").closest('#MBSPAN').style.display = "none";
		// 			document.getElementById("MBUpDate").closest('#MBText').value = document.getElementById("MBUpDate").closest('#MBSPAN').innerHTML
		// 			document.getElementById("MBUpDate").style.display = "none";
		// 		};
		// 		document.getElementById("MBCommit").onclick = function() {
		// 			document.getElementById("MBCommit").closest('#MBSPAN').innerHTML = document.getElementById("MBCommit").closest('#MBText').value;
		// 			document.getElementById("MBCommit").closest('#MBSPAN').style.display = "inline-block";
		// 			document.getElementById("MBCommit").closest('#MBUpDate').style.display = "inline-block";
		// 			document.getElementById("MBCommit").closest('#MBText').style.display = "none";
		// 			document.getElementById("MBCommit").style.display = "none";
		// 		};
	</script>
	<script>
		google.charts.load("current", {
			packages : [ 'corechart' ]
		});
		google.charts.setOnLoadCallback(drawChart);
		function drawChart() {
			var data = google.visualization
					.arrayToDataTable([ [ "Element", "Density", {
						role : "style"
					} ], [ "2022.07", 166, "silver" ],
							[ "2022.08", 274, "gold" ],
							[ "2022.09", 319, "silver" ],
							[ "2022.10", 558, "gold" ],
							[ "2022.11", 891, "silver" ],
							[ "2022.12", 1293, "gold" ],
							[ "2023.1", 1742, "silver" ] ]);

			var view = new google.visualization.DataView(data);
			view.setColumns([ 0, 1, {
				calc : "stringify",
				sourceColumn : 1,
				type : "string",
				role : "annotation"
			}, 2 ]);

			var options = {
				title : "網站累績註冊會員人數",
				//     titleTextStyle: {
				//         color: 'white'
				//       },
				width : 700,
				height : 400,
				//     backgroundColor : "black",
				bar : {
					groupWidth : "95%"
				},
				legend : {
					position : "none"
				},
			};
			var chart = new google.visualization.ColumnChart(document
					.getElementById("columnchart_values"));
			chart.draw(view, options);
		}
	</script>
	<script>
		google.charts.load('current', {
			packages : [ 'corechart', 'line' ]
		});
		google.charts.setOnLoadCallback(drawBasic);

		function drawBasic() {

			var data = new google.visualization.DataTable();
			data.addColumn('number', 'X');
			data.addColumn('number', '瀏覽次數');

			data.addRows([ [ 1, 0 ], [ 5, 12 ], [ 10, 35 ], [ 15, 77 ],
					[ 20, 107 ], [ 25, 355 ], [ 30, 784 ], [ 35, 1112 ],
					[ 40, 1548 ], [ 45, 1925 ], [ 50, 2554 ], [ 55, 3010 ],
					[ 60, 3899 ], [ 65, 4950 ], [ 70, 5952 ], [ 75, 6555 ],
					[ 80, 7892 ], [ 85, 9107 ], [ 90, 10111 ], [ 100, 10254 ],
					[ 105, 10142 ], [ 110, 11055 ], [ 115, 12456 ],
					[ 120, 13057 ], [ 125, 13360 ], [ 130, 13548 ],
					[ 135, 14011 ], [ 140, 14975 ], [ 145, 15084 ],
					[ 150, 15120 ], [ 155, 15278 ], [ 160, 15475 ],
					[ 165, 16612 ], [ 170, 17477 ], [ 175, 18212 ],
					[ 180, 19012 ], [ 185, 20123 ] ]);

			var options = {
				hAxis : {
					title : '日期(天數)'
				},
				vAxis : {
					title : '瀏覽次數'
				}
			};

			var chart = new google.visualization.LineChart(document
					.getElementById('chart_div'));

			chart.draw(data, options);
		}
	</script>
	</body>
</html>