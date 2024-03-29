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
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">後臺管理-修改課程</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<form
										action="<c:url value='/admin/_02_subLocation.MBupdateCourseAction.controller' />"
										method="Post" enctype="multipart/form-data">
										<div
											class="post-video embed-responsive embed-responsive-16by9"
											style="height: auto; padding-bottom: 100px;">
											<div style="display: flex">
												<button class="MBbtn"
													onclick="window.location='/MeetBoth/admin/_02_subLocation.index.controller'">返回</button>
											</div>
											<!-- 											<div> -->
											<%-- 												<span>商品狀態 :&ensp;<input value="${prod.prodState}" --%>
											<!-- 													type="text" name="pst" class="MBinput" placeholder="上架或下架"></span> -->
											<!-- 											</div> -->
											<div>
												<span>課程編號 :&ensp;<input value="${course.courseID}"
													type="text" name="courseID" class="MBinput"
													placeholder="自動產生" readonly></span>
											</div>
											<div>
												<span>課程名稱 :&ensp;<input value="${course.courseName}"
													type="text" name="courseName" class="MBinput"
													placeholder="不能為空"></span>
											</div>
											<div>
												<span>課程類別 :&ensp;<input type="hidden"
														id="cClass" class="MBinput"
														value="${course.coursetype.courseClass}${param.cClass}"><select
													name="courseClass" style="width: 312px; height: 66.1px;"
													class="MBinput">
														<option class="A1" value="1">語言學習</option>
														<option class="A2" value="2">升學補習</option>
														<option class="A3" value="3">專業科目</option>
														<option class="A4" value="4">人文課程</option>
														<option class="A5" value="5">程式課程</option>
												</select></span>
											</div>
											<div>
												<span>課程價格 :&ensp;<input
													value="${course.coursePrice}" type="text"
													name="coursePrice" class="MBinput" placeholder="只能數字"></span>
											</div>
											<div>
												<span>賣家編號 :&ensp;<input
													value="${memberBean.memberID}" type="text" name="memberID"
													class="MBinput" placeholder="只能編號"></span>
											</div>
											<div>
												<span>上架時間 :&ensp;<input value="${course.coursePost}"
													type="text" name="coursePost" class="MBinput"
													placeholder="自動產生" readonly></span>
											</div>
											<div>
												<span>更新時間 :&ensp;<input
													value="${course.courseUpdate}" type="text"
													name="courseUpdate" class="MBinput" placeholder="自動產生"
													readonly></span>
											</div>
											<div style="display: flex;">
												<span>上傳課程照片</span>
												<div
													style="height: 200px; width: 200px; background-color: #272727; text-align: center; margin: 15px;">
													<img id="preImg"
														style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
														src="<c:url value='/showCoursePicture.controller?id=${course.courseID}' />" />
												</div>
												<input class="MBinput" type="file" name="images"
													id="images5278" accept=".jpg,.png">
											</div>
											<div>
												<div id="commentDiv">
													<span>課程介紹 :&ensp;</span>
												</div>
											</div>
											<div>
												<textarea name="courseDirections"
													style="margin-left: 10px; resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 25px; color: white; background-color: black;"
													placeholder="課程介紹 可以不填">${course.courseDirections}</textarea>
											</div>
											<div>
												<input type="submit" class="MBbtn" value="確定"
													style="margin-top: 15px; margin-left: 900px; font-size: 35px;">
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
	<script type="text/javascript">
		// 選取 select 元素
		var selectElement = document.getElementsByName("pty");
		// 取得 typeClassNum 的值
		var typeClassNum = document.getElementsByName("pClass").value;
		// 選取特定的 option 元素
		for (var i = 0; i < selectElement.options.length; i++) {
			if (selectElement.options[i].value == typeClassNum) {
				// 將選到的 option 元素的 selected 屬性設為 true
				selectElement.options[i].selected = true;
				break;
			}
		}
	</script>
	
	<!-- 用於下拉選單 -->
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#cClass').val();
		console.log(v)
		console.log('1231254')
		switch (v) {
		case '1':
			$(".A1").attr('selected', true)
			console.log('1------')
			break;
		case '2':
			$(".A2").attr('selected', true)
			console.log('2------')
			break;
		case '3':
			$(".A3").attr('selected', true)
			console.log('3------')
			break;
		case '4':
			$(".A4").attr('selected', true)
			console.log('4------')
			break;
		case '5':
			$(".A5").attr('selected', true)
			console.log('5------')
			break;
		}
	</script>
	<!-- 用於下拉選單 -->

</body>

</html>