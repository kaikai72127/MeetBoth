<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!DOCTYPE html>
			<html lang="zh-hant-TW">

			<head>
				<!-- 引入共同的headMVC -->
				<jsp:include page="fragment/headMVC.jsp" />
				<script src="https://apis.google.com/js/platform.js" async defer></script>
			</head>

			<!--BOBY-->

			<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

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
									<h4 class="font-alt h4-p">登入</h4>
									<hr class="divider-w mb-10">
									<form class="form" action="<%=request.getContextPath()%>/login/page" method="Post">
										<div class="form-group">
											<input class="form-control" id="username" type="text" name="username"
												placeholder="Username" />
										</div>
										<div class="form-group">
											<input class="form-control" id="password" type="password" name="password"
												placeholder="Password" />
										</div>
										<div class="form-group">
											<button class="btn btn-round btn-p">Login</button>
										</div>
										<div class="form-group">
											<a href=""><i class="fa-solid fa-circle-xmark"></i>忘記密碼?</a>
										</div>
										<button class="btn btn-round btn-p"
											href="<%=request.getContextPath()%>/oauth2/authorization/google">Google登入</button>
									</form>

								</div>
								<div class="col-sm-5">
									<h4 class=" h4-p">沒有帳號嗎？<a
											href="<%=request.getContextPath()%>/_01_member.register.controller">註冊</a>
									</h4>

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