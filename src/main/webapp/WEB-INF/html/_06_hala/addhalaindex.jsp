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
<%-- <jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" /> --%>
<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />

<style>
.star-off {
	color: black;
}

h1 {
	font-size: 18px;
	font-weight: 700;
	text-align: center;
	margin: 20px 0;
}

.cart>li>a {
	border: 1px solid gray;
	border-radius: 10px;
	color: gray;
	font-weight: 600;
	font-size: 16px;
	padding: 10px;
	text-align: center;
}

.cart>li {
	padding-bottom: 10px;
}

.cart>li>ul>li>a {
	border: solid 1px gray;
	border-radius: 10px;
	text-align: center;
	font-size: 18px;
}

.cart a {
	display: block;
	text-decoration: none;
}

.cart ul {
	display: none;
}

.cart ul li {
	margin: 10px;
}

.cart ul li a {
	color: #000;
}

.navbar.navbar-custom.navbar-fixed-top.headershadow {
	background-color: black;
	margin-bottom: 0;
}

.navbar.navbar-custom.navbar-fixed-top.headershadow>div>div>img {
	height: 70;
}

.nav.navbar-nav.navbar-right>li>a {
	color: white !important;
}

.fas.fa-shopping-cart.text-primary {
	color: white !important;
}

#ChartData>div>div>div>div>svg>g>text {
	font-size: 22px;
}

#ChartData>div>div>div>div>svg>g>g>g>text {
	font-size: 17px;
}

.navbar-brand {
	color: white !important;
}

span {
	color: white;
	font-size: 25px;
	font-weight: 550;
	margin: auto 10;
	line-height: 2.5;
}

a {
	color: white;
	font-size: 25px;
	font-width: 550;
}

.MBbtn {
	font-size: 25px;
	background-color: black;
	color: white;
	border: solid 1px white;
	border-radius: 50%;
	margin: auto 10px;
	transition: color 0.5s;
	text-align: center;
}

.MBbtn:hover {
	font-size: 25px;
	background-color: black;
	color: yellow;
	border: solid 1px yellow;
	margin: auto 10px;
	border-radius: 50%;
}

.MBinput {
	font-size: 25px;
	background-color: black;
	color: white;
	border: solid 1px white;
	margin: auto 10px;
	transition: color 0.5s;
	text-align: center;
}

.MBinput:hover {
	font-size: 25px;
	background-color: black;
	color: yellow;
	border: solid 1px yellow;
	margin: auto 10px;
}

#columnchart_values>div>div>div>svg>g>text {
	font-size: 25px;
}

a:hover {
	color: yellow;
	border-bottom: solid 1px yellow;
}

.prodtable>thead>tr>th {
	border-right: solid 1px white;
	text-align: center;
}

.prodtable>tbody>tr>td {
	border-right: solid 1px white;
	border-top: solid 1px white;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main" style="background-color: black;">
			<section class="module"
				style="padding-top: 10px; padding-bottom: 0px;">
				<div class="container" style="width: 100%; background-color: black;">
					<!-- 整頁 -->
					<div class="row">
						<!-- 整頁 -->
						<!-- 左邊欄位開始 -->
						<jsp:include page="/WEB-INF/html/fragment/AdminIndexSideBar.jsp" />
						<!-- 左邊欄位結束 -->
						<!-- 						右邊欄位開始 -->
						<div class="col-sm-8 col-sm-offset-1"
							style="margin-left: 20px; width: 75%; border-left: solid 1px yellow;">
							<div class="post">
								<!-- 							標題 -->
								<div class="post-thumbnail"
									style="padding-bottom: 0; margin-bottom: 0;">
									<h1
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">後臺管理-新增貼文</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<form
										action="<c:url value='/admin/_06_halaAndQa.AddHalaIndex.controller' />"
										method="Post" enctype="multipart/form-data">
										<div
											class="post-video embed-responsive embed-responsive-16by9"
											style="height: auto; padding-bottom: 100px;">
											<div style="display: flex">
												<button class="MBbtn"
													onclick="window.location='/MeetBoth/admin/_06_halaAndQa.SelectAllHalaIndex.controller'">返回</button>
											</div>

											<div>
												<span>貼文編號 :&ensp;<input type="text" name="halaId"
													class="MBinput" placeholder="自動產生" readonly></span>
											</div>
											<div>
												<span>貼文標題 :&ensp;<input type="text" name="title"
													class="MBinput" placeholder="不能為空"></span>
											</div>
											<div>
												<span>貼文類別 :&ensp;<select name="halaclassname"
													style="width: 312px; height: 66.1px;" class="MBinput">
														<option value="公告">公告</option>
														<option value="閱讀心得">閱讀心得</option>
														<option value="資料分享">資料分享</option>
														<option value="圖書推薦">圖書推薦</option>
														<option value="教學文章">教學文章</option>
														<option value="JAVA">JAVA</option>
														<option value="HTML">HTML</option>
														<option value="Spring">Spring</option>
														<option value="SpringBoot">SpringBoot</option>
														<option value="SpringMVC">SpringMVC</option>
														<option value="SQL Server">SQL Server</option>
														<option value="My SQL">My SQL</option>
														<option value="Hibernate">Hibernate</option>
														<option value="VScode">VScode</option>
														<option value="eclipse">eclipse</option>
														<option value="SpringTool">SpringTool</option>
														<option value="JDBC">JDBC</option>
														<option value="Servlet">Servlet</option>
														<option value="JavaScript">JavaScript</option>
														<option value="jQuery">jQuery</option>
														<option value="Azure">Azureoption</option>
														<option value="RESTful">RESTful</option>
														<option value="c++">c++</option>
														<option value="python">python</option>
														<option value="其他">其他</option>
												</select></span>
											</div>

											<div>
												<span>會員編號 :&ensp;<input type="text" name="memberid"
													class="MBinput" value="${Member.memberID}" readonly></span>
											</div>

											<div style="display: flex;">
												<span>上傳照片</span>
												<div
													style="height: 200px; width: 200px; background-color: #272727; text-align: center; margin: 15px;">
													<img id="preImg"
														style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
														src="<c:url value='/html/images/meatball-200.png'/>" />
												</div>
												<input class="MBinput" type="file" name="images"
													id="images5278" accept=".jpg, .png">
											</div>

											<div>
												<div id="commentDiv">
													<span>文章內容 :&ensp;</span>
												</div>
											</div>
											<div>
												<textarea name="halacontent"
													style="margin-left: 10px; resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 25px; color: white; background-color: black;"
													placeholder="請輸入文章內容"></textarea>
											</div>
											<div>
												<input type="submit" class="MBbtn" value="確定"
													style="margin-top: 15px; margin-left: 900px; font-size: 35px;">
												<button class="MBbtn" type="button" id="fill-form-btn"
													style="margin-top: 15px; margin-left: 900px; font-size: 35px;">一鍵輸入</button>
											</div>
										</div>
									</form>
								</div>
								<!--       右邊第一部分結束 -->
								<hr class="divider-w pt-20">
							</div>
						</div>
						<!-- 		右邊欄位結束 -->
					</div>
				</div>
			</section>
			<%-- 			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" /> --%>
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
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script>
		$(document).ready(function() {
			//以ul li包子選單
			$('.cart>li>a').click(function(event) {
				event.preventDefault();
				$(this).toggleClass('active');
				$(this).siblings('ul').slideToggle(500);
			});
			//html以div h3 h5包子選單
			$('.list h3').click(function(event) {
				$(this).toggleClass('active');
				$(this).siblings('h5').slideToggle(500);
			});

		});
	</script>
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
	<script>
		document
				.getElementById('fill-form-btn')
				.addEventListener(
						'click',
						function() {
							// 範例標題文字
							var title = '家教網會員權益公告';

							// 範例內容文字
							var content = '近期接到會員檢舉有不肖人士，利用1111家教網名義騷擾會員，經查證確有此事，我方已開始進行法律提告程序中，以確保家教網會員權益。\n提醒您若有遇到有心人士騷擾\n1.請記下相關的「案件編號」或「履歷編號」\n2.提供騷擾人士的FB或通訊軟體的帳號及相關對話記錄的截圖\n以上兩者請同時附上(資料提供我方客服查證)，以便我們後續處理進行處分。';

							// 將範例文字填入標題與內容欄位
							document.getElementsByName('title')[0].value = title;
							document.getElementsByName('halacontent')[0].value = content;
						});
	</script>

</body>
</html>