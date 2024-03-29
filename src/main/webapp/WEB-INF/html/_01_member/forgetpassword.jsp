<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!DOCTYPE html>
			<html lang="zh-hant-TW">

			<head>
				<!-- 引入共同的headMVC -->
				<jsp:include page="../fragment/headMVC.jsp" />

			</head>

			<!--BOBY-->

			<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

				<!-- header -->
				<!-- 引入共同的topMVC -->
				<jsp:include page="../fragment/topMVC.jsp" />

				<main>
					<div class="page-loader">
						<div class="loader">Loading...</div>
					</div>

					<!-- LoginRegister-->

					<section class="forgotpassword">
						<div class="container">
							<div class="row">
								<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
									<h4 class="font-alt h4-p">忘記密碼了嗎?</h4>
									<hr class="divider-w mb-10">
									<span style="color: red;">${error}</span>
									<form class="form" action="<%=request.getContextPath()%>/verifymember"
										method="Post">

										<div class="form-group">
											<input class="form-control" style="text-transform: none;" id="account"
												type="text" name="account" value='${value}' placeholder="請輸入帳號" />
											<input class="form-control" style="text-transform: uppercase;" id="idnumber"
												type="text" name="idnumber" value='${value}' placeholder="請輸入身分證字號" />
										</div>

										<div class="form-group">
											<button class="btn btn-round btn-p">進行驗證</button>
										</div>


									</form>

								</div>

							</div>
						</div>
					</section>

					<!-- Footer -->
					<!-- 引入共同的footerMVC -->
					<jsp:include page="../fragment/footerMVC.jsp" />
				</main>

				<!--  
    JavaScripts
    =============================================
    -->
				<!-- 引入共同的js -->
				<jsp:include page="../fragment/jsPath.jsp" />



			</body>

			</html>