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
										class="btn btn-d btn-round">購物車管理&ensp;<i
											class="fa-solid fa-angle-double-down"></i></a>
										<ul style="">
											<li><a href="#" style="color: white; font-weight: 600;"
												class="btn btn-d btn-round">所有購物單清單</a></li>
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
								<div class="post-thumbnail"
									style="padding-bottom: 0; margin-bottom: 0;">
									<h1
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">哈拉區後臺管理</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<div class="post-video embed-responsive embed-responsive-16by9"
										style="height: auto; padding-bottom: 100px;">
										<div>
											<span>所有貼文資料 :&ensp;</span>
										</div>
										
										<form class="row"
											action="<c:url value='/_06_halaAndQa.SelectHalaClassIndex.controller'/>"
											method="get">
											<div style="display: flex; margin-bottom: 15px;">

												<div style="padding-right: 0; margin: auto 10px;">
													<select name="halaclassname" class="form-control"
														style="font-size: 17px; color: black;">
														<option value="">--請選擇分類--</option>
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
													</select>
												</div>

												<input type="hidden" name="lowprice" value="0" /> <input
													type="hidden" name="highprice" value="9999999" />
												<div class="" style=""></div>
												<div style="">
													<button class="MBbtn" type="submit" style="">搜尋</button>
													
													
													
													<input type="button" class="MBbtn" value="新增"
														onclick="window.location='/MeetBoth/_06_halaAndQa.goAddHalaIndex.controller'">
														
												</div>
												
											</div>
											
										</form>
										<div>
											<form action="_06_halaAndQa.searchAllLike.controller1"
												method="post">
												<input class="MBinput" type="text" name="search1"
													style="font-size: 17px; color: white; margin: 10px 10px;"
													placeholder="搜尋名稱" />

												<button class="MBbtn" type="submit" style="">搜尋</button>
											</form>
										</div>
										
										<div>


											<div>
												<table style="color: white; text-align: center;"
													class="prodtable">
													<thead>
														<tr style="">
															<th style="width: 5%;">編號</th>
															<th style="width: 25%; padding-left: 5px;">標題</th>
															<th style="width: 10%">類別</th>
															<th style="width: 10%">瀏覽次數</th>
															<th style="width: 5%">發文者</th>
															<th style="width: 15%">發文日期</th>
															<th></th>
															<th></th>
															<th style="border-right: none"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="bean" items="${classList}">
															<tr>
																<td style="">${bean.halaId}</td>
																<td>${bean.title}</td>
																<td>${bean.halaclassname}</td>
																<td>&#129321;${bean.watch}</td>
																<td>${bean.memberid}</td>
																<td>${bean.postdate}</td>
																<td><input type="button" class="MBbtn" value="修改"
																	onclick="window.location='/MeetBoth/_06_halaAndQa.GoHalaUpdateIndex.controller?halaId=${bean.halaId}'"></td>
																<td style="border-right: none"><input type="button"
																	class="MBbtn deleteThisProduct" value="刪除"
																	name="${bean.halaId}"></td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
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
	<script>
	
        $(function(){
        	$('.deleteThisProduct').click(function(){
                let id=$(this).attr("name");
                Swal.fire({
                  title: '你確定要刪除嗎?',
                  text: "將無法恢復此貼文!!!",
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
                         url:'/MeetBoth/_06_halaAndQa.deleteHalaIndex.controller',
                          method:"get",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"halaId":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/_06_halaAndQa.SelectAllHalaIndex.controller'
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