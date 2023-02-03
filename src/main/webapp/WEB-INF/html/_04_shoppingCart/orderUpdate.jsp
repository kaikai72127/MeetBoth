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
<%-- <%@ include file="/html/backMVC.jsp" %> --%>
<%-- <jsp:include page="/html/backMVC.jsp" flush="true" /> --%>
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
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
						<h2>訂單管理-編輯</h2>
					</header>
					<!-- Search -->
					<!-- 					<section id="search" class="alt"> -->
					<!-- 						<form method="post" action="#"> -->
					<!-- 							<input type="text" name="query" id="query" placeholder="Search" /> -->
					<!-- 						</form> -->
					<!-- 					</section> -->
					<!-- Table -->
					<div class="table-wrapper">
						<div id='main'>
							<form method="POST"
								action="<c:url value='/_04_shoppingCart.UpdateOrder.controller' />">
								<Table>
									<c:forEach var="bean" items="${classList}">
										<tr height="30">
											<td><label class="fontSize">訂單編號：</label><br>&nbsp;</td>
											<td colspan='3'><input type='text' readonly="readonly"
												name='orderNo' value="${bean.orderNo}" class="fieldWidth"
												style="width: 200px;" /><br>&nbsp; <font color="red"
												size="-1">${MsgMap.errorPasswordEmpty}${MsgMap.passwordError}</font>
											</td>
										</tr>
										<tr height="30">
											<td style="width: 120px;"><label class="fontSize">會員編號：</label><br>&nbsp;</td>
											<td><input type='text' name='memberId'
												value="${bean.memberId}" class="fieldWidth"
												style="width: 200px;" /><br>&nbsp; <font color="red"
												size="-1">${MsgMap.errorName}</font></td>
											<td><label class="fontSize">訂單日期：</label><br>&nbsp;</td>
											<td><input type='text' name='orderDate'
												value="${bean.orderDate}" class="fieldWidth"
												style="width: 200px;" readonly /><br>&nbsp; <font
												color="red" size="-1">${MsgMap.errorAddr}</font></td>
										</tr>
										<tr height="30">
											<td><label class="fontSize">會員地址：</label><br>&nbsp;</td>
											<td colspan='3'><input type='text'
												name='shippingAddress' value="${bean.shippingAddress}"
												class="fieldWidth" style="width: 800px;" /><br>&nbsp;
												<font color="red" size="-1">${MsgMap.errorPasswordEmpty}${MsgMap.passwordError}</font>
											</td>
										</tr>
										<tr height="30">
											<td><label class="fontSize">訂單狀態：</label><br>&nbsp;</td>
											<td><input type="hidden" id="ordS"
												value="${bean.ordStstus}${param.ordS}"><select
												name='ordStstus' class="fieldWidth" style="width: 200px;">
													<option class="A1" value="處理中">處理中</option>
													<option class="A2" value="備貨中">備貨中</option>
													<option class="A3" value="已完成">已完成</option>
											</select></td>
											<td><label class="fontSize">付款狀態：</label><br>&nbsp;</td>
											<td><input type="hidden" id="paymentS"
												value="${bean.paymentStstus}${param.paymentS}"> <select
												name='paymentStstus' class="fieldWidth"
												style="width: 200px;">
													<option class="B1" value="未付款">未付款</option>
													<option class="B2" value="已付款">已付款</option>
													<option class="B3" value="退款中">退款中</option>
													<option class="B4" value="已退款">已退款</option>
											</select></td>
										</tr>
										<tr height="30">
											<td><label class="fontSize">送貨狀態：</label><br>&nbsp;</td>
											<td><input type="hidden" id="deliveryS"
												value="${bean.deliveryStstus}${param.deliveryS}"> <select
												name='deliveryStstus' class="fieldWidth"
												style="width: 200px;">
													<option class="C1" value="無">無</option>
													<option class="C2" value="備貨中">備貨中</option>
													<option class="C3" value="已發貨">已發貨</option>
													<option class="C4" value="已取貨">已取貨</option>
													<option class="C5" value="退貨中">退貨中</option>
													<option class="C6" value="已退貨">已退貨</option>
											</select></td>
											<td><label class="fontSize">總金額：</label><br>&nbsp;</td>
											<td><input type='text' name='totalAmount'
												value="${bean.totalAmount}" class="fieldWidth"
												style="width: 200px;" readonly /><br>&nbsp; <font
												color="red" size="-1">${MsgMap.errorTel}</font></td>
										</tr>

										<tr height="30">
											<td colspan='4'>
												<div id="btnArea" align="center">
													<input type="submit" name="submit" id="submit" value="儲存" />
													<input type="reset" name="cancel" id="cancel" value="重填">
												</div>
											</td>
										</tr>
									</c:forEach>
								</Table>
								<div style="display: flex; justify-content: center">
									<a
										href="<c:url value='/_04_shoppingCart.SelectAll.controller' />">
										返回<i class="fa-solid fa-left-long"></i>
									</a>
								</div>
							</form>

						</div>
					</div>

					<!-- 				<form method="post" -->
					<%-- 					action="<c:url value='/_04_ShoppingCart/OrderUpdate.do' />"> --%>
					<%-- 					<button name="orderNo" value="${bean.orderNo}"> --%>
					<!-- 						<i class="fa-solid fa-xmark"></i> -->
					<!-- 					</button> -->
					<!-- 				</form> -->
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>
							<img src="<%=basePathimg2%>" alt="" />
						</h2>
					</header>
					
					<ul>
						<li><a href="<c:url value='/index.controller' />">首頁 <i class="fa-solid fa-house"></i></a></li>
						<li><a href="<c:url value='/backIndex.controller' />">後台管理 <i
								class="fa-solid fa-gears"></i></a></li>
						<li><a href="<c:url value='/_01_member.admin' />">會員資料 <i
								class="fa-solid fa-users-viewfinder"></i></a></li>
						<li><span class="opener">科目地區資料 <i
								class="fa-solid fa-magnifying-glass-location"></i></span>
							<ul>
								<li><a href="<c:url value='/_02_subLocation.SelectAllSub.controller' />">科目搜尋</a>
								<li><a href="<c:url value='/_02_subLocation.SelectAllLoc.controller' />">地點搜尋</a>
							</ul></li>
						<li><a href="<c:url value='/_03_product.searchAllProduct.controller'/>">商品資料 <i
								class="fa-solid fa-store"></i></a></li>
						<li><a
							href="<c:url value='/_04_shoppingCart.SelectAll.controller' />">訂單資料
								<i class="fa-solid fa-cart-shopping"></i>
						</a></li>
						<li><span class="opener">老師學生資料 <i
								class="fa-solid fa-users"></i></span>
							<ul>
								<li><a href="<c:url value='/_05_teacStu.searchAllTeac.controller' />">老師貼文資料</a></li>
								<li><a href="<c:url value='/_05_teacStu.searchAllStud.controller' />">學生貼文資料</a></li>
							</ul></li>
						<li><span class="opener">哈拉區 <i
								class="fa-solid fa-comments"></i></span>
							<ul>
								<li><a href="<c:url value='/_06_halaAndQa.SelectAllHala.controller' />">討論公告區</a></li>
								<li><a href="<c:url value='/_06_halaAndQa.SelectAllQa.controller' />">Q&A解答區</a></li>
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
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#ordS').val();
		console.log(v)
		switch (v) {
		case '處理中':
			$(".A1").attr('selected', true)
			break;
		case '備貨中':
			$(".A2").attr('selected', true)
			break;
		case '已完成':
			$(".A3").attr('selected', true)
			break;
		}
	</script>
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#paymentS').val();
		console.log(v)
		switch (v) {
		case '未付款':
			$(".B1").attr('selected', true)
			break;
		case '已付款':
			$(".B2").attr('selected', true)
			break;
		case '退款中':
			$(".B3").attr('selected', true)
			break;
		case '已退款':
			$(".B4").attr('selected', true)
			break;
		}
	</script>
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#deliveryS').val();
		console.log(v)
		switch (v) {
		case '無':
			$(".C1").attr('selected', true)
			break;
		case '備貨中':
			$(".C2").attr('selected', true)
			break;
		case '已發貨':
			$(".C3").attr('selected', true)
			break;
		case '已取貨':
			$(".C4").attr('selected', true)
			break;
		case '退貨中':
			$(".C5").attr('selected', true)
			break;
		case '已退貨':
			$(".C6").attr('selected', true)
			break;
		}
	</script>

</body>
</html>