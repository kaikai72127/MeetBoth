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
	border: solid 1px black;
	border-radius: 10px;
	height: 35px;
	text-align: center;
	font-size: 18px;
}

.cart>li>ul>li>a:hover, .cart>li>ul>li>a.active {
	background: gray;
	color: #fff;
}

.cart>li>a:hover, .cart>li>a.active {
	background: gray;
	color: #fff;
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

#ChartData>div>div>div>div>svg>g>text {
	font-size: 22px;
}

#ChartData>div>div>div>div>svg>g>g>g>text {
	font-size: 17px;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main">
			<section class="module" style="padding-top: 10px;">
				<div class="container">
					<div class="row">
						<div class="col-sm-4 col-md-3 sidebar"
							style="position: sticky; top: 100px;">
							<div class="widget">
								<img src="/MeetBoth/html/assets/images/shop/賣家中心.png"
									style="padding-bottom: 10px;">
								<ul class="cart">
									<li><a href="#">商品管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a
												href="<c:url value='/_03_product/pathToMyPDP.controller'/>">我的商品</a></li>
											<li><a
												href="<c:url value='/_03_product.pathToInsertProduct.controller'/>">新增商品</a></li>
										</ul></li>
									<li><a href="#" style="">訂單管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#">我的銷售</a></li>
											<li><a href="#">待付款訂單</a></li>
											<li><a href="#">待出貨訂單</a></li>
											<li><a href="#">已完成訂單</a></li>
										</ul></li>
									<li><a href="#">賣場管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#">賣場評價</a></li>
											<li><a href="#">賣場介紹</a></li>
										</ul></li>
									<li><a href="#">財務管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#">子選單3-1</a></li>
											<li><a href="#">子選單3-2</a></li>
											<li><a href="#">子選單3-3</a></li>
										</ul></li>
									<li><a href="#">數據中心&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#">賣家數據中心</a></li>
											<li><a href="#">營運表現</a></li>
										</ul></li>
								</ul>
							</div>
						</div>
						<div class="col-sm-8 col-sm-offset-1" style="margin-left: 20px;">
							<div class="post">
								<div class="post-thumbnail">
									<img src="/MeetBoth/html/assets/images/shop/個人賣場.jpg"
										style="padding-bottom: 10px;">
								</div>

								<!--       商品列 -->
								<!--訂單管理 -->
								<div class="post-header font-alt" style="display: flex;">
									<img src="/MeetBoth/html/assets/images/shop/兔年海報2.jpg"
										style="padding-bottom: 10px;">
								</div>
								<!--       動態搜尋列 -->
								<section class="module-small"
									style="padding-top: 20px; padding-bottom: 0px;">
									<div class="container" style="">
										<form class="row"
											action="<c:url value='/_03_product.searchProductWithCondition3.controller'/>"
											method="post">
											<div class="col-sm-4 mb-sm-20"
												style="width: 17%; padding-right: 0;">
												<select name="case" class="form-control"
													style="padding-right: 0; font-size: 17px">
													<option value="1">預設排序</option>
													<option value="6">依瀏覽次數排序</option>
													<option value="2">依價格由大到小</option>
													<option value="3">依價格由小到大</option>
													<option value="4">依上架日期排序</option>
													<option value="5">依更新日期排序</option>
												</select>
											</div>
											<div class="col-sm-2 mb-sm-20"
												style="width: 15%; padding-right: 0;">
												<select name="typecase" class="form-control"
													style="font-size: 17px">
													<option value="0">全部類別</option>
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
												</select>
											</div>
											<div class="col-sm-2 mb-sm-20" style="width: 25%">
												<input class="form-control" type="text" name="searchName"
													style="font-size: 17px" placeholder="搜尋名稱" />
											</div>
											<input type="hidden" name="lowprice" value="0" /> <input
												type="hidden" name="highprice" value="9999999" />
											<div class="col-sm-3" style="width: 10%">
												<button class="btn btn-d btn-round" type="submit"
													style="font-size: 17px">搜尋</button>
											</div>
										</form>
									</div>
								</section>
								<!--       動態搜尋列 -->
								<!--       按鈕列 -->
								<div class="container" style="padding: 0px 10px 0px 20px;">
									<input type="button" value="返回首頁"
										class="btn btn-info btn-circle"
										style="font-size: 17px; color: black;"
										onclick="window.location='/MeetBoth/_03_product.searchAllProduct.controller'">
									&nbsp; <input type="button" value="新增商品"
										class="btn btn-warning btn-circle"
										style="font-size: 17px; color: black;"
										onclick="window.location='/MeetBoth/_03_product.pathToInsertProduct.controller'">
								</div>
								<!--       按鈕列 -->
								<!-- 123 -->
								<div class="row mt-70">
									<div class="col-sm-12">
										<ul class="nav nav-tabs font-alt" role="tablist">
											<li class="active"><a href="#description"
												data-toggle="tab" style="font-size: 20px; color: #ce7777"><i
													class="fa-solid fa-cart-shopping"></i>購買訂單</a></li>
											<li><a href="#data-sheet" data-toggle="tab"
												style="font-size: 20px; color: #ce7777"><i
													class="fa-solid fa-shop"></i>售出訂單 </a></li>
											<li><a href="#reviews" data-toggle="tab"><span
													class="icon-tools-2"></span>Reviews (2)</a></li>
										</ul>

										<!-- 購買訂單 -->
										<div class="tab-content">
											<div class="tab-pane active" id="description">
												<table class="table table-striped ds-table table-responsive">
													<tr>
														<th>訂單編號</th>
														<th>訂購日期</th>
														<th>訂單狀態</th>
														<th>付款狀態</th>
														<th>送貨狀態</th>
														<th>總金額</th>
													</tr>
													<c:forEach var="bean" items="${orderList}">
														<tr>
															<td>${bean.orderUID}</td>
															<td>${bean.orderDate}</td>
															<td>${bean.ordStstus}</td>
															<td>${bean.paymentStstus}</td>
															<td>${bean.deliveryStstus}</td>
															<td>${bean.totalAmount}</td>
														</tr>
													</c:forEach>
												</table>
											</div>
											<div class="tab-pane" id="data-sheet">
												<table class="table table-striped ds-table table-responsive">
													<tbody>
														<tr>
															<th>Title</th>
															<th>Info</th>
														</tr>
														<tr>
															<td>Compositions</td>
															<td>Jeans</td>
														</tr>
														<tr>
															<td>Size</td>
															<td>44, 46, 48</td>
														</tr>
														<tr>
															<td>Color</td>
															<td>Black</td>
														</tr>
														<tr>
															<td>Brand</td>
															<td>Somebrand</td>
														</tr>
													</tbody>
												</table>
											</div>
											<div class="tab-pane" id="reviews">
												<div class="comments reviews">
													<div class="comment clearfix">
														<div class="comment-avatar">
															<img src="" alt="avatar" />
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt">
																<a href="#">John Doe</a>
															</div>
															<div class="comment-body">
																<p>The European languages are members of the same
																	family. Their separate existence is a myth. For
																	science, music, sport, etc, Europe uses the same
																	vocabulary. The European languages are members of the
																	same family. Their separate existence is a myth.</p>
															</div>
															<div class="comment-meta font-alt">
																Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star-off"></i></span>
															</div>
														</div>
													</div>
													<div class="comment clearfix">
														<div class="comment-avatar">
															<img src="" alt="avatar" />
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt">
																<a href="#">Mark Stone</a>
															</div>
															<div class="comment-body">
																<p>Europe uses the same vocabulary. The European
																	languages are members of the same family. Their
																	separate existence is a myth.</p>
															</div>
															<div class="comment-meta font-alt">
																Today, 14:59 -<span><i class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star"></i></span><span><i
																	class="fa fa-star star-off"></i></span><span><i
																	class="fa fa-star star-off"></i></span>
															</div>
														</div>
													</div>
												</div>
												<div class="comment-form mt-30">
													<h4 class="comment-form-title font-alt">Add review</h4>
													<form method="post">
														<div class="row">
															<div class="col-sm-4">
																<div class="form-group">
																	<label class="sr-only" for="name">Name</label> <input
																		class="form-control" id="name" type="text" name="name"
																		placeholder="Name" />
																</div>
															</div>
															<div class="col-sm-4">
																<div class="form-group">
																	<label class="sr-only" for="email">Name</label> <input
																		class="form-control" id="email" type="text"
																		name="email" placeholder="E-mail" />
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</div>
								</div>
								<!-- 123 -->
							</div>
						</div>
					</div>
				</div>
			</section>
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
	<!-- SweetAlert js -->
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<!-- SweetAlert js -->
	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script>
	
        $(function(){
        	$('.deleteThisProduct').click(function(){
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
                         url:'/MeetBoth/_03_product.deleteProductById.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/_03_product.searchAllProduct.controller'
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
	<script>
		function roundToTwo(num) {
			return +(Math.round(num + "e+2") + "e-2");
		}

		const score = document.querySelectorAll("#starAVG");

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const scores = document
									.querySelectorAll("#scoreAVG");
							for (let i = 0; i < scores.length; i++) {
								const score = scores[i];
								const starAVGs = score
										.querySelectorAll("#starAVG");
								let totalScore = 0;
								for (let j = 0; j < starAVGs.length; j++) {
									const starNum = starAVGs[j].value;
									totalScore += Number(starNum);
								}
								let avgScore = roundToTwo(totalScore
										/ starAVGs.length);
								let stars = '';
								if (isNaN(avgScore)) {
									stars = '&nbsp;(0)';
								} else {
									stars = '&nbsp;(' + avgScore + ')';
								}
								let onstar = '<span><i class="fa fa-star star"></i></span>';
								let offstar = '<span><i class="fa fa-star star-off"></i></span>';
								for (var k = 0; k < 5; k++) {
									if (k < avgScore) {
										stars += onstar;
									} else {
										stars += offstar;
									}
								}
								stars += '&nbsp;(' + starAVGs.length + '則評論)'
								score.querySelector("#starAVGDiv").innerHTML = stars;
							}
						});
	</script>
	<script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales', 'Expenses'],
          ['2004',  1000,      400],
          ['2005',  1170,      460],
          ['2006',  660,       1120],
          ['2007',  1030,      540]
        ]);

        var options = {
          title: '圖表2',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
	<script type="text/javascript">
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Dinosaur', 'Length'],
          ['Acrocanthosaurus (top-spined lizard)', 12.2],
          ['Albertosaurus (Alberta lizard)', 9.1],
          ['Allosaurus (other lizard)', 12.2],
          ['Apatosaurus (deceptive lizard)', 22.9],
          ['Archaeopteryx (ancient wing)', 0.9],
          ['Argentinosaurus (Argentina lizard)', 36.6],
          ['Baryonyx (heavy claws)', 9.1],
          ['Brachiosaurus (arm lizard)', 30.5],
          ['Ceratosaurus (horned lizard)', 6.1],
          ['Coelophysis (hollow form)', 2.7],
          ['Compsognathus (elegant jaw)', 0.9],
          ['Deinonychus (terrible claw)', 2.7],
          ['Diplodocus (double beam)', 27.1],
          ['Dromicelomimus (emu mimic)', 3.4],
          ['Gallimimus (fowl mimic)', 5.5],
          ['Mamenchisaurus (Mamenchi lizard)', 21.0],
          ['Megalosaurus (big lizard)', 7.9],
          ['Microvenator (small hunter)', 1.2],
          ['Ornithomimus (bird mimic)', 4.6],
          ['Oviraptor (egg robber)', 1.5],
          ['Plateosaurus (flat lizard)', 7.9],
          ['Sauronithoides (narrow-clawed lizard)', 2.0],
          ['Seismosaurus (tremor lizard)', 45.7],
          ['Spinosaurus (spiny lizard)', 12.2],
          ['Supersaurus (super lizard)', 30.5],
          ['Tyrannosaurus (tyrant lizard)', 15.2],
          ['Ultrasaurus (ultra lizard)', 30.5],
          ['Velociraptor (swift robber)', 1.8]]);

        var options = {
          title: '圖表1',
          legend: { position: 'none' },
        };

        var chart = new google.visualization.Histogram(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
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
  	var ctx = document.getElementById( "example" ),
  		example = new Chart(ctx, {
  			// 參數設定[註1]
  			type: "bar", // 圖表類型
  			data: {
  				labels: [ "Red", "Green", "Blue" ], // 標題
  				datasets: [{
  					label: "# of Votes", // 標籤
  					data: [ 12, 19, 3 ], // 資料
  					backgroundColor: [ // 背景色
  					"#FF0000",
  					"#00FF00",
  					"#0000FF",
  					],
  					borderWidth: 1 // 外框寬度
  				}]
  			}
  		});
  </script>
</body>
</html>