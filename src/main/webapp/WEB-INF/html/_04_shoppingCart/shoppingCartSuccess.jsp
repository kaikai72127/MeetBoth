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
		<section style="margin-bottom:100px">
			<!-- check out-->
			<div class="container">
				<h1 class="animate__animated animate__bounce">訂購完成</h1>
				<h1> ${member.memName}感謝您的訂購</h1>
				<h3>已收到您的訂單，請您檢視訂單，確認您的付款狀態</h3>
				
				<a href="<c:url value='/shoppingcart.controller' />">
  <button class="btn btn-danger btn-circle" type="button">返回首頁</button>
</a>
				
				&nbsp;
				<button class="btn btn-default btn-circle" type="button">查看我的訂單</button>
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
