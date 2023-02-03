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
					<header class="main">
						<h1>修改商品資料</h1>
					</header>
					<div class="table-wrapper">
						<form
							action='<c:url value="/_03_product.updateProductDate.controller" />'
							enctype='multipart/form-data' method='post' id="form1">
							<table class="alt">
								<c:forEach var="bean" items="${bean}">
									<thead>
										<tr>
											<td>商品類別編號：</td>
										</tr>
										<tr>
											<td><input name="prodClass" type="text"
												value="${bean.prodtype.prodClass}" style="width: 80%"
												onkeyup="value=value.replace(/[^\d]/g,'') "></td>
										</tr>
										<tr>
											<td>產品編號：</td>
										</tr>
										<tr>
											<td><input name="prodID" type="text" readonly="readonly"
												value="${bean.prodID}" style="width: 80%"></td>
										</tr>
										<tr>
											<td>請輸入要修改的產品名稱：</td>
										</tr>
										<tr>
											<td><input name="prodName" type="text"
												value="${bean.prodName}" style="width: 80%"></td>
										</tr>
										<tr>
											<td>請輸入要修改的產品價格：</td>
										</tr>
										<tr>
											<td><input name="prodPrice" type="text"
												value="${bean.prodPrice}" style="width: 80%"
												onkeyup="value=value.replace(/[^\d]/g,'') "></td>
										</tr>
										<tr>
											<td>賣家編號：</td>
										</tr>
										<tr>
											<td><input name="memberID" type="text"
												value="${bean.memberID}" style="width: 80%"
												onkeyup="value=value.replace(/[^\d]/g,'') "></td>
										</tr>
										<tr>
											<td>產品庫存:</td>
										</tr>
										<tr>
											<td><input name="inventory" type="text"
												value="${bean.inventory}" style="width: 80%"
												onkeyup="value=value.replace(/[^\d]/g,'') "></td>
										</tr>
										<tr>
											<td>產品上架日期:</td>
										</tr>
										<tr>
											<td><input name="prodPost" type="text"
												value="${bean.prodPost}" style="width: 80%"
												readonly='readonly'></td>
										</tr>
										<tr>
											<td>產品資料更新日期:</td>
										</tr>
										<tr>
											<td><input name="prodUpdate" type="text"
												value="${bean.prodUpdate}" style="width: 80%"
												readonly='readonly'></td>
										</tr>
										<tr>
											<td>商品照片：</td>
										</tr>
										<tr>
											<td><input name="images" id="images5278" type="file"
												style="width: 80%" accept=".jpg,.png"><img
												id="preImg" style="width: 300px; height: 350px"
												src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodID}' />" />
											</td>
										</tr>
									</thead>
								</c:forEach>
							</table>
							<div>
								<input type="submit" value="確定">
								<!-- 									<input type="button" class="updateForm" value="確定"> -->
								<a
									href="<c:url value='/_03_product.searchAllProduct.controller'/>">
									<input type="button" value="取消">
								</a>
							</div>
						</form>
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
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.6.1.js"></script>
	<script>
		$("#images5278").change(function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preImg").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<!-- 		<script> -->
	// $(function(){ // $('.updateForm').click(function(){ // Swal.fire({
	// title: '你確定要修改嗎?', // text: "將無法還原此筆訂單!!!", // icon: 'warning', //
	//icon: "success", "error", "warning", "info" or "question" 這幾種選項 //
	showCancelButton: true, // confirmButtonColor: '#f7d966', //
	cancelButtonColor: '#3d3b39', // cancelButtonText: '取消', //
	confirmButtonText: '確定' // }).then((result) => { // if
	(result.isConfirmed) { // ('#form1').submit(); // $.ajax({ //
	//專案名稱+servlet //
	url:'/SpringMVC_Team5/_03_product.updateProductDate.controller', //
	method:"post", // //對應name設定的名稱 並非value的名稱 // }) // .done(function () {
	// location.reload(); // console.log("delete") // })//done //
	.fail(function(error) { // console.log(error) // })//fail end // }//if
	// })//then // })//click end // }); // //function end
	<!--         </script> -->
</body>
</html>