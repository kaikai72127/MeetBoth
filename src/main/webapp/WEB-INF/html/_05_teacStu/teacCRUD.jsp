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
	-avatar-width: 120px;
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

.tutor-avatar {
	display: flex;
	width: var(- -avatar-width);
	height: var(- -avatar-width);
	border-radius: calc(var(- -avatar-width)/8);
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

#formContainer {
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

#formContainer::before {
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

#formContainer.shown::before {
	content: "";
	opacity: 1;
}

#formContainer .form-section {
	background: #fff;
	border-radius: 10px;
	box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px
		rgba(0, 0, 0, 0.23);
	border: #ce7777 0.25rem solid;
	position: relative;
	padding: 40px;
	width: 50%;
	height: 45%;
	transform: scale(0);
	transition: all 0.5s ease-in-out;
}

#formContainer.shown .form-section {
	transform: scale(1);
}

#formContainer form {
	width: 100%;
	height: 100%;
	max-width: 900px;
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
}

.card-section .card-container {
	flex: 1 0 50%;
	max-width: 50%;
}

.card-section .card-container .card {
	position: relative;
	height: 200px;
	margin: 4rem;
	margin-left: 15%;
}

.content {
	position: absolute;
	border: #ce7777 0.25rem solid;
	background: #FFFFFF;
	border-radius: 10px;
	width: 80%;
	height: 120%;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
	transition: transform 1s;
	transform-style: preserve-3d;
}

.card:hover .content {
	transform: rotateY(180deg);
	transition: transform 0.5s;
}

.front, .back {
	position: absolute;
	height: 100%;
	width: 100%;
	background: #03446A;
	line-height: 300px;
	color: white;
	text-align: center;
	font-size: 60px;
	border-radius: 5px;
	backface-visibility: hidden;
}

.back {
	background: white;
	color: #03446A;
	transform: rotateY(180deg);
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
</style>
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
					<button id="openForm" style="float: right"
						class="btn btn-b btn-circle">MeetBoth</button>
					<form
						action="<c:url value='/_05_teacStu.insertdataMain.controller' />">
						<button style="float: right" class="btn btn-b btn-circle"
							type="submit">成為教師</button>
					</form>
				</div>
				<!-- 標題結束 -->

				<!-- 測試 -->
				<div id="formContainer" class="hidden">
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
										<select name="locChoose" style="width: 100%">
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
										<select name="objectChoose" style="width: 100%">
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
										<select name="timeChoose" style="width: 100%">
											<option value="">--請選擇您希望教師的上課時段--</option>
											<option value="平日">平日</option>
											<option value="假日">假日</option>
											<option value="皆可">皆可</option>
										</select>
									</div>
								</div>
							</div>
							<!--                 之後要把這個button改成submit -->
							<div
								style="display: flex; align-items: center; justify-content: center;">
								<button id="form-submit-button"
									class="btn btn-danger btn-circle" type="submit">開始匹配</button>
							</div>
						</form>
					</div>
				</div>

				<div class="card-section hidden">
					<div class="card-container">
						<div class="card">
							<div class="content">
								<div class="front">Front</div>
								<div class="back"
									style="background-color: white; display: flex;">
									<div class="tutor-avatar" style="width: 40%; margin: 20px">
										<img
											src="<c:url value='/_01_member.ShowPhoto.controller?${bean.member.memberID}' />"
											alt="">
									</div>
									<div class="tutor-detail" style="width: 40%; margin: 20px">
										<div id="jsonsubjectItem" class="subject-items"></div>
										<div id="jsonName" class="tutor-name"></div>
										<div class="detail-table">
											<div class="detail-item">
												<div class="detail-item-title">授課對象</div>
												<div id="jsonteacObject" class="detail-item-content"></div>
											</div>
											<div class="detail-item">
												<div class="detail-item-title">學歷</div>
												<div id="jsonhighEdu" class="detail-item-content"></div>
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
								</div>
							</div>
						</div>
					</div>
					<div class="card-container">
						<div class="card">
							<div class="content">
								<div class="front">Front</div>
								<div class="back">Back!</div>
							</div>
						</div>
					</div>
					<div class="card-container">
						<div class="card">
							<div class="content">
								<div class="front">Front</div>
								<div class="back">Back!</div>
							</div>
						</div>
					</div>
					<div class="card-container">
						<div class="card">
							<div class="content">
								<div class="front">Front</div>
								<div class="back">Back!</div>
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
					<a
						href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">
						<div class="tutor-item">
							<div class="tutor-avatar">
								<img
									src="<c:url value='/_01_member.ShowPhoto.controller?${bean.member.memberID}' />"
									alt="">
							</div>
							<div>瀏覽次數:${bean.views}次</div>
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

					//dialog content switch
					const button = $("#form-submit-button");
					const cardSection = $(".card-section");


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

							//             const array = JSON.stringify(formData);

							console.log(formData)
							fetch("/MeetBoth/_05_teacStu.match.controller", {
								method: 'POST',
								headers: {
									'Content-Type': 'application/json'
								},
								body: JSON.stringify(formData)
							})
							.then(response=>response.json())
							.then(data=>
							{
								var firstData = data[0];
								    var jsonsubjectItem = firstData.subjectItem;
								    $('#jsonsubjectItem').html(jsonsubjectItem);
								    var jsonName = firstData.member.memName (firstData.member.memNickName);
								    $('#jsonName').html(jsonName);
								    var jsonteacObject = firstData.teacObject;
								    $('#jsonteacObject').html(jsonteacObject);
								    var jsonhighEdu = firstData.highEdu;
								    $('#jsonhighEdu').html(jsonhighEdu);
								    var jsontutorExp = firstData.tutorExp;
								    $('#jsontutorExp').html(jsontutorExp);
								    var jsonteacLoc = firstData.teacLoc;
								    $('#jsonteacLoc').html(jsonteacLoc);
// 								
							}
									)
// 							            .then(function (response) {
// 							                    if (response.status == 200) {
// 							                    	console.log('success')
// 							                    	console.log(response)
// 							                    }
// 							                    response.json()

							//                     	response.json().then(function (teacBeans){
							//                     var firstData = teacBeans[0];
							//      		    var jsonsubjectItem = firstData.subjectItem;
							//      		    $('#jsonsubjectItem').html(jsonsubjectItem);
							//      		    var jsonName = firstData.member.memName (firstData.member.memNickName);
							//      		    $('#jsonName').html(jsonName);
							//      		    var jsonteacObject = firstData.teacObject;
							//      		    $('#jsonteacObject').html(jsonteacObject);
							//      		    var jsonhighEdu = firstData.highEdu;
							//      		    $('#jsonhighEdu').html(jsonhighEdu);
							//      		    var jsontutorExp = firstData.tutorExp;
							//      		    $('#jsontutorExp').html(jsontutorExp);
							//      		    var jsonteacLoc = firstData.teacLoc;
							//      		    $('#jsonteacLoc').html(jsonteacLoc);
							//                     	});
							//                 });
						})
						setTimeout(() => {
							closeDialog();
							cardSection.removeClass("hidden");
						}, 100);
					});
				</script>
	<script>
// 	$.ajax({
//  		type: "POST",
//  		contentType: "application/json",
//  		url: "/MeetBoth/_05_teacStu.match.controller",
//  		data: JSON.stringify(options),
//  		dataType: "json",
//  		success: function (teacBeans) {
//    		// 這裡是 success callback function，將回傳的 teacBeans 處理後顯示在 JSP 中
//  			var firstData = teacBeans[0];
//  		    var jsonsubjectItem = firstData.subjectItem;
//  		    $('#jsonsubjectItem').html(jsonsubjectItem);
//  		    var jsonName = firstData.member.memName (firstData.member.memNickName);
//  		    $('#jsonName').html(jsonName);
//  		    var jsonteacObject = firstData.teacObject;
//  		    $('#jsonteacObject').html(jsonteacObject);
//  		    var jsonhighEdu = firstData.highEdu;
//  		    $('#jsonhighEdu').html(jsonhighEdu);
//  		    var jsontutorExp = firstData.tutorExp;
//  		    $('#jsontutorExp').html(jsontutorExp);
//  		    var jsonteacLoc = firstData.teacLoc;
//  		    $('#jsonteacLoc').html(jsonteacLoc);
//  		}
// 	});
				</script>
</body>

</html>