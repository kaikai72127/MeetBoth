<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
String pathAnimation = request.getContextPath();
String basePathAnimation = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ pathAnimation + "/html/assets/css/animation.css";
%>
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

<! DOCTYPE html>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html lang="zh-hant-TW">
<head>
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
<link rel="stylesheet" href="<%=basePathAnimation%>">
<link rel="stylesheet" href="<%=basePath%>" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
</head>

<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<a href="index.jsp" class="logo animated bounce"><strong>肉丸家教網
							<br>MEET BOTH
					</strong></a>
					<ul class="icons">
						<!-- 						<li><a href="#" class="icon brands fa-twitter"><span -->
						<!-- 								class="label">Twitter</span></a></li> -->
						<!-- 						<li><a href="#" class="icon brands fa-facebook-f"><span -->
						<!-- 								class="label">Facebook</span></a></li> -->
						<!-- 						<li><a href="#" class="icon brands fa-snapchat-ghost"><span -->
						<!-- 								class="label">Snapchat</span></a></li> -->
						<!-- 						<li><a href="#" class="icon brands fa-instagram"><span -->
						<!-- 								class="label">Instagram</span></a></li> -->
						<li><a href="/SpringMVC_Team5/_01_member.Login"><span
								class="label"><i class="fa-solid fa-right-to-bracket"></i></span>登入</a></li>
					</ul>

				</header>

				<!-- Section -->
				<section>
					<header class="major">
						<h2>使用者登入</h2>
					</header>
					<div style="text-algin: center; padding-top: 12px; width:200px">
						<form action="_01_member.Oath" method="post">
							使用者名稱：<input type="text" name="username" required> 
							密碼：<input	type="password" name="password" required><br>
							<span style="display:flex;"><input type="submit" value="登入" style="margin-right:20px;"> <input type="reset" name="cancel" id="cancel" value="重填" ></span>
						</form>
					</div>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
				<!-- Search -->
				<!--           <section id="search" class="alt"> -->
				<!--             <form method="post" action="#"> -->
				<!--               <input type="text" name="query" id="query" placeholder="Search" /> -->
				<!--             </form> -->
				<!--           </section> -->

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>
							<img src="<%=basePathimg2%>" alt="" />
						</h2>
					</header>
					<ul>
						<li><a href="<c:url value='/index.controller' />">首頁 <i class="fa-solid fa-house"></i></a></li>
						<li><a href="<c:url value='/_01_member.Login' />">後台管理 <i
								class="fa-solid fa-gears"></i></a></li>
					</ul>
				</nav>

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
			+ "/html/assets/js/app.js";
	%>
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src=<%=basePath6%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
	<!-- jQuery animateCss Extend -->
	<script>
		$.fn
				.extend({
					animateCss : function(animationName, callback) {
						var animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
						this.addClass("animated " + animationName).one(
								animationEnd,
								function() {
									$(this).removeClass(
											"animated " + animationName);
									if (callback)
										callback();
								});
						return this;
					}
				});
	</script>
	<!-- #example動畫結束後執行此事件 -->
	<script>
		$("#example").animateCss("bounce", function() {
			$("#example").css("color", "red");
		});
		</body>
		</html>
	</script>