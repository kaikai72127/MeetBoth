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
</style>


</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<c:set value="${CartSize}" var="cartsize" />
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
								onclick="window.location='/MeetBoth/_03_product.searchAllProduct.controller'">
								<span class="icon-browser">&ensp;回到商品目錄</span>
							</button>
							&nbsp;
							<button class="btn btn-primary  btn-circle" type="button"
								style="height: 43px; font-size: 19px;"
								onclick="window.location='/MeetBoth/_03_product.catchSingleProductDate.controller?id=${bean.prodID}'">
								<span class=" icon-gears">&ensp;修改商品</span>
							</button>
							&nbsp;
							<button class="btn btn-danger btn-circle" type="button"
								id="deleteThisProduct" name="${bean.prodID}"
								style="height: 43px; font-size: 19px;">
								<span class="icon-recycle">&ensp;刪除商品</span>
							</button>
						</div>
					</div>
					<!-- 			按鈕們 -->
					<div class="container">
						<div class="row">
							<!-- 						圖片BLOCK -->
							<div class="col-sm-6 mb-sm-40">
								<img id="preImg" style="width: 445px; height: 600px"
									src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodID}' />" />
							</div>
							<!-- 							圖片右邊BLOCK -->
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-12">
										<h1 class="product-title font-alt">${bean.prodName}</h1>
									</div>
								</div>
								<!-- 								星級評等 -->
								<div class="row mb-20">
									<div class="col-sm-12">
										<div>
											<c:forEach var="commbean" items="${commBean}">
												<input id="starAVG" type="hidden"
													value="${commbean.prodScore}" />
											</c:forEach>
											<div style="display: flex; float: left;">
												<div style="font-size: 18px;">商品評價:</div>
												<div id="starAVGDiv" style="font-size: 17px;"></div>
											</div>
										</div>
									</div>
								</div>
								<!-- 								星級評等end -->
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="price font-alt">
											<span class="amount">NT$${bean.prodPrice}</span>
										</div>
									</div>
								</div>
								<!-- 								商品資訊 -->
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
										<input type="hidden" value="${bean.prodID}" name="prodIdForAjax"/>
											<h4>商品編號 : ${bean.prodID}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品類別名稱 : ${bean.prodtype.prodClassName}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品上架日期 : ${bean.prodPost}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>商品上次資訊更新日期 : ${bean.prodUpdate}</h4>
										</div>
									</div>
								</div>
								<div class="row mb-20">
									<div class="col-sm-12">
										<div class="description">
											<h4>庫存數量 : ${bean.inventory}</h4>
										</div>
									</div>
								</div>
								<!-- 								商品資訊 -->

								<div class="row mb-20">
									<form
										action="<c:url value='/shoppingCartAddOnly.controller/${bean.prodID}' />"
										method="GET">
										<div class="col-sm-4 mb-sm-20">
											<input class="form-control input-lg" type="number" name="qty"
												id="qty" value="1" max="${bean.inventory}" min="1"
												required="required"
												style="font-size: 25px; letter-spacing: 0px; border: 1px solid black; border-radius: 30px; text-align: center;" />
										</div>
										<!-- 隱藏ID -->
										<Input type='hidden' name='prodID' id="prodID"
											value='${bean.prodID}'>
										<div class="col-sm-8">
											<%-- 											<button style="float: right" id="${bean.prodID}" --%>
											<!-- 												class="btn btn-sm text-dark p-0 addtocart"> -->
											<!-- 												<i class="fas fa-shopping-cart text-primary mr-1"></i> 加入購物車 -->
											<!-- 											</button> -->
											<button type='submit' id="addToCartBtn"
												class="btn btn-d btn-circle">
												<i class="fas fa-shopping-cart text-primary mr-1"></i> 加入購物車
											</button>
										</div>
									</form>
								</div>

								<!-- 								商品資訊 -->
							</div>
						</div>
						<!-- 						中間BLOCK -->
						<div class="row mt-70">
							<div class="col-sm-12">
								<ul class="nav nav-tabs font-alt" role="tablist">
									<li class="active"><a href="#description"
										data-toggle="tab" style="font-size: 17px;"><span
											class="icon-tools-2"></span>賣家訊息</a></li>
									<li><a href="#data-sheet" data-toggle="tab"
										style="font-size: 17px;"><span class="icon-tools-2"></span>商品簡介</a></li>
									<li><a href="#reviews" data-toggle="tab"
										style="font-size: 17px;"><span class="icon-tools-2"></span>商品頻論(commentAmount)</a></li>
								</ul>
								<div class="tab-content">
									<!-- 	賣家資訊 -->
									<div class="tab-pane active" id="description">
										<div style="display: flex;">
											<div class="shop-item-image"
												style="width: 200px; height: 250px;">
												<img src="html/assets/images/shop/product-12.jpg"
													alt="avatar" />
											</div>
											<div class="comment-content clearfix"
												style="margin-left: 10px; width: 70%;">
												<div class="comment-author font-alt">
													<h3>
														<a href="#">賣家暱稱</a>
													</h3>
													<p style="font-size: 20px;">賣家訊息1</p>
													<p style="font-size: 20px;">賣家訊息2</p>
													<p style="font-size: 20px;">賣家訊息3</p>
												</div>
											</div>
											<div style="margin-top: 170px;">
												<input class="btn btn-d btn-circle" type="button"
													value="前往賣家個人頁面"
													style="height: 43px; font-size: 19px; float: right;">
											</div>
										</div>
									</div>
									<!-- 	賣家資訊 end-->
									<!-- 											商品簡介 -->
									<div class="tab-pane" id="data-sheet">
										<div>
											<textarea id="prod_articel_body_directions"
												style="resize: none; height: 325px; width: 975px; overflow-y: auto; overflow-y: auto; font-size: 17px; color: black;"
												readonly>${bean.directions}</textarea>
										</div>
									</div>
									<!-- 										商品簡介 end -->
									<!-- 										商品評論 -->
									<div class="tab-pane" id="reviews">
										<div class="comments reviews">
											<!-- 										商品評論 forEach -->
											<div style="height: 650px; width: 100%; overflow-y: scroll;"
												id="commentForEach">
												<c:forEach var="commbean" items="${commBean}">
													<div class="comment clearfix">
														<div class="comment-avatar">
															<img src="html/assets/images/shop/product-12.jpg"
																alt="賣家圖片" />
														</div>
														<div class="comment-content clearfix">
															<div class="comment-author font-alt" style="margin: 0;">
																<a href="#" style="font-size: 15px;">賣家暱稱</a>
															</div>
															<div class="comment-meta font-alt"
																style="font-size: 14px;">
																${commbean.commentDate} -
																<div id="starDiv" style="font-size: 14px;">
																	<input id="score" type="hidden"
																		value="${commbean.prodScore}" />
																</div>
																<div class="comment-body">
																	<p style="font-size: 18px; text-transform: none;">${commbean.comment}</p>
																</div>
															</div>
														</div>
													</div>
												</c:forEach>
											</div>
											<!-- 										商品評論 forEach end-->
										</div>
										<hr>
										<!-- 										新增評論 -->
										<div class="comment-form mt-30">
											<h2 style="font-size: 23px;"
												class="comment-form-title font-alt">新增評論</h2>
											<form method="post"
												action="<c:url value='/_03_product.InsertProdComment.controller' />">
												<input type="hidden" name="id" value="${bean.prodID}" />
												<div class="row">
													<div class="col-sm-4">
														<div class="form-group">
															<label class="sr-only" for="name">Name</label> <input
																class="form-control" id="name" type="text" name="name"
																placeholder="Name"
																style="text-transform: none; font-size: 17px; height: 35px;" />
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
														<button class="btn btn-round btn-d" type="submit"
															style="height: 50px; font-size: 22px; float: right;">新增評論</button>
													</div>
												</div>
											</form>
										</div>
										<!-- 										商品評論 end -->
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
							<h2 class="module-title font-alt">相似熱門商品</h2>
						</div>
					</div>
					<div class="row multi-columns-row">
						<c:forEach var="prodLikeBean" items="${prodLikeBean}">
							<div class="col-sm-6 col-md-3 col-lg-3">
								<div class="shop-item">
									<div class="shop-item-image"
										style="width: 265px; height: 375px; display: flex; justify-content: center; align-items: center;">
										<img
											src="<c:url value='/_03_product.showPicture.controller?id=${prodLikeBean.prodID}' />"
											alt="Cold Garb" />
										<div class="shop-item-detail">
											<a
												href="/MeetBoth/_03_product.PathToProductDetail.controller?id=${prodLikeBean.prodID}"
												class="btn btn-round btn-b"><span class="icon-heart" style="font-size:18px;">查看商品頁面</span><span
												class="icon-heart" style="font-size:18px;"></span></a>
										</div>
									</div>
									<h4 class="shop-item-title font-alt">
										<a href="#" style="font-size:22px;">${prodLikeBean.prodName}</a>
									</h4>
									<div id="scoreAVGTwo">
										<c:forEach var="commentBeanTwo"
											items="${prodLikeBean.productComment}">
											<input type="hidden" id="starAVGTwo"
												value="${commentBeanTwo.prodScore}">
										</c:forEach>
										<div id="starAVGDivTwo" style="font-size: 20px;">123</div>
									</div>
									<p style="font-size:20px;">NT$${prodLikeBean.prodPrice}</p>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</section>
			<!-- 			類似產品 end-->
			<!-- 						中間BLOCK end-->
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
	<div class="scroll-up">
		<a href="#totop"><i class="fa fa-angle-double-up"></i></a>
	</div>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="html/assets/lib/jquery/dist/jquery.js"></script>
	<script src="html/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="html/assets/lib/wow/dist/wow.js"></script>
	<script
		src="html/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="html/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="html/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="html/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="html/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="html/assets/lib/smoothscroll.js"></script>
	<script
		src="html/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="html/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="html/assets/js/plugins.js"></script>
	<script src="html/assets/js/main.js"></script>
	<!-- SweetAlert js -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- SweetAlert js -->
	<script>
		const scores = document.querySelectorAll("#score");

		document.addEventListener(
						"DOMContentLoaded",
						function() {
							if(scores.length!=0){
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
							}else{
								starDiv.innerHTML='沒有評論';
							}
						});
	</script>
	<script>
		function roundToTwo(num) {
			return +(Math.round(num + "e+2") + "e-2");
		}

		const score = document.querySelectorAll("#starAVG");
		console.log(score.length)
		
		
		document.addEventListener("DOMContentLoaded", function() {
			var totalScore = 0;
			for (let i = 0; i < score.length; i++) {
				const starNum = score[i].value;
				totalScore += Number(starNum);
			}
			let avgScore = roundToTwo(totalScore / score.length);
			if(isNaN(avgScore)){
				stars = '&nbsp;(0)';
			}else{
				stars = '&nbsp;(' + avgScore + ')';
			}
			let onstar = '<span><i class="fa fa-star star"></i></span>';
			let offstar = '<span><i class="fa fa-star star-off"></i></span>';
			for (var j = 0; j < 5; j++) {
				if (j < avgScore) {
					stars += onstar;
				} else {
					stars += offstar;
				}
			}
			if(score.length!=0){
				stars += '&nbsp;('+ score.length +'則評論)'
			}else{
				stars += '&nbsp;(0則評論)'		
				document.getElementById("commentForEach").innerHTML = "<p style='font-size: 30px; text-align: center;'>沒有評論</p>";
			}
			document.getElementById("starAVGDiv").innerHTML = stars;
		});
	</script>
	<script>
	document.addEventListener("DOMContentLoaded", function() {
		  const scores = document.querySelectorAll("#scoreAVGTwo");
		  for (let i = 0; i < scores.length; i++) {
		    const score = scores[i];
		    const starAVGs = score.querySelectorAll("#starAVGTwo");
		    let totalScore = 0;
		    for (let j = 0; j < starAVGs.length; j++) {
		      const starNum = starAVGs[j].value;
		      totalScore += Number(starNum);
		    }
		    let avgScore = roundToTwo(totalScore / starAVGs.length);
		    let stars = '';
		    if(isNaN(avgScore)){
				stars = '&nbsp;(0)';
			}else{
				stars = '&nbsp;(' + avgScore + ')';
			}
		    for (let k = 0; k < 5; k++) {
		      if (k < avgScore) {
		        stars += '<i class="fa fa-star star"></i>';
		      } else {
		        stars += '<i class="fa fa-star star-off"></i>';
		      }
		    }
		    stars += '&nbsp;('+ starAVGs.length +'則評論)'
		    score.querySelector("#starAVGDivTwo").innerHTML = stars;
		  }
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
	var prodIdInput = document.querySelector('input[name="prodIdForAjax"]');
    var prodId = prodIdInput.value;
    console.log("id="+prodId);
	window.onload = function() {
	    var xhr = new XMLHttpRequest();
	    xhr.open("GET", "/MeetBoth/product.productCheck.controller?id=" + prodId, true);
	    xhr.send();
	};
</script>
<script>
    let cartCount = 0;
    document.getElementById("addToCartBtn").addEventListener("click", function() {
        cartCount += 1;
        document.getElementById("cartCount").innerHTML = "購物車：" + cartCount;
    });
</script>
	<script type="text/javascript">
    $('.addtocart').on('click', function () {
        let MyValue = $(this).attr("id");
        console.log(MyValue);
        $.ajax({
            url: '/shoppingCartAddOnly.controller/' + MyValue,
            method: "get",
            dataType: "text",
            //這邊的"id"是給controller的變數名
            data: { "prodID": MyValue },
        }).done(function () {
//         	alert("成功")
            location.reload();
        }).fail(function () {
//         	alert("失敗")
        	location.reload();
        })
    });
	</script>
	<script>
      let cartCount = 0;
      document
        .getElementById("addToCartBtn")
        .addEventListener("click", function () {
          console.log(cartCount);
          cartCount += 1;
          document.getElementById("cartCount").innerHTML =
            "購物車：" + cartCount;
        });
    </script>
</body>
</html>