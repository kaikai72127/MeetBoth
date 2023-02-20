<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ include file="js/myjs.jsp" %>


				<!DOCTYPE html>
				<html lang="zh-hant-TW">

				<head>
					<!-- 引入共同的headMVC -->
					<jsp:include page="../fragment/headMVC.jsp" />
					<jsp:include page="js/myjs.jsp" />
					<style>
						#checkEye {
							position: absolute;
							top: 50%;
							right: 20px;
							transform: translateY(-50%);
						}

						#checkEye2 {
							position: absolute;
							top: 65%;
							right: 20px;
							transform: translateY(-50%);
						}
					</style>
					<script>
						function view() {
							if ($("#checkEye").hasClass('fa-eye')) {
								$("#pas1check").attr('type', 'text');
							} else {
								$("#pas1check").attr('type', 'password');
							}
							$("#checkEye").toggleClass('fa-eye').toggleClass('fa-eye-slash');
						}
						function view2() {
							if ($("#checkEye2").hasClass('fa-eye')) {
								$("#pas2check").attr('type', 'text');
							} else {
								$("#pas2check").attr('type', 'password');
							}
							$("#checkEye2").toggleClass('fa-eye').toggleClass('fa-eye-slash');
						}

					</script>
				</head>

				<!--BOBY-->

				<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

					<!-- header -->
					<!-- 引入共同的topMVC -->
					<jsp:include page="../fragment/topMVC.jsp" />

					<main>


						<!-- LoginRegister-->

						<section class="forgotpassword">
							<div class="container">
								<div class="row">
									<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
										<h4 class="font-alt h4-p">重設密碼</h4>
										<hr class="divider-w mb-10">
										<form class="form" action="resetpass" method="Post">

											<div class="form-group">
												<div style="width: 95%;">
													<input class="form-control" style="text-transform: none;"
														id="account" type="text" name="account" value='${account}'
														placeholder="請輸入帳號" readonly />
												</div>
												<div style="width: 95%;">
													<input class="form-control" style="text-transform: none;"
														id="pas1check" type="password" name="password" value='${value}'
														onblur="pasvalid()" placeholder="請輸入新密碼" required><span><i
															onclick='view()' class="fas fa-eye"
															id="checkEye"></i></span>

												</div>
												<div style="width: 95%;">
													<input class="form-control" style="text-transform: none;"
														id="pas2check" type="password" name="password2"
														onblur="checkpwd()" value='${value}' placeholder="請再輸入一次新密碼"
														required /><i class="fas fa-eye" onclick="view2()"
														id="checkEye2"></i>

												</div>
											</div>

											<div class="form-group">
												<button class="btn btn-round btn-p" onclick="submitcheck()">送出</button>
											</div>


										</form>

									</div>

								</div>
							</div>
						</section>

						<!-- Footer -->
						<!-- 引入共同的footerMVC -->
						<div>
							<jsp:include page="../fragment/footerMVC.jsp" />
						</div>
					</main>

					<!--  
    JavaScripts
    =============================================
    -->
					<!-- 引入共同的js -->
					<jsp:include page="../fragment/jsPath.jsp" />



				</body>

				</html>