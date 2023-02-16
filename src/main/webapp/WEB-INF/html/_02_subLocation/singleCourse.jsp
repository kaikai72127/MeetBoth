<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">
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
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>
		<div class="main" style="background-color: #F0F0F0;">
			<section class="module">
				<!--         forEach -->
				<c:forEach var="bean" items="${bean}">
					<!-- 			按鈕們 -->
					<div class="container" style="padding: 10px 10px 30px 30px;">
						<div class="row">
							<button class="btn btn-warning btn-circle" type="button"
								style="height: 43px; font-size: 19px;"
								onclick="window.location='/MeetBoth/searchAllCourse.controller'">
								<span class="icon-browser">&ensp;回到課程目錄</span>
							</button>
							<!-- 							&nbsp; -->
							<!-- 							<button class="btn btn-primary  btn-circle" type="button" -->
							<!-- 								style="height: 43px; font-size: 19px;" -->
							<%-- 								onclick="window.location='/MeetBoth/catchSingleCourseDate.controller?id=${bean.courseID}'"> --%>
							<!-- 								<span class=" icon-gears">&ensp;修改課程</span> -->
							<!-- 							</button> -->
							<!-- 							&nbsp; -->
							<!-- 							<button class="btn btn-danger btn-circle" type="button" -->
							<%-- 								id="deleteThisProduct" name="${bean.courseID}" --%>
							<!-- 								style="height: 43px; font-size: 19px;"> -->
							<!-- 								<span class="icon-recycle">&ensp;刪除課程</span> -->
							</button>
						</div>
					</div>
					<!-- 			按鈕們 -->

					<div class="container">
						<form action="<c:url value='/courseOrderCheck.controller' />"
							method="POST">
							<div class="row">
								<!-- 						圖片BLOCK -->
								<div class="col-sm-6 mb-sm-40"
									style="width: 445px; height: 600px; display: flex; justify-content: center; align-items: center;">
									<img id="preImg"
										style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
										src="<c:url value='/showCoursePicture.controller?id=${bean.courseID}' />" />
								</div>
								<!-- 							圖片右邊BLOCK -->
								<div class="col-sm-6">
									<div class="row">
										<div class="col-sm-12">
											<h1 class="product-title font-alt">${bean.courseName}</h1>
										</div>
									</div>
									<!-- 								星級評等 -->
									<div class="row mb-20">
										<div class="col-sm-12">
											<div>
												<c:forEach var="commbean" items="${commBean}">
													<input id="starAVG" type="hidden"
														value="${commbean.courseScore}" />
												</c:forEach>
												<div style="display: flex; float: left;">
													<div style="font-size: 18px;">課程評價:</div>
													<div id="starAVGDiv" style="font-size: 17px;"></div>
												</div>
											</div>
										</div>
									</div>
									<!-- 								星級評等end -->
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="price font-alt">
												<span class="amount"> NT$${bean.coursePrice}</span> <input
													type="hidden" id="paymentS" value="${bean.coursePrice}"
													name="coursePrice">
											</div>
										</div>
									</div>
									<!-- 								課程資訊 -->
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="description">
												<h4>課程編號 : ${bean.courseID}</h4>
												<input type="hidden" id="paymentS" value=" ${bean.courseID}"
													name="courseID">
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="description">
												<h4>課程類別名稱 : ${bean.coursetype.courseClassName}</h4>
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="description">
												<h4>課程上架日期 : ${bean.coursePost}</h4>
											</div>
										</div>
									</div>
									<div class="row mb-20">
										<div class="col-sm-12">
											<div class="description">
												<h4>課程上次資訊更新日期 : ${bean.courseUpdate}</h4>
											</div>
										</div>
									</div>
									<!-- 								課程資訊 -->
									<div class="row mb-20">

										<div class="col-sm-8">
											<input class="btn btn-p btn-circle" type="submit"
												value="直接購買課程" style="height: 43px; font-size: 19px;">
										</div>

										<div class="col-sm-4 mb-sm-20">
											<input type="hidden" class="form-control input-lg"
												type="number" name="chooseAmount" id="amount" value="1"
												max="1" min="1" required="required"
												style="font-size: 25px; letter-spacing: 0px; border: 3px solid #ce7777; border-radius: 30px; text-align: center;" />
										</div>

									</div>

									<!-- 								課程資訊 -->
								</div>
							</div>
						</form>
						<!-- 						中間BLOCK -->
						<div class="row mt-70">
							<div class="col-sm-12">
								<ul class="nav nav-tabs font-alt" role="tablist">
									<li class="active"><a href="#description"
										data-toggle="tab" style="font-size: 17px;"><span
											class="icon-tools-2"></span>賣家訊息</a></li>
									<li><a href="#data-sheet" data-toggle="tab"
										style="font-size: 17px;"><span class="icon-tools-2"></span>課程簡介</a></li>
									<li><a href="#reviews" data-toggle="tab"
										style="font-size: 17px;"><span class="icon-tools-2"></span>課程評論(${bean.courseComment.size()})</a></li>
								</ul>
								<div class="tab-content">
									<!-- 	賣家資訊 -->
									<div class="tab-pane active" id="description">
										<div style="display: flex;">
											<div class="shop-item-image"
												style="width: 200px; height: 250px;">
													<img src="<c:url value='/_01_member.ShowPhoto.controller?account=${bean.memberBean.account}'/>"
                                            alt="avatar">
											</div>
											<div class="comment-content clearfix"
												style="margin-left: 10px; width: 70%;">
												<div class="comment-author font-alt">
													<h3>
														<a href="#">${bean.memberBean.memName}</a>
													</h3>
													<p style="font-size: 20px;">${bean.memberBean.memNickName}</p>
													<p style="font-size: 20px;">${bean.memberBean.phone}</p>
													<p style="font-size: 20px;">${bean.memberBean.eMail}</p>
												</div>
											</div>
											<div style="margin-top: 170px;">
												<input class="btn btn-p btn-circle" type="button"
													value="前往賣家個人頁面"
													style="height: 43px; font-size: 19px; float: right;">
											</div>
										</div>
									</div>
									<!-- 	賣家資訊 end-->
									<!-- 											課程簡介 -->
									<div class="tab-pane" id="data-sheet">
										<div>
											<textarea id="prod_articel_body_directions"
												style="resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 17px; color: black;"
												readonly>${bean.courseDirections}</textarea>
										</div>
									</div>
									<!-- 										課程簡介 end -->
									<!-- 										課程評論 -->
									<div class="tab-pane" id="reviews">
										<div class="comments reviews">
											<!-- 										課程評論 forEach -->
											<div style="height: 650px; width: 100%; overflow-y: scroll;">
												<c:forEach var="commbean" items="${commBean}">
													<div class="comment clearfix">
														<div class="comment-avatar">
															
																<img src="<c:url value='/_01_member.ShowPhoto.controller?account=${bean.memberBean.account}'/>"
                                            alt="賣家圖片">
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt" style="margin: 0;">
																<a href="#" style="font-size: 15px;">${commbean.memberBean.memNickName}</a>
															</div>
															<div class="comment-meta font-alt"
																style="font-size: 14px;">
																${commbean.courseCommentDate} -
																<div id="starDiv" style="font-size: 14px;">
																	<input id="score" type="hidden"
																		value="${commbean.courseScore}" />
																</div>
																<div class="comment-body">
																	<p style="font-size: 18px; text-transform: none;">${commbean.courseComment}</p>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
											<!-- 										課程評論 forEach end-->
										</div>
										<hr>
										<!-- 										新增評論 -->
										<div class="comment-form mt-30">
											<h2 style="font-size: 23px;"
												class="comment-form-title font-alt">新增評論</h2>
											<form method="post"
												action="<c:url value='/InsertCourseComment.controller' />">
												<input type="hidden" name="id" value="${bean.courseID}" />
												<div class="row">
													<div class="col-sm-4">
														<div class="form-group">
															<label class="sr-only" for="name">Name</label> <input
																class="form-control" id="name" type="text" name="name"
																placeholder="${bean.memberBean.memNickName}"
																style="text-transform: none; font-size: 17px; height: 35px;" readonly />
														</div>
													</div>
													<div class="col-sm-4">
														<div class="form-group">
															<select class="form-control" name="score"
																style="font-size: 17px; height: 35px;">
																<option value="5">評分</option>
																<option value="1">1</option>
																<option value="2">2</option>
																<option value="3">3</option>
																<option value="4">4</option>
																<option value="5">5</option>
															</select>
														</div>
													</div>
													<div class="col-sm-12">
														<div class="form-group">
															<textarea class="form-control" id="" name="comm" rows="4"
																placeholder="留言" maxlength="50"
																style="text-transform: none; resize: none; white-space: nowrap; color: black; font-size: 17px;"></textarea>
														</div>
													</div>
													<div class="col-sm-12">
														<button class="btn btn-round btn-p" type="submit"
															style="height: 50px; font-size: 22px; float: right;">新增評論</button>
													</div>
												</div>
											</form>
										</div>
										<!-- 										課程評論 end -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--         forEach  end -->
				</c:forEach>
			</section>
			<hr class="divider-w">
			<!-- 			類似產品 -->
			<section class="module-small">
				<div class="container">
					<div class="row">
						<div class="col-sm-6 col-sm-offset-3">
							<h2 class="module-title font-alt">相似熱門課程</h2>
						</div>
					</div>
					<div class="row multi-columns-row">
						<c:forEach var="prodLikeBean" items="${courseLikeBean}">
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="shop-item">
									<div class="shop-item-image"
										style="width: 265px; height: 375px; display: flex; justify-content: center; align-items: center;">
										<img
											src="<c:url value='/showCoursePicture.controller?id=${prodLikeBean.courseID}' />"
											alt="Cold Garb" />
										<div class="shop-item-detail">
											<a
												href="/MeetBoth/PathToCourseDetail.controller?id=${prodLikeBean.courseID}"
												class="btn btn-round btn-p"><span class="icon-heart">查看課程頁面</span><span
												class="icon-heart"></span></a>
										</div>
									</div>
									<h4 class="shop-item-title font-alt">
										<a href="#">${prodLikeBean.courseName}</a>
									</h4>
									NT$${prodLikeBean.coursePrice}
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<!-- 			類似產品 end-->
			<!-- Footer -->
			<!-- 引入共同的footerMVC -->
			<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
		</div>
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<!-- 引入共同的js -->
	<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />
	<script>
		const scores = document.querySelectorAll("#score");

		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							for (let i = 0; i < scores.length; i++) {
								const starNum = scores[i].value;
								const starDiv = scores[i].closest("#starDiv");
								let onstar = '<span><i class="fa fa-star star"></i></span>';
								let offstar = '<span><i class="fa fa-star star-off"></i></span>';
								let stars = '';

								for (var j = 0; j < 5; j++) {
									if (j < starNum) {
										stars += onstar;
									} else {
										stars += offstar;
									}
								}
								starDiv.innerHTML = stars;
							}
						});
	</script>
	<script>
		function roundToTwo(num) {
			return +(Math.round(num + "e+2") + "e-2");
		}

		const score = document.querySelectorAll("#starAVG");

		document.addEventListener("DOMContentLoaded", function() {
			var totalScore = 0;
			for (let i = 0; i < score.length; i++) {
				const starNum = score[i].value;
				totalScore += Number(starNum);
			}
			let avgScore = roundToTwo(totalScore / score.length);
			let stars = '&nbsp;(' + avgScore + ')';
			let onstar = '<span><i class="fa fa-star star"></i></span>';
			let offstar = '<span><i class="fa fa-star star-off"></i></span>';
			for (var j = 0; j < 5; j++) {
				if (j < avgScore) {
					stars += onstar;
				} else {
					stars += offstar;
				}
			}
			stars += '&nbsp;('+ score.length +'則評論)'
			document.getElementById("starAVGDiv").innerHTML = stars;
		});
	</script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
                         url:'/MeetBoth/deleteCourseById.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":id},
                        })
                            .done(function () {
                            	window.location='/MeetBoth/searchAllCourse.controller'
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
		function calToCost(price,invt){
			var amount = document.getElementById("amount").value;
			if(amount>invt){
				alert("訂購數量超過庫存")
				document.getElementById("amount").value = invt;
				amount = invt;
			}else if(amount < 0){
				alert("訂購數量不得為負值")
				document.getElementById("amount").value = 0;
				amount=0;
			}
			var cost = amount*price; 
			document.getElementById("Cost").value = cost;
		}
	</script>
</body>
</html>