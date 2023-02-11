<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en-US" dir="ltr">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--  
    Document Title
    =============================================
    -->
<title>肉丸家教網</title>
<!--  
    Favicons
    =============================================
    -->
<link rel="apple-touch-icon" sizes="57x57"
	href="html/assets/images/favicons/apple-icon-57x57.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="html/assets/images/favicons/apple-icon-60x60.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="html/assets/images/favicons/apple-icon-72x72.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="html/assets/images/favicons/apple-icon-76x76.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="html/assets/images/favicons/apple-icon-114x114.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="html/assets/images/favicons/apple-icon-120x120.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="html/assets/images/favicons/apple-icon-144x144.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="html/assets/images/favicons/apple-icon-152x152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="html/assets/images/favicons/apple-icon-180x180.png">
<link rel="icon" type="image/png" sizes="192x192"
	href="html/assets/images/favicons/android-icon-192x192.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="html/assets/images/favicons/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="html/assets/images/favicons/favicon-96x96.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="html/assets/images/favicons/favicon-16x16.png">
<link rel="manifest" href="/manifest.json">
<meta name="msapplication-TileColor" content="#ffffff">
<meta name="msapplication-TileImage"
	content="html/assets/images/favicons/ms-icon-144x144.png">
<meta name="theme-color" content="#ffffff">
<!--  
    Stylesheets
    =============================================
    
    -->
<!-- Default stylesheets-->
<link href="html/assets/lib/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet">
<link href="html/assets/lib/animate.css/animate.css" rel="stylesheet">
<link
	href="html/assets/lib/components-font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<link href="html/assets/lib/et-line-font/et-line-font.css"
	rel="stylesheet">
<link href="html/assets/lib/flexslider/flexslider.css" rel="stylesheet">
<link
	href="html/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css"
	rel="stylesheet">
<link
	href="html/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css"
	rel="stylesheet">
<link href="html/assets/lib/magnific-popup/dist/magnific-popup.css"
	rel="stylesheet">
<link href="html/assets/lib/simple-text-rotator/simpletextrotator.css"
	rel="stylesheet">
<!-- Main stylesheet and color file-->
<link href="html/assets/css/style.css" rel="stylesheet">
<link id="color-scheme" href="html/assets/css/colors/default.css"
	rel="stylesheet">
<link rel="stylesheet" href="html/assets/css/deopostpagestyle.css">
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />
<style>
.tab {
	width: 110%;
	border: 5px dashed gray;
}

.reply1 {
	background-color: #F0F8FF;
}

.postpage {
	border: 1px solid;
}

.postpagetitle {
	background-color: #E6E6FA;
}

.trr {
	border: 1px dashed gray
}

.td1 {
	padding: 20px;
	padding-right: 60px;
	font-size: 18px
}

.td2 {
	padding: 5px;
	font-size: 14px;
}

.post_headerdeo {
	background-image:
		url(https://i2.bahamut.com.tw/forum/background/manager.jpg?v=20170731);
	padding-bottom: 60px;
	background-position: bottom center;
	background-repeat: no-repeat;
	background-size: cover;
	padding: 36px;
	padding-top: 60px;
	margin-bottom: 18px;
	margin: 0;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>


		<!-- 中間欄位開始 -->
		<div class="main">
			<section class="module">
				<div class="demo-container">
					<div class="message-board-container" id="message-board-container">

						<!-- Post template -->

						<div class="post-container">
							<div class="user-section">
								<div class="user-card">
									<img src="https://picsum.photos/200/300" alt="">
								</div>
							</div>

							<div class="post-section">
								<div class="post_headerdeo">
									<h2
										style="font-size: 26px; padding-left: 15px; font-weight: bolder;">
										<a href="#" style="color: #FFFFFF;">${bean.title}</a> <input
											id="halaIdHidden" type="hidden" value="${bean.halaId}" />
									</h2>
									<div class="post-header">
										<div class="post-author">
											<div class="post-index" style="color: #FFFFFF;">樓主</div>
											<div class="post-user">
												<a href="" class="user-name" style="color: #FFFFFF;">Kevin</a>
												<a href="" class="user-id" style="color: #FFFFFF;">@${bean.memberBean.memberID}</a>
											</div>
										</div>
										<div class="post-detail" style="color: #FFFFFF;">${bean.postdate}</div>
									</div>
								</div>
								<div class="post-body">${bean.halacontent}
									<div
										style="position: absolute; z-index: 1; height: 20px; right: 400px">

										<div
											style="position: relative; z-index: 2; display: flex; align-items: center; justify-content: flex-end; padding: 16px 0 32px;">
											<div style="padding-right: 5%">
												<div id="targetDiv" style="display: none;">顯示的內容</div>
											</div>
										</div>

									</div>
								</div>

								<!-- 修改按鈕開始 -->
								<div
									style="display: flex; align-items: center; justify-content: flex-end; padding: 16px 0 12px;">
									<div style="padding-right: 5%">
										<a
											href="<c:url value='/_06_halaAndQa.GoHalaUpdate.controller?halaId=${bean.halaId}'/>">
											<button id="updateBtn"
												style="border: none; background-color: white; height: 17px;">
												<span style="font-size: 20px" class="icon-gears"
													aria-hidden="true"></span>
											</button>
										</a>
									</div>
								</div>
								<!-- 修改按鈕結束 -->
                                <!-- 回復貼文開始 -->
								<div class="post-footer">
									<div class="reply-expand-button"></div>
									<div class="reply-list" id="fuckyoureplylist">

											<input type="hidden" value="${member.memNickName}" id="memberNickName" class="memberNickName">
											<input type="hidden" value="${member.memberID}" name="memberid" id="memberIDforAjax">
										<c:forEach var="respBean" items="${bean.responseHala}">
											<div class="reply-item">
												<div class="reply-avatar">
													<img src="https://picsum.photos/200" alt="">
												</div>
												<div class="reply-content">
													<div class="reply-user">${respBean.memberBean.memNickName}</div>
													<article class="reply-article">${respBean.responseHalaContent}</article>
													<div class="reply-content-detail">${respBean.responseHalaPostDate}</div>
												</div>
											</div>
										</c:forEach>
									</div>


									<div id="div1" class="reply-editor">
										<input class="reply-article" id="textForRespHala"
											onkeypress="handleKeyPress(event)" type="text"
											placeholder="Reply">
									</div>
								</div>
								  <!-- 回復貼文結束 -->
							</div>
						</div>
					</div>
					<input type="hidden" value="${bean.halaId}" name="prodIdForAjax" />


					<!-- reply template -->




					<!-- 					------------------------------------------- -->

					<c:forEach var="answer" items="${bean.answerHala}">
						<input class="answerHalaIdHidden" type="hidden"
							value="${answer.answerId}" />
<!-- 							<input id="answerHalaIdHidden" type="hidden" -->
<%-- 							value="${member.memberID}" name="memberid" id="memberIDforAjax2" /> --%>
							
						<div class="post-container">
							<div class="user-section">
								<div class="user-card">
									<img src="https://picsum.photos/200/300" alt="">
								</div>
							</div>

							<div class="post-section">
								<div class="post-header">
									<div class="post-author">
										<div class="post-index">2樓</div>
										<div class="post-user">
											<a href="" class="user-name">Kevin</a> <a href=""
												class="user-id">${answer.memberBean.memberID}</a>
										</div>
									</div>
									<div class="post-detail">${answer.answerDate}</div>
								</div>

								<div class="post-body">${answer.answerContent}</div>

								<div class="post-footer">
									<div class="reply-expand-button"></div>
									<div class="reply-list" id="fuckyoureplylist123">
										<!----------------------------------------------------回覆留言迴圈開始------------------------ -->
										<c:forEach var="respAnswerBean"
											items="${answer.responseAnswerBean}">
										<input type="hidden" value="${member.memNickName}" id="memberNickName" class="memberNickName">
											<div class="reply-item">
												<div class="reply-avatar">
													<img src="https://picsum.photos/200" alt="">
												</div>
												<div class="reply-content">
													<div class="reply-user">${bean.memberBean.memNickName}</div>
													<article class="reply-article">${respAnswerBean.responseAnswerContent}</article>
													<div class="reply-content-detail">${respAnswerBean.responseAnswerDate}</div>
												</div>
											</div>
										</c:forEach>
										<!-- -------------------------------------------------------------回覆留言迴圈結束------------------------ -->

									</div>
									<div id="div1" class="reply-editor">
										<input class="reply-article textForRespAnswer"
											onkeypress="handleKeyPress2(event)" type="text"
											placeholder="Reply">
									</div>
								</div>
							</div>
						</div>

					</c:forEach>
				</div>



				<!-- 新增回覆區域開始 -->
				<div style='width: 80%; margin: 30px; position: relative;'>
					<div class="comment-form" style=' margin-left: 130px ;margin-top:0'>
						<h4 class="comment-form-title font-alt">撰寫回覆</h4>
						<form
							action='<c:url value="/_06_halaAndQa.addAnswerHala.controller" />'
							method="post">
							<input type="hidden" name="hieId" value="${bean.halaId}">
							<input type="hidden" name="memberid" value="${member.memberID}">
							<div class="form-group">
								<textarea class="form-control" id="answerHalaContent"
									name="answerHalaContent" rows="4" placeholder="請寫入您的回覆"></textarea>
							</div>
							<button class="btn btn-round btn-d" type="submit">Post
								comment</button>
						</form>
					</div>
				</div>
				<!-- 新增回覆區域結束 -->
		</div>
		</div>
		</section>
		<!-- 中間欄位結束 -->


		<%-- 			<input type="hidden" value="${bean.halaId}" name="prodIdForAjax" /> --%>

	
	</main>
	<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
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
	<script>
		window.onscroll = function() {
			if (document.body.scrollHeight == document.body.scrollTop
					+ window.innerHeight) {
				window.scrollTo(0, document.body.scrollHeight);
			}
		};
	</script>
	<script>
		const toggleBtn = document.getElementById("toggleBtn");
		const targetDiv = document.getElementById("targetDiv");

		toggleBtn.addEventListener("mouseover", function() {
			targetDiv.style.display = "block";
		});

		toggleBtn.addEventListener("mouseout", function() {
			targetDiv.style.display = "none";
		});
	</script>
	<script>
		var halaIdInput = document.querySelector('input[name="prodIdForAjax"]');
		var halaId = halaIdInput.value;
		console.log("id=" + halaId);
		window.onload = function() {
			var xhr = new XMLHttpRequest();
			xhr.open("GET",
					"/MeetBoth/_06_halaAndQa.watch.controller?halaIdForWatch="
							+ halaId, true);
			xhr.send();
		};
	</script>
	<!-- 貼文留言 -->
	<script>
		function handleKeyPress(event) {
			if (event.key == 'Enter') {
				var newTextValue = document.getElementById("textForRespHala").value;
				var mID = document.getElementById("memberIDforAjax").value;
				console.log("newTextValue="+newTextValue);
				console.log("mID="+mID);
				$.ajax({
					url : '/MeetBoth/_06_halaAndQa.addResponseHala.controller',
					type : 'POST',
					data : {
						responseHalaContent : $('#textForRespHala').val(),
						halaId : $('#halaIdHidden').val(),
						memberid : mID
					},
					success : function(respones) {

					}
				});
				console.log("這是part1")
				var div0 = document.createElement("div");
				div0.setAttribute("class", "reply-item")

				var div1 = document.createElement("div");
				div1.setAttribute("class", "reply-avatar")

				var img1 = document.createElement("img");
				img1.setAttribute("src", "https://picsum.photos/200")
				img1.setAttribute("alt", "")
				console.log("這是part2")

				var div2 = document.createElement("div");
				div2.setAttribute("class", "reply-content")

				var div3 = document.createElement("div");
				div3.setAttribute("class", "reply-user")
				var memN = document.getElementById("memberNickName").value
				div3.innerHTML =memN;

				console.log("這是part3")
				var article1 = document.createElement("article");
				article1.setAttribute("class", "reply-article")
				article1.innerHTML = newTextValue;
				console.log("這是part3.1: " + newTextValue)

				var div4 = document.createElement("div");
				var d = new Date();
				var date = d.getFullYear() + '.'
						+ (d.getMonth() + 1).toString().padStart(2, '0') + '.'
						+ d.getDate().toString().padStart(2, '0');
				var time = d.getHours().toString().padStart(2, '0') + ':'
						+ d.getMinutes().toString().padStart(2, '0') + ':'
						+ d.getSeconds().toString().padStart(2, '0');
				div4.setAttribute("class", "reply-content-detail");
				div4.innerHTML = date + ' ' + time;

				console.log("這是part4")
				div2.appendChild(div3);
				div2.appendChild(article1);
				div2.appendChild(div4);
				div1.appendChild(img1);
				div0.appendChild(div1);
				div0.appendChild(div2);
				console.log("這是part5")

				var list = document.getElementById("fuckyoureplylist");
				console.log("這是part5.1")

				if (!list) {
					console.error("Cannot find element with id 'reply-List'");
					return;
				}

				list.appendChild(div0);
				console.log("這是part6")
				document.getElementById("textForRespHala").value = "";
				console.log("這是part7")

			}
		}
	</script>

	<!-- 	回復留言 -->
	<script>
		function handleKeyPress2(event) {
			if (event.key == 'Enter') {
// 				var newTextValue = document.getElementById("textForRespAnswer").value;
				
				var newTextValue = document.querySelectorAll('.textForRespAnswer'); 
				var hiddenID = document.querySelectorAll('.answerHalaIdHidden'); 
// 				var newTextValue = document.getElemensByClass('textForRespAnswer'); 
// 				var hiddenID = document.getElemensByClass('answerHalaIdHidden'); 
				
				
				var mID = document.getElementById("memberIDforAjax").value;
				
				for(var i=0;i<newTextValue.length;i++){

						console.log("newTextValue[i]="+newTextValue[i].value.length );
						if(newTextValue[i].value.length!=0){
						$.ajax({
							url : '/MeetBoth/_06_halaAndQa.addResponseAnswer.controller',
							type : 'POST',
							data : {
								responseAnswerContent : newTextValue[i].value,
								answerId : hiddenID[i].value
							},
							success : function(respones) {

							}
						});
// 						ajax end
						// 				innerHTML
				console.log("這是part1")
				var div0 = document.createElement("div");
				div0.setAttribute("class", "reply-item")

				var div1 = document.createElement("div");
				div1.setAttribute("class", "reply-avatar")

				var img1 = document.createElement("img");
				img1.setAttribute("src", "https://picsum.photos/200")
				img1.setAttribute("alt", "")
				console.log("這是part2")

				var div2 = document.createElement("div");
				div2.setAttribute("class", "reply-content")

				var div3 = document.createElement("div");
				div3.setAttribute("class", "reply-user")
				var memN = document.getElementById("memberNickName").value
				div3.innerHTML =memN

				console.log("這是part3")
				var article1 = document.createElement("article");
				article1.setAttribute("class", "reply-article")
				article1.innerHTML = newTextValue[i].value;
				console.log("這是part3.1: " + newTextValue[i])

				var div4 = document.createElement("div");
				var d = new Date();
				var date = d.getFullYear() + '.'
						+ (d.getMonth() + 1).toString().padStart(2, '0') + '.'
						+ d.getDate().toString().padStart(2, '0');
				var time = d.getHours().toString().padStart(2, '0') + ':'
						+ d.getMinutes().toString().padStart(2, '0') + ':'
						+ d.getSeconds().toString().padStart(2, '0');
				div4.setAttribute("class", "reply-content-detail");
				div4.innerHTML = date + ' ' + time;

				console.log("這是part4")
				div2.appendChild(div3);
				div2.appendChild(article1);
				div2.appendChild(div4);
				div1.appendChild(img1);
				div0.appendChild(div1);
				div0.appendChild(div2);
				console.log("這是part5")
// 				innerHTML
						
				var list = document.querySelectorAll('#fuckyoureplylist123');

// 				var list = document.getElementById("fuckyoureplylist123");
				console.log("這是part5.1")

				if (!list) {
					console.error("Cannot find element with id 'reply-List'");
					return;
				}

				list[i].appendChild(div0);
				console.log("這是part6")
				newTextValue[i].value = "";
				console.log("這是part7")

						}
					
						
				}//for i end
				

			}
		}
	</script>
</body>
</html>
