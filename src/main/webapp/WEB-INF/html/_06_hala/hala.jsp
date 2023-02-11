<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/css/main.css";
%>
<%
String pathimg = request.getContextPath();
String basePathimg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathimg
		+ "/html/images/meatball-icon.png";
%>
<%
String basePathimg2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/images/meatball-200.png";
%>

<!-- 引入共同的頁首 -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />


<style>
.star-off {
	color: black;
}

.tab {
	width: 110%;
	border: 5px double gray;
	border-radius: 10px;
}

.trr {
	border: 1px dashed gray
}

.td1 {
	padding: 5px;
	font-size: 18px
}

.td11 {
	padding: 5px;
	width: 10%;
}

.td12 {
	padding: 0;
	width: 8%;
}

.td13 {
	padding: 0;
	width: 40%;
}

.td14 {
	padding: 0;
	width: 10%;
}

.td15 {
	padding: 0;
	width: 10%;
}

.td2 {
	padding: 5px;
	font-size: 14px;
}

input[type="submit"] {
	margin: 10px;
}

.btn-container {
	display: flex;
	justify-content: flex-end;
}

.btn-container button {
	margin-left: 10px;
}

.long {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-box-orient: vertical;
	-webkit-line-clamp: 4;
	box-sizing: border-box;
}

.color-text {
	color: red;
}

.titlesize {
	font-size: 18;
	color: red
}
</style>


</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>



		<!-- 中間欄位開始 -->

		<!-- 			<table -->
		<!-- 				style='border-style: outset; margin-top: 80px; margin-left: 80px'> -->
		<!-- 				<tr> -->
		<!-- 					<th><strong>熱門貼文</strong></th> -->
		<!-- 				</tr> -->
		<!-- 				<tr style='border-style: outset;'> -->
		<!-- 					<td>標題</td> -->
		<!-- 					<td>瀏覽次數</td> -->
		<!-- 				</tr> -->
		<%-- 				<c:forEach var="topList" items="${topList}"> --%>
		<!-- 					<tr style='border-style: outset;'> -->
		<!-- 						<td><a -->
		<%-- 							href="<c:url value='/_06_halaAndQa.goHalaPage.controller?halaid=${bean.halaId}'/>"> --%>
		<%-- 								${topList.title} </a></td> --%>
		<%-- 						<td>${topList.watch}</td> --%>
		<!-- 					</tr> -->
		<%-- 				</c:forEach> --%>
		<!-- 			</table> -->








		<!-- 搜尋方式開始 -->
		<section class="module">







			<div class="container">
				<div>
					<table style='margin: auto; width: 70%;'>
						<tr style='width: 100px'>
							<th><h2>&#x1F451;TOP&#9316;熱門貼文 &#x1F451;</h2></th>
						</tr>
						<tr style='border-style: outset; background-color: #FFFF6F'>
							<td class="color-text"><h3>標題</h3></td>
							<td class="color-text" style="border-left: outset black"><h3>瀏覽次數</h3></td>
							<td class="color-text" style="border-left: outset black"><h3>作者</h3></td>
						</tr>
						<c:forEach var="topList" items="${topList}">
							<tr style='border-style: outset; background-color: #FFFFCE;'>
								<td style="border-left: outset black"><a
									href="<c:url value='/_06_halaAndQa.goHalaPage.controller?halaid=${topList.halaId}'/>">
										&#128293;${topList.title} </a></td>
								<td style="border-left: outset black">&#129321;${topList.watch}</td>
								<td style="border-left: outset black">&#128585;${topList.memberBean.memberID}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
				<br> <br>

				<div class="row">
					<div>
						<div style='width: 40%; text-align: center; margin: 0 auto;'
							class="widget">
							<form role="form" method="post"
								action="<c:url value='/_06_halaAndQa.searchAllLike.controller' />">
								<div class="search-box">
									<input name="search" class="form-control" type="text"
										placeholder="Search..." />
									<button class="search-btn" type="submit">
										<i class="fa fa-search"></i>
									</button>
								</div>
							</form>
						</div>
					</div>
					<br>
					<!-- 搜尋方式結束 -->

					<!-- 表格欄位開始 -->
					<div class="col-sm-8 col-sm-offset-1" style='width: 80%'>
						<div class="post">
							<div class="post-header font-alt">
								<h2 class="post-title">
									<a href="#">哈拉區貼文列表</a>
								</h2>
								<div class="btn-container">
									<form
										action="<c:url value='/_06_halaAndQa.SelectAllHala.controller' />">
										<button style="float: right" class="btn btn-b btn-circle"
											type="submit">查詢全部貼文</button>
									</form>
									<form
										action="<c:url value='/_06_halaAndQa.goAddHala.controller' />">
										<button style="float: right" class="btn btn-b btn-circle"
											type="submit">發文</button>
									</form>
								</div>
							</div>
							<div>
								<form method="get"
									action="<c:url value='/_06_halaAndQa.SelectHalaClass.controller' />">
									<input type="submit" name="halaclassname" value="公告"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="閱讀心得" style="width: 17%">
									<input type="submit" name="halaclassname" value="資料分享"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="圖書推薦" style="width: 17%">
									<input type="submit" name="halaclassname" value="教學文章"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="JAVA" style="width: 17%">
									<input type="submit" name="halaclassname" value="HTML"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="Spring" style="width: 17%">
									<input type="submit" name="halaclassname" value="SpringBoot"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="SpringMVC" style="width: 17%">
									<input type="submit" name="halaclassname" value="SQL Server"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="My SQL" style="width: 17%">
									<input type="submit" name="halaclassname" value="Hibernate"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="VScode" style="width: 17%">
									<input type="submit" name="halaclassname" value="eclipse"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="SpringTool" style="width: 17%">
									<input type="submit" name="halaclassname" value="JDBC"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="Servlet" style="width: 17%">
									<input type="submit" name="halaclassname" value="JavaScript"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="jQuery" style="width: 17%">
									<input type="submit" name="halaclassname" value="Azure"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="RESTful" style="width: 17%">
									<input type="submit" name="halaclassname" value="c++"
										style="width: 17%"> <input type="submit"
										name="halaclassname" value="python" style="width: 17%">
									<input type="submit" name="halaclassname" value="其他"
										style="width: 17%">
								</form>
							</div>
							<div class="post-entry">
								<table class="tab">
									<tr class="trr">
										<td class="td11">圖片</td>
										<td class="td12">文章分類</td>
										<td class="td13">標題/內容</td>
										<td class="td14">讚/瀏覽次數</td>
										<td class="td15">貼文/修改日期</td>
									</tr>
									<c:forEach var="bean" items="${classList}">
										<tr class="trr">
											<td><img width='80'
												src="<c:url value='/_06_halaAndQa.picsave.controller?id=${bean.halaId}' />"></td>
											<td class="td2"><p>${bean.halaclassname}</p></td>
											<td class="td2"><a
												href="<c:url value='/_06_halaAndQa.goHalaPage.controller?halaid=${bean.halaId}'/>">
													<div class="long">
														<div class="titlesize">
															<p>${bean.title}</p>
														</div>
														<p>${bean.halacontent}</p>
													</div>
											</a></td>
											<td class="td2"><button id="tumbBtn">讚</button>
												<p id="tumbhere">
													讚:${bean.tumb} <input type="hidden" id="tumbid"
														value="${bean.halaId}">
												</p>
												<p id="watch">瀏覽次數:${bean.watch}</p></td>
											<td class="td2"><p>${bean.postdate}</p></td>
										</tr>
									</c:forEach>
								</table>
								<div class="pagination font-alt">
									<a href="#"><i class="fa fa-angle-left"></i></a><a
										class="active" href="#">1</a><a href="#">2</a><a href="#">3</a><a
										href="#">4</a><a href="#"><i class="fa fa-angle-right"></i></a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- 表格欄位結束 -->
		<!-- 中間欄位結束 -->
	</main>
	<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
	</div>
	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<%
	String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/jquery.min.js";
	%>

	<%
	String basePath2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/browser.min.js";
	%>

	<%
	String basePath3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/breakpoints.min.js";
	%>

	<%
	String basePath4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/util.js";
	%>

	<%
	String basePath5 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/main.js";
	%>
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>

	<script>
		const tumbBtn = document.getElementById("tumbBtn");
		const tumbhere = document.getElementById("tumbhere");
		var i = 0;
		tumbBtn
				.addEventListener(
						"click",
						function() {
							i++;
							let currentCount = parseInt(tumbhere.innerHTML);
							if (i % 2 == 1) {
								tumbhere.innerHTML = currentCount + 1;
							} else {
								tumbhere.innerHTML = currentCount - 1;
							}
							console.log(i % 2);

							const tumbid = document.getElementById("tumbid");
							let tumbValue = tumbid.value;

							fetch(
									`/MeetBoth/tumbhere.controller/${tumbhere.innerHTML}/${tumbValue}`,
									{
										method : 'POST',
										headers : {
											'Content-Type' : 'application/json'
										},
									}).then(function(response) {
								if (response.status == 200) {

								}
							});
						});
	</script>


</body>
</html>