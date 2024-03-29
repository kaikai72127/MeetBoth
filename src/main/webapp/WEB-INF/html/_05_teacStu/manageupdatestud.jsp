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
	width:60%;
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
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">後臺管理-修改學生需求</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
								<form action="<c:url value='/admin/_05_teacStu.updatedataStud.controller' />" method="Post" enctype="multipart/form-data">
								<input name="views" type="hidden" value="${bean.views}">
									<div class="post-video embed-responsive embed-responsive-16by9"
										style="height: auto; padding-bottom: 100px;">
										<div style="display: flex">
											<button class="MBbtn" id="cancel-btn"
												onclick="window.location='/MeetBoth/admin/_05_teacStu.searchAllStud.controller/1'">返回</button>
										</div>
										<div>
											<span>會員編號 :&ensp;&ensp;&ensp;&ensp;&ensp;<input value="${bean.member.memberID}" type="text" name="pid" class="MBinput" placeholder="自動產生" readonly></span>
										</div>
										<div>
											<span>履歷貼文編號 :&ensp;<input name="studno" value="${bean.studno}" type="text" name="pid" class="MBinput" placeholder="自動產生" readonly></span>
										</div>
										<div>
											<span>需求科目 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="subjectItem" value="${bean.subjectItem}" type="text" name="pna" class="MBinput" placeholder="請輸入您的需求科目...Ex:國小數學" required></span>
										</div>
										<div>
											<span>上課地點 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="studLoc" value="${bean.studLoc}" type="text" name="ppr" class="MBinput" placeholder="請輸入您的上課地點...Ex:新北市" required></span>
										</div>
										<div>
											<span>教學對象 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="object" value="${bean.object}" type="text" name="pmid" class="MBinput" placeholder="請輸入您的教學對象...Ex:國小" required></span>
										</div>
										<div>
											<span>自備教材 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="textBook" value="${bean.textBook}" type="text" name="pinvt" class="MBinput" placeholder="請輸入您的自備教材...Ex:希望有其他課內教材" required></span>
										</div>
										<div>
											<span>開始日期 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="startDate" value="${bean.startDate}" type="text" name="ppo" class="MBinput" placeholder="請輸入您的開始日期...Ex:隨時" required></span>
										</div>
										<div>
											<span>課程期間 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="period" value="${bean.period}" type="text" name="pup" class="MBinput" placeholder="請輸入您的課程期間...Ex:兩個月以上，每周上課兩次" required></span>
										</div>
										<div>
											<span>上課時段 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="studTime" value="${bean.studTime}" type="text" name="pps" class="MBinput" placeholder="請輸入您的上課時段...Ex:平日下午" required></span>
										</div>
										<div>
											<span>上課方式 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="classMode" value="${bean.classMode}" type="text" name="pch" class="MBinput" placeholder="請輸入您的上課模式...Ex:面授" required></span>
										</div>
										<div>
											<span>薪資 :&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;<input name="price" value="${bean.price}" type="text" name="pch" class="MBinput" placeholder="請輸入您的希望待遇...Ex:800" required></span>
										</div>
										<div>
											<span>老師試教 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="testTeacMode" value="${bean.testTeacMode}" type="text" name="pch" class="MBinput" placeholder="請輸入您的老師試教...Ex:需試教，面授" required></span>
										</div>
										<div>
											<span>學歷要求 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="educaLimit" value="${bean.educaLimit}" type="text" name="pch" class="MBinput" placeholder="請輸入您的學歷要求...Ex:大學以上" required></span>
										</div>
										<div>
											<span>應徵方式 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="conMethod" value="${bean.conMethod}" type="text" name="pch" class="MBinput" placeholder="請輸入您的應徵方式...Ex:電話聯絡" required></span>
										</div>
										<div>
											<span>聯絡時間 :&ensp;&ensp;&ensp;&ensp;&ensp;<input name="conTime" value="${bean.conTime}" type="text" name="pch" class="MBinput" placeholder="請輸入您的聯絡時間...Ex:平日早上、平日下午" required></span>
										</div>
										<div>
											<input type="submit" class="MBbtn" value="確定" style="margin-top:15px;margin-left:900px;font-size:35px;">
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
          document.getElementById("cancel-btn").addEventListener("click", function (event) {
              event.preventDefault();
              window.location.href = "/MeetBoth/admin/_05_teacStu.searchAllStud.controller/1";
          });
    </script>
</body>
</html>