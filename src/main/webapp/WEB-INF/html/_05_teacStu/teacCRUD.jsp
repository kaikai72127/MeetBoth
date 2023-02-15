<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<style type="text/css">
* {
	padding: 0;
	margin: 0;
}

*, ::before, ::after {
	background-repeat: no-repeat;
	box-sizing: inherit;
}

body {
	background: #F8F8F8;
	color: #333333;
}

.page-container {
	width: 100%;
	margin: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	position: relative;
}

.list {
	display: flex;
	flex-direction: column;
	gap: 2rem;
	margin: 2rem 0;
	width: 60%
}

.tutor-item {
	display: flex;
	width: 100%;
	position: relative;
	gap: 1rem;
	cursor: pointer;
	--avatar-width: 120px;
	padding: 1rem 1.5rem;
	border-radius: 0.25rem;
	background: #FFFFFF;
	overflow: hidden;
	transition: box-shadow 0.5s;
}

.tutor-item::after {
	content: "";
	position: absolute;
	background: #ce7777;
	height: 100%;
	width: 0.25rem;
	top: 0;
	left: 0;
}

.tutor-item:hover {
	box-shadow: 0px 2px 6px rgb(0 0 0/ 33%);
}

.tutor-left-section {
	display: flex;
	flex-direction: column;
	align-items: center;
	gap: 0.75rem;
}

.tutor-avatar {
	display: flex;
	width: var(--avatar-width);
	height: var(--avatar-width);
	border-radius: calc(var(--avatar-width)/8);
	border: #ce7777 0.25rem solid;
	overflow: hidden;
}

.tutor-avatar>img {
	width: 100%;
	height: 100%;
	object-fit: contain;
}

.tutor-detail {
	display: flex;
	flex-direction: column;
	/* gap: 1rem; */
}

.tutor-name {
	font-size: 1.25rem;
	margin-bottom: 1rem;
}

.subject-items {
	color: #ce7777;
}

.detail-table {
	display: inline-grid;
	border-spacing: 1rem 0.5rem;
	margin: -0.5rem -1rem;
}

.detail-item {
	display: table-row;
}

.detail-item-title {
	display: table-cell;
	position: relative;
	color: #777;
	padding-right: 1rem;
	min-width: 80px;
}

.detail-item-content {
	display: table-cell;
}

.resume-section {
	flex: 1;
}

.resume-body-title {
	font-size: 1rem;
	letter-spacing: 0.5em;
	padding-bottom: 0.25rem;
	margin-bottom: 1rem;
	position: relative;
	color: #ce7777;
}

.resume-body-title::after {
	content: "";
	position: absolute;
	background: #ce7777;
	height: 2px;
	width: 100%;
	border-radius: 1px;
	bottom: 0;
	left: 0;
}

.resume-no {
	font-size: 0.75rem;
	color: #0089ac;
}

.resume-name {
	font-size: 1.5rem;
	margin-bottom: 0.5rem;
}

.resume-contact {
	margin-bottom: 4rem;
}

.resume-contact-item {
	display: flex;
	gap: 0.5rem;
	margin-bottom: 0.25rem;
}

.resume-table {
	display: table;
	border-spacing: 1rem 2rem;
	margin: -2rem -1rem 2rem;
}

.resume-item {
	display: table-row;
}

.resume-item-title {
	display: table-cell;
	position: relative;
	color: #777;
	padding-right: 1rem;
	min-width: 100px;
	font-size: 16px;
}

.resume-item-title::after {
	content: "";
	position: absolute;
	background: #ce7777;
	height: 100%;
	width: 2px;
	border-radius: 1px;
	top: 0;
	right: 0;
}

.resume-item-content {
	display: table-cell;
	font-size: 16px;
}

#formContainer .form-section {
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	border: #ce7777 0.25rem solid;
	position: relative;
	padding: 0 40px 50px;
	width: 50%;
	height: 63%;
	transform: scale(0) translateY(0);
	transition: all 0.5s ease-in-out;
}

#formContainer.shown .form-section {
	transform: scale(1) translateY(50px);
}

#formContainer form {
	width: 100%;
	height: 100%;
	max-width: 900px;
}

.dialog-container {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 999;
	align-items: center;
	justify-content: center;
	display: flex;
}

.dialog-container::before {
	content: "";
	position: absolute;
	background: rgba(0, 0, 0, 0.5);
	width: 100vw;
	height: 100vh;
	top: 0;
	left: 0;
	opacity: 0;
	display: flex;
	transition: opacity 0.5s ease-in-out;
}

.dialog-container.shown::before {
	content: "";
	opacity: 1;
}

.card-section {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	z-index: 999;
	align-content: center;
	justify-content: center;
	display: flex;
	flex-wrap: wrap;
	transform: scale(0);
	transition: all 0.5s ease-in-out;
}

#cardContainer.shown .card-section {
	transform: scale(1);
}

.card-section .card-container {
	flex: 1 0 50%;
	max-width: 40%;
}

.card-section .card-container .card {
	position: relative;
	height: 170px;
	margin: 4rem;
	margin-left: 15%;
}

.content {
	position: absolute;
	border: #ce7777 0.25rem solid;
	background: #FFFFFF;
	border-radius: 10px;
	width: 100%;
	height: 120%;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	transition: transform 1s;
	transform-style: preserve-3d;
	--avatar-width: 120px;
}

.card:hover .content {
	transform: rotateY(180deg);
	transition: transform 0.5s;
}

.front, .back {
	position: absolute;
	height: 100%;
	width: 100%;
	background-image: url("../html/images/背景渲染.jpg");
	border-radius: 10px;
	backface-visibility: hidden;
	display: flex;
	align-items: center;
	justify-content: center;
	overflow: hidden;
}

.back {
	background: white;
	justify-content: flex-start;
	transform: rotateY(180deg);
}

#cardContainer .tutor-avatar {
	flex: 1 0 var(--avatar-width);
	max-width: var(--avatar-width);
}

#cardContainer .tutor-name {
	font-size: 2.25rem;
}

#cardContainer .subject-items {
	font-size: 1.25rem;
	line-height: 110%;
}

#cardContainer .match-score {
	position: absolute;
	padding: 0.25rem 0;
	background: #ce7777;
	top: 20px;
	right: -3rem;
	width: 12rem;
	transform: rotate(45deg);
	font-size: 1.5rem;
	font-weight: 600;
	line-height: 150%;
	color: #ffffff;
	text-align: center;
}

#closeForm {
	position: absolute;
	width: 2.5rem;
	height: 2.5rem;
	border-radius: 50%;
	border: #ce7777 0.25rem solid;
	background: #FFFFFF;
	top: -10px;
	right: -10px;
	font-size: 24px;
	cursor: pointer;
	align-items: center;
	justify-content: center;
	display: flex;
}

#form-h1 {
	align-items: center;
	justify-content: center;
	display: flex;
}

.button-container {
	animation: hue-rotate 10s linear infinite;
}

.button--bubble__container span {
	box-sizing: border-box;
}

.button--bubble__container .button {
	-webkit-font-smoothing: antialiased;
	background-color: #222;
	border: none;
	border-radius: 2rem;
	color: #fff;
	display: inline-block;
	font-family: "Montserrat", sans-serif;
	font-size: 11px;
	font-weight: 100;
	text-decoration: none;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	letter-spacing: 1px;
	color: white;
	padding: 8px 40px;
	text-transform: uppercase;
	transition: all 0.1s ease-out;
	cursor: pointer;
}

.button--bubble__container .button:hover {
	background-color: #90feb5;
	color: #fff;
}

.button--bubble__container .button:active {
	transform: scale(0.95);
}

.button--bubble__container .button--bubble {
	position: relative;
	z-index: 2;
	color: white;
	background: none;
}

.button--bubble:hover {
	background: none;
}

.button--bubble:hover+.button--bubble__effect-container .circle {
	background: #44fd82;
}

.button--bubble:hover+.button--bubble__effect-container .button {
	background: #44fd82;
}

.button--bubble:active+.button--bubble__effect-container {
	transform: scale(0.95);
}

.button--bubble__container {
	position: relative;
	display: inline-block;
}

.button--bubble__container .effect-button {
	position: absolute;
	width: 50%;
	height: 25%;
	top: 50%;
	left: 25%;
	z-index: 1;
	transform: translateY(-50%);
	background: #222;
	transition: background 0.1s ease-out;
}

.button--bubble__effect-container {
	position: absolute;
	display: block;
	width: 200%;
	height: 400%;
	top: -150%;
	left: -50%;
	filter: url("#goo");
	transition: all 0.1s ease-out;
	pointer-events: none;
}

.button--bubble__effect-container .circle {
	position: absolute;
	width: 25px;
	height: 25px;
	border-radius: 15px;
	background: #222;
	transition: background 0.1s ease-out;
}

.button--bubble__effect-container .circle.top-left {
	top: 40%;
	left: 27%;
}

.button--bubble__effect-container .circle.bottom-right {
	bottom: 40%;
	right: 27%;
}

.button--bubble__container {
	top: 50%;
}


@-webkit-keyframes hue-rotate {from { -moz-filter:hue-rotate(0);
	-ms-filter: hue-rotate(0);
	filter: hue-rotate(0);
}

to {
	-moz-filter: hue-rotate(360deg);
	-ms-filter: hue-rotate(360deg);
	filter: hue-rotate(360deg);
}

}

@keyframes hue-rotate {from { -moz-filter:hue-rotate(0);
	-ms-filter: hue-rotate(0);
	filter: hue-rotate(0);
}

to {
	-moz-filter: hue-rotate(360deg);
	-ms-filter: hue-rotate(360deg);
	filter: hue-rotate(360deg);
}
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/plugins/CSSPlugin.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/easing/EasePack.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/1.17.0/TweenLite.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/gsap/latest/TimelineLite.min.js"></script>
</head>

<!--BOBY-->

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		<!-- 中間內文 -->
		<div class="page-container">
			<div class="list">
				<!-- 模糊搜尋 -->
				<div style='width: 80%; text-align: center; margin: 0 auto;'
					class="widget">
					<form role="form" method="post"
						action="<c:url value='/_05_teacStu.searchAllLike.controller/1' />">
						<div class="search-box">
							<input name="search" class="form-control" type="text"
								placeholder="Search..." />
							<button class="search-btn" type="submit">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</form>
				</div>
				<!-- 模糊搜尋結束 -->

				<!-- 標題 -->
				<div class="post-header font-alt">
					<h2 class="post-title">
						<a href="#">教師貼文列表</a>
					</h2>
					<hr>
					<div class="button-container">
						<span class="button--bubble__container">
							<div id="openForm" style="float: left"
								class="button button--bubble">MeetBoth</div>
								<span class="button--bubble__effect-container">
								<span class="circle top-left"></span>
								<span class="circle top-left"></span>
								<span class="circle top-left"></span>
								<span class="button effect-button"></span>
								<span class="circle bottom-right"></span>
								<span class="circle bottom-right"></span>
								<span class="circle bottom-right"></span>
								</span>
						</span>
						<form style="float: right"
							action="<c:url value='/_05_teacStu.insertdataMain.controller' />">
							<button class="btn btn-b btn-circle" type="submit">成為教師</button>
						</form>
					</div>

					<!-- <button id="openForm" style="float: left" class="btn btn-b btn-circle">MeetBoth</button> -->
				</div>
				<!-- 標題結束 -->

				<!-- 測試 -->
				<div id="formContainer" class="dialog-container hidden">
					<div class="form-section">
						<span id="closeForm">&times;</span>
						<form id="test-form">
							<h1 id="form-h1">請填寫資料</h1>
							<hr>
							<!-- form content here -->
							<div class="resume-table">
								<div class="resume-item">
									<div class="resume-item-title">請選擇您希望教師的上課地區</div>
									<div class="resume-item-content">
										<select name="locChoose" style="width: 100%" required>
											<option value="">--請選擇您希望教師的上課地區--</option>
											<option value="北部">北部</option>
											<option value="中部">中部</option>
											<option value="南部">南部</option>
											<option value="東部">東部</option>
										</select>
									</div>
								</div>
								<div class="resume-item">
									<div class="resume-item-title">請選擇您希望教師的上課對象</div>
									<div class="resume-item-content">
										<select name="objectChoose" style="width: 100%" required>
											<option value="">--請選擇您希望教師的上課對象--</option>
											<option value="國小">國小</option>
											<option value="國中">國中</option>
											<option value="高中">高中</option>
											<option value="大學">大學</option>
										</select>
									</div>
								</div>
								<div class="resume-item">
									<div class="resume-item-title">請選擇您希望教師的上課時段</div>
									<div class="resume-item-content">
										<select name="timeChoose" style="width: 100%" required>
											<option value="">--請選擇您希望教師的上課時段--</option>
											<option value="平日">平日</option>
											<option value="假日">假日</option>
											<option value="皆可">皆可</option>
										</select>
									</div>
								</div>
								<div class="resume-item">
									<div class="resume-item-title">請選擇您希望教師的擅長科目</div>
									<div class="resume-item-content">
										<select name="subChoose" style="width: 100%" required>
											<option value="">--請選擇您希望教師的擅長科目--</option>
											<option value="國文">國文</option>
											<option value="英文">英文</option>
											<option value="數學">數學</option>
											<option value="自然">自然</option>
											<option value="社會">社會</option>
											<option value="其他">其他</option>
										</select>
									</div>
								</div>
								<div class="resume-item">
									<div class="resume-item-title">請選擇您希望教師擅長的語言能力</div>
									<div class="resume-item-content">
										<select name="lanChoose" style="width: 100%" required>
											<option value="">--請選擇您希望教師擅長的語言能力--</option>
											<option value="英文">英文</option>
											<option value="日文">日文</option>
											<option value="韓文">韓文</option>
											<option value="法文">法文</option>
											<option value="德文">德文</option>
											<option value="希伯來文">希伯來文</option>
											<option value="其他">其他</option>
										</select>
									</div>
								</div>
								<div class="resume-item">
									<div class="resume-item-title">請選擇您希望給教師的時薪</div>
									<div class="resume-item-content">
										<select name="priceChoose" style="width: 100%" required>
											<option value="">--請選擇您希望給教師的時薪--</option>
											<option value="500以下">500以下</option>
											<option value="501~1000">501~1000</option>
											<option value="1000以上">1000以上</option>
										</select>
									</div>
								</div>
							</div>
							<div style="display: flex; align-items: center; justify-content: center;">
								<button id="form-submit-button"
									class="btn btn-danger btn-circle" type="submit">開始匹配</button>
							</div>
						</form>
					</div>
				</div>

				<div id="cardContainer" class="dialog-container hidden">
					<div class="card-section">
						<div class="card-container">
							<div class="card">
								<div class="content">
									<div class="front">
										<img src="../html/assets/images/meatball/meatball-144x144.png">
									</div>
									<div class="back" id="connect1"
										style="background-color: white; display: flex;">
										<div id="img1" class="tutor-avatar" style="margin: 20px">
										</div>
										<div class="tutor-detail" style="margin: 20px">
											<div id="jsonsubjectItem" class="subject-items"></div>
											<div id="jsonName" class="tutor-name"></div>
											<div class="detail-table">
												<div class="detail-item">
													<div class="detail-item-title">授課對象</div>
													<div id="jsonteacObject" class="detail-item-content">
													</div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">家教經驗</div>
													<div id="jsontutorExp" class="detail-item-content"></div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">授課地區</div>
													<div id="jsonteacLoc" class="detail-item-content"></div>
												</div>
											</div>
										</div>
										<div class="match-score">97%</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-container">
							<div class="card">
								<div class="content">
									<div class="front">
										<img src="../html/assets/images/meatball/meatball-144x144.png">
									</div>
									<div class="back" id="connect2"
										style="background-color: white; display: flex;">
										<div id="img2" class="tutor-avatar" style="margin: 20px">
										</div>
										<div class="tutor-detail" style="margin: 20px">
											<div id="jsonsubjectItem2" class="subject-items"></div>
											<div id="jsonName2" class="tutor-name"></div>
											<div class="detail-table">
												<div class="detail-item">
													<div class="detail-item-title">授課對象</div>
													<div id="jsonteacObject2" class="detail-item-content">
													</div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">家教經驗</div>
													<div id="jsontutorExp2" class="detail-item-content"></div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">授課地區</div>
													<div id="jsonteacLoc2" class="detail-item-content"></div>
												</div>
											</div>
										</div>
										<div class="match-score">86%</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-container">
							<div class="card">
								<div class="content">
									<div class="front">
										<img src="../html/assets/images/meatball/meatball-144x144.png">
									</div>
									<div class="back" id="connect3"
										style="background-color: white; display: flex;">
										<div id="img3" class="tutor-avatar" style="margin: 20px">
										</div>
										<div class="tutor-detail" style="margin: 20px">
											<div id="jsonsubjectItem3" class="subject-items"></div>
											<div id="jsonName3" class="tutor-name"></div>
											<div class="detail-table">
												<div class="detail-item">
													<div class="detail-item-title">授課對象</div>
													<div id="jsonteacObject3" class="detail-item-content">
													</div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">家教經驗</div>
													<div id="jsontutorExp3" class="detail-item-content"></div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">授課地區</div>
													<div id="jsonteacLoc3" class="detail-item-content"></div>
												</div>
											</div>
										</div>
										<div class="match-score">77%</div>
									</div>
								</div>
							</div>
						</div>
						<div class="card-container">
							<div class="card">
								<div class="content">
									<div class="front">
										<img src="../html/assets/images/meatball/meatball-144x144.png">
									</div>
									<div class="back" id="connect4"
										style="background-color: white; display: flex;">
										<div id="img4" class="tutor-avatar" style="margin: 20px">
										</div>
										<div class="tutor-detail" style="margin: 20px">
											<div id="jsonsubjectItem4" class="subject-items"></div>
											<div id="jsonName4" class="tutor-name"></div>
											<div class="detail-table">
												<div class="detail-item">
													<div class="detail-item-title">授課對象</div>
													<div id="jsonteacObject4" class="detail-item-content">
													</div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">家教經驗</div>
													<div id="jsontutorExp4" class="detail-item-content"></div>
												</div>
												<div class="detail-item">
													<div class="detail-item-title">授課地區</div>
													<div id="jsonteacLoc4" class="detail-item-content"></div>
												</div>
											</div>
										</div>
										<div class="match-score">69%</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- 測試 -->

				<!-- 價格區間搜尋與排列方式 -->
				<div>
					<div>
						<form method="post"
							action="<c:url value='/_05_teacStu.switchsequence.controller/1' />">
							<select name="case" onchange="this.form.submit()"
								style="width: 17%">
								<option value="">--請選擇排序方式--</option>
								<option value="1">依瀏覽次數排序</option>
								<option value="2">依日期排序</option>
								<option value="3">依價格排序</option>
							</select>
						</form>
					</div>
					<div>
						<form method="post"
							action="<c:url value='/_05_teacStu.searchAllByPrice.controller/1' />">
							<table style="width: 80%">
								<thead>
									<tr>
										<th>請輸入查詢的時薪區間:</th>
										<th><input name="low" type="text" value="最低時薪"
											onfocus="javascript:if(this.value=='最低時薪')this.value='';">
										</th>
										<th>至</th>
										<th><input name="high" type="text" value="最高時薪"
											onfocus="javascript:if(this.value=='最高時薪')this.value='';">
										</th>
										<th><button class="btn btn-g btn-round btn-xs"
												type="submit">搜尋</button></th>
									</tr>
								</thead>
							</table>
						</form>
					</div>
				</div>
				<!-- 價格區間搜尋與排列方式結束 -->

				<!-- 貼文開始 -->

				<c:forEach var="bean" items="${pageTeac}">
					<a href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">
						<div class="tutor-item">
							<div class="tutor-left-section">
								<div class="tutor-avatar">
									<img
										src="<c:url value='/_01_member.ShowPhoto.controller?account=${bean.member.account}' />"
										alt="">
								</div>
								<div>瀏覽次數:${bean.views}次</div>
							</div>

							<div class="tutor-detail">
								<div class="subject-items">${bean.subjectItem}</div>
								<div class="tutor-name">${bean.member.memName}
									(${bean.member.memNickName})</div>
								<div class="detail-table">
									<div class="detail-item">
										<div class="detail-item-title">授課對象</div>
										<div class="detail-item-content">${bean.teacObject}</div>
									</div>
									<div class="detail-item">
										<div class="detail-item-title">學歷</div>
										<div class="detail-item-content">${bean.highEdu}</div>
									</div>
									<div class="detail-item">
										<div class="detail-item-title">家教經驗</div>
										<div class="detail-item-content">${bean.tutorExp}</div>
									</div>
									<div class="detail-item">
										<div class="detail-item-title">授課地區</div>
										<div class="detail-item-content">${bean.teacLoc}</div>
									</div>
								</div>
							</div>
						</div>
					</a>
				</c:forEach>

				<!-- ------------------------- -->

				<!-- 分頁按鈕 -->
				<div class="pagination font-alt"
					style="display: flex; justify-content: center; align-items: center">
					<c:if test="${currentPage != 1}">
						<a
							href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${currentPage-1}"><i
							class="fa fa-angle-left"></i></a>
					</c:if>
					<!-- 迴圈生成每一頁的按鈕 -->
					<c:forEach var="i" begin="1" end="${totalPages}">
						<c:choose>
							<c:when test="${currentPage == i}">
								<a class="active"
									href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${i}">${i}</a>
							</c:when>
							<c:otherwise>
								<a href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${i}">${i}</a>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${currentPage != totalPages}">
						<a
							href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${currentPage+1}"><i
							class="fa fa-angle-right"></i></a>
					</c:if>
				</div>
				<!-- 分頁按鈕結束 -->
			</div>
		</div>
		<div class="pagination-bar"></div>
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
	<script>
		document.querySelector('form[action*="_05_teacStu.insertdataMain.controller"] button[type="submit"]').addEventListener('click', function (e) {
		const user = '${pageContext.request.userPrincipal.name}';
		if (!user) {
			e.preventDefault();
			alert('請先登入');
			window.location.href = '/MeetBoth/login/page';
		}
		});
	</script>
	<script>
	const closeDialog = () => {
		document.getElementById("formContainer").classList.remove("shown");
			setTimeout(() => {
				document.getElementById("formContainer").classList.add("hidden");
			}, 500)
		};

		document.getElementById("openForm").addEventListener("click", function () {
			document.getElementById("formContainer").classList.remove("hidden");
			setTimeout(() => {
				document.getElementById("formContainer").classList.add("shown");
			}, 10)
		});

		document.getElementById("closeForm").addEventListener("click", function () {
			closeDialog();
		});

		const formContainer = $("#formContainer");
			formContainer.click(() => {
				closeDialog();
			})

		$(".form-section").click((event) => {
			event.stopPropagation();
		})

		const cardContainer = $("#cardContainer");
		const closeCardContainer = () => {
			cardContainer.removeClass("shown");
			setTimeout(() => {
				cardContainer.addClass("hidden");
			}, 500);
		};

		const showCardContainer = () => {
			cardContainer.removeClass("hidden");
			setTimeout(() => {
				cardContainer.addClass("shown");
			}, 500);
		};

		cardContainer.click(() => {
			closeCardContainer();
		});

		//dialog content switch
		const button = $("#form-submit-button");
		const card = $(".card-container");
		cardContainer.click((event) => {
			event.stopPropagation();
		});

		const form = document.getElementById('test-form');
		button.click(() => {
		//TODO: ajax call
		form.addEventListener('submit', function (event) {
			event.preventDefault();
			const formData = {
				location: this.elements.locChoose.value,
				object: this.elements.objectChoose.value,
				time: this.elements.timeChoose.value,
		};

		fetch("/MeetBoth/_05_teacStu.match.controller", {
			method: 'POST',
			headers: {
				'Content-Type': 'application/json'
			},
			body: JSON.stringify(formData)
			})
			.then(response => response.json())
			.then(data => {
				var firstData = data[0];
				var teacno1 = firstData.teacno;
				var account1 = firstData.member.account;
				var i1 = document.createElement('img');
				i1.src = "<c:url value='/_01_member.ShowPhoto.controller?account=" + account1 + "' />";
				var img1 = document.getElementById('img1');
				img1.innerHTML = '';
				img1.appendChild(i1);
				var jsonsubjectItem = firstData.subjectItem;
				$('#jsonsubjectItem').html(jsonsubjectItem);
				var jsonName = firstData.member.memName + "(" + firstData.member.memNickName + ")";
				$('#jsonName').html(jsonName);
				var jsonteacObject = firstData.teacObject;
				$('#jsonteacObject').html(jsonteacObject);
				var jsontutorExp = firstData.tutorExp;
				$('#jsontutorExp').html(jsontutorExp);
				var jsonteacLoc = firstData.teacLoc;
				$('#jsonteacLoc').html(jsonteacLoc);
				document.querySelector('#connect1').addEventListener("click", function () {
					window.location.href = "/MeetBoth/_05_teacStu.teacpostpageMain.controller?teacno=" + teacno1;
				});
				
				var secondData = data[1];
				var teacno2 = secondData.teacno;
				var account2 = secondData.member.account;
				var i2 = document.createElement('img');
				i2.src = "<c:url value='/_01_member.ShowPhoto.controller?account=" + account2 + "' />";
				var img2 = document.getElementById('img2');
				img2.innerHTML = '';
				img2.appendChild(i2);
				var jsonsubjectItem2 = secondData.subjectItem;
				$('#jsonsubjectItem2').html(jsonsubjectItem2);
				var jsonName2 = secondData.member.memName + "(" + secondData.member.memNickName + ")";
				$('#jsonName2').html(jsonName2);
				var jsonteacObject2 = secondData.teacObject;
				$('#jsonteacObject2').html(jsonteacObject2);
				var jsontutorExp2 = secondData.tutorExp;
				$('#jsontutorExp2').html(jsontutorExp2);
				var jsonteacLoc2 = secondData.teacLoc;
				$('#jsonteacLoc2').html(jsonteacLoc2);
				document.querySelector('#connect2').addEventListener("click", function () {
					window.location.href = "/MeetBoth/_05_teacStu.teacpostpageMain.controller?teacno=" + teacno2;
				});
				
				var thirdData = data[2];
				var teacno3 = thirdData.teacno;
				var account3 = thirdData.member.account;
				var i3 = document.createElement('img');
				i3.src = "<c:url value='/_01_member.ShowPhoto.controller?account=" + account3 + "' />";
				var img3 = document.getElementById('img3');
				img3.innerHTML = '';
				img3.appendChild(i3);
				var jsonsubjectItem3 = thirdData.subjectItem;
				$('#jsonsubjectItem3').html(jsonsubjectItem3);
				var jsonName3 = thirdData.member.memName + "(" + thirdData.member.memNickName + ")";
				$('#jsonName3').html(jsonName3);
				var jsonteacObject3 = thirdData.teacObject;
				$('#jsonteacObject3').html(jsonteacObject3);
				var jsontutorExp3 = thirdData.tutorExp;
				$('#jsontutorExp3').html(jsontutorExp3);
				var jsonteacLoc3 = thirdData.teacLoc;
				$('#jsonteacLoc3').html(jsonteacLoc3);
				document.querySelector('#connect3').addEventListener("click", function () {
					window.location.href = "/MeetBoth/_05_teacStu.teacpostpageMain.controller?teacno=" + teacno3;
				});
				
				var forthData = data[3];
				var teacno4 = forthData.teacno;
				var account4 = forthData.member.account;
				var i4 = document.createElement('img');
				i4.src = "<c:url value='/_01_member.ShowPhoto.controller?account=" + account4 + "' />";
				var img4 = document.getElementById('img4');
				img4.innerHTML = '';
				img4.appendChild(i4);
				var jsonsubjectItem4 = forthData.subjectItem;
				$('#jsonsubjectItem4').html(jsonsubjectItem4);
				var jsonName4 = forthData.member.memName + "(" + forthData.member.memNickName + ")";
				$('#jsonName4').html(jsonName4);
				var jsonteacObject4 = forthData.teacObject;
				$('#jsonteacObject4').html(jsonteacObject4);
				var jsontutorExp4 = forthData.tutorExp;
				$('#jsontutorExp4').html(jsontutorExp4);
				var jsonteacLoc4 = forthData.teacLoc;
				$('#jsonteacLoc4').html(jsonteacLoc4);
				document.querySelector('#connect4').addEventListener("click", function () {
					window.location.href = "/MeetBoth/_05_teacStu.teacpostpageMain.controller?teacno=" + teacno4;
				});
				
			setTimeout(() => {
				closeDialog();
				showCardContainer();
			}, 100);
		})
		})
		});
	</script>
	<script>
	$('.button--bubble').each(function () {
		console.log($(this).parent())
		var $circlesTopLeft = $(this).parent().find('.circle.top-left');
		var $circlesBottomRight = $(this).parent().find('.circle.bottom-right');

		var tl = new TimelineLite();
		var tl2 = new TimelineLite();

		var btTl = new TimelineLite({ paused: true });

		tl.to($circlesTopLeft, 1.2, { x: -25, y: -25, scaleY: 2, ease: SlowMo.ease.config(0.1, 0.7, false) });
		tl.to($circlesTopLeft.eq(0), 0.1, { scale: 0.2, x: '+=6', y: '-=2' });
		tl.to($circlesTopLeft.eq(1), 0.1, { scaleX: 1, scaleY: 0.8, x: '-=10', y: '-=7' }, '-=0.1');
		tl.to($circlesTopLeft.eq(2), 0.1, { scale: 0.2, x: '-=15', y: '+=6' }, '-=0.1');
		tl.to($circlesTopLeft.eq(0), 1, { scale: 0, x: '-=5', y: '-=15', opacity: 0 });
		tl.to($circlesTopLeft.eq(1), 1, { scaleX: 0.4, scaleY: 0.4, x: '-=10', y: '-=10', opacity: 0 }, '-=1');
		tl.to($circlesTopLeft.eq(2), 1, { scale: 0, x: '-=15', y: '+=5', opacity: 0 }, '-=1');

		var tlBt1 = new TimelineLite();
		var tlBt2 = new TimelineLite();

		tlBt1.set($circlesTopLeft, { x: 0, y: 0, rotation: -45 });
		tlBt1.add(tl);

		tl2.set($circlesBottomRight, { x: 0, y: 0 });
		tl2.to($circlesBottomRight, 1.1, { x: 30, y: 30, ease: SlowMo.ease.config(0.1, 0.7, false) });
		tl2.to($circlesBottomRight.eq(0), 0.1, { scale: 0.2, x: '-=6', y: '+=3' });
		tl2.to($circlesBottomRight.eq(1), 0.1, { scale: 0.8, x: '+=7', y: '+=3' }, '-=0.1');
		tl2.to($circlesBottomRight.eq(2), 0.1, { scale: 0.2, x: '+=15', y: '-=6' }, '-=0.2');
		tl2.to($circlesBottomRight.eq(0), 1, { scale: 0, x: '+=5', y: '+=15', opacity: 0 });
		tl2.to($circlesBottomRight.eq(1), 1, { scale: 0.4, x: '+=7', y: '+=7', opacity: 0 }, '-=1');
		tl2.to($circlesBottomRight.eq(2), 1, { scale: 0, x: '+=15', y: '-=5', opacity: 0 }, '-=1');

		tlBt2.set($circlesBottomRight, { x: 0, y: 0, rotation: 45 });
		tlBt2.add(tl2);

		btTl.add(tlBt1);
		btTl.to($(this).parent().find('.button.effect-button'), 0.8, { scaleY: 1.1 }, 0.1);
		btTl.add(tlBt2, 0.2);
		btTl.to($(this).parent().find('.button.effect-button'), 1.8, { scale: 1, ease: Elastic.easeOut.config(1.2, 0.4) }, 1.2);

		btTl.timeScale(2.6);

		$(this).on('mouseover', function () {
			console.log("hover button")
			btTl.restart();
		});
	});
	</script>
</body>
</html>