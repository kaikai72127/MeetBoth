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
		<div class="main"   style="background-color:#F0F0F0;">

			<form
				action="<c:url value='/insertCourse.controller' />"
				method="post" enctype="multipart/form-data">
				<section class="module" style="padding-bottom: 20px">
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
								<span class="amount">上傳商品照片</span> <input type="file"
									name="cPic" id="images5278" style="width: 80%"
									accept=".jpg,.png"> <img id="preImg"
									style="" src="#" />
							</div>
							<!-- 							圖片右邊BLOCK -->
							<div class="col-sm-6" style="margin-top: 68px; width: 58%">
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt" style="display: flex;">
											<span class="amount"
												style="font-size: 25px; text-align: center;">商品名稱:&ensp;</span>
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
												style="font-size: 25px; text-align: center;">商品類別:&ensp;</span>
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
												style="font-size: 25px; text-align: center;">商品價格:&ensp;</span>
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
											style="font-size: 25px; text-align: center; margin-left: 10px">商品介紹:&ensp;</span>
										<textarea class="form-control" id="directions"
											name="directions" placeholder="商品介紹"
											style="text-transform: none; resize: none; height: 425px; width: 100%; overflow-y: auto; font-size: 17px; color: black; border: 1px solid black; border-radius: 15px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<div class="col-sm-12" style="padding-right: 0px;">
							<input class="btn btn-d btn-circle" type="submit" value="新增商品"
								style="height: 60px; font-size: 25px; float: right;">
						</div>
					</div>
				</section>
			</form>

			<!-- 						中間BLOCK end-->
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