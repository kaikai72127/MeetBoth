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
						<jsp:include
                page="/WEB-INF/html/fragment/AdminIndexSideBar.jsp"
              />
						<!-- 左邊欄位結束 -->
						<!-- 						右邊欄位開始 -->
						<div class="col-sm-8 col-sm-offset-1"
							style="margin-left: 20px; width: 75%; border-left: solid 1px yellow;">
							<div class="post">
								<!-- 							標題 -->
								<div class="post-thumbnail"
									style="padding-bottom: 0; margin-bottom: 0;">
									<h1
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">後臺管理-修改商品</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
								<form action="<c:url value='/admin/_03_product.MBupdateProdAction.controller' />" method="Post" enctype="multipart/form-data">
									<div class="post-video embed-responsive embed-responsive-16by9"
										style="height: auto; padding-bottom: 100px;">
										<div style="display: flex">
											<input type="button" class="MBbtn" onclick="window.location='/MeetBoth/admin/_03_product.productindex.controller/1'" value="返回">
										</div>
										<div>
											<span>商品狀態 :&ensp;<input value="${prod.prodState}" type="text" name="pst" class="MBinput" placeholder="上架或下架"></span>
										</div>
										<div>
											<span>商品編號 :&ensp;<input value="${prod.prodID}" type="text" name="pid" class="MBinput" placeholder="自動產生" readonly></span>
										</div>
										<div>
											<span>商品名稱 :&ensp;<input value="${prod.prodName}" type="text" name="pna" class="MBinput" placeholder="不能為空"></span>
										</div>
										<div>
											<input type="hidden" value="${prod.prodtype.prodClass}" name="pClass">
											<span>商品類別 :&ensp;<select name="pty"
												style="width: 312px; height: 66.1px;" class="MBinput">
												<option value="1">文具</option>
												<option value="2">教具</option>
												<option value="3">運動用品</option>
												<option value="4">學生用品</option>
												<option value="5">全新教科書</option>
												<option value="6">全新好書</option>
												<option value="7">二手教科書</option>
												<option value="8">二手好書</option>
												<option value="9">桌上小物</option>
												<option value="10">教室小物</option>
												<option value="11">3c小物</option>
												<option value="12">益智小物</option>
											</select></span>
										</div>
										<div>
											<span>商品價格 :&ensp;<input value="${prod.prodPrice}" type="text" name="ppr" class="MBinput" placeholder="只能數字"></span>
										</div>
										<div>
											<span>賣家編號 :&ensp;<input value="${prod.memberBean.memberID}" type="text" name="pmid" class="MBinput" placeholder="只能編號"></span>
										</div>
										<div>
											<span>商品庫存 :&ensp;<input value="${prod.inventory}" type="text" name="pinvt" class="MBinput" placeholder="只能數字"></span>
										</div>
										<div>
											<span>上架時間 :&ensp;<input value="${prod.prodPost}" type="text" name="ppo" class="MBinput" placeholder="自動產生" readonly></span>
										</div>
										<div>
											<span>更新時間 :&ensp;<input value="${prod.prodUpdate}" type="text" name="pup" class="MBinput" placeholder="自動產生" readonly></span>
										</div>
										<div>
											<span>瀏覽次數 :&ensp;<input value="${prod.prodCheck}" type="text" name="pch" class="MBinput" readonly></span>
										</div>
										<div style="display: flex;">
											<span>上傳商品照片</span> 
											<div style="height:200px;width:200px;background-color:#272727;text-align:center;margin:15px;">
											<img id="preImg" style="max-width: 100%; max-height: 100%; height: auto; width: auto;" src="<c:url value='/_03_product.showPicture.controller?id=${prod.prodID}' />" />
											</div>
											<input class="MBinput" type="file" name="pPic" id="images5278" accept=".jpg,.png"> 
										</div>
										<div>
											<div id="commentDiv">
												<span>商品評論 :&ensp;</span>
											</div>
										</div>
										<div>
											<textarea name="pdr" 
												style="margin-left: 10px; resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 25px; color: white; background-color: black;" placeholder="商品評論 可以不填"
												>${prod.directions}</textarea>
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
	</body>
</html>