<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<style>
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
}

.page-container {
	width: 80%;
	margin: auto;
	display: flex;
	justify-content: center;
	padding: 2rem 0;
}

.resume-container {
	color: #333333;
	width: 100%;
	padding: 1.5rem 2.5rem;
	border-radius: 0.25rem;
	box-shadow: 0px 2px 6px rgb(0 0 0/ 33%); -
	-avatar-width: 120px; -
	-avatar-height: 180px;
}

.resume-title {
	font-size: 2rem;
	padding-bottom: 0.25rem;
	position: relative;
}

.resume-title::after {
	content: "";
	position: absolute;
	background: #ce7777;
	height: 4px;
	width: 5rem;
	border-radius: 2px;
	bottom: 0;
	left: 0;
}

.resume-last-update {
	color: #787878;
	font-size: 1rem;
	text-align: end;
}

.resume-body {
	display: flex;
	gap: 1rem;
	padding: 4rem 0 1rem;
}

.avatar-section {
	flex: 1 0 var(- -avatar-width);
	max-width: var(- -avatar-width);
}

.avatar-container {
	display: flex;
	width: var(- -avatar-width);
	height: var(- -avatar-height);
	/* box-sizing: border-box; */
	border-radius: calc(var(- -avatar-width)/8);
	border: #ce7777 0.25rem solid;
	overflow: hidden;
}

.avatar-container>img {
	width: 100%;
	height: 100%;
	object-fit: contain;
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
}

.case-list {
	border-radius: 0.25rem;
	box-shadow: 0px 2px 6px rgb(0 0 0/ 33%);
	overflow: hidden;
}

.case-list-header {
	display: flex;
	align-items: center;
	background: #efd9d9;
	color: #ce7777;
	padding: 0.5rem 0.25rem;
}

.case-list-header-icon {
	width: 2rem;
	height: 2rem;
	padding-left: 1rem;
}

.case-list-header-icon>svg {
	fill: #ce7777;
}

.case-list-header h1 {
	font-size: 1rem;
	flex: 1;
	padding-left: 1rem;
}

.case-list-header .more-button {
	font-size: 1rem;
	padding: 0.25rem 0.75rem;
	cursor: pointer;
}

.case-list-header .more-button:hover {
	background: #eaeaea;
}

.case-list-body {
	padding: 1.5rem 1.5rem 2rem;
}

.comment-table {
	display: table;
	table-layout: fixed;
	position: relative;
	width: 100%;
	border-spacing: 0 1rem;
	margin: -1rem 0;
}

.comment-table-row {
	display: table-row;
}

.comment-table-row:hover:not(.header) .comment-table-col-content {
	background: #e7e7e7;
}

.comment-table-col {
	display: table-cell;
}

.comment-table-col-content {
	display: flex;
	padding: 0.75rem 1rem;
	border-top: 1px #777 solid;
	border-bottom: 1px #777 solid;
}

.comment-table-col:first-child>.comment-table-col-content {
	border-top-left-radius: 1rem;
	border-bottom-left-radius: 1rem;
	border-left: 1px #777 solid;
}

.comment-table-col:last-child>.comment-table-col-content {
	border-top-right-radius: 1rem;
	border-bottom-right-radius: 1rem;
	border-right: 1px #777 solid;
}

.comment-table-row.header .comment-table-col-content {
	background: #ce7777;
	color: #f8f8f8;
	border: none;
}

#replace {
	font-size: 25px;
	height: 25px;
}

#replace:hover {
	font-size: 25px;
	height: 25px;
	color: lightgrey;
}
</style>

</head>

<!--BOBY-->

<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<!-- 內容-會員 -->
	<main>
		<div class="page-container">
			<div class="resume-container">
				<h1 class="resume-title" style="color: #ce7777;">會員資訊PROFILE</h1>
				<div class="resume-body">
					<div class="resume-section">
						<h2 class="resume-body-title"></h2>
						<input style="display: none;" value="${member.memberID}"
							id="idvalue"></input>
						<div class="resume-no">
							@${member.account}<span style="color: #0089ac;">#${member.memberID}</span>
						</div>
						<div class="resume-name">${member.memName}
							(${member.memNickName})</div>
						<div class="resume-contact">
							<div class="resume-contact-item">
								<span style="color: #ce7777; font-size: medium;">✉</span><a
									href="mailto:${member.eMail}">${member.eMail}</a>
							</div>
							<div class="resume-contact-item">
								<span>📞</span>${member.phone}
							</div>
						</div>


					</div>
					<div class="avatar-section">
						<div class="avatar-container">
							<img
								src="<c:url value='/_01_member.ShowPhoto.controller?account=${member.account}'/>"
								alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 內容-會員結束 -->

		<!-- 內容-哈拉區貼文 -->
		<div class="page-container cart">
			<div class="resume-container">
				<h1 class="resume-title">
					哈拉區貼文
				</h1>
				<div class="case-list-body">
						<!-- Migrant from Resume to Case list -->
						<div class="comment-table">
							<div class="comment-table-row header">
								<div class="comment-table-col">
									<div class="comment-table-col-content">貼文編號</div>
								</div>
								<div class="comment-table-col">
									<div class="comment-table-col-content">標題</div>
								</div>
								<div class="comment-table-col">
									<div class="comment-table-col-content">瀏覽次數</div>
								</div>
								<div class="comment-table-col">
									<div class="comment-table-col-content">發文日期</div>
								</div>

							</div>
							<c:forEach var="bean" items="${classList}">
								<div class="comment-table-row"
									onclick="window.location='<c:url value='/_06_halaAndQa.goHalaPage.controller?halaid=${bean.halaId}'/>'">
									<div class="comment-table-col">
										<div class="comment-table-col-content">
											${bean.halaId}</div>
									</div>
									<div class="comment-table-col">
										<div class="comment-table-col-content">
											${bean.title}</div>
									</div>
									<div class="comment-table-col">
										<div class="comment-table-col-content">
											${bean.watch}</div>
									</div>
									<div class="comment-table-col">
										<div class="comment-table-col-content">
											${bean.postdate}</div>
									</div>
									
								</div>
							</c:forEach>
						</div>
					</div>
			</div>
		</div>
		<!-- 內容-哈拉區貼文 -->

		<!-- 內容-教師履歷 -->
		<div class="page-container">
			<div class="resume-container">
				<h1 class="resume-title">
					<a href="">教師履歷</a>
				</h1>
			</div>
		</div>
		<!-- 內容-教師履歷 -->

		<!-- 內容-會員商品 -->
		<div class="page-container">
			<div class="resume-container">
				<h1 class="resume-title">會員商品</h1>
			</div>
		</div>
		<!-- 內容-會員商品 -->

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
	<!-- SweetAlert js -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- SweetAlert js -->
	<script>
                    $(document).ready(function () {
                        //以ul li包子選單
                        $('.cart>li>a').click(function (event) {
                            event.preventDefault();
                            $(this).toggleClass('active');
                            $(this).siblings('ul').slideToggle(500);
                        });
                        //html以div h3 h5包子選單
                        $('.list h3').click(function (event) {
                            $(this).toggleClass('active');
                            $(this).siblings('h5').slideToggle(500);
                        });

                    });
                </script>
</body>

</html>