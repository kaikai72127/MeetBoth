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
				<div class="col-sm-10">
					<form action="discountsCreateMain.controller"
						method="post">
						<label>折扣代碼</label> <input type="text" name="discountNo"
							value="${bean.discountNo}" placeholder="請填寫折扣代碼" required>
						<label>折扣名稱</label> <input type="text" name="discountName"
							value="${bean.discountName}" placeholder="請填寫折扣名稱" required>
						<label>折扣金額</label> <input id="inputNumber" type="number"
							name="discountPrice" value="0" min=0 placeholder="請填寫折扣金額">
						<label>折扣內容</label> <input type="text" name="discountDesc" 
							placeholder="請填寫折扣內容"> <label for="from">折扣起始日</label> <input
							type="text" id="dicountFrom" name="discountStart" required>
						<label for="to">折扣結束日</label> <input type="text" id="dicountTo"
							name="discountEnd" required>

						<div style="display: flex; justify-content: center">
							<br> <input type="submit" name="submit" id="submit"
								style="margin-right: 10px" value="儲存" /> <input type="reset"
								name="cancel" id="cancel" value="重填">
						</div>
						<div style="display: flex; justify-content: center">
							<a
								href="<c:url value='/discountsCreateMain.controller' />">
								返回<i class="fa-solid fa-left-long"></i>
							</a>
						</div>
					</form>
				</div>
			</section>

		</div>

		<!-- Footer -->
		<!-- 引入共同的footerMVC -->
		<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
	</main>



</body>
</html>
