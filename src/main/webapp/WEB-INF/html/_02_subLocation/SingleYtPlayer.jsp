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
									<%-- 									<c:forEach var="eachCourse" items="${courseBean}"> --%>
									<li><a
										href="/MeetBoth/YtDetail.controller?id=${courseBean.courseID}">
											${courseBean.courseName}&ensp;<i
											class="fa-solid fa-angle-double-down"></i>
									</a>
										<ul style="">
											<c:forEach var="ytBean" items="${courseBean.ytPlayer}">
												<li><a
													href="/MeetBoth/YtDetail.controller?id=${ytBean.ytPlayerID}&courseID=${eachCourse.courseID}">${ytBean.ytPlayerName}</a></li>
											</c:forEach>
										</ul></li>

									<%-- 									</c:forEach> --%>
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
										style="padding-bottom: 10px; text-align: center; font-size: 50px;">${singleCourseBean.ytPlayerName}</h1>
								</div>
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post" style="margin-bottom: 0px">
									<div class="post-video embed-responsive embed-responsive-16by9">
										<iframe class="embed-responsive-item"
											src="//www.youtube.com/embed/${singleCourseBean.ytPlayerURL}"
											frameborder="0" allowfullscreen="allowfullscreen"></iframe>
									</div>
									<div class="post-header font-alt">
										<h2 class="post-title">${bean.ytPlayerName}</h2>
										<div class="post-meta">
											By&nbsp;<a href="#">課程講師(會員導覽)</a>|
											&nbsp;${singleCourseBean.courseUpdate} | &nbsp;課程類別&nbsp;:<a
												href="#">${singleCourseBean.coursetype.courseClassName}</a>
										</div>
									</div>
								
								</div>
								<!--       右邊第一部分結束 -->
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
												<table class="table table-striped ds-table table-responsive">
													<tbody>
														<tr>
															<th>Title</th>
															<th>Info</th>
														</tr>
														<tr>
															<td>Compositions</td>
															<td>Jeans</td>
														</tr>
														<tr>
															<td>Size</td>
															<td>44, 46, 48</td>
														</tr>
														<tr>
															<td>Color</td>
															<td>Black</td>
														</tr>
														<tr>
															<td>Brand</td>
															<td>Somebrand</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="tab-pane" id="reviews">
												<div class="comments reviews">
													<div class="comment clearfix">
														<div class="comment-avatar">
															<img src="" alt="avatar" />
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt">
																<a href="#">John Doe</a>
															</div>
															<div class="comment-body">
																<p>The European languages are members of the same
																	family. Their separate existence is a myth. For
																	science, music, sport, etc, Europe uses the same
																	vocabulary. The European languages are members of the
																	same family. Their separate existence is a myth.</p>
															</div>
															<div class="comment-meta font-alt">
																Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star-off"></i></span>
															</div>
														</div>
													</div>
													<div class="comment clearfix">
														<div class="comment-avatar">
															<img src="" alt="avatar" />
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt">
																<a href="#">Mark Stone</a>
															</div>
															<div class="comment-body">
																<p>Europe uses the same vocabulary. The European
																	languages are members of the same family. Their
																	separate existence is a myth.</p>
															</div>
															<div class="comment-meta font-alt">
																Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star-off"></i></span><span><i
																	class="fa fa-star star-off"></i></span>
															</div>
														</div>
													</div>
												</div>
											</div>
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
</html>