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
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Oswald&display=swap" rel="stylesheet">

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

p {
	color: white;
	font-size: 25px;
	font-width: 550;
}

.wrap {
	overflow: hidden;
	border-radius: 10px 10px 0px 0px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.35);
}

table {
	font-family: 'Oswald', sans-serif;
	border-collapse: collapse;
}

th {
	background-color: #009879;
	color: #ffffff;
	width: 25vw;
	height: 75px;
}

td {
	background-color: #ffffff;
	width: 25vw;
	height: 50px;
	text-align: center;
}

tr {
	border-bottom: 1px solid #dddddd;
}

tr:last-of-type {
	border-bottom: 2px solid #009879;
}

tr:nth-of-type(even) td {
	background-color: #f3f3f3;
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
								<a href="#"><img
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
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有商品清單</a></li>
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
											<li><a href="#" style="color: white; font-weight: 600;"
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
							<div class="post">
								<!-- 							標題 -->
								<div class="post-thumbnail"
									style="padding-bottom: 0; margin-bottom: 0;">
									<h1
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">
										網站資料</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<div class="post-video embed-responsive embed-responsive-16by9">
										<div>
											<p>網站名稱 : 肉丸家教網 MeetBoth</p>
										</div>
										<!-- Content -->
										<section class="" id="demos">
											<header class=>
												<h2 style="margin: 0">折扣碼管理</h2>
												<form method="post"
													action="<c:url value='/discountsCreate.controller' />">
													<button>
														<i class="fa-solid fa-square-plus"></i>
													</button>
												</form>
											</header>
											<!-- Search -->
											<section id="search" class="alt">
												<form method="post"
													action="<c:url value='/_04_shoppingCart.SearchAllorders.controller' />">
													<input type="text" name="search" id="search"
														placeholder="Search" />
												</form>
											</section>

											<!-- Table -->
											<div class="table-wrapper">
												<table class="wrap">
													<thead>
														<tr>
															<th width=100px>折扣編號</th>
															<th width=100px>折扣代號</th>
															<th width=120px>折扣名稱</th>
															<th>折扣內容</th>
															<th width=80px>折扣開始日</th>
															<th width=80px>折扣結束日</th>
															<th width=80px>編輯</th>
															<th width=80px>刪除</th>
														</tr>
													</thead>
<<<<<<< HEAD
													<c:forEach var="bean" items="${discountList}">
=======
													<c:forEach var="bean" items="${classList}">
>>>>>>> origin/_01_Seal
														<tbody>
															<tr>
																<td>${bean.discountId}</td>
																<td>${bean.discountNo}</td>
																<td>${bean.discountName}</td>
																<td>${bean.discountDesc}</td>
																<td>${bean.discountStart}</td>
																<td>${bean.discountEnd}</td>
																<td><form method="post"
																		action="<c:url value='discountsUpdate.controller/${bean.discountId}' />">
																		<button id="create-discount" name="discountId"
																			value="${bean.discountId}">
																			<i class="fa-solid fa-pen-to-square"></i>
																		</button>
																	</form></td>
																<td><button value="${bean.discountId}"
																		class="deleteThisDiscount" name="discountId">
																		<i class="fa-solid fa-xmark"></i>
																	</button></td>
															</tr>
														</tbody>
													</c:forEach>
												</table>
												<div style="display: flex; justify-content: center">
													<a href="backIndex.controller"> 返回<i
														class="fa-solid fa-left-long"></i></a>
												</div>
											</div>
										</section>
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
			<%-- <jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" /> --%>
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
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
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
</html>