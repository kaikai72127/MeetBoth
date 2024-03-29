<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!DOCTYPE html>
			<html lang="zh-hant-TW">

			<head>
				<!-- 引入共同的headMVC -->
				<jsp:include page="fragment/headMVC.jsp" />

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
				<script>
					function adminlog() {
						console.log("我要進去")
						$('#account').val('MeetBest');
						$('#pwd').val('!Aa123456');
						$('#loginform').submit();
					}

					function userlog() {
						$('#account').val('AwG2gX4YOa');
						$('#pwd').val('!Aa123456');
						$('#loginform').submit();
					}

					function happylog() {
						$('#account').val('happyloveeeit56');
						$('#pwd').val('!Aa123456');
						$('#loginform').submit();
					}
				</script>
				<script> $(function () {
						$.ajax({
							type: 'POST', url: '/MeetBoth/_01_member.checklog.controller',
							contentType: 'application/json', success: function (user) {
								if (user != "" && user != "anonymousUser"
								) { location.href = '/MeetBoth/justlogin'; }
							}
						});
					}); </script>
				<script src="https://www.google.com/recaptcha/api.js" async defer></script>
				<script src="https://www.google.com/recaptcha/api.js" async defer></script>
				<script>
					function verifyCallback(token) {
						console.log(token);
						$('#loginform').submit();
						// let formData = new FormData();
						// formData.append('token', token);

						// fetch(uriGAS, {
						// 	method: "POST",
						// 	body: formData
						// }).then(response => response.json())
						// 	.then(result => {
						// 		if (result.success) {
						// 			// 分數大過 0.5，才當作是真實人類操作
						// 			if (result.score > 0.5) {
						// 				$('#loginform').submit();
						// 			}

						// 			else {
						// 				$('#error').text('驗證不通過');
						// 			}
						// 		} else {
						// 			window.alert(result['error-codes'][0])
						// 		}
						// 	})
						// 	.catch(err => {
						// 		window.alert(err)
						// 	})
					}

					// function doPost(e) {

					// 	var params = e.parameter;
					// 	var token = params.token; // 從前端傳來的 token


					// 	var uri = 'https://www.google.com/recaptcha/api/siteverify';
					// 	var data = {
					// 		secret: '6LdxZYskAAAAAKc0nTph64_4fGJp3t5-DbtAjtzS',
					// 		response: token,

					// 	}

					// 	var option = {
					// 		method: 'post',
					// 		payload: data
					// 	};

					// 	var response = UrlFetchApp.fetch(uri, option);
					// 	return ContentService.createTextOutput(response).setMimeType(ContentService.MimeType.JSON);

					// }
				</script>
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
											<input style="text-transform: none; font-size: 18px;" class="form-control"
												id="account" type="text" name="username" placeholder="帳號" value="" />
										</div>
										<div class="form-group">
											<input style="text-transform: none; font-size: 18px;" class="form-control"
												id="pwd" type="password" name="password" placeholder="密碼" value="" />
										</div>
										<div class="form-group">
											<label for="checkbox">
												<input type="checkbox" id="checkbox" name="remember-me" checked>
												<span style="font-size: medium;" class="btn-p">記住我</span>
											</label>
										</div>
										<div class="form-group">
											<button class="btn btn-round btn-p g-recaptcha"
												data-sitekey="6LdxZYskAAAAABbdq9T-558ROSD4Uf0GpCvfprcH"
												data-action="verify1" data-callback="verifyCallback"
												style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;">登入</button>
											<a style="font-size: large;padding-left: 10px;"
												href="<%=request.getContextPath()%>/forgetpassword"><label
													id="error"></label><i class="fa-solid fa-circle-xmark"></i>忘記密碼?</a>
											<!-- <button class="btn btn-round btn-p"
												style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;"
												href="<%=request.getContextPath()%>/oauth2/authorization/google">Google登入</button> -->
										</div>



										<input type="button" id="admin" class="btn btn-round btn-p"
											onclick='event.preventDefault();adminlog();' value="管理員一鍵登入"
											style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;">
										<input type="button" id="user" class="btn btn-round btn-p"
											onclick="event.preventDefault();userlog();" value="GARY一鍵登入"
											style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%;">
										<input type="button" id="user" class="btn btn-round btn-p"
											onclick="event.preventDefault();happylog();" value="開芯一鍵登入"
											style="font-size: 20px; font-family: 微軟正黑體 ; padding: 0.7% 3% 0.7% 3%; margin-top: 3%;">
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

			</body>

			</html>