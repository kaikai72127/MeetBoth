<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!DOCTYPE html>
			<html lang="zh-hant-TW">

			<head>
				<!-- 引入共同的headMVC -->
				<jsp:include page="../fragment/headMVC.jsp" />
				<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
				<script>
					function mailcheck() {
						var email = $("#mail").val();
						if (/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(email)) {
							$.ajax({
								type: 'GET',
								url: '/MeetBoth/mailcheck',
								data: { "email": email },
								contentType: 'application/json',
								success: function (check) {
									if (check == "1") {
										event.preventDefault();
										$("#errormessage").css({ "font-size": "medium", color: "red" }).text("信箱已被註冊！")
										$("#push").hide();
									} else {
										event.preventDefault();
										$("#errormessage").css({ "font-size": "medium", color: "green" }).text("信箱未被註冊！");
										$("#push").show();
									}
								}
							});
						} else {
							event.preventDefault();
							$("#errormessage").css({ "font-size": "medium", color: "red" }).text("信箱不可使用！")
							$("#push").hide();
						}
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

					<section class="register">
						<div class="container">
							<div class="row">
								<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
									<h4 class="font-alt h4-p">開始註冊前，請先驗證信箱</h4>
									<hr class="divider-w mb-10">
									<form class="form" action="<%=request.getContextPath()%>/mailVerify.controller"
										method="Post">
										<div class="form-group">
											<input class="form-control" style="text-transform: none;" id="mail"
												type="text" name="email" oninput='mailcheck()' value='${value}'
												placeholder="請輸入正確的電子郵件信箱" />
										</div>

										<div class="form-group">
											<button class="btn btn-round btn-p" id="push"
												style="display: none;">進行驗證</button>
											<label id="errormessage" style="font-size: medium; color: red;">
											</label>

										</div>

										<div class="form-group">
											<button id="push" class="btn btn-round btn-p"
												style="display: none;">進行驗證</button>

										</div>


									</form>

								</div>

							</div>
						</div>
					</section>

					<!-- Footer -->
					<!-- 引入共同的footerMVC -->
					<jsp:include page="../fragment/footerMVC.jsp" />
					<script>
						Swal.fire({
							title: 'Are you sure?',
							text: "You won't be able to revert this!",
							icon: 'warning',
							showCancelButton: true,
							confirmButtonColor: '#3085d6',
							cancelButtonColor: '#d33',
							confirmButtonText: 'Yes, delete it!'
						}).then((result) => {
							if (result.isConfirmed) {
								Swal.fire(
									'Deleted!',
									'Your file has been deleted.',
									'success'
								)
							}
						})
					</script>
				</main>

				<!--  
    JavaScripts
    =============================================
    -->
				<!-- 引入共同的js -->
				<jsp:include page="../fragment/jsPath.jsp" />



			</body>

			</html>