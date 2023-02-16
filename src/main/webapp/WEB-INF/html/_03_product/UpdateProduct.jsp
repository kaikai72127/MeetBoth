<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/css/main.css";
%>
<%
String pathimg = request.getContextPath();
String basePathimg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathimg
		+ "/html/images/meatball-icon.png";
%>
<%
String basePathimg2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/images/meatball-200.png";
%>

<!-- 引入共同的頁首 -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />

</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main" style="background-color: #F0F0F0;">
			<form
				action='<c:url value="/_03_product.updateProductDate.controller" />'
				enctype='multipart/form-data' method='post' id="form1">
				<c:forEach var="bean" items="${bean}">
					<section class="module" style="padding-bottom: 20px">

						<!-- 			按鈕們 -->
						<div class="container" style="padding: 10px 10px 30px 30px;">
							<div class="row">
								<button class="btn btn-warning btn-circle" type="button"
									style="height: 43px; font-size: 19px;"
									onclick="window.location='/MeetBoth/_03_product.searchAllProduct.controller/1'">
									<span class="icon-browser">&ensp;回到商品目錄</span>
								</button>
							</div>
						</div>
						<!-- 			按鈕們 -->

						<div class="container">
							<div class="row">
								<!-- 						圖片BLOCK -->
								<div class="col-sm-6 mb-sm-40" style="width: 42%;">
									<span class="amount">修改商品照片</span> <input type="file"
										name="images" id="images5278" style="width: 80%"
										accept=".jpg,.png"> <div style="width: 445px; height: 600px; margin: auto; display: flex; justify-content: center; align-items: center; margin-right: 15px; text-align: center;"><img id="preImg"
										style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
										src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodID}' />" /></div>
								</div>
								<!-- 							圖片右邊BLOCK -->
								<div class="col-sm-6" style="margin-top: 68px; width: 58%">
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt" style="display: flex;">
												<span class="amount"
													style="font-size: 25px; text-align: center;">商品名稱:&ensp;</span>
												<input class="form-control input-lg" type="text"
													name="prodName" required="required"
													value="${bean.prodName}"
													style="text-transform: none; width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;" />
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt" style="display: flex;">
												<span class="amount"
													style="font-size: 25px; text-align: center;">商品編號:&ensp;</span>
												<input class="form-control input-lg" type="text"
													name="prodID" required="required" readonly
													value="${bean.prodID}"
													style="text-transform: none; width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;" />
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt" style="display: flex;">
												<span class="amount"
													style="font-size: 25px; text-align: center;">商品類別:&ensp;</span>
												<input type="hidden" name="typeClassNum"
													value="${bean.prodtype.prodClass}"> <select
													name="prodClass"
													style="width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;">
													<option value="1">文具</option>
													<option value="2">教具</option>
													<option value="3">運動用品</option>
													<option value="4">學生用品</option>
													<option value="5">全新教科書</option>
													<option value="6">全新好數</option>
													<option value="7">二手教科書</option>
													<option value="8">二手好書</option>
													<option value="9">桌上小物</option>
													<option value="10">教室小物</option>
													<option value="11">3c小物</option>
													<option value="12">益智小物</option>
												</select>
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt" style="display: flex;">
												<span class="amount"
													style="font-size: 25px; text-align: center;">商品價格:&ensp;</span>
												<input class="form-control input-lg" type="number"
													name="prodPrice" id="amount" required="required"
													value="${bean.prodPrice}"
													style="width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;" />
											</div>
										</div>
									</div>
									<!-- 							會員資料 -->
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt" style="display: flex;">
												<span class="amount"
													style="font-size: 25px; text-align: center;">賣家編號:&ensp;</span>
												<input class="form-control input-lg" type="text"
													name="memberID" required="required"
													value="${bean.memberBean.memberID}" readonly
													style="width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;" />
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt" style="display: flex;">
												<span class="amount"
													style="font-size: 25px; text-align: center;">商品庫存:&ensp;</span>
												<input class="form-control input-lg" type="number"
													name="inventory" id="amount" required="required"
													value="${bean.inventory}"
													style="width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;" />
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- 						中間BLOCK -->
						</div>
					</section>
					<section class="module" style="padding: 20px">

						<div class="container">
							<div class="row">
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt" style="">
											<span class="amount"
												style="font-size: 25px; text-align: center; margin-left: 10px">商品介紹:&ensp;</span>
											<textarea class="form-control" id="directions"
												name="directions"
												style="text-transform: none; resize: none; height: 425px; width: 100%; overflow-y: auto; font-size: 17px; color: black; border: 1px solid black; border-radius: 15px;">${bean.directions}</textarea>
										</div>
									</div>
								</div>
							</div>
							<div class="col-sm-12" style="padding-right: 0px;">
								<input class="btn btn-d btn-circle" type="submit" value="修改商品"
									style="height: 60px; font-size: 25px; float: right;">
							</div>
						</div>
					</section>
				</c:forEach>
			</form>

			<!-- 						中間BLOCK end-->
			<!-- 						中間BLOCK end-->
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<%
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/jquery.min.js";
	%>

	<%
	String basePath2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/browser.min.js";
	%>

	<%
	String basePath3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/breakpoints.min.js";
	%>

	<%
	String basePath4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/util.js";
	%>

	<%
	String basePath5 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/main.js";
	%>
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
	<script>
		$("#images5278").change(function() {
			readURL(this);
		});

		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#preImg").attr('src', e.target.result);
				}
				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<script type="text/javascript">
		// 選取 select 元素
		var selectElement = document.getElementsByName("prodClass")[0];
		// 取得 typeClassNum 的值
		var typeClassNum = document.getElementsByName("typeClassNum")[0].value;
		// 選取特定的 option 元素
		for (var i = 0; i < selectElement.options.length; i++) {
			if (selectElement.options[i].value == typeClassNum) {
				// 將選到的 option 元素的 selected 屬性設為 true
				selectElement.options[i].selected = true;
				break;
			}
		}
	</script>
</body>
</html>