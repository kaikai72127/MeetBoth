<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!DOCTYPE html>
			<html lang="zh-hant-TW">

			<head>
				<!-- 引入共同的headMVC -->
				<jsp:include page="fragment/headMVC.jsp" />
				<script src="https://apis.google.com/js/platform.js" async defer></script>
				<style>
					input[type='checkbox'] {
						width: 15px;
						height: 15px;
						border: 2px solid #ffa0a0;
						border-radius: 3px;

						-webkit-appearance: none;
						/*取消預設外觀*/
						background-color: #fff;

						position: relative;
					}

					input[type='checkbox']:checked {
						border: 2px solid #ffa0a0;
						background-color: #fff;
					}

					input[type='checkbox']:checked:after {
						content: "✔";
						font-size: 15px;
						font-weight: 900;
						color: rgb(255, 120, 120);
						line-height: 10px;
						position: absolute;
					}
				</style>
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
									<form class="form" action="<%=request.getContextPath()%>/login/page" method="Post"
										id="loginform">
										<div class="form-group">
											<input style="text-transform: none;" class="form-control" id="username"
												type="text" name="username" placeholder="帳號" value="" />
										</div>
										<div class="form-group">
											<input style="text-transform: none; " class="form-control" id="password"
												type="password" name="password" placeholder="密碼" value="" />
										</div>
										<div class="form-group">
											<label for="checkbox">
												<input type="checkbox" id="checkbox" name="remember-me" checked>
												<span style="font-size: medium;" class="btn-p">記住我</span>
											</label>
										</div>
										<div class="form-group">
											<button class="btn btn-round btn-p"
												style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;">登入</button>
											<!-- <button class="btn btn-round btn-p"
												style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;"
												href="<%=request.getContextPath()%>/oauth2/authorization/google">Google登入</button> -->
										</div>

										<div class="form-group">
											<a href="<%=request.getContextPath()%>/forgetpassword"><i
													class="fa-solid fa-circle-xmark"></i>忘記密碼?</a>
										</div>

										<button id="adminlog" class="btn btn-round btn-p" onclick='adminlog()'
											style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;">管理員一鍵登入</button>
										<button id="userlog" class="btn btn-round btn-p" onclick="userlog()"
											style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;">使用者一鍵登入</button>
									</form>


								</div>
								<div class="col-sm-5">
									<h4 class=" h4-p">沒有帳號嗎？<a href="<%=request.getContextPath()%>/mail"
											target="_blank">註冊</a>
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
				<script>
					function adminlog() {
						$(' #username').val('MeetBest'); $('#password').val('!Aa123456'); $('#loginform').submit();
					}
					function userlog() {
						$(' #username').val('AWCzXmbyi'); $('#password').val('!Aa123456'); $('#loginform').submit();
					}

					$(function () {
						$.ajax({
							type: 'POST',
							url: '/MeetBoth/_01_member.checklog.controller',
							contentType: 'application/json',

							success: function (user) {

								if (user != "" && user != "anonymousUser") {
									location.href = '/MeetBoth/justlogin';
								}
							}
						});
					});

				</script>



			</body>

			</html>