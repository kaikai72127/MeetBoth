<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
<%
String basePathimg3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/index.jsp";
%>
<%
String basePathimg4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/backIndex.jsp";
%>

<title>肉丸家教網 MEET BOTH</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="index,follow" />
<meta name="description" content="全台最優質最快速方便的家教網" />
<meta name="author" content="EEIT56-MEETBOTH" />
<meta name="keywords" content="最棒最優質的家教網" />
<meta name="copyright" content="肉丸家教網" />
<link rel="shortcut icon" href="<%=basePathimg%>" />
<link rel="bookmark" href="<%=basePathimg%>" />
<link rel="stylesheet" href="<%=basePath%>" />
<style>
#prodMenu {
	display: flex;
	flex-direction: row;
	flex-wrap: wrap;
	justify-content: flex-start;
	align-content: flex-start;
	height: 3000px;
	width: 1000px;
	margin: 0px auto;
	border: 1px dashed #FF7575;
	height: 3000px;
	background-color:#f5f6f7;
}

#eachProdBlock {
	border: 1px dashed #FF7575;
	height: 500x;
	width: 230px;
	margin: 10px 0px 0px 15px;
	padding: 10px;
	background-color: white;
}

#photo {
	height: 300px;
	width: 210px;
}

#img {
	height: 280px;
	width: 210px;
}

#Name {
	
}

#price {
	
}

#invt {
	
}

#soldout {
	
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<h1 class="logo">
						<strong>管理者介面</strong>
					</h1>
				</header>

				<!-- Content -->
				<section>
					<div>
						<input type="button" value="查看全部商品"
							onclick="window.location='/SpringBoot_Team5/_03_product.searchAllProduct2.controller'">
					</div>
					<hr>
					<div>
						<form
							action="<c:url value='/_03_product.searchProductWithCondition.controller'/>"
							method="post">
							<table>
								<thead>
									<tr>
										<th style="width: 20%"><em>排序方式 :</em></th>
										<th style="width: 15%"><em>產品類別 :</em></th>
										<th style="width: 10%"><em>最低價格:</em></th>
										<th style="width: 10%"><em>最高價格:</em></th>
										<th style="width: 35%"><em>名稱搜尋:</em></th>
										<th style="width: 10%"></th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><select name="case">
												<option value="1">預設</option>
												<option value="2">依價格由大到小</option>
												<option value="3">依價格由小到大</option>
												<option value="4">依上架日期排序</option>
												<option value="5">依更新日期排序</option>
										</select></td>
										<td><select name="typecase">
												<option value="0">全部</option>
												<option value="1">文具</option>
												<option value="2">書籍資料</option>
												<option value="3">線上課程</option>
										</select></td>
										<td><input type="number" name="lowprice"
											style="width: 100px" value="0"></td>
										<td><input type="number" name="highprice"
											style="width: 100px" value="999999"></td>
										<td><input type="text" name="searchName" value=""></td>
										<td><input type="submit" value="搜尋" name="subOrder"></td>
									</tr>
								</tbody>
							</table>
						</form>
					</div>
					<div>
						<input type="button" value="新增商品"
							onclick="window.location='/SpringBoot_Team5/_03_product.pathToInsertProduct.controller'">
					</div>
					<br>
					<div class="table-wrapper">
						<!-- ----------------------------------------------------------------------------					 -->
						<div id="prodMenu">
							<c:forEach var="bean" items="${allprodlist}">
								<div id="eachProdBlock" class="mEvent"
									onclick="window.location='/SpringBoot_Team5/_03_product.PathToProductDetail.controller?id=${bean.prodID}'">
									<div id="photo">
										<img id="img"
											src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodID}' />">
									</div>
									<div id="Name">
										<strong>${bean.prodName}</strong>
									</div>
									<div id="price">
										<strong>價格 : $${bean.prodPrice}</strong>
									</div>
									<div id="invt">
										<strong>庫存 : ${bean.inventory}</strong>
									</div>
									<div id="soldout">
										<strong>已售出 : 0</strong>
									</div>
								</div>
							</c:forEach>
						</div>
						<!-- ----------------------------------------------------------------------------					 -->
					</div>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<!-- 				<section id="search" class="alt"> -->
				<!-- 					<form method="post" action="#"> -->
				<!-- 						<input type="text" name="query" id="query" placeholder="Search" /> -->
				<!-- 					</form> -->
				<!-- 				</section> -->

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>
							<img src="<%=basePathimg2%>" alt="" />
						</h2>
					</header>

					<ul>
						<li><a href="<c:url value='/index.controller' />">首頁 <i
								class="fa-solid fa-house"></i></a></li>
						<li><a href="<c:url value='/backIndex.controller' />">後台管理
								<i class="fa-solid fa-gears"></i>
						</a></li>
						<li><a href="<c:url value='/_01_member.admin' />">會員資料 <i
								class="fa-solid fa-users-viewfinder"></i></a></li>
						<li><span class="opener">科目地區資料 <i
								class="fa-solid fa-magnifying-glass-location"></i></span>
							<ul>
								<li><a
									href="<c:url value='/_02_subLocation.SelectAllSub.controller' />">科目搜尋</a>
								<li><a
									href="<c:url value='/_02_subLocation.SelectAllLoc.controller' />">地點搜尋</a>
							</ul></li>
						<li><a
							href="<c:url value='/_03_product.searchAllProduct.controller'/>">商品資料
								<i class="fa-solid fa-store"></i>
						</a></li>
						<li><a
							href="<c:url value='/_04_shoppingCart.SelectAll.controller' />">訂單資料
								<i class="fa-solid fa-cart-shopping"></i>
						</a></li>
						<li><span class="opener">老師學生資料 <i
								class="fa-solid fa-users"></i></span>
							<ul>
								<li><a
									href="<c:url value='/_05_teacStu.searchAllTeac.controller' />">老師貼文資料</a></li>
								<li><a
									href="<c:url value='/_05_teacStu.searchAllStud.controller' />">學生貼文資料</a></li>
							</ul></li>
						<li><span class="opener">哈拉區 <i
								class="fa-solid fa-comments"></i></span>
							<ul>
								<li><a
									href="<c:url value='/_06_halaAndQa.SelectAllHala.controller' />">討論公告區</a></li>
								<li><a
									href="<c:url value='/_06_halaAndQa.SelectAllQa.controller' />">Q&A解答區</a></li>
							</ul></li>
					</ul>

				</nav>


				<!-- Section -->
				<section>
					<header class="major">
						<h2>聯絡我們</h2>
					</header>
					<p>肉丸家教網是一個希望不管是學生還是老師，都能在這裡精進自己，花最少的時間，找到最棒的老師/學生。</p>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a>
						</li>
						<li class="icon solid fa-phone">(000) 000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
							Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>

		</div>
	</div>

	<!-- Scripts -->

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
	<%
	String basePath6 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
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
		$(".mEvent")
				.mouseenter(
						function() {
							$(this).css("background-color", "pink");
							$(this).css("cursor", "pointer");
							$(this)
									.url(
											"/_03_product.PathToProductDetail.controller?id=${bean.prodID}")
						})
		$(".mEvent").mouseleave(function() {
			$(this).css("background-color", "white");
		})
	</script>
</body>
</html>
