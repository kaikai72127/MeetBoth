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

					<section class="register">
						<div class="container">
							<div class="row">
								<div class="col-sm-5 col-sm-offset-1 mb-sm-40">
									<h5 class="font-alt h5-p">你已經登入</h5><br>
									<h5 id="timeBox" class="font-alt h5-p">
									</h5>
									<hr class="divider-w mb-10">
								</div>

							</div>
						</div>
					</section>

					<!-- Footer -->
					<!-- 引入共同的footerMVC -->
					<jsp:include page="../fragment/footerMVC.jsp" />
				</main>
				<script type="text/javascript">
					//設定秒數
					let count = 5;
					function countDown() {
						// 將秒數寫在指定元素中
						document.getElementById("timeBox").innerHTML = count + "秒後回到首頁！";
						// 每次執行就減1
						count -= 1;
						// 當 count = 0 時跳轉頁面
						if (count == 0) {
							location.href = "/MeetBoth";
						}
						// 設定每秒執行1次
						setTimeout("countDown()", 1000);
					}
					// 執行 countDown
					countDown();
				</script>
				<!--  
    JavaScripts
    =============================================
    -->
				<!-- 引入共同的js -->
				<jsp:include page="../fragment/jsPath.jsp" />



			</body>

			</html>