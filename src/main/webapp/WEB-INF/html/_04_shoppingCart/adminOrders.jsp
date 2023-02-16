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
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">訂單後臺管理</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<div class="post-video embed-responsive embed-responsive-16by9"
										style="height: auto; padding-bottom: 100px;">
										<div>
											<span>所有訂單資料 :&ensp;</span>
										</div>
										<form class="row"
											action="<c:url value='/admin/shoppingCartSearchOrders.controller/1'/>"
											method="post">
											<div style="display: flex; margin-bottom: 15px;">
												<div style="padding-right: 0; margin: auto 10px;">
													<input type="hidden" id="ordS"
														value="${bean.ordStstus}${param.ordS}"> <select
														name="ordStstus" class="form-control"
														style="padding-right: 0; font-size: 17px; color: black;">
														<option value="0">訂單狀態</option>
														<option value="處理中">處理中</option>
														<option value="備貨中">備貨中</option>
														<option value="已完成">已完成</option>
														<option value="取消">取消</option>
													</select>
												</div>
												<div style="padding-right: 0; margin: auto 10px;">
													<input type="hidden" id="paymentS"
														value="${bean.paymentStstus}${param.paymentS}"> <select
														name="paymentStstus" class="form-control"
														style="font-size: 17px; color: black;">
														<option value="0">付款狀態</option>
														<option value="未付款">未付款</option>
														<option value="已付款">已付款</option>
														<option value="退款中">退款中</option>
														<option value="已退款">已退款</option>
													</select>
												</div>
												<div style="padding-right: 0; margin: auto 10px;">
													<input type="hidden" id="deliveryS"
														value="${bean.deliveryStstus}${param.deliveryS}">
													<select name="deliveryStstus" class="form-control"
														style="font-size: 17px; color: black;">
														<option value="0">送貨狀態</option>
														<option value="備貨中">備貨中</option>
														<option value="已發貨">已發貨</option>
														<option value="已取貨">已取貨</option>
														<option value="退貨中">退貨中</option>
														<option value="已退貨">已退貨</option>
													</select>
												</div>
												<div class="" style="">
													<input class="MBinput" type="text" name="search"
														style="font-size: 17px; color: white; margin: 10px 10px;"
														placeholder="搜尋名稱" />
												</div>
												<div style="">
													<button class="MBbtn" type="submit" style="">搜尋</button>
												</div>
											</div>
										</form>
										<div>


											<div>
												<table
													style="color: white; text-align: center; font-size: 20px"
													class="prodtable">
													<thead>
														<tr style="">
															<th style="width: 20%;">編號</th>
															<th style="width: 10%; padding-left: 5px;">訂購會員</th>
															<th style="width: 15%; padding-left: 10px">訂單日期</th>
															<th style="width: 15%; padding-left: 10px">更新日期</th>
															<th style="width: 10%">訂單狀態</th>
															<th style="width: 10%">付款狀態</th>
															<th style="width: 10%">送貨狀態</th>
															<th></th>
															<th style="border-right: none;"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="bean" items="${orderList}">
															<tr>
																<td id="eachProdBlock" class="mEvent">${bean.orderUID}</td>
																<td style="">${bean.memberbuy.memName}</td>
																<td>${bean.orderDate}</td>
																<td>${bean.uporderDate}</td>
																<td>${bean.ordStstus}</td>
																<td>${bean.paymentStstus}</td>
																<td>${bean.deliveryStstus}</td>
																<td><input type="button" class="MBbtn" value="更多"
																	onclick="window.location='/MeetBoth/admin/shoppingCartUpdateOrder.controller/${bean.orderNo}'"></td>
																<td style="border-right: none"><input type="button"
																	class="MBbtn deleteThisOrder" value="刪除" id=""
																	name="${bean.orderNo}"></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												<!-- 分頁按鈕 -->
												<div class="pagination font-alt"
													style="display: flex; justify-content: center; align-items: center">
													<c:if test="${currentPage != 1}">
														<a
															href="/MeetBoth/admin/shoppingCartOrders.controller/${currentPage-1}"><i
															class="fa fa-angle-left"></i></a>
													</c:if>
													<!-- 迴圈生成每一頁的按鈕 -->
													<c:forEach var="i" begin="1" end="${totalPages}">
														<c:choose>
															<c:when test="${currentPage == i}">
																<a class="active"
																	href="/MeetBoth/admin/shoppingCartOrders.controller/${i}">${i}</a>
															</c:when>
															<c:otherwise>
																<a
																	href="/MeetBoth/admin/shoppingCartOrders.controller/${i}">${i}</a>
															</c:otherwise>
														</c:choose>
													</c:forEach>
													<c:if test="${currentPage != totalPages}">
														<a
															href="/MeetBoth/admin/shoppingCartOrders.controller/${currentPage+1}"><i
															class="fa fa-angle-right"></i></a>
													</c:if>
												</div>
												<!-- 分頁按鈕結束 -->
											</div>
										</div>
									</div>
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
	<!-- SweetAlert js -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- SweetAlert js -->



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

	<!--     刪除訂單 -->
	<script>
        $(function(){
        	$('.deleteThisOrder').click(function(){
                let id=$(this).attr("name");
                Swal.fire({
                  title: '你確定要刪除嗎?',
                  text: "將無法恢復此筆訂單!!!",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 這幾種選項
                  showCancelButton: true,
                  confirmButtonColor: '#f7d966',
                  cancelButtonColor: '#3d3b39',
                  cancelButtonText: '取消',
                  confirmButtonText: '確定刪除'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                          //專案名稱+servlet
                         url:'/MeetBoth/admin/shoppingCart.DeleteOrder.controller',
                          method:"get",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"orderNo":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/admin/shoppingCartOrders.controller/1'
                                console.log("delete")
                             })//done
                             .fail(function(error) {
                                 console.log(error)
                             })//fail end
                    }//if
                  })//then

              })//click end
        });
        //function end
    </script>

	<!--     刪除訂單 -->


	<script>
	var commentAmounts = document.querySelectorAll("#commentAmount");
	var AVGscores = document.querySelectorAll("#AVGscore");

	for (var i = 0; i < commentAmounts.length; i++) {
		var commentList = commentAmounts[i].querySelector("#commmentList").value;
    	if(commentList === '[]'){
  		commentAmounts[i].innerHTML = 0;
    	}else{
  		commentAmounts[i].innerHTML = commentList.split(",").length;
    	}

  		var scoreList = AVGscores[i].querySelectorAll("#commmentList");
  		var sum = 0;
  		for (var j = 0; j < scoreList.length; j++) {
    		sum += parseInt(scoreList[j].value);
  		}
  		if(isNaN((sum / scoreList.length).toFixed(2))){
  			AVGscores[i].innerHTML = '無'
  		}else{
	  		AVGscores[i].innerHTML = (sum / scoreList.length).toFixed(2);
  		}
	}
</script>
</html>