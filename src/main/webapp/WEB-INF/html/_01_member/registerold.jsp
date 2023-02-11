<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
		<%@ include file="js/myjs.jsp" %>
			<% String path=request.getContextPath(); String basePathimg2=request.getScheme() + "://" +
				request.getServerName() + ":" + request.getServerPort() + path + "/html/images/meatball-200.png" ; %>
				<% String path2=request.getContextPath(); String basePath=request.getScheme() + "://" +
					request.getServerName() + ":" + request.getServerPort() + path2 + "/html/assets/css/main.css" ; %>
					<!DOCTYPE html>
					<html lang="en">

					<head>
						<title>會員管理</title>
						<meta charset="utf-8" />
						<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
						<link rel="stylesheet" href="<%=basePath%>" />

						<script src="https://kit.fontawesome.com/2688683da7.js" crossorigin="anonymous"></script>
					</head>

					<body class="is-preload">

						<!-- Wrapper -->
						<div id="wrapper">

							<!-- Main -->
							<div id="main">
								<div class="inner">

									<!-- Header -->
									<header id="header">
										<a href="register.jsp" class="logo"><strong>會員註冊</strong></a>
										<!-- 							<ul class="icons"> -->
										<!-- 								<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a> -->
										<!-- 								</li> -->
										<!-- 								<li><a href="#" class="icon brands fa-facebook-f"><span -->
										<!-- 											class="label">Facebook</span></a></li> -->
										<!-- 								<li><a href="#" class="icon brands fa-snapchat-ghost"><span -->
										<!-- 											class="label">Snapchat</span></a> -->
										<!-- 								</li> -->
										<!-- 								<li><a href="#" class="icon brands fa-instagram"><span -->
										<!-- 											class="label">Instagram</span></a></li> -->
										<!-- 								<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a> -->
										<!-- 								</li> -->
										<!-- 							</ul> -->
									</header>

									<!-- Content -->
									<section>
										<header class="main">

											<form action="_01_member.add.controller" method="POST"
												enctype="multipart/form-data">

												<div class="table-wrapper">
													<table class="alt">
														<tr>
															<td style="width: 150px;"><label>帳號：</label></td>
															<td><input type="text" placeholder="請輸入帳號" name="account"
																	value="${param.account}" required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>密碼：</label></td>
															<td><input type="password" onblur="pasvalid()"
																	placeholder="請輸入6 - 12位密碼，且須包含英文大寫、小寫、數字、特殊符號。"
																	id="pas1check" name="password"
																	value="${param.password}" required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>確認密碼：</label></td>
															<td><input type="password" placeholder="請再輸入一次。"
																	id="pas2check" onblur="checkpwd()"
																	name="passwordcheck" value="${param.passwordcheck}"
																	required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>身分證字號：</label></td>
															<td><input type="text" placeholder="請輸入中華民國身分證字號"
																	id="idNumber" name="idNumber" onblur="checkID()"
																	value="${param.idNumber}" required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>姓名：</label></td>
															<td><input type="text" placeholder="請輸入真實姓名" name="memName"
																	value="${param.memname}" required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>暱稱：</label></td>
															<td><input type="text" placeholder="請輸入暱稱"
																	name="memNickName" value="${param.memNickname}">
															</td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>年齡：</label></td>
															<td><input type="text" name="memOld"
																	oninput="value=value.replace(/[^\d]/g,'')"
																	value="${param.memOld}"></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>生日：</label></td>
															<td><input type="Date" name="memBirth"
																	value="${param.memBirth}" required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>性別：</label></td>
															<td><select name="memGender" style="width: 150px;" required>
																	<option value="">請選擇</option>
																	<option value="男">男</option>
																	<option value="女">女</option>
																</select></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>電子郵件：</label></td>
															<td><input type="text" name="eMail" id="mail"
																	onblur="checkmail()" value="${param.email}"
																	required>
															</td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>手機：</label></td>
															<td><input type="text" name="phone"
																	oninput="value=value.replace(/[^\d]/g,'')"
																	value="${param.phone}" required></td>
														</tr>
														<tr>
															<td style="width: 150px;"><label>地址：</label></td>
															<td><input type="text" name="address"
																	value="${param.address}" required></td>
														</tr>
														<tr>
															<td><label class="fontSize">照片：</label><br>&nbsp;</td>
															<td><input name='photofile' id="images5278" type='file'
																	accept="image/jpg"
																	placeholder="請使用jpg檔案">請使用jpg檔案<br>&nbsp;
																<img id="preImg" style="width: 150px; height: 200px"
																	src="<%=basePathimg2%>" />
															</td>
														</tr>
														<tr height="42">
															<td colspan='4'>
																<div align="center">
																	<input type="submit" name="submit" id="submit"
																		value="儲存" />
																	<input type="reset" name="cancel" id="cancel"
																		value="重填">
																</div>
															</td>
														</tr>
													</table>
											</form>
								</div>
								</header>

								<!-- 					<span class="image main"><img src="images/pic11.jpg" alt="" /></span> -->


								</section>

							</div>
						</div>

						<!-- Sidebar -->
						<div id="sidebar">
							<div class="inner">

								<!-- Search -->
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="Search" />
									</form>
								</section>

								<!-- Menu -->
								<nav id="menu">
									<header class="major">
										<h2>
											<img src="<%=basePathimg2%>" alt="" />
										</h2>
									</header>

									<ul>
										<li><a href="<c:url value='/index.controller' />">首頁 <i
													class="fa-solid fa-house"></i></a></li>
										<li><a href="<c:url value='/backIndex.controller' />">後台管理
												<i class="fa-solid fa-gears"></i>
											</a></li>
										<li><a href="<c:url value='/_01_member.admin.controller' />">會員資料 <i
													class="fa-solid fa-users-viewfinder"></i></a></li>
										<li><span class="opener">科目地區資料 <i
													class="fa-solid fa-magnifying-glass-location"></i></span>
											<ul>
												<li><a
														href="<c:url value='/_02_subLocation.SelectAllSub.controller' />">科目搜尋</a>
												<li><a
														href="<c:url value='/_02_subLocation.SelectAllLoc.controller' />">地點搜尋</a>
											</ul>
										</li>
										<li><a href="<c:url value='/_03_product.searchAllProduct.controller'/>">商品資料
												<i class="fa-solid fa-store"></i>
											</a></li>
										<li><a href="<c:url value='/_04_shoppingCart.SelectAll.controller' />">訂單資料
												<i class="fa-solid fa-cart-shopping"></i>
											</a></li>
										<li><span class="opener">老師學生資料 <i class="fa-solid fa-users"></i></span>
											<ul>
												<li><a
														href="<c:url value='/_05_teacStu.searchAllTeac.controller' />">老師貼文資料</a>
												</li>
												<li><a
														href="<c:url value='/_05_teacStu.searchAllStud.controller' />">學生貼文資料</a>
												</li>
											</ul>
										</li>
										<li><span class="opener">哈拉區 <i class="fa-solid fa-comments"></i></span>
											<ul>
												<li><a
														href="<c:url value='/_06_halaAndQa.SelectAllHala.controller' />">討論公告區</a>
												</li>
												<li><a
														href="<c:url value='/_06_halaAndQa.SelectAllQa.controller' />">Q&A解答區</a>
												</li>
											</ul>
										</li>
									</ul>
								</nav>

								<!-- 					Section -->
								<!-- 					<section> -->
								<!-- 						<header class="major"> -->
								<!-- 							<h2>Ante interdum</h2> -->
								<!-- 						</header> -->
								<!-- 						<div class="mini-posts"> -->
								<!-- 							<article> -->
								<!-- 								<a href="#" class="image"><img src="images/pic07.jpg" alt="" /></a> -->
								<!-- 								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p> -->
								<!-- 							</article> -->
								<!-- 							<article> -->
								<!-- 								<a href="#" class="image"><img src="images/pic08.jpg" alt="" /></a> -->
								<!-- 								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p> -->
								<!-- 							</article> -->
								<!-- 							<article> -->
								<!-- 								<a href="#" class="image"><img src="images/pic09.jpg" alt="" /></a> -->
								<!-- 								<p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p> -->
								<!-- 							</article> -->
								<!-- 						</div> -->
								<!-- 						<ul class="actions"> -->
								<!-- 							<li><a href="#" class="button">More</a></li> -->
								<!-- 						</ul> -->
								<!-- 					</section> -->

								<!-- 					Section -->
								<!-- 					<section> -->
								<!-- 						<header class="major"> -->
								<!-- 							<h2>Get in touch</h2> -->
								<!-- 						</header> -->
								<!-- 						<p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim -->
								<!-- 							lorem -->
								<!-- 							ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat -->
								<!-- 							tempus aliquam.</p> -->
								<!-- 						<ul class="contact"> -->
								<!-- 							<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a></li> -->
								<!-- 							<li class="icon solid fa-phone">(000) 000-0000</li> -->
								<!-- 							<li class="icon solid fa-home">1234 Somewhere Road #8254<br /> -->
								<!-- 								Nashville, TN 00000-0000</li> -->
								<!-- 						</ul> -->
								<!-- 					</section> -->

								<!-- 					Footer -->
								<!-- 					<footer id="footer"> -->
								<!-- 						<p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a -->
								<!-- 								href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 -->
								<!-- 								UP</a>.</p> -->
								<!-- 					</footer> -->

								<!-- 				</div> -->
								<!-- 			</div> -->

							</div>

							<!-- Scripts -->
							<% String basePath1=request.getScheme() + "://" + request.getServerName() + ":" +
								request.getServerPort() + path + "/html/assets/js/jquery.min.js" ; %>

								<% String basePath2=request.getScheme() + "://" + request.getServerName() + ":" +
									request.getServerPort() + path + "/html/assets/js/browser.min.js" ; %>

									<% String basePath3=request.getScheme() + "://" + request.getServerName() + ":" +
										request.getServerPort() + path + "/html/assets/js/breakpoints.min.js" ; %>

										<% String basePath4=request.getScheme() + "://" + request.getServerName() + ":"
											+ request.getServerPort() + path + "/html/assets/js/util.js" ; %>

											<% String basePath5=request.getScheme() + "://" + request.getServerName()
												+ ":" + request.getServerPort() + path + "/html/assets/js/main.js" ; %>
												<script src=<%=basePath1%>></script>
												<script src=<%=basePath2%>></script>
												<script src=<%=basePath3%>></script>
												<script src=<%=basePath4%>></script>
												<script src=<%=basePath5%>></script>
												<script src="https://kit.fontawesome.com/25590258af.js"
													crossorigin="anonymous"></script>
												<script>
														$("#images5278").change(function () {
															readURL(this);
														});

													function readURL(input) {
														if (input.files && input.files[0]) {
															var reader = new FileReader();
															reader.onload = function (e) {
																$("#preImg").attr('src', e.target.result);
															}
															reader.readAsDataURL(input.files[0]);
														}
													}
												</script>
					</body>

					</html>