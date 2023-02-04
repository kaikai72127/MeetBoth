<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%
String path = request.getContextPath();
String basePathHeadMVC = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/fragment/headMVC.jsp";
%>
<%
String basePathTopMVC = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/fragment/topMVC.jsp";
%>
<%
String basePathFooterMVC = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/fragment/footerMVC.jsp";
%>
<%
String basePathJsPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/fragment/jsPath.jsp";
%>


<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="<%=basePathHeadMVC%>" />
</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="<%=basePathTopMVC%>" />

	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<h1 class="logo">
						<strong>管理者介面　</strong>
					</h1>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h2 style="margin: 0; float: left">訂單管理CRUD　</h2>
						<form method="post"
							action="<c:url value='/_04_shoppingCart.InsertOrderMain.controller' />">
							<button name="orderNo" value="${bean.orderNo}">
								<i class="fa-solid fa-square-plus"></i>
							</button>
						</form>
					</header>
					<!-- Search -->
					<section id="search" class="alt">
						<form method="post"
							action="<c:url value='/_04_shoppingCart.SearchAllorders.controller' />">
							<input type="text" name="search" id="search" placeholder="Search" />
						</form>
					</section>

					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt">
							<thead>
								<tr>
									<th width=100px>訂單編號</th>
									<th width=100px>會員編號</th>
									<th width=120px>訂單日期</th>
									<th width=120px>更新日期</th>
									<th>訂單地址</th>
									<th>訂單狀態</th>
									<th>付款狀態</th>
									<th>送貨狀態</th>
									<th width=80px>總金額</th>
									<th width=80px>編輯</th>
									<th width=80px>訂單明細</th>
									<th width=80px>刪除</th>
								</tr>
							</thead>
							<c:forEach var="bean" items="${classList}">
								<tbody>
									<tr>
										<td>${bean.orderNo}</td>
										<td>${bean.memberId}</td>
										<td>${bean.orderDate}</td>
										<td>${bean.uporderDate}</td>
										<td>${bean.shippingAddress}</td>
										<td>${bean.ordStstus}</td>
										<td>${bean.paymentStstus}</td>
										<td>${bean.deliveryStstus}</td>
										<td>${bean.totalAmount}</td>
										<td><form method="post"
												action="<c:url value='/_04_shoppingCart.UpdateOrderMain.controller' />">
												<button name="orderNo" value="${bean.orderNo}">
													<i class="fa-solid fa-pen-to-square"></i>
												</button>
											</form></td>
										<td><form action="<c:url value='/_04_shoppingCart.InsertOrderItemMain.controller' />"
												method="post">
												<button name="orderNo" value="${bean.orderNo}">
													<i class="fa-solid fa-file-pen"></i>
												</button>
											</form></td>
										<td><button class="deleteThisOrder" name="orderNo"
												value="${bean.orderNo}">
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

			<!-- Footer -->
			<!-- 引入共同的footerMVC -->
			<jsp:include page="<%=basePathFooterMVC%>" />
	</main>

	<!--  
    JavaScripts
    =============================================
    -->
	<!-- 引入共同的js -->
	<jsp:include page="<%=basePathJsPath%>" />



</body>
</html>
