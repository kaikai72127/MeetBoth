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
<style>
.btn {
	font-family: "微軟正黑體";
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		
		<div class="main" style="background-color: #F0F0F0;">
		<h3 style=" margin-left: 10%; ">我的線上課程</h3>
			<!--       動態搜尋列 -->
			<section class="module-small" style="padding-bottom: 10px;">
				<div class="container" style="">
					<form class="row"
						action="<c:url value='/searchCourseWithCondition.controller'/>"
						method="post">
						<div class="col-sm-4 mb-sm-20"
							style="width: 20%; padding-right: 0;">
							<select name="case" class="form-control"
								style="padding-right: 0;">
								<option value="1">預設排序</option>
								<option value="2">依價格由大到小</option>
								<option value="3">依價格由小到大</option>
								<option value="4">依上架日期排序</option>
								<option value="5">依更新日期排序</option>
							</select>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 20%; padding-right: 0;">
							<select name="typecase" class="form-control" style="">
								<option value="0">全部類別</option>
								<option value="1">語言學習</option>
								<option value="2">升學補習</option>
								<option value="3">專業科目</option>
								<option value="4">人文課程</option>
								<option value="5">程式課程</option>
							</select>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 7.5%; padding: 0px 0px 0px 0px;">
							<p align="right" style="font-size: 17px;">價格區間:&ensp;</p>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 10%; padding-left: 0;">
							<input class="form-control input-sm" type="text" name="lowprice"
								placeholder="0" value="0" style="text-align: center;"
								onkeyup="value=value.replace(/[^\d]/g,'') " />
						</div>
						<div class="col-sm-2 mb-sm-20" style="width: 0.5%; padding: 0px;">
							<p align="right" style="">~</p>
						</div>
						<div class="col-sm-2 mb-sm-20"
							style="width: 10%; padding-right: 0;">
							<input class="form-control input-sm" type="text" name="highprice"
								placeholder="999999" value="999999" style="text-align: center;"
								onkeyup="value=value.replace(/[^\d]/g,'') " />
						</div>
						<div class="col-sm-2 mb-sm-20" style="width: 22%">
							<input class="form-control" type="text" name="searchName"
								style="" placeholder="搜尋名稱" />
						</div>
						<div class="col-sm-3" style="width: 10%">
							<button class="btn btn-p btn-round" type="submit" style="">搜尋</button>
						</div>
					</form>
				</div>
			</section>
			<!-- 			新增商品 -->
			<div class="container" style="padding: 10px 10px 20px 20px;">
				<input type="button" value="返回首頁" class="btn btn-info btn-circle"
					style="font-size: 17px; color: black;"
					onclick="window.location='/MeetBoth/pathToSearchAllCourseMember.controller'">
<!-- 				&nbsp; <input type="button" value="隨便看看" -->
<!-- 					class="btn btn-success btn-circle" -->
<!-- 					style="font-size: 17px; color: black;" -->
<!-- 					onclick="window.location='/MeetBoth/searchRandomCourse.controller'"> -->
<!-- 				&nbsp; <input type="button" value="新增商品" -->
<!-- 					class="btn btn-warning btn-circle" -->
<!-- 					style="font-size: 17px; color: black;" -->
<!-- 					onclick="window.location='/MeetBoth/pathToInsertCourse.controller'"> -->
			</div>
			<!-- 			新增商品 -->
			<hr class="divider-w">
			<!--         商品陳列 -->
			<section class="module-small">
				<div class="container">
					<div class="row multi-columns-row">
						<c:forEach var="bean" items="${memberbuy.coureOrder}">
							<div class="col-sm-6 col-md-3 col-lg-3"
								style="padding-bottom: 10px;">
								<div class="shop-item">
									<div id="shop-item-image"
										style="height: 282px; width: 210px; margin: auto; display: flex; justify-content: center; align-items: center;">
										<img style="padding: auto;" alt="${bean.courseBean.courseName}"
											src="<c:url value='/showCoursePicture.controller?id=${bean.courseBean.courseID}' />">
										<div class="shop-item-detail">
											<a
												href="/MeetBoth/YtDetail.controller?id=1&courseID=${bean.courseBean.courseID}"
												class="btn btn-round btn-p" style="font-size: 14px;"><span
												class="icon-heart">進入課程影片</span><span class="icon-heart"></span></a>
										</div>
									</div>
									<div id="soldout">
										<strong style="font-size: 6px">開始課程</strong>
									</div>
									<div id="courseName">
										<strong style="font-size: 16px">${bean.courseBean.courseName}</strong>
									</div>
									<div id="memberName">
										<strong style="font-size: 16px">老師 : ${bean.courseBean.memberBean.memNickName}</strong>
									</div>
									<div id="price">
										<strong style="font-size: 16px">價格 :
											NT$${bean.courseBean.coursePrice}</strong>
									</div>
									
								</div>
							</div>
						</c:forEach>
					</div>
					
				</div>
			</section>
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
</body>
</html>