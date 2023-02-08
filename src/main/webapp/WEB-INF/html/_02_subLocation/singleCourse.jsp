<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->
<title>Titan | Multipurpose HTML5 Template</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="html/assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="html/assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="html/assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="html/assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="html/assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="html/assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="html/assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="html/assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="html/assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="html/assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="html/assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="html/assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="html/assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="html/assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link href="html/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="html/assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="html/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="html/assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="html/assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link
	href="html/assets/lib/owl.carousel/dist/html/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="html/assets/lib/owl.carousel/dist/html/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="html/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="html/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="html/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="html/assets/css/colors/default.css"
	rel="stylesheet">
<style>
.star-off {
	color: black;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<nav class="navbar navbar-custom navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button class="navbar-toggle" type="button" data-toggle="collapse"
						data-target="#custom-collapse">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="index.html">Titan</a>
				</div>
				<div class="collapse navbar-collapse" id="custom-collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Home</a>
							<ul class="dropdown-menu">
								<li><a href="index_mp_fullscreen_video_background.html">Default</a></li>
								<li><a href="index_op_fullscreen_gradient_overlay.html">One
										Page</a></li>
								<li><a href="index_agency.html">Agency</a></li>
								<li><a href="index_portfolio.html">Portfolio</a></li>
								<li><a href="index_restaurant.html">Restaurant</a></li>
								<li><a href="index_finance.html">Finance</a></li>
								<li><a href="index_landing.html">Landing Page</a></li>
								<li><a href="index_photography.html">Photography</a></li>
								<li><a href="index_shop.html">Shop</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Headers</a>
							<ul class="dropdown-menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Static Image Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_static.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_static.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Flexslider Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_flexslider.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_flexslider.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Video Background Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_video_background.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_video_background.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Text Rotator Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_text_rotator.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_text_rotator.html">Classic</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Gradient Overlay Header</a>
									<ul class="dropdown-menu">
										<li><a href="index_mp_fullscreen_gradient_overlay.html">Fulscreen</a></li>
										<li><a href="index_mp_classic_gradient_overlay.html">Classic</a></li>
									</ul></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Pages</a>
							<ul class="dropdown-menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">About</a>
									<ul class="dropdown-menu">
										<li><a href="about1.html">About 1</a></li>
										<li><a href="about2.html">About 2</a></li>
										<li><a href="about3.html">About 3</a></li>
										<li><a href="about4.html">About 4</a></li>
										<li><a href="about5.html">About 5</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Services</a>
									<ul class="dropdown-menu">
										<li><a href="service1.html">Service 1</a></li>
										<li><a href="service2.html">Service 2</a></li>
										<li><a href="service3.html">Service 3</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Pricing</a>
									<ul class="dropdown-menu">
										<li><a href="pricing1.html">Pricing 1</a></li>
										<li><a href="pricing2.html">Pricing 2</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Gallery</a>
									<ul class="dropdown-menu">
										<li><a href="gallery_col_2.html">2 Columns</a></li>
										<li><a href="gallery_col_3.html">3 Columns</a></li>
										<li><a href="gallery_col_4.html">4 Columns</a></li>
										<li><a href="gallery_col_6.html">6 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Contact</a>
									<ul class="dropdown-menu">
										<li><a href="contact1.html">Contact 1</a></li>
										<li><a href="contact2.html">Contact 2</a></li>
										<li><a href="contact3.html">Contact 3</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Restaurant menu</a>
									<ul class="dropdown-menu">
										<li><a href="restaurant_menu1.html">Menu 2 Columns</a></li>
										<li><a href="restaurant_menu2.html">Menu 3 Columns</a></li>
									</ul></li>
								<li><a href="login_register.html">Login / Register</a></li>
								<li><a href="faq.html">FAQ</a></li>
								<li><a href="404.html">Page 404</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Portfolio</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Boxed</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_boxed_col_2.html">2 Columns</a></li>
										<li><a href="portfolio_boxed_col_3.html">3 Columns</a></li>
										<li><a href="portfolio_boxed_col_4.html">4 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Boxed - Gutter</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_boxed_gutter_col_2.html">2
												Columns</a></li>
										<li><a href="portfolio_boxed_gutter_col_3.html">3
												Columns</a></li>
										<li><a href="portfolio_boxed_gutter_col_4.html">4
												Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Full Width</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_full_width_col_2.html">2
												Columns</a></li>
										<li><a href="portfolio_full_width_col_3.html">3
												Columns</a></li>
										<li><a href="portfolio_full_width_col_4.html">4
												Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Full Width - Gutter</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_full_width_gutter_col_2.html">2
												Columns</a></li>
										<li><a href="portfolio_full_width_gutter_col_3.html">3
												Columns</a></li>
										<li><a href="portfolio_full_width_gutter_col_4.html">4
												Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Masonry</a>
									<ul class="dropdown-menu">
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Boxed</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_masonry_boxed_col_2.html">2
														Columns</a></li>
												<li><a href="portfolio_masonry_boxed_col_3.html">3
														Columns</a></li>
												<li><a href="portfolio_masonry_boxed_col_4.html">4
														Columns</a></li>
											</ul></li>
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Full Width</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_masonry_full_width_col_2.html">2
														Columns</a></li>
												<li><a href="portfolio_masonry_full_width_col_3.html">3
														Columns</a></li>
												<li><a href="portfolio_masonry_full_width_col_4.html">4
														Columns</a></li>
											</ul></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Hover Style</a>
									<ul class="dropdown-menu">
										<li><a href="portfolio_hover_black.html">Black</a></li>
										<li><a href="portfolio_hover_gradient.html">Gradient</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Single</a>
									<ul class="dropdown-menu">
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Featured Image</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_single_featured_image1.html">Style
														1</a></li>
												<li><a href="portfolio_single_featured_image2.html">Style
														2</a></li>
											</ul></li>
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Featured Slider</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_single_featured_slider1.html">Style
														1</a></li>
												<li><a href="portfolio_single_featured_slider2.html">Style
														2</a></li>
											</ul></li>
										<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Featured Video</a>
											<ul class="dropdown-menu">
												<li><a href="portfolio_single_featured_video1.html">Style
														1</a></li>
												<li><a href="portfolio_single_featured_video2.html">Style
														2</a></li>
											</ul></li>
									</ul></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Blog</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Standard</a>
									<ul class="dropdown-menu">
										<li><a href="blog_standard_left_sidebar.html">Left
												Sidebar</a></li>
										<li><a href="blog_standard_right_sidebar.html">Right
												Sidebar</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Grid</a>
									<ul class="dropdown-menu">
										<li><a href="blog_grid_col_2.html">2 Columns</a></li>
										<li><a href="blog_grid_col_3.html">3 Columns</a></li>
										<li><a href="blog_grid_col_4.html">4 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Masonry</a>
									<ul class="dropdown-menu">
										<li><a href="blog_grid_masonry_col_2.html">2 Columns</a></li>
										<li><a href="blog_grid_masonry_col_3.html">3 Columns</a></li>
										<li><a href="blog_grid_masonry_col_4.html">4 Columns</a></li>
									</ul></li>
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Single</a>
									<ul class="dropdown-menu">
										<li><a href="blog_single_left_sidebar.html">Left
												Sidebar</a></li>
										<li><a href="blog_single_right_sidebar.html">Right
												Sidebar</a></li>
									</ul></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Features</a>
							<ul class="dropdown-menu" role="menu">
								<li><a href="alerts-and-wells.html"><i
										class="fa fa-bolt"></i> Alerts and Wells</a></li>
								<li><a href="buttons.html"><i class="fa fa-link fa-sm"></i>
										Buttons</a></li>
								<li><a href="tabs_and_accordions.html"><i
										class="fa fa-tasks"></i> Tabs &amp; Accordions</a></li>
								<li><a href="content_box.html"><i
										class="fa fa-list-alt"></i> Contents Box</a></li>
								<li><a href="forms.html"><i
										class="fa fa-check-square-o"></i> Forms</a></li>
								<li><a href="icons.html"><i class="fa fa-star"></i>
										Icons</a></li>
								<li><a href="progress-bars.html"><i
										class="fa fa-server"></i> Progress Bars</a></li>
								<li><a href="typography.html"><i class="fa fa-font"></i>
										Typography</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">Shop</a>
							<ul class="dropdown-menu" role="menu">
								<li class="dropdown"><a class="dropdown-toggle" href="#"
									data-toggle="dropdown">Product</a>
									<ul class="dropdown-menu">
										<li><a href="shop_product_col_3.html">3 columns</a></li>
										<li><a href="shop_product_col_4.html">4 columns</a></li>
									</ul></li>
								<li><a href="shop_single_product.html">Single Product</a></li>
								<li><a href="shop_checkout.html">Checkout</a></li>
							</ul></li>
						<li class="dropdown"><a class="dropdown-toggle"
							href="documentation.html" data-toggle="dropdown">Documentation</a>
							<ul class="dropdown-menu">
								<li><a href="documentation.html#contact">Contact Form</a></li>
								<li><a href="documentation.html#reservation">Reservation
										Form</a></li>
								<li><a href="documentation.html#mailchimp">Mailchimp</a></li>
								<li><a href="documentation.html#gmap">Google Map</a></li>
								<li><a href="documentation.html#plugin">Plugins</a></li>
								<li><a href="documentation.html#changelog">Changelog</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</nav>
		<div class="main" style="background-color: #F0F0F0;">
			<section class="module">
				<!--         forEach -->
				<c:forEach var="bean" items="${bean}">
					<!-- 			按鈕們 -->
					<div class="container" style="padding: 10px 10px 30px 30px;">
						<div class="row">
							<button class="btn btn-warning btn-circle" type="button"
								style="height: 43px; font-size: 19px;"
								onclick="window.location='/MeetBoth/searchAllCourse.controller'">
								<span class="icon-browser">&ensp;回到商品目錄</span>
							</button>
							&nbsp;
							<button class="btn btn-primary  btn-circle" type="button"
								style="height: 43px; font-size: 19px;"
								onclick="window.location='/MeetBoth/catchSingleCourseDate.controller?id=${bean.courseID}'">
								<span class=" icon-gears">&ensp;修改商品</span>
							</button>
							&nbsp;
							<button class="btn btn-danger btn-circle" type="button"
								id="deleteThisProduct" name="${bean.courseID}"
								style="height: 43px; font-size: 19px;">
								<span class="icon-recycle">&ensp;刪除商品</span>
							</button>
						</div>
					</div>
					<!-- 			按鈕們 -->
					<div class="container">
						<div class="row">
							<!-- 						圖片BLOCK -->
							<div class="col-sm-6 mb-sm-40">
								<img id="preImg" style="width: 445px; height: 600px"
									src="<c:url value='/showCoursePicture.controller?id=${bean.courseID}' />" />
							</div>
							<!-- 							圖片右邊BLOCK -->
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-12">
										<h1 class="product-title font-alt">${bean.courseName}</h1>
									</div>
								</div>
								<!-- 								星級評等 -->
								<div class="row mb-20">
									<div class="col-sm-12">
										<div>
											<c:forEach var="commbean" items="${commBean}">
												<input id="starAVG" type="hidden"
													value="${commbean.courseScore}" />
											</c:forEach>
											<div style="display: flex; float: left;">
												<div style="font-size: 18px;">商品評價:</div>
												<div id="starAVGDiv" style="font-size: 17px;"></div>
											</div>
										</div>
									</div>
								</div>
								<!-- 								星級評等end -->
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt">
											<span class="amount">NT$${bean.coursePrice}</span>
										</div>
									</div>
								</div>
								<!-- 								商品資訊 -->
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品編號 : ${bean.courseID}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品類別名稱 : ${bean.coursetype.courseClassName}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品上架日期 : ${bean.coursePost}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品上次資訊更新日期 : ${bean.courseUpdate}</h4>
										</div>
									</div>
								</div>
								<!-- 								商品資訊 -->
								<div class="row mb-20">
									<div class="col-sm-4 mb-sm-20">
										<input class="form-control input-lg" type="number"
											name="chooseAmount" id="amount" value="1"
											max="1" min="1" required="required"
											style="font-size: 25px; letter-spacing: 0px; border: 1px solid black; border-radius: 30px; text-align: center;" />
									</div>
									<div class="col-sm-8">
										<a class="btn btn-d btn-circle" href="#"
											style="height: 43px; font-size: 19px;">加入購物車</a>
									</div>
								</div>
								<!-- 								商品資訊 -->
							</div>
						</div>
						<!-- 						中間BLOCK -->
						<div class="row mt-70">
							<div class="col-sm-12">
								<ul class="nav nav-tabs font-alt" role="tablist">
									<li class="active"><a href="#description"
										data-toggle="tab" style="font-size: 17px;"><span
											class="icon-tools-2"></span>賣家訊息</a></li>
									<li><a href="#data-sheet" data-toggle="tab"
										style="font-size: 17px;"><span class="icon-tools-2"></span>商品簡介</a></li>
									<li><a href="#reviews" data-toggle="tab"
										style="font-size: 17px;"><span class="icon-tools-2"></span>商品頻論(commentAmount)</a></li>
								</ul>
								<div class="tab-content">
									<!-- 	賣家資訊 -->
									<div class="tab-pane active" id="description">
										<div style="display: flex;">
											<div class="shop-item-image"
												style="width: 200px; height: 250px;">
												<img src="html/assets/images/shop/product-12.jpg"
													alt="avatar" />
											</div>
											<div class="comment-content clearfix"
												style="margin-left: 10px; width: 70%;">
												<div class="comment-author font-alt">
													<h3>
														<a href="#">賣家暱稱</a>
													</h3>
													<p style="font-size: 20px;">賣家訊息1</p>
													<p style="font-size: 20px;">賣家訊息2</p>
													<p style="font-size: 20px;">賣家訊息3</p>
												</div>
											</div>
											<div style="margin-top: 170px;">
												<input class="btn btn-d btn-circle" type="button"
													value="前往賣家個人頁面"
													style="height: 43px; font-size: 19px; float: right;">
											</div>
										</div>
									</div>
									<!-- 	賣家資訊 end-->
									<!-- 											商品簡介 -->
									<div class="tab-pane" id="data-sheet">
										<div>
											<textarea id="prod_articel_body_directions"
												style="resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 17px; color: black;"
												readonly>${bean.courseDirections}</textarea>
										</div>
									</div>
									<!-- 										商品簡介 end -->
									<!-- 										商品評論 -->
									<div class="tab-pane" id="reviews">
										<div class="comments reviews">
											<!-- 										商品評論 forEach -->
											<div style="height: 650px; width: 100%; overflow-y: scroll;">
												<c:forEach var="commbean" items="${commBean}">
													<div class="comment clearfix">
														<div class="comment-avatar">
															<img src="html/assets/images/shop/product-12.jpg"
																alt="賣家圖片" />
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt" style="margin: 0;">
																<a href="#" style="font-size: 15px;">賣家暱稱</a>
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
											<!-- 										商品評論 forEach end-->
										</div>
										<hr>
										<!-- 										新增評論 -->
										<div class="comment-form mt-30">
											<h2 style="font-size: 23px;"
												class="comment-form-title font-alt">新增評論</h2>
											<form method="post"
												action="<c:url value='/InsertCourseComment.controller' />">
												<input type="hidden" name="id" value="${bean.courseID}" />
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
															<textarea class="form-control" id="" name="comm" rows="4"
																placeholder="留言" maxlength="50"
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
										<!-- 										商品評論 end -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--         forEach  end -->
				</c:forEach>
			</section>
			<hr class="divider-w">
			<!-- 			類似產品 -->
			<section class="module-small">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">相似熱門商品</h2>
						</div>
					</div>
					<div class="row multi-columns-row">
						<c:forEach var="prodLikeBean" items="${courseLikeBean}">
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="shop-item">
									<div class="shop-item-image"
										style="width: 265px; height: 375px; display: flex; justify-content: center; align-items: center;">
										<img
											src="<c:url value='/showCoursePicture.controller?id=${prodLikeBean.courseID}' />"
											alt="Cold Garb" />
										<div class="shop-item-detail">
											<a
												href="/MeetBoth/PathToCourseDetail.controller?id=${prodLikeBean.courseID}"
												class="btn btn-round btn-b"><span class="icon-heart">查看商品頁面</span><span
												class="icon-heart"></span></a>
										</div>
									</div>
									<h4 class="shop-item-title font-alt">
										<a href="#">${prodLikeBean.courseName}</a>
									</h4>
									NT$${prodLikeBean.coursePrice}
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<!-- 			類似產品 end-->

			<div class="module-small bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">About Titan</h5>
								<p>The languages only differ in their grammar, their
									pronunciation and their most common words.</p>
								<p>Phone: +1 234 567 89 10</p>
								Fax: +1 234 567 89 10
								<p>
									Email:<a href="#">somecompany@example.com</a>
								</p>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Recent Comments</h5>
								<ul class="icon-list">
									<li>Maria on <a href="#">Designer Desk Essentials</a></li>
									<li>John on <a href="#">Realistic Business Card Mockup</a></li>
									<li>Andy on <a href="#">Eco bag Mockup</a></li>
									<li>Jack on <a href="#">Bottle Mockup</a></li>
									<li>Mark on <a href="#">Our trip to the Alps</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Blog Categories</h5>
								<ul class="icon-list">
									<li><a href="#">Photography - 7</a></li>
									<li><a href="#">Web Design - 3</a></li>
									<li><a href="#">Illustration - 12</a></li>
									<li><a href="#">Marketing - 1</a></li>
									<li><a href="#">Wordpress - 16</a></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-3">
							<div class="widget">
								<h5 class="widget-title font-alt">Popular Posts</h5>
								<ul class="widget-posts">
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="html/assets/images/rp-1.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Designer Desk Essentials</a>
											</div>
											<div class="widget-posts-meta">23 january</div>
										</div>
									</li>
									<li class="clearfix">
										<div class="widget-posts-image">
											<a href="#"><img src="html/assets/images/rp-2.jpg"
												alt="Post Thumbnail" /></a>
										</div>
										<div class="widget-posts-body">
											<div class="widget-posts-title">
												<a href="#">Realistic Business Card Mockup</a>
											</div>
											<div class="widget-posts-meta">15 February</div>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
			<hr class="divider-d">
			<footer class="footer bg-dark">
				<div class="container">
					<div class="row">
						<div class="col-sm-6">
							<p class="copyright font-alt">
								&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights
								Reserved
							</p>
						</div>
						<div class="col-sm-6">
							<div class="footer-social-links">
								<a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i
									class="fa fa-twitter"></i></a><a href="#"><i
									class="fa fa-dribbble"></i></a><a href="#"><i
									class="fa fa-skype"></i></a>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<div class="scroll-up">
			<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="html/assets/lib/jquery/dist/jquery.js"></script>
	<script src="html/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="html/assets/lib/wow/dist/wow.js"></script>
	<script
		src="html/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="html/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="html/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="html/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="html/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="html/assets/lib/smoothscroll.js"></script>
	<script
		src="html/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="html/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="html/assets/js/plugins.js"></script>
	<script src="html/assets/js/main.js"></script>
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
			stars += '&nbsp;('+ score.length +'則評論)'
			document.getElementById("starAVGDiv").innerHTML = stars;
		});
	</script>
	<script>
	
        $(function(){
        	$('#deleteThisProduct').click(function(){
                let id=$(this).attr("name");
                Swal.fire({
                  title: '你確定要刪除嗎?',
                  text: "將無法恢復此筆訂單!!!",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 這幾種選項
                  showCancelButton: true,
                  confirmButtonColor: '#f7d966',
                  cancelButtonColor: '#3d3b39',
                  cancelButtonText: '取消',
                  confirmButtonText: '確定刪除'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                          //專案名稱+servlet
                         url:'/MeetBoth/deleteCourseById.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/searchAllCourse.controller'
                                console.log("delete")
                             })//done
                             .fail(function(error) {
                                 console.log(error)
                             })//fail end
                    }//if
                  })//then

              })//click end
        });
        //function end
    </script>
	<script>
		function calToCost(price,invt){
			var amount = document.getElementById("amount").value;
			if(amount>invt){
				alert("訂購數量超過庫存")
				document.getElementById("amount").value = invt;
				amount = invt;
			}else if(amount < 0){
				alert("訂購數量不得為負值")
				document.getElementById("amount").value = 0;
				amount=0;
			}
			var cost = amount*price; 
			document.getElementById("Cost").value = cost;
		}
	</script>
</body>
</html>