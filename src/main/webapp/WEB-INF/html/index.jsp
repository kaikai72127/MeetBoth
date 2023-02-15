<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


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

//
/* div樣式 框框 */
.wrapPhoto {
	width: 800px;
	height: 400px;
	background-color: black;
	margin: 0 auto;
	position: relative;
	/* 溢出內容 */
	overflow: hidden;
}
/* ul樣式 */
.slide-imgs {
	position: absolute;
	margin: 0;
	padding: 0;
	left: 0;
	list-style: none;
	width: 4000px;
	/* 彈性 並排 */
	display: flex;
	/* left: -1600px; */
}

.slide-imgs li {
	width: 800px;
	height: 400px;
}

.slide-imgs li img {
	width: 100%;
	height: 100%;
	/* 控制元素內容大小 調整圖片比例 */
	object-fit: cover;
}

.pages {
	position: absolute;
	list-style: none;
	display: flex;
	margin: 0;
	padding: 0;
	bottom: 10px;
	width: 100%;
	/* 主軸置中 */
	justify-content: center;
}

.pages li {
	border: 2px solid gray;
	width: 20px;
	height: 20px;
	border-radius: 50%;
	margin: 0 5px;
}

.slide-arrow {
	position: absolute;
	/* background-color: red; */
	z-index: 1;
	width: 30px;
	height: 100%;
	font-size: 36px;
	display: flex;
	align-items: center;
	color: gray;
	opacity: 0.5;
	cursor: pointer;
}

.right {
	right: 0;
}

.slide-arrow:hover {
	opacity: 1;
}
</style>
</head>

<!--BOBY-->

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
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


		<section class="bg-dark-30 showcase-page-header module parallax-bg"
			data-background="assets/images/showcase_bg.jpg">
			<div class="titan-caption"></div>
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
									<img
										src="<c:url value='/_01_member.ShowPhoto.controller?${bean.member.memberID}' />"
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
		<div class="container">
			<div class="wrapPhoto">
				<a class="slide-arrow" id="slidePrev"><i
					class="fa-solid fa-arrow-left"></i></a> <a class="slide-arrow right"
					id="slideNext"><i class="fa-solid fa-arrow-right"></i></a>
				<ul class="slide-imgs" id="slideImg">
					<li><img src="html/assets/images/shop/MeetBoth.gif" alt="" /></li>
					<li><img src="html/assets/images/shop/MeetBoth.gif" alt="" /></li>
					<li><img src="html/assets/images/shop/MeetBoth.gif" alt="" /></li>
					<li><img src="html/assets/images/shop/MeetBoth.gif" alt="" /></li>
					<li><img src="html/assets/images/shop/MeetBoth.gif" alt="" /></li>
				</ul>
				<ul class="pages">
					<li></li>
					<li></li>
					<li></li>
					<li></li>
					<li></li>
				</ul>
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

	<script src="https://kit.fontawesome.com/a260a05f7c.js"
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<!-- <script src="../jquery-3.6.1.js"></script> -->
	<script>
      $(function () {
        /*
        1.框樣式設定好
        2.放圖
        3.第一張圖移動
        4.N張圖移動
        5.設定選項li
        6.設定箭頭樣式
        7.箭頭功能移動
        */
        // $("#slideImg").css("left", "-800px");
        let index = 0;
        let slideMove = 0;
        $(".pages li").eq(0).css("background", "gray");
        $(".pages li").on("mouseenter", function () {
          // $("#slideImg").css("left", "-800px");
          //index() >>索引值
          index = $(this).index();
          // console.log(index);
          // slideMove = 0 - index * 800;
          // $("#slideImg").css("left", slideMove);
          // $(this)
          //   .css("background", "gray")
          //   .siblings()
          //   .css("background", "transparent");
          //其他變回透明
          moveImg();
        });
        let slideLength = $(".pages li").length;

        $("#slideNext").on("click", function () {
          // console.log("123");
          index++;
          if (index >= slideLength) {
            index = 0;
          }
          moveImg();
        });

        $("#slidePrev").on("click", function () {
          // console.log("123");
          index--;
          if (index < 0) {
            index = slideLength - 1;
          }
          moveImg();
        });

        function moveImg() {
          slideMove = 0 - index * 800;
          $("#slideImg").css("left", slideMove);
          $(".pages li")
            .eq(index)
            .css("background", "gray")
            .siblings()
            .css("background", "transparent");
        }
        setInterval(autoImg, 2000);
        function autoImg() {
          index++;
          if (index >= slideLength) {
            index = 0;
          }
          moveImg();
        }
      });
    </script>
</body>

</html>