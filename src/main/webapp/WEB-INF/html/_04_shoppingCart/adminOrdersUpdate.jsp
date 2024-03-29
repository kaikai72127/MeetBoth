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
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">後臺管理-訂單管理</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<button class="MBbtn"
										onclick="window.location='/MeetBoth/admin/shoppingCartOrders.controller/1'">返回</button>
									<form
										action="<c:url value='/admin/shoppingCartUpdateOrderMain.controller' />"
										method="Post" enctype="multipart/form-data">
										<div
											class="post-video embed-responsive embed-responsive-16by9"
											style="height: auto; padding-bottom: 100px; display: flex;">
											<div style="width: 50%;">
												<input type="hidden" class="MBinput"
													value="${orderBean.orderNo}" name="orderNo">
												<div>
													<span>訂單&ensp;&ensp;編號 :&ensp;<input
														value="${orderBean.orderUID}" type="text" name="orderNo"
														class="MBinput" readonly></span>
												</div>
												<div>
													<span>會員&ensp;&ensp;姓名 :&ensp;<input
														value="${orderBean.memberbuy.memName}" type="text"
														class="MBinput" readonly></span>
												</div>
												<div>
													<span>收件人姓名 :&ensp;<input name='shippingName'
														value="${orderBean.shippingName}" type="text"
														class="MBinput"></span>
												</div>
												<div>
													<span>收件人電話 :&ensp;<input name='shippingPhone'
														value="${orderBean.shippingPhone}" type="text"
														class="MBinput"></span>
												</div>
												<div>
													<span>收件人地址 :&ensp;<input name='shippingAddress'
														value="${orderBean.shippingAddress}" type="text"
														class="MBinput"></span>
												</div>

											</div>
											<div style="width: 50%;">
												<div>
													<span>訂單&ensp;&ensp;狀態 :&ensp;<input type="hidden"
														id="ordS" class="MBinput"
														value="${orderBean.ordStstus}${param.ordS}"><select
														name='ordStstus' class="fieldWidth MBinput"
														style="width: 312px; height: 66.1px;">
															<option class="A1" value="處理中">處理中</option>
															<option class="A2" value="已完成">已完成</option>
													</select></span>
												</div>
												<div>
													<span>付款&ensp;&ensp;狀態 :&ensp;<input type="hidden"
														id="paymentS" class="MBinput"
														value="${orderBean.paymentStstus}${param.paymentS}"><select
														name='paymentStstus' class="fieldWidth MBinput"
														style="width: 312px; height: 66.1px;">
															<option class="B1" value="未付款">未付款</option>
															<option class="B2" value="已付款">已付款</option>
															<option class="B3" value="退款中">退款中</option>
															<option class="B4" value="已退款">已退款</option>
													</select></span>
												</div>
												<div>
													<span>送貨&ensp;&ensp;狀態 :&ensp;<input type="hidden"
														id="deliveryS" class="MBinput"
														value="${orderBean.deliveryStstus}${param.deliveryS}"><select
														name='deliveryStstus' class="fieldWidth MBinput"
														style="width: 312px; height: 66.1px;">
															<option class="C1" value="備貨中">備貨中</option>
															<option class="C2" value="已發貨">已發貨</option>
															<option class="C3" value="已取貨">已取貨</option>
															<option class="C4" value="退貨中">退貨中</option>
															<option class="C5" value="已退貨">已退貨</option>
													</select></span>
												</div>
												<div>
													<span>折扣碼使用 :&ensp;<input name='discountNo'
														value="${orderBean.discount.discountNo}" type="text"
														class="MBinput" readonly></span>
												</div>
												<div>
													<span>總&ensp;&ensp;金&ensp;&ensp;額 :&ensp;<input
														name='totalAmount' value="${orderBean.totalAmount}"
														type="text" class="MBinput" readonly></span>
												</div>
												<div>
													<input type="submit" class="MBbtn" value="確定"
														style="margin-top: 15px; margin-left: 400px; font-size: 35px;">
												</div>
											</div>



										</div>
									</form>
									<div class="table-wrapper">
										<table
											style="color: white; text-align: center; font-size: 20px"
											class="prodtable">
											<thead>
												<tr>
													<th style="width: 10%; font-size: 25px">item</th>
													<th style="width: 10%; font-size: 25px">商品名稱</th>
													<th style="width: 10%; font-size: 25px">單價</th>
													<th style="width: 10%; font-size: 25px">數量</th>
													<th style="width: 10%; border-right: none; font-size: 25px">總計</th>
												</tr>
											</thead>
											<c:forEach var="bean" items="${orderItems}">
												<tbody>
													<tr>
														<td><div id="photo">
																<img id="preImg" style="width: 100px; height: 100px"
																	src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodItem.prodID}' />" />
															</div></td>
														<td style="font-size: 25px">${bean.prodItem.prodName}</td>
														<td style="font-size: 25px" class="prodPrice">${bean.prodItem.prodPrice}</td>
														<td style="font-size: 25px">${bean.qty}</td>
														<td class="itemTotal"
															style="border-right: none; font-size: 25px">${bean.itemTotal}</td>
													</tr>
												</tbody>
											</c:forEach>
										</table>
									</div>
									<!--       右邊第一部分結束 -->
									<!-- 									<hr class="divider-w pt-20"> -->
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
		case '已完成':
			$(".A2").attr('selected', true)
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
		case '備貨中':
			$(".C1").attr('selected', true)
			break;
		case '已發貨':
			$(".C2").attr('selected', true)
			break;
		case '已取貨':
			$(".C3").attr('selected', true)
			break;
		case '退貨中':
			$(".C4").attr('selected', true)
			break;
		case '已退貨':
			$(".C5").attr('selected', true)
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