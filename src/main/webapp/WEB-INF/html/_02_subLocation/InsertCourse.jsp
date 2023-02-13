<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
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

			<form action="<c:url value='/insertCourse.controller' />"
				method="post" enctype="multipart/form-data">
				<section class="module" style="padding-bottom: 20px">
					<!-- 			按鈕們 -->
					<div class="container" style="padding: 10px 10px 30px 30px;">
						<div class="row">
							<button class="btn btn-warning btn-circle" type="button"
								style="height: 43px; font-size: 19px;"
								onclick="window.location='/MeetBoth/searchAllCourse.controller'">
								<span class="icon-browser">&ensp;回到課程目錄</span>
							</button>
							&nbsp;
							<button class="btn btn-primary  btn-circle" type="button"
								style="height: 43px; font-size: 19px;" onclick="#">
								<span class=" icon-gears">&ensp;一件輸入</span>
							</button>

						</div>
					</div>
					<!-- 			按鈕們 -->
					<div class="container">
						<div class="row">
							<!-- 						圖片BLOCK -->
							<div class="col-sm-6 mb-sm-40" style="width: 42%;">
								<span class="amount">上傳課程照片</span> <input type="file"
									name="cPic" id="images5278" style="width: 80%"
									accept=".jpg,.png"> <img id="preImg" style="" src="#" />
							</div>
							<!-- 							圖片右邊BLOCK -->
							<div class="col-sm-6" style="margin-top: 68px; width: 58%">
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt" style="display: flex;">
											<span class="amount"
												style="font-size: 25px; text-align: center;">課程名稱:&ensp;</span>
											<input class="form-control input-lg" type="text" name="cName"
												required="required"
												style="text-transform: none; width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;" />
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt" style="display: flex;">
											<span class="amount"
												style="font-size: 25px; text-align: center;">課程類別:&ensp;</span>
											<select name="cClass"
												style="width: 80%; font-size: 20px; letter-spacing: 0px; border: 1px solid black; border-radius: 15px; text-align: center;">
												<option value="1">語言學習</option>
												<option value="2">升學補習</option>
												<option value="3">專業科目</option>
												<option value="4">人文課程</option>
												<option value="5">程式課程</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt" style="display: flex;">
											<span class="amount"
												style="font-size: 25px; text-align: center;">課程價格:&ensp;</span>
											<input class="form-control input-lg" type="number"
												name="cPrice" id="amount" value="1" min="0"
												required="required"
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
											<input class="form-control input-lg" type="text" name="memID"
												required="required"
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
											style="font-size: 25px; text-align: center; margin-left: 10px">課程介紹:&ensp;</span>
										<textarea class="form-control" id="directions"
											name="directions" placeholder="課程介紹"
											style="text-transform: none; resize: none; height: 425px; width: 100%; overflow-y: auto; font-size: 17px; color: black; border: 1px solid black; border-radius: 15px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12" style="padding-right: 0px;">
							<input class="btn btn-d btn-circle" type="submit" value="新增課程"
								style="height: 60px; font-size: 25px; float: right;">
						</div>
					</div>
				</section>
			</form>

			<!-- 						中間BLOCK end-->
			<!-- Footer -->
			<!-- 引入共同的footerMVC -->
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
			</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<!-- 引入共同的js -->
	<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />
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
</body>
</html>