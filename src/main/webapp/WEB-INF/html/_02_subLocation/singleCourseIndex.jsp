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
										style="padding-bottom: 0px; margin-bottom: 0; text-align: center; font-size: 50px; color: white;">單一商品後臺管理</h1>
								</div>
								<hr class="divider-w pt-20">
								<!-- 							標題 -->
								<!--       右邊第一部分開始 -->
								<div class="post">
									<div class="post-video embed-responsive embed-responsive-16by9"
										style="height: auto; padding-bottom: 100px;">
										<div style="display: flex">
											<span>課程資料 :&ensp;</span>
										</div>
										<div style="display: flex">
											<button class="MBbtn"
												onclick="window.location='/MeetBoth/admin/_02_subLocation.index.controller'">返回</button>
											<button class="MBbtn"
												onclick="window.location='/MeetBoth/admin/_02_subLocation.pathToMBupdateCourse.controller?id=${course.courseID}'">修改</button>
											<button class="MBbtn" id="deleteThisProduct"
												name="${course.courseID}">刪除</button>
										</div>
										<div>
											<span>商品編號 :&ensp;${course.courseID}</span>
										</div>
										<div>
											<span>商品名稱 :&ensp;${course.courseName}</span>
										</div>
										<div style="display: flex;">
											<span>商品圖片 :&ensp;</span>
											<div
												style="width: 150px; height: 200px; display: flex; justify-content: center; align-items: center; text-align: center;">
												<img id="preImg"
													style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
													src="<c:url value='/showCoursePicture.controller?id=${course.courseID}' />" />
											</div>
										</div>
										<div>
											<span>商品類別 :&ensp;${course.coursetype.courseClassName}</span>
										</div>
										<div>
											<span>商品價格 :&ensp;${course.coursePrice}</span>
										</div>
										<div>
											<span>賣家編號 :&ensp;${course.memberBean.memberID}</span>
										</div>
										<div>
											<span>上架時間 :&ensp;${course.coursePost}</span>
										</div>
										<div>
											<span>更新時間 :&ensp;${course.courseUpdate}</span>
										</div>
										<div>
											<textarea
												style="margin-left: 10px; resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 17px; color: white; background-color: black;"
												readonly>${course.courseDirections}</textarea>
										</div>

										<div>
											<div>
												<span>商品評論 :&ensp;</span>
											</div>
											<div>
												<table style="color: white; text-align: center;"
													class="prodtable">
													<thead>
														<tr style="">
															<th style="width: 5%;">編號</th>
															<th style="width: 10%; padding-left: 5px;">留言者</th>
															<th style="width: 5%">評分</th>
															<th style="width: 50%">評論</th>
															<th style="width: 18%">時間</th>
															<th></th>
															<th></th>
															<th style="border-right: none"></th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="commBean" items="${course.courseComment}">
															<tr>
																<td style="">${commBean.courseCommentID}</td>
																<td>${commBean.memberBean.memberID}</td>
																<td>${commBean.courseScore}</td>
																<td>${commBean.courseComment}</td>
																<td>${commBean.courseCommentDate}</td>
																<td><input type="button" class="MBbtn" value="更多"
																	onclick="#"></td>
																<td><input type="button" class="MBbtn" value="修改"
																	onclick="#"></td>
																<td style="border-right: none"><input type="button"
																	class="MBbtn" value="刪除" id="deleteThisProduct" name=""></td>
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
        	$('#deleteThisProduct').click(function(){
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
                         url:'/MeetBoth/admin/_02_subLocation.MBdeleteCourseById.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/admin/_02_subLocation.index.controller'
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
</html>