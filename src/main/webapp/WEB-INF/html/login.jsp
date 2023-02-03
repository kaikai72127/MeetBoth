<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="fragment/headMVC.jsp" />
</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="fragment/topMVC.jsp" />

	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		<!-- LoginRegister-->

		<section class="register">
			<div class="container">
				<div class="row">
					<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
						<h4 class="font-alt h4-p">Login</h4>
						<hr class="divider-w mb-10">
						<form class="form">
							<div class="form-group">
								<input class="form-control" id="username" type="text"
									name="username" placeholder="Username" />
							</div>
							<div class="form-group">
								<input class="form-control" id="password" type="password"
									name="password" placeholder="Password" />
							</div>
							<div class="form-group">
								<button class="btn btn-round btn-p">Login</button>
							</div>
							<div class="form-group">
								<a href=""><i class="fa-solid fa-circle-xmark"></i> Forgot
									Password?</a>
							</div>
						</form>
					</div>
					<div class="col-sm-5">
						<h4 class=" h4-p">Register</h4>
						<hr class="divider-w mb-10">
						<form class="form">
							<div class="form-group">
								<input class="form-control" id="E-mail" type="text" name="email"
									placeholder="Email" />
							</div>
							<div class="form-group">
								<input class="form-control" id="username" type="text"
									name="username" placeholder="Username" />
							</div>
							<div class="form-group">
								<input class="form-control" id="password" type="password"
									name="password" placeholder="Password" />
							</div>
							<div class="form-group">
								<input class="form-control" id="re-password" type="password"
									name="re-password" placeholder="Re-enter Password" />
							</div>
							<div class="form-group">
								<button class="btn btn-block btn-round btn-p">Register</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<!-- 引入共同的footerMVC -->
		<jsp:include page="fragment/footerMVC.jsp" />
	</main>

	<!--  
    JavaScripts
    =============================================
    -->
	<!-- 引入共同的js -->
	<jsp:include page="fragment/jsPath.jsp" />



</body>
</html>
