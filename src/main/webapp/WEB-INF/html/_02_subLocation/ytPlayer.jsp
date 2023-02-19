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

<style>
.star-off {
	color: black;
}

h1 {
	font-size: 18px;
	font-weight: 700;
	text-align: center;
	margin: 20px 0;
}

.cart>li>a {
	border: 1px solid gray;
	border-radius: 10px;
	color: gray;
	font-weight: 600;
	font-size: 16px;
	padding: 10px;
	text-align: center;
}

.cart>li {
	padding-bottom: 10px;
}

.cart>li>ul>li>a {
	border: solid 1px black;
	border-radius: 10px;
	height: 35px;
	text-align: center;
	font-size: 18px;
}

.cart>li>ul>li>a:hover, .cart>li>ul>li>a.active {
	background: gray;
	color: #fff;
}

.cart>li>a:hover, .cart>li>a.active {
	background: gray;
	color: #fff;
}

.cart a {
	display: block;
	text-decoration: none;
}

.cart ul {
	display: none;
}

.cart ul li {
	margin: 10px;
}

.cart ul li a {
	color: #000;
}

#ChartData>div>div>div>div>svg>g>text {
	font-size: 22px;
}

#ChartData>div>div>div>div>svg>g>g>g>text {
	font-size: 17px;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main">
			<!-- 			新增商品 -->
			<!-- 			<section class="module-small" style="padding-bottom: 10px;"> -->
			<!-- 				<div class="container" style="padding: 10px 10px 20px 20px;"> -->
			<!-- 					<input type="button" value="返回首頁" class="btn btn-info btn-circle" -->
			<!-- 						style="font-size: 17px; color: black;" -->
			<!-- 						onclick="window.location='/MeetBoth/searchAllCourse.controller'"> -->
			<!-- 					&nbsp; <input type="button" value="新增商品" -->
			<!-- 						class="btn btn-warning btn-circle" -->
			<!-- 						style="font-size: 17px; color: black;" -->
			<!-- 						onclick="window.location='/MeetBoth/pathToInsertCourse.controller'"> -->
			<!-- 				</div> -->
			<!-- 			</section> -->
			<!-- 			新增商品結束 -->
			<!-- 			<hr class="divider-w"> -->
			<section class="module" style="padding-top: 10px;">
				<div class="container">
					<!-- 整頁 -->
					<div class="row">
						<!-- 整頁 -->
						<!-- 左邊欄位開始 -->
						<div class="col-sm-4 col-md-3 sidebar" style="">
							<div class="widget">
								<h3 style="padding-bottom: 10px; text-align: center;">我的線上課程</h3>
								<ul class="cart">
									<c:forEach var="eachCourse" items="${memberbuy.coureOrder}">
										<li><a href="#">${eachCourse.courseBean.courseName}&ensp;<i
												class="fa-solid fa-angle-double-down"></i>
										</a>
											<ul style="">
												<c:forEach var="ytBean"
													items="${eachCourse.courseBean.ytPlayer}">
													<li><a
														href="/MeetBoth/YtDetail.controller?id=${ytBean.ytPlayerID}&courseID=${eachCourse.courseBean.courseID}">${ytBean.ytPlayerName}</a></li>
												</c:forEach>
											</ul></li>

									</c:forEach>
								</ul>
							</div>
						</div>
						<!-- 左邊欄位結束 -->
						<!-- 						右邊欄位開始 -->
						<div class="col-sm-8 col-sm-offset-1" style="margin-left: 20px;">
							<div class="post">
								<!-- 							標題 -->
								<div class="post-thumbnail">
									<h1
										style="padding-bottom: 10px; text-align: center; font-size: 50px;">${bean.ytPlayerName}</h1>
								</div>
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post" style="margin-bottom: 0px">
									<div class="post-video embed-responsive embed-responsive-16by9">
										<iframe class="embed-responsive-item"
											src="//www.youtube.com/embed/${bean.ytPlayerURL}"
											frameborder="0" allowfullscreen="allowfullscreen"></iframe>
									</div>
									<div class="post-header font-alt">
										<h2 class="post-title">${bean.ytPlayerName}</h2>
										<div class="post-meta">
											By&nbsp;<a href="#">課程講師
												${singleCourseBean.memberBean.memName}</a>|
											&nbsp;${singleCourseBean.courseUpdate} | &nbsp;課程類別&nbsp;:<a
												href="#">${singleCourseBean.coursetype.courseClassName}</a>
										</div>
									</div>

								</div>
								<hr class="divider-w pt-20">
								<!--       右邊第二部分 -->

								<div class="row mt-70" style="margin-top: 0px !important;">
									<div class="col-sm-12">
										<ul class="nav nav-tabs font-alt" role="tablist">
											<li class="active"><a href="#description"
												data-toggle="tab"><span class="icon-tools-2"></span>總覽
													Description</a></li>
											<li><a href="#data-sheet" data-toggle="tab"><span
													class="icon-tools-2"></span>課程講師 Teacher</a></li>
											<li><a href="#reviews" data-toggle="tab"><span
													class="icon-tools-2"></span>課程評論 Reviews
													(${commBean.size()})</a></li>
										</ul>
										<div class="tab-content">
											<!-- 		課程資訊 -->
											<div class="tab-pane active" id="description">
												<h3>關於此課程</h3>
												${singleCourseBean.courseDirections}
											</div>
											<!-- 		上架者資訊 -->
											<div class="tab-pane" id="data-sheet">
												<div style="display: flex;">
													<div class="shop-item-image"
														style="width: 200px; height: 250px;">
														<img src="<c:url value='/_01_member.ShowPhoto.controller?account=${singleCourseBean.memberBean.account}'/>"
															alt="avatar" />
													</div>
													<div class="comment-content clearfix"
														style="margin-left: 10px; width: 70%;">
														<div class="comment-author font-alt">
															<h3>
																<a href="#">${singleCourseBean.memberBean.memName}</a>
															</h3>
															<p style="font-size: 20px;">${singleCourseBean.memberBean.memName}</p>
															<p style="font-size: 20px;">${singleCourseBean.memberBean.memNickName}</p>
															<p style="font-size: 20px;">${singleCourseBean.memberBean.eMail}</p>
														</div>
													</div>
													<div style="margin-top: 170px;">
														<a
															href="<c:url value='/memberresume?id=${singleCourseBean.memberBean.memberID}'/>">
															<input class="btn btn-p btn-circle" type="button"
															value="前往賣家個人頁面"
															style="height: 43px; font-size: 19px; float: right;">
														</a>
													</div>
												</div>
											</div>
											<!-- 		課程評論 -->
											<div class="tab-pane" id="reviews">
												<div class="comments reviews">
													<!-- 										課程評論 forEach -->
													<div
														style="height: 650px; width: 100%; overflow-y: scroll;">
														<c:forEach var="commbean" items="${commBean}">
															<div class="comment clearfix">
																<div class="comment-avatar">
																	<img src="<c:url value='/_01_member.ShowPhoto.controller?account=${bean.memberBean.account}'/>"
																		alt="賣家圖片" />
																</div>
																<div class="comment-content clearfix">
																	<div class="comment-author font-alt" style="margin: 0;">
																		<a href="#" style="font-size: 15px;">${singleCourseBean.memberBean.memNickName}</a>
																	</div>
																	<div class="comment-meta font-alt"
																		style="font-size: 14px;">
																		${commbean.courseCommentDate} -
																		<div id="starDiv" style="font-size: 14px;">
																			<input id="score" type="hidden"
																				value="${commbean.courseScore}" />
																		</div>
																		<div class="comment-body">
																			<p style="font-size: 18px; text-transform: none;">${commbean.courseComment}</p>
																		</div>
																	</div>
																</div>
															</div>
														</c:forEach>
													</div>
													<!-- 										課程評論 forEach end-->
												</div>
												<hr>
												<!-- 										新增評論 -->
												<div class="comment-form mt-30">
													<h2 style="font-size: 23px;"
														class="comment-form-title font-alt">新增評論</h2>
													<form method="post"
														action="<c:url value='/InsertCourseCommentUnderYt.controller' />">
														<input type="hidden" name="id"
															value="${singleCourseBean.courseID}" /> <input
															type="hidden" name="ytPlayerID"
															value="${bean.ytPlayerID}" />
														<div class="row">
															<div class="col-sm-4">
																<div class="form-group">
																	<label class="sr-only" for="name">Name</label> <input
																		class="form-control" id="name" type="text" name="name"
																		placeholder="Name"
																		style="text-transform: none; font-size: 17px; height: 35px;" />
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-group">
																	<select class="form-control" name="score"
																		style="font-size: 17px; height: 35px;">
																		<option value="5">評分</option>
																		<option value="1">1</option>
																		<option value="2">2</option>
																		<option value="3">3</option>
																		<option value="4">4</option>
																		<option value="5">5</option>
																	</select>
																</div>
															</div>
															<div class="col-sm-12">
																<div class="form-group">
																	<textarea class="form-control" id="" name="comm"
																		rows="4" placeholder="留言" maxlength="50"
																		style="text-transform: none; resize: none; white-space: nowrap; color: black; font-size: 17px;"></textarea>
																</div>
															</div>
															<div class="col-sm-12">
																<button class="btn btn-round btn-d" type="submit"
																	style="height: 50px; font-size: 22px; float: right;">新增評論</button>
															</div>
														</div>
													</form>
												</div>
											</div>
											<!-- 										課程評論 end -->
										</div>
									</div>
								</div>
								<!--       右邊第二部分 -->
								<!-- 		課程資訊結束 -->
							</div>
						</div>
						<!-- 		右邊欄位結束 -->
					</div>
				</div>
			</section>
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
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
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
	<script>
		$(document).ready(function() {
			//以ul li包子選單
			$('.cart>li>a').click(function(event) {
				event.preventDefault();
				$(this).toggleClass('active');
				$(this).siblings('ul').slideToggle(500);
			});
			//html以div h3 h5包子選單
			$('.list h3').click(function(event) {
				$(this).toggleClass('active');
				$(this).siblings('h5').slideToggle(500);
			});

		});
	</script>
	<!-- score js -->
	<script>
		const scores = document.querySelectorAll("#score");

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							for (let i = 0; i < scores.length; i++) {
								const starNum = scores[i].value;
								const starDiv = scores[i].closest("#starDiv");
								let onstar = '<span><i class="fa fa-star star"></i></span>';
								let offstar = '<span><i class="fa fa-star star-off"></i></span>';
								let stars = '';

								for (var j = 0; j < 5; j++) {
									if (j < starNum) {
										stars += onstar;
									} else {
										stars += offstar;
									}
								}
								starDiv.innerHTML = stars;
							}
						});
	</script>
	<script>
		function roundToTwo(num) {
			return +(Math.round(num + "e+2") + "e-2");
		}

		const score = document.querySelectorAll("#starAVG");

		document.addEventListener("DOMContentLoaded", function() {
			var totalScore = 0;
			for (let i = 0; i < score.length; i++) {
				const starNum = score[i].value;
				totalScore += Number(starNum);
			}
			let avgScore = roundToTwo(totalScore / score.length);
			let stars = '&nbsp;(' + avgScore + ')';
			let onstar = '<span><i class="fa fa-star star"></i></span>';
			let offstar = '<span><i class="fa fa-star star-off"></i></span>';
			for (var j = 0; j < 5; j++) {
				if (j < avgScore) {
					stars += onstar;
				} else {
					stars += offstar;
				}
			}
			stars += '&nbsp;(' + score.length + '則評論)'
			document.getElementById("starAVGDiv").innerHTML = stars;
		});
	</script>
</html>