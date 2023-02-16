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

					.work-item.illustration.webdesign {
						height: 175px;
						padding: 0 15px 15px 0;
					}

					.work-title {
						font-size: 25px;
					}

					.col-lg-3 {
						width: 22%;
					}

#wrapperPhoto {
	width: 50%;
}
/* 放大圖片使用 */
.image-modal {
	display: none;
	position: fixed;
	z-index: 999;
	top: 15%;
	left: 15%;
	width: 80%;
	height: 80%;
	background-color: rgba(0, 0, 0, 0.0);
}
/* 放大圖片使用 */

/* 閃爍的折扣碼 */
.blink {
  animation: blink-animation 2s ease-in-out infinite;
}

@keyframes blink-animation {
  0% {
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    opacity: 0;
  }
}
/* 閃爍的折扣碼 */
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
						肉丸家教網歡迎您的加入 點擊<a href="/MeetBoth/login/page">註冊</a> ꉂꉂ꒰•̤▿•̤*ૢ꒱
					</marquee>
					<!-- 內容 1-->
					<div style="display: flex; justify-content: center">
						<div id="team5"
							style="width: 80%; margin-bottom: 30px; display: flex; justify-content: space-between; align-items: center;">
							<div
								style="width: 20%; height: 100%; display: flex; flex-direction: column; justify-content: space-between;">
								<a class="image-link" href="html/assets/images/shop/sport.gif"><img
										style="box-shadow: 4px 4px 5px rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 3px;"
										src="html/assets/images/shop/sport.gif" alt="Title of Image" /> </a>
								<a class="image-link" href="html/assets/images/shop/lulu.jpg"><img class="image-link"
										style="box-shadow: 4px 4px 5px rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 3px;"
										src="html/assets/images/shop/lulu.jpg" alt="Title of Image" /></a>
							</div>
							<div>
								<img style="width: 160%; box-shadow: 4px 4px 5px rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 3px;"
									src="html/assets/images/shop/team5.gif" alt="Title of Image" />
							</div>
							<div
								style="width: 20%; height: 100%; display: flex; flex-direction: column; justify-content: space-between;">
								<a class="image-link" href="html/assets/images/shop/wewe.jpg"><img class="image-link"
										style="box-shadow: 4px 4px 5px rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 3px;"
										src="html/assets/images/shop/wewe.jpg" alt="Title of Image" /></a> <a
									class="image-link" href="html/assets/images/shop/birthday.gif"><img
										class="image-link"
										style="box-shadow: 4px 4px 5px rgba(0, 0, 0, 0.5); border-radius: 10px; padding: 3px;"
										src="html/assets/images/shop/birthday.gif" alt="Title of Image" /></a>
							</div>

						</div>

		</div>
		<!-- 		折扣碼 ----跑馬燈 -->
		<div style="display: flex; justify-content: center;">
			<c:if test="${not empty discount}">
				<div>
					<div style="font-size: 25px;height: 80px;line-height: 80px;">
						(*ฅ•ᗜ•*)　　立即輸入 <span class="blink" style="color:#ce7777;font-size:30px;font-weight:800">${discount.discountNo}</span>
						折扣碼 即可於商城使用優惠券<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnTKPkclYtpbwvXZSgvGMNDS0JtjyPKBRKFQ&usqp=CAU" width="50px"
					height="50px"> <span class="blink" style="color:#ce7777;font-size:30px;font-weight:800">${discount.discountDesc}</span>　　(*•ᗜ•ฅ*)
					</div>
				</div>
			</c:if>
			<c:if test="${empty discount}">
				<img src="https://i.imgur.com/53AabEX.png" width="48px"
					height="48px">
				<span style="font-size: 22px; margin-left: 20px; margin-right: 20px">
					目前沒有折扣碼 敬請期待小編灑 優 惠 劵 （♡╹ω╹♡）ﾉ”♡</span>
				<img src="https://i.imgur.com/53AabEX.png" width="48px"
					height="48px">

			</c:if>
		</div>
		<!-- 		折扣碼 ----跑馬燈 -->


					<!-- 內容 2-->


					<!-- 			熱門商品 -->
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
												<img src="<c:url value='/_01_member.ShowPhoto.controller?account=${bean.member.account}' />"
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
					<!-- 內容5 -->
					<!-- 			熱門商品 -->
					<section class="module-small" style="padding-top: 0px; padding-bottom: 0px;">
						<div class="container">

							<div class="row multi-columns-row" style="padding-bottom: 35px;">
								<div class="row">
									<div class="col-sm-12" style="">
										<img src="/MeetBoth/html/assets/images/shop/熱門商品橫幅.jpg" alt="Title of Image" />
									</div>
								</div>
							</div>
							<div class="row multi-columns-row">
								<c:forEach var="HotBean" items="${Hotprodlist}">
									<div class="col-sm-6 col-md-3 col-lg-3"
										style="padding-bottom: 30px; display: flex;">
										<div class="works-grid works-grid-4 works-hover-w" id=""
											style="text-align: center;">
											<div class="work-item illustration webdesign" id="typeBlock"
												style="height: 30rem; width: 100%;">
												<a
													href="/MeetBoth/_03_product.PathToProductDetail.controller?id=${HotBean.prodID}">
													<span class="work-image"
														style="width: 100%; height: 100%; margin: auto; display: flex; justify-content: center; align-items: center; margin-right: 15px; text-align: center;">
														<img style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
															src="<c:url value='/_03_product.showPicture.controller?id=${HotBean.prodID}' />"
															alt="Portfolio Item" /> <span class="work-caption font-alt">
															<span class="work-title"><img style=""
																	src="/MeetBoth/html/assets/images/shop/seesee.png"
																	alt="Portfolio Item" /></span>
														</span>
													</span>
												</a>
											</div>
											<div id="prodName" style="padding-top: 30px;">
												<strong style="font-size: 16px">${HotBean.prodName}</strong>
											</div>
											<div id="prodCheck">
												<strong
													style="font-size: 16px">瀏覽次數:&ensp;${HotBean.prodCheck}次</strong>
											</div>
											<div id="scoreAVG">
												<c:forEach var="commentBean" items="${HotBean.productComment}">
													<input type="hidden" id="starAVG" value="${commentBean.prodScore}">
												</c:forEach>
												<div id="starAVGDiv" style="font-size: 17px;"></div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</section>

					<!-- 內容5 -->
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
				<script>
					function roundToTwo(num) {
						return +(Math.round(num + "e+2") + "e-2");
					}

					const score = document.querySelectorAll("#starAVG");

					document
						.addEventListener(
							"DOMContentLoaded",
							function () {
								const scores = document
									.querySelectorAll("#scoreAVG");
								for (let i = 0; i < scores.length; i++) {
									const score = scores[i];
									const starAVGs = score
										.querySelectorAll("#starAVG");
									let totalScore = 0;
									for (let j = 0; j < starAVGs.length; j++) {
										const starNum = starAVGs[j].value;
										totalScore += Number(starNum);
									}
									let avgScore = roundToTwo(totalScore
										/ starAVGs.length);
									let stars = '';
									if (isNaN(avgScore)) {
										stars = '&nbsp;(0)';
									} else {
										stars = '&nbsp;(' + avgScore + ')';
									}
									let onstar = '<span><i class="fa fa-star star"></i></span>';
									let offstar = '<span><i class="fa fa-star star-off"></i></span>';
									for (var k = 0; k < 5; k++) {
										if (k < avgScore) {
											stars += onstar;
										} else {
											stars += offstar;
										}
									}
									stars += '&nbsp;(' + starAVGs.length + '則評論)'
									score.querySelector("#starAVGDiv").innerHTML = stars;
								}
							});
				</script>
				<script>
					var links = document.querySelectorAll('.image-link');
					for (var i = 0; i < links.length; i++) {
						links[i].addEventListener('click', function (event) {
							event.preventDefault();
							var imageUrl = this.getAttribute('href');
							var image = new Image();
							image.src = imageUrl;
							image.onload = function () {
								var modal = document.createElement('div');
								modal.className = 'image-modal';
								modal.appendChild(image);
								document.body.appendChild(modal);
								modal.addEventListener('click', function () {
									modal.remove();
								});
								modal.style.display = 'flex';
							};
						});
					}
				</script>

			</body>

			</html>