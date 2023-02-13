<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


			<!DOCTYPE html>
			<html lang="zh-hant-TW">

			<head>
				<!-- 引入共同的headMVC -->
				<jsp:include page="fragment/headMVC.jsp" />
				<link rel="stylesheet" href="html/assets/css/_05_teacStu/deoindex.css" />

				<style type="text/css">
					marquee {
						font-size: 28px;
					}

					marquee a {
						color: #ce7777;
						font-size: 28px;
						font-weight: 800;
						text-decoration: none;
					}

					marquee a:hover {
						color: white;
						background-color: #ce7777;
					}
				</style>
			</head>

			<!--BOBY-->

			<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
				<!-- animation -->
				<!-- 引入animation -->
				<jsp:include page="/WEB-INF/html/fragment/animation.jsp" />

				<!-- header -->
				<!-- 引入共同的topMVC -->
				<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

				<main>
					<div class="page-loader">
						<div class="loader">Loading...</div>
					</div>
					<marquee onMouseOver="this.stop()" onMouseOut="this.start()">
						<img src="https://i.imgur.com/53AabEX.png" width="48px" height="48px">
						肉玩家教網歡迎您的加入 點擊<a href="/MeetBoth/login/page">註冊</a> ꉂꉂ꒰•̤▿•̤*ૢ꒱
					</marquee>
					<!-- 內容 1-->
					<section class="bg-dark-30 showcase-page-header module parallax-bg"
						data-background="assets/images/showcase_bg.jpg">
						<div class="titan-caption">
							<div class="caption-content">
								<div class="font-alt mb-30 titan-title-size-1">Powerful.
									Multipurpose.</div>
								<div class="font-alt mb-40 titan-title-size-4">100+ Layouts</div>
								<a class="section-scroll btn btn-border-w btn-round" href="#demos">See
									Demos</a>
							</div>
						</div>
					</section>

					<div class="main showcase-page">
						<section class="module-extra-small bg-dark">
							<div class="container">
								<div class="row">
									<div class="col-sm-6 col-md-8 col-lg-9">
										<div class="callout-text font-alt">
											<h4 style="margin-top: 0px;">Start Creating Beautiful
												Websites</h4>
											<p style="margin-bottom: 0px">Download Titan Free today!</p>
										</div>
									</div>
									<div class="col-sm-6 col-md-4 col-lg-3">
										<div class="callout-btn-box">
											<a class="btn btn-border-w btn-circle"
												href="https://themewagon.com/themes/titan/">Downlaod Free</a>
										</div>
									</div>
								</div>
							</div>
						</section>

						<!-- 內容 2-->
						<section class="module-medium" id="demos">
							<div class="container">
								<div class="row multi-columns-row">
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_mp_fullscreen_video_background.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/main_demo.jpg" alt="Main Demo" />
											</div>
											<h3 class="content-box-title font-serif">Main Demo</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_agency.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/agency.jpg" alt="Agency" />
											</div>
											<h3 class="content-box-title font-serif">Agency</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_portfolio.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/portfolio.jpg" alt="Portfolio" />
											</div>
											<h3 class="content-box-title font-serif">Portfolio</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_restaurant.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/restaurant.jpg" alt="Restaurant" />
											</div>
											<h3 class="content-box-title font-serif">Restaurant</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_finance.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/finance.jpg" alt="Finance" />
											</div>
											<h3 class="content-box-title font-serif">Finance</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_landing.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/landing.jpg" alt="Landing" />
											</div>
											<h3 class="content-box-title font-serif">Landing</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_photography.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/photography.jpg"
													alt="Photography" />
											</div>
											<h3 class="content-box-title font-serif">Photography</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_shop.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/shop.jpg" alt="Shop" />
											</div>
											<h3 class="content-box-title font-serif">Shop</h3>
										</a>
									</div>
									<div class="col-md-4 col-sm-6 col-xs-12">
										<a class="content-box" href="index_op_fullscreen_gradient_overlay.html">
											<div class="content-box-image">
												<img src="assets/images/screenshots/one_page.jpg" alt="One Page" />
											</div>
											<h3 class="content-box-title font-serif">One Page</h3>
										</a>
									</div>
								</div>
							</div>
						</section>

						<!-- 內容3 -->
						<div class="page-container">
							<div class="newest-list">
								<div class="newest-list-header">
									<div class="newest-list-header-icon">
										<svg viewbox="0 0 48 48">
											<path
												d="m23.95 42-14.5-7.95v-12L2 18 23.95 6 46 18v15.85h-3v-14.1l-4.55 2.3v12Zm0-15.4L39.7 18 23.95 9.55 8.3 18Zm0 12 11.5-6.35v-8.4L23.95 30l-11.5-6.25v8.5Zm.05-12Zm-.05 3.7Zm0 0Z" />
										</svg>
									</div>
									<h1>最新老師</h1>
									<div class="more-button">
										<a href="<c:url value='/_05_teacStu.searchAllTeac.controller/1'/>">更多</a>
									</div>
								</div>
								<div class="newest-list-body">
									<c:forEach var="bean" items="${teac}">
										<div class="newest-list-item">
											<a
												href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">
												<div class="teacher-profile">
													<img src="<c:url value='/_01_member.ShowPhoto.controller?${bean.member.memberID}' />"
														alt="">
												</div>
											</a>
											<div class="teacher-detail">
												<a
													href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">${bean.member.memName}老師
													#${bean.member.account}</a>
												<div>${bean.subjectItem}</div>
												<div>${bean.tutorExp}</div>
												<div>${bean.updateDate}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

						<!-- 內容3 -->
						<div class="page-container">
							<div class="newest-list">
								<div class="newest-list-header">
									<div class="newest-list-header-icon">
										<svg viewbox="0 0 48 48">
											<path
												d="m23.95 42-14.5-7.95v-12L2 18 23.95 6 46 18v15.85h-3v-14.1l-4.55 2.3v12Zm0-15.4L39.7 18 23.95 9.55 8.3 18Zm0 12 11.5-6.35v-8.4L23.95 30l-11.5-6.25v8.5Zm.05-12Zm-.05 3.7Zm0 0Z" />
										</svg>
									</div>
									<h1>最新老師</h1>
									<div class="more-button">
										<a href="<c:url value='/_05_teacStu.searchAllTeac.controller/1'/>">更多</a>
									</div>
								</div>
								<div class="newest-list-body">
									<c:forEach var="bean" items="${teac}">
										<div class="newest-list-item">
											<a
												href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">
												<div class="teacher-profile">
													<img src="<c:url value='/_01_member.ShowPhoto.controller?${bean.member.memberID}' />"
														alt="">
												</div>
											</a>
											<div class="teacher-detail">
												<a
													href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">${bean.member.memName}老師
													#${bean.member.account}</a>
												<div>${bean.subjectItem}</div>
												<div>${bean.tutorExp}</div>
												<div>${bean.updateDate}</div>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>

						<!-- 內容4 -->
						<div class="page-container">
							<div class="case-list">
								<div class="case-list-header">
									<div class="case-list-header-icon">
										<svg viewbox="0 0 48 48">
											<path
												d="m23.95 42-14.5-7.95v-12L2 18 23.95 6 46 18v15.85h-3v-14.1l-4.55 2.3v12Zm0-15.4L39.7 18 23.95 9.55 8.3 18Zm0 12 11.5-6.35v-8.4L23.95 30l-11.5-6.25v8.5Zm.05-12Zm-.05 3.7Zm0 0Z" />
										</svg>
									</div>
									<h1>最新案件</h1>
									<div class="more-button">
										<a href="<c:url value='/_05_teacStu.searchAllStud.controller/1'/>">更多</a>
									</div>
								</div>

								<div class="case-list-body">
									<!-- Migrant from Resume to Case list -->
									<div class="comment-table">
										<div class="comment-table-row header">
											<div class="comment-table-col">
												<div class="comment-table-col-content">更新日期</div>
											</div>
											<div class="comment-table-col">
												<div class="comment-table-col-content">需求科目</div>
											</div>
											<div class="comment-table-col">
												<div class="comment-table-col-content">需求對象</div>
											</div>
											<div class="comment-table-col">
												<div class="comment-table-col-content">需求地區</div>
											</div>
											<div class="comment-table-col">
												<div class="comment-table-col-content">案件薪資</div>
											</div>
										</div>
										<c:forEach var="bean" items="${stud}">
											<div class="comment-table-row"
												onclick="window.location='<c:url value='/_05_teacStu.studpostpageMain.controller?studno=${bean.studno}'/>'">
												<div class="comment-table-col">
													<div class="comment-table-col-content">
														${bean.updateDate}</div>
												</div>
												<div class="comment-table-col">
													<div class="comment-table-col-content">
														${bean.subjectItem}</div>
												</div>
												<div class="comment-table-col">
													<div class="comment-table-col-content">${bean.object}</div>
												</div>
												<div class="comment-table-col">
													<div class="comment-table-col-content">${bean.studLoc}</div>
												</div>
												<div class="comment-table-col">
													<div class="comment-table-col-content">${bean.price}</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</div>
						</div>

						<!-- Footer -->
						<!-- 引入共同的footerMVC -->
						<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
				</main>

				<!--  
    JavaScripts
    =============================================
    -->
				<!-- 引入共同的js -->
				<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />


				<!-- jQuery animateCss Extend -->
				<script>
					$.fn
						.extend({
							animateCss: function (animationName, callback) {
								var animationEnd = "webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend";
								this.addClass("animated " + animationName).one(
									animationEnd,
									function () {
										$(this).removeClass(
											"animated " + animationName);
										if (callback)
											callback();
									});
								return this;
							}
						});
				</script>
				<!-- #example動畫結束後執行此事件 -->
				<script>
					$("#example").animateCss("bounce", function () {
						$("#example").css("color", "red");
					});
				</script>
			</body>

			</html>