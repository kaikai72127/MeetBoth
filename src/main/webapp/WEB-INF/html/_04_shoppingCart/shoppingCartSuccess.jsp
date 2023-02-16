<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<main>

		<!-- 內容 1-->
		<!-- 		style="background-image: url('/MeetBoth/html/assets/images/shop/backgroundimg.jpg') -->
		<section style="margin-top: 110px; margin-bottom: 120px">
			<!-- check out-->
			<div class="container"
				style="text-align: center;border-style:outset;height:100%">
				<h1 class="animate__animated animate__bounce" style="font-weight: 800">- 訂購完成 -</h1>
				<h2>${member.memName}先生/小姐 感謝您的訂購</h2>
				<h3 style="margin-bottom: 35px">已收到您的訂單，請您檢視訂單，會盡速為您發貨。</h3>
				<div style="padding-bottom:30px">
					<a href="<c:url value='/index.controller' />">
						<button class="btn btn-danger btn-circle" type="button"
							style="font-size: 16px; font-weight: 800">返回首頁</button>
					</a> &nbsp;&nbsp; <a href="/MeetBoth/memberOrdersList.controller/${order.orderNo}"><button
							class="btn btn-default btn-circle" type="button"
							style="font-size: 16px; border: 2px solid #ce7777; font-weight: 800">我的訂單</button></a>
				</div>

			</div>

		</section>

		<!-- Footer -->
		<!-- 引入共同的footerMVC -->
		<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
	</main>

	<!--  
    JavaScripts
    =============================================
    -->
	<!-- 引入共同的js -->
	<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />



</body>
</html>
