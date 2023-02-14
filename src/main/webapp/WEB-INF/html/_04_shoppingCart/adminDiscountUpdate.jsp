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
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
<script>
	$(function() {
		var dateFormat = "mm/dd/yy", from = $("#from").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			to.datepicker("option", "minDate", getDate(this));
		}), to = $("#to").datepicker({
			defaultDate : "+1w",
			changeMonth : true,
			numberOfMonths : 1
		}).on("change", function() {
			from.datepicker("option", "maxDate", getDate(this));
		});

		function getDate(element) {
			var date;
			try {
				date = $.datepicker.parseDate(dateFormat, element.value);
			} catch (error) {
				date = null;
			}

			return date;
		}
	});
</script>
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
						<div class="col-sm-4 col-md-3 sidebar"
							style="width: 20%; padding-right: 0px;">
							<div class="widget">
								<a href="/MeetBoth/_03_product.index.controller"><img
									src="/MeetBoth/html/assets/images/shop/警告.jpg"
									style="padding-bottom: 10px;"></a>
								<ul class="cart">
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">會員管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有會員清單</a></li>
										</ul></li>
									<li><a href="" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">商品管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a
												href="/MeetBoth/_03_product.productindex.controller"
												style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有商品清單</a></li>
											<li><a
												href="/MeetBoth/_03_product.MBinsertProd.controller"
												style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">新增商品</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">課程管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有課程清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">徵才管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有貼文清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">討論區管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有貼文清單</a></li>
										</ul></li>
									<li><a href="#" style="color: white; font-size: 20px;"
										class="btn btn-d btn-round">訂單管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a
												href="/MeetBoth/admin/shoppingCartOrders.controller"
												style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有訂單清單</a></li>
											<li><a href="/MeetBoth/admin/discounts.controller"
												style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">折扣碼管理</a></li>
										</ul></li>
								</ul>
								<a href="#"><img
									src="/MeetBoth/html/assets/images/shop/警告2.jpg"
									style="padding-bottom: 10px;"></a>
							</div>
						</div>
						<!-- 左邊欄位結束 -->
						<!-- 						右邊欄位開始 -->
						<div class="col-sm-8 col-sm-offset-1"
							style="margin-left: 20px; width: 75%; border-left: solid 1px yellow;">
							<div class="post">
								<!-- 							標題 -->
								<div class=
								"post-thumbnail"
									style="padding-bottom: 0; margin-bottom: 0;">
									<h1
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">後臺管理-訂單管理</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<button class="MBbtn"
										onclick="window.location='/MeetBoth/admin/discounts.controller'">返回</button>
									<form
										action="<c:url value='/admin/discountsUpdateMain.controller' />"
										method="Post" enctype="multipart/form-data">
										<div
											class="post-video embed-responsive embed-responsive-16by9"
											style="height: auto; padding-bottom: 100px; display: flex;">
											<div style="width: 50%;">
												<div>
													<span>折扣&ensp;編碼 :&ensp;<input name='discountNo'
														value="${bean.discountNo}" type="text" class="MBinput"
														readonly></span>
												</div>
												<div>
													<span>折扣&ensp;名稱 :&ensp;<input name='discountName'
														value="${bean.discountName}" type="text" class="MBinput"></span>
												</div>
												<div>
													<span>折扣&ensp;名稱 :&ensp;<input name='discountPrice'
														value="${bean.discountPrice}" type="text" class="MBinput"></span>
												</div>
												<div>
													<span>折扣&ensp;敘述 :&ensp;<input name='discountDesc'
														value="${bean.discountDesc}" type="text" class="MBinput"></span>
												</div>
												<div>
													<span>開始&ensp;日期 : &ensp;<input
														style="color: black; margin-left: 1.5px" type="text"
														id="from" name="discountStart"
														value="${bean.discountStart}"></span>
												</div>
												<div>
													<span>到期&ensp;日期 : &ensp;<input
														style="color: black; margin-left: 1.5px" type="text" id="to"
														name="discountEnd" value="${bean.discountEnd}"></span>
												</div>
											</div>
											<div style="width: 50%;">
												<div>
													<input type="submit" class="MBbtn" value="確定"
														style="margin-top: 15px; margin-left: 400px; font-size: 35px;">
												</div>
											</div>
										</div>
									</form>
									<!--       右邊第一部分結束 -->
								</div>
							</div>
							<!-- 		右邊欄位結束 -->
						</div>
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

	<!-- 用於下拉選單 -->
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#ordS').val();
		console.log(v)
		switch (v) {
		case '處理中':
			$(".A1").attr('selected', true)
			break;
		case '備貨中':
			$(".A2").attr('selected', true)
			break;
		case '已完成':
			$(".A3").attr('selected', true)
			break;
		}
	</script>
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#paymentS').val();
		console.log(v)
		switch (v) {
		case '未付款':
			$(".B1").attr('selected', true)
			break;
		case '已付款':
			$(".B2").attr('selected', true)
			break;
		case '退款中':
			$(".B3").attr('selected', true)
			break;
		case '已退款':
			$(".B4").attr('selected', true)
			break;
		}
	</script>
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#deliveryS').val();
		console.log(v)
		switch (v) {
		case '無':
			$(".C1").attr('selected', true)
			break;
		case '備貨中':
			$(".C2").attr('selected', true)
			break;
		case '已發貨':
			$(".C3").attr('selected', true)
			break;
		case '已取貨':
			$(".C4").attr('selected', true)
			break;
		case '退貨中':
			$(".C5").attr('selected', true)
			break;
		case '已退貨':
			$(".C6").attr('selected', true)
			break;
		}

		//-----更新商品數量--------------------------
		$(".itemQtyChange").change(function() {
			let seqno = $(this).attr("id");
			var updateQty = $(this).val();
			console.log("---------------" + seqno);
			console.log(updateQty);
			$.ajax({
				url : '/MeetBoth/updateOrderItemQty.controller',
				method : "post",
				dataType : "text",
				//這邊的"id"是給controller的變數名
				data : {
					"seqno" : seqno,
					"updateQty" : updateQty
				},
			}).done(function() {
				location.reload();
			})

		});
	</script>
	<!-- 用於下拉選單 -->

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
</html>