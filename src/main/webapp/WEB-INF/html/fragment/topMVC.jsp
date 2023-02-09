<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<% String path=request.getContextPath(); String baseMeetboth96x96=request.getScheme() + "://" +
			request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/images/meatball/meatball-96x96-New.png" ; System.out.println(baseMeetboth96x96); %>
			<script>
				$(function () {
					$.ajax({
						type: 'POST',
						url: 'http://localhost:8080/MeetBoth/_01_member.checklog.controller',
						contentType: 'application/json',

						success: function (user) {

							if (user == "" || user == "anonymousUser") {
								console.log(user + "登入");
								$("#loginBtn").show();
								$("#logoutBtn").hide();
								$("#animation").show();
							} else {
								console.log(user + "登出");
								$("#loginBtn").hide();
								$("#logoutBtn").show();
								$("#animation").hide();
								$("#username").text("你好，" + user)
							}
						}
					});
				});
				$(function () {
					$.ajax({
						type: 'POST',
						url: 'http://localhost:8080/MeetBoth/_01_member.rolecheck.controller',
						contentType: 'application/json',
						success: function (role) {
							if (role == "admin") {
								console.log(role + "管理員");

								//管理員要執行的動作
								$("admincontroller").show();
								//這裡是ID標籤

							} else {
								console.log(role + "用戶");
								//使用者要執行的動作
								$("#admincontroller").hide();
							}
						}
					});
				});
			</script>
			<!-- header -->
			<nav class="navbar navbar-custom navbar-fixed-top headershadow" role="navigation">
				<div class="container-nav">
					<!--Navbar橫幅 -->
					<div class="navbar-header">
						<button class="navbar-toggle" type="button" data-toggle="collapse"
							data-target="#custom-collapse">
							<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
								class="icon-bar"></span><span class="icon-bar"></span>
						</button>
						<img src="<%=baseMeetboth96x96%>" style="float: left" />
						<a class="navbar-brand" href="<c:url value='/index.controller' />"> 肉丸家教網</a>
						<!-- <a class="navbar-brand" href="index.html">肉丸家教網-MEET BOTH</a> -->
					</div>

					<div class="collapse navbar-collapse" id="custom-collapse">
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<!--Navbar橫幅 搜尋教師 --> <a class="dropdown-toggle" href="#"
									data-toggle="dropdown">MeetBoth</a>
								<ul class="dropdown-menu">
									<li><a href="index_mp_fullscreen_video_background.html">Default</a>
									</li>
								</ul>
							</li>

							<!--Navbar橫幅 隨堂測驗 -->
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">隨堂測驗</a>
								<ul class="dropdown-menu">
									<li><a href="#" data-toggle="dropdown">會員資料數據</a></li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">會員管理</a>
										<ul class="dropdown-menu">
											<li><a href="index_mp_fullscreen_flexslider.html">會員查詢</a>
											</li>
											<li><a href="index_mp_classic_flexslider.html">會員新增</a></li>
										</ul>
									</li>
								</ul>
							</li>

							<!--Navbar橫幅 Shop -->
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">地圖搜尋</a>
								<ul class="dropdown-menu" role="menu">
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Product</a>
										<ul class="dropdown-menu">
											<li><a href="shop_product_col_3.html">3 columns</a></li>
											<li><a href="shop_product_col_4.html">4 columns</a></li>
										</ul>
									</li>
									<li><a href="shop_single_product.html">Single Product</a></li>
									<li><a href="shop_checkout.html">Checkout</a></li>
								</ul>
							</li>

							<!--Navbar橫幅 Pages -->
							<!-- <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown"
                  >科目與地區</a
                >
                <ul class="dropdown-menu">
                  <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown"
                      >科目搜尋管理</a
                    >
                    <ul class="dropdown-menu">
                      <li><a href="about1.html">英文</a></li>
                      <li><a href="about2.html">數學</a></li>
                      <li><a href="about3.html">理化</a></li>
                      <li><a href="about4.html">音樂</a></li>
                      <li><a href="about5.html">美術</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown"
                      >地區搜尋管理</a
                    >
                    <ul class="dropdown-menu">
                      <li><a href="service1.html">北部</a></li>
                      <li><a href="service2.html">中部</a></li>
                      <li><a href="service3.html">南部</a></li>
                      <li><a href="#">東部</a></li>
                      <li><a href="#">離島</a></li>
                      <li><a href="#">海外</a></li>
                    </ul>
                  </li>
                </ul>
              </li> -->

							<!--Navbar橫幅 Prorfolio -->
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">買賣專區</a>
								<ul class="dropdown-menu" role="menu">
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Boxed</a>
										<ul class="dropdown-menu">
											<li><a href="portfolio_boxed_col_2.html">2 Columns</a></li>
											<li><a href="portfolio_boxed_col_3.html">3 Columns</a></li>
											<li><a href="portfolio_boxed_col_4.html">4 Columns</a></li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Boxed - Gutter</a>
										<ul class="dropdown-menu">
											<li><a href="portfolio_boxed_gutter_col_2.html">2
													Columns</a></li>
											<li><a href="portfolio_boxed_gutter_col_3.html">3
													Columns</a></li>
											<li><a href="portfolio_boxed_gutter_col_4.html">4
													Columns</a></li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Full
											Width</a>
										<ul class="dropdown-menu">
											<li><a href="portfolio_full_width_col_2.html">2 Columns</a>
											</li>
											<li><a href="portfolio_full_width_col_3.html">3 Columns</a>
											</li>
											<li><a href="portfolio_full_width_col_4.html">4 Columns</a>
											</li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">Full
											Width -
											Gutter</a>
										<ul class="dropdown-menu">
											<li><a href="portfolio_full_width_gutter_col_2.html">2
													Columns</a></li>
											<li><a href="portfolio_full_width_gutter_col_3.html">3
													Columns</a></li>
											<li><a href="portfolio_full_width_gutter_col_4.html">4
													Columns</a></li>
										</ul>
									</li>
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
												</ul>
											</li>
											<li class="dropdown"><a class="dropdown-toggle" href="#"
													data-toggle="dropdown">Full Width</a>
												<ul class="dropdown-menu">
													<li><a href="portfolio_masonry_full_width_col_2.html">2
															Columns</a></li>
													<li><a href="portfolio_masonry_full_width_col_3.html">3
															Columns</a></li>
													<li><a href="portfolio_masonry_full_width_col_4.html">4
															Columns</a></li>
												</ul>
											</li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Hover Style</a>
										<ul class="dropdown-menu">
											<li><a href="portfolio_hover_black.html">Black</a></li>
											<li><a href="portfolio_hover_gradient.html">Gradient</a></li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Single</a>
										<ul class="dropdown-menu">
											<li class="dropdown"><a class="dropdown-toggle" href="#"
													data-toggle="dropdown">Featured
													Image</a>
												<ul class="dropdown-menu">
													<li><a href="portfolio_single_featured_image1.html">Style
															1</a></li>
													<li><a href="portfolio_single_featured_image2.html">Style
															2</a></li>
												</ul>
											</li>
											<li class="dropdown"><a class="dropdown-toggle" href="#"
													data-toggle="dropdown">Featured
													Slider</a>
												<ul class="dropdown-menu">
													<li><a href="portfolio_single_featured_slider1.html">Style
															1</a></li>
													<li><a href="portfolio_single_featured_slider2.html">Style
															2</a></li>
												</ul>
											</li>
											<li class="dropdown"><a class="dropdown-toggle" href="#"
													data-toggle="dropdown">Featured
													Video</a>
												<ul class="dropdown-menu">
													<li><a href="portfolio_single_featured_video1.html">Style
															1</a></li>
													<li><a href="portfolio_single_featured_video2.html">Style
															2</a></li>
												</ul>
											</li>
										</ul>
									</li>
								</ul>
							</li>

							<!--Navbar橫幅 Blog -->
							<li class="dropdown"><a class="dropdown-toggle" href="#" data-toggle="dropdown">哈拉討論區</a>
								<ul class="dropdown-menu" role="menu">
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">隨便聊聊</a>
										<ul class="dropdown-menu">
											<li><a href="blog_standard_left_sidebar.html">Left
													Sidebar</a></li>
											<li><a href="blog_standard_right_sidebar.html">Right
													Sidebar</a></li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">我有問題</a>
										<ul class="dropdown-menu">
											<li><a href="blog_grid_col_2.html">2 Columns</a></li>
											<li><a href="blog_grid_col_3.html">3 Columns</a></li>
											<li><a href="blog_grid_col_4.html">4 Columns</a></li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Masonry</a>
										<ul class="dropdown-menu">
											<li><a href="blog_grid_masonry_col_2.html">2 Columns</a></li>
											<li><a href="blog_grid_masonry_col_3.html">3 Columns</a></li>
											<li><a href="blog_grid_masonry_col_4.html">4 Columns</a></li>
										</ul>
									</li>
									<li class="dropdown"><a class="dropdown-toggle" href="#"
											data-toggle="dropdown">Single</a>
										<ul class="dropdown-menu">
											<li><a href="blog_single_left_sidebar.html">Left
													Sidebar</a></li>
											<li><a href="blog_single_right_sidebar.html">Right
													Sidebar</a></li>
										</ul>
									</li>
								</ul>
							</li>

							<!-- <li>
                 我的最愛 
                <a href="" class="btn border">
                  <i class="fas fa-heart text-primary"></i>
                  <span class="badge">0</span>
                </a>
              </li> -->
							<li>
								<!-- 購物車 --> <a href="index-shopcheckout.html" class="btn border">
									<i class="fas fa-shopping-cart text-primary"></i> <span class="badge">0</span>
								</a>
							</li>

							<!--Navbar橫幅 Login會員登入 -->
							<li id="loginBtn" class="nav-item dropdown"><a
									href="<%=request.getContextPath()%>/login/page" class="nav-link dropdown-toggle"
									data-bs-toggle="dropdown">
									<img class="rounded-circle me-lg-2"
										src="html/assets/images/meatball/meatball-32x32.png" alt=""
										style="width: 24px; height: 24px" /> <span class="d-none d-lg-inline-flex">登入<i
											class="fa-solid fa-right-to-bracket"></i>
							<li id="logoutBtn" class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle"
									data-bs-toggle="dropdown">
									<img class="rounded-circle me-lg-2"
										src="<c:url value='/_01_member.ShowPhoto.controller?account=${pageContext.request.userPrincipal.name}'/>"
										alt="" style="width: 24px; height: 24px" /> <span id="username"
										class="d-none d-lg-inline-flex"><i class="fa-solid fa-right-to-bracket"></i>
									</span>
								</a>
								<ul
									class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
									<li><a href="#" class="dropdown-item">會員中心<i class="fa-solid fa-user"></i></a>
									</li>
									<li id="admincontroller"><a href="<%=request.getContextPath()%>/backIndex"
											class="dropdown-item">管理員控制台
											<i class="fa-solid fa-screwdriver-wrench"></i>
										</a></li>
									<li><a href="<%=request.getContextPath()%>/logout" class="dropdown-item">Log
											Out <i class="fa-solid fa-right-from-bracket"></i> </i>
										</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</div>
			</nav>