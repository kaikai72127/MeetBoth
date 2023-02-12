<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />

<script>
	$(function() {
		var dateFormat = "mm/dd/yy", from = $("#dicountFrom").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#dicountTo").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 2,
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}
			return date;
		}
	});
</script>
<!-- 只能輸入數字 -->
<script>
	document.getElementById("inputNumber").addEventListener("input",
			function(event) {
				this.value = this.value.replace(/[^0-9]/g, "");
			});
</script>
</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<main>

		<div class="inner">
			<!-- Header -->
			<header id="header">
				<h1 class="logo">
					<strong>管理者介面 </strong>
				</h1>
			</header>

			<!-- Content -->
			<section class="module">
				<header class="main">
					<h2 style="margin: 0; float: left">折扣碼管理</h2>
					
				</header>
				<!-- Search -->
				<section id="search" class="alt">
					<form method="post"
						action="<c:url value='/_04_shoppingCart.SearchAllorders.controller' />">
						<input type="text" name="search" id="search" placeholder="Search" />
					</form>
				</section>
				<!-- Table -->
				<div class="card-body">
					<form action="<c:url value='/discountsUpdateMain.controller'/>"
						method="post" enctype="multipart/form-data">
<<<<<<< HEAD
						<table id="datatablesSimple" ">
=======
						<table id="datatablesSimple">
>>>>>>> origin/_01_Seal
							<thead>
								<tr>
									<th>折扣代碼</th>
									<th>折扣名稱</th>
									<th>折扣金額</th>
									<th>折扣內容</th>
									<th>折扣起始日</th>
									<th>折扣結束日</th>
									<th>請確認</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th><input type="text" name="discountNo"
										value="${bean.discountNo}" readonly /></th>

									<th><input type="text" name="discountName"
										value="${bean.discountName}" /></th>

									<td><input type="text" name="discountPrice"
										value="${bean.discountPrice}" /></td>

									<td><input type="text" name="discountDesc"
										value="${bean.discountDesc}" /></td>

									<td><input type="text" id="dicountFrom"
										name="discountStart" value="${bean.discountStart}"></td>

									<td><input type="text" id="dicountTo" name="discountEnd"
										value="${bean.discountEnd}"></td>

									<td><input type="submit" value="確認" /></td>

								</tr>
							</tbody>
						</table>
					</form>
				</div>
				<div style="display: flex; justify-content: center">
					<a href="backIndex.controller"> 返回<i
						class="fa-solid fa-left-long"></i></a>
				</div>
			</section>

		</div>

		<!-- Footer -->
		<!-- 引入共同的footerMVC -->
		<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
	</main>



</body>
</html>
