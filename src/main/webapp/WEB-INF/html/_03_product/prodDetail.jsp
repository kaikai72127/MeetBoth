<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE html>
<html>
<head>
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
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
<%
String basePathimg3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/index.jsp";
%>
<%
String basePathimg4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/backIndex.jsp";
%>

<title>肉丸家教網 MEET BOTH</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="index,follow" />
<meta name="description" content="全台最優質最快速方便的家教網" />
<meta name="author" content="EEIT56-MEETBOTH" />
<meta name="keywords" content="最棒最優質的家教網" />
<meta name="copyright" content="肉丸家教網" />
<link rel="shortcut icon" href="<%=basePathimg%>" />
<link rel="bookmark" href="<%=basePathimg%>" />
<link rel="stylesheet" href="<%=basePath%>" />
<style>
#top_div {
	display: flex;
	height: 525px;
	width: 1000px;
	margin: 0px auto;
	border: 1px dashed pink;
}

#pic_put_in_here {
	height: 500px;
	width: 400px;
	margin: 12.5px;
	padding: 12.5px;
}

#prod_detail {
	height: 500px;
	width: 580px;
	margin: 12.5px 12.5px 0px 0px;
	padding-left: 10px;
}

#prodName_title_put_there {
	height: 30px;
	width: 570px;
	margin: 0px 0px 0px 0px;
}

#prod_info {
	height: 30px;
	width: 570px;
	margin: 12.5px 0px 0px 0px;
}

#prod_chooseAmount {
	height: 30px;
	width: 570px;
	margin: 12.5px 0px 0px 0px;
}

#middle_div {
	height: 500px;
	width: 1000px;
	margin: 0px auto;
	padding: 12.5px;
	border: 1px dashed pink;
}

#prod_articel_title_block {
	display: flex;
	height: 150px;
	width: 975px;
	padding: 0px;
}

#member_info_pic {
	margin-right: 8px;
	margin-left: 0px;
}

#member_info_data {
	width: 845px;
}

#pathTOmemberPage {
	margin-top: 90px;
}

#prod_articel_body_block {
	border: 1px dashed pink;
	height: 325px;
	width: 975px;
}

#prod_articel_body_directions {
	resize: none;
	height: 325px;
	width: 975px;
	overflow-y: auto;
}

#third_div {
	border: 1px dashed pink;
	height: 400px;
	width: 1000px;
	margin: 0px auto;
	padding: 12.5px;
}

#prod_customs_comment_block {
	border: 1px dashed pink;
	height: 300px;
	width: 975px;
	overflow-y: auto;
}

#prod_customs_comment_pages_block {
	border: 1px dashed pink;
	height: 61px;
	width: 975px;
}

#page_for_show {
	width: 5px;
	height: 5px;
	cursor: pointer;
	border-color: black;
	border-radius: 50%;
	background-color: pink;
	margin: auto;
}

#page_not_show {
	width: 5px;
	height: 5px;
	cursor: pointer;
	border-color: white;
	border-radius: 50%;
	margin: auto;
}

#page_title {
	padding: 0;
	margin: auto;
	height: 5px;
	text-align: center;
}

#text-align {
	margin: auto;
}

#padding0 {
	width: 10px;
	height: 10px;
	padding: 0.75em 1.25em 0.75em 1.25em;
}

#foot_div {
	border: 1px dashed pink;
	height: 300px;
	width: 1000px;
	margin: 0px auto;
	padding: 12.5px;
}

#foot_title {
	height: 15%;
}

#foot_score {
	height: 25%;
}

#foot_comment {
	height: 50%;
}

#isertComment {
	resize: none;
	height: 125px;
	background-color: #F0F0F0;
}

#btn_insertComment {
	height: 20%;
}
</style>
</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<h1 class="logo">
						<strong>商品細節</strong>
					</h1>
				</header>

				<!-- Content -->
				<section style="padding-top: 10px">
					<c:forEach var="bean" items="${bean}">
						<div>
								<input type="button" value="返回商品目錄" onclick="window.location='/SpringBoot_Team5/_03_product.searchAllProduct.controller'">
								<input type="button" value="修改商品資料" onclick="window.location='/SpringBoot_Team5/_03_product.catchSingleProductDate.controller?id=${bean.prodID}'">
								<input type="button" value="刪除這項商品" id="${bean.prodID}" class="deleteThisProduct" />
						</div>
						<br />
						<div id="top_div">
							<div id="pic_put_in_here">
								<img id="preImg" style="width: 350px; height: 400px"
									src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodID}' />" />
							</div>
							<div id="prod_detail">
								<div id="prodName_title_put_there">
									<Strong>商品名稱 : ${bean.prodName}</Strong>
								</div>
								<div id="prod_info">
									<Strong>商品編號 : ${bean.prodID}</Strong>
								</div>
								<div id="prod_info">
									<Strong>商品類別編號 : ${bean.prodtype.prodClass}</Strong>
								</div>
								<div id="prod_info">
									<Strong>商品類別名稱 : ${bean.prodtype.prodClassName}</Strong>
								</div>
								<div id="prod_info">
									<Strong>商品價格 : ${bean.prodPrice}</Strong>
								</div>
								<div id="prod_info">
									<Strong>庫存數量 : ${bean.inventory}</Strong>
								</div>
								<div id="prod_info">
									<Strong>商品上架日期 : ${bean.prodPost}</Strong>
								</div>
								<div id="prod_info">
									<Strong>商品上次資訊更新日期 : ${bean.prodUpdate}</Strong>
								</div>
								<div id="prod_chooseAmount">
									<Strong> 選擇數量 : <input type="number"
										name="chooseAmount" value="0" id="amount"
										onkeyup="value=value.replace(/[^\d]/g,'') "
										onchange="calToCost(${bean.prodPrice},${bean.inventory})">
									</Strong>
								</div>
								<div id="prod_info">
									<Strong> 購買金額 : <input type="number" id="Cost"
										value="0" readonly>
									</Strong>
								</div>
								<div id="prod_info">
									<p align="right">
										<input type="button" value="加到購物車" style="background: white;">
									</p>
								</div>
							</div>
						</div>
						<div id="middle_div">
							<div id="prod_articel_title_block">
								<div id="member_info_pic">
									<img height='130' width='100' title="賣家圖片">
								</div>
								<div id="member_info_data">
									<Strong>賣家訊息1</Strong> <Strong>賣家訊息2</Strong> <Strong>賣家訊息3</Strong>
								</div>
								<input type="button" value="前往賣家個人頁面" id="pathTOmemberPage">
							</div>
							<div id="prod_articel_body_block">
								<div>
									<textarea id="prod_articel_body_directions"
										style="color: black;" readonly>${bean.directions}</textarea>
								</div>
							</div>
						</div>
						<div id="third_div">
							<div id="prod_customs_comment_block">
								<table id="tbl" border="1">
									<thead>
										<tr>
											<th align="left" style="width: 10%;">Custom_Name</th>
											<th align="left" style="width: 15%;">Product_score</th>
											<th align="left" style="width: 50%;">Custom_Comment</th>
											<th align="left" style="width: 25%;">Comment_date</th>
										</tr>
									</thead>
									<c:forEach var="commbean" items="${commBean}">
										<tbody>
											<tr>
												<td><Strong>${commbean.customID}</Strong></td>
												<td><Strong>${commbean.prodScore}</Strong></td>
												<td><Strong>${commbean.comment}</Strong></td>
												<td><Strong>${commbean.commentDate}</Strong></td>
											<tr>
										</tbody>
									</c:forEach>
								</table>
							</div>
							<div id="prod_customs_comment_pages_block">
								<span id='table_page'></span>
							</div>
						</div>
						<div id="foot_div">
							<form
								action="<c:url value='/_03_product.InsertProdComment.controller' />"
								method="post">
								<div id="foot_title">
									<Strong>新增商品留言</Strong>
								</div>
								<input type="hidden" name="id" value="${bean.prodID}" />
								<div id="foot_score">
									<table>
										<tr>
											<td style="width: 11%"><Strong>評分(1~5):</Strong></td>
											<td><select style="width: 900 px;" name="score">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
											</select></td>
										</tr>
									</table>
								</div>
								<div id="foot_comment">
									<textarea id="isertComment" placeholder="在此輸入評論" maxlength="50"
										name="comm"></textarea>
								</div>
								<div id="btn_insertComment" align="right">
									<input type="submit" value="新增留言" />
								</div>
							</form>
						</div>
					</c:forEach>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">

				<!-- Search -->
				<!-- 				<section id="search" class="alt"> -->
				<!-- 					<form method="post" action="#"> -->
				<!-- 						<input type="text" name="query" id="query" placeholder="Search" /> -->
				<!-- 					</form> -->
				<!-- 				</section> -->

				<!-- Menu -->
				<nav id="menu">
					<header class="major">
						<h2>
							<img src="<%=basePathimg2%>" alt="" />
						</h2>
					</header>

					<ul>
						<li><a href="<c:url value='/index.controller' />">首頁 <i
								class="fa-solid fa-house"></i></a></li>
						<li><a href="<c:url value='/backIndex.controller' />">後台管理
								<i class="fa-solid fa-gears"></i>
						</a></li>
						<li><a href="<c:url value='/_01_member.admin' />">會員資料 <i
								class="fa-solid fa-users-viewfinder"></i></a></li>
						<li><span class="opener">科目地區資料 <i
								class="fa-solid fa-magnifying-glass-location"></i></span>
							<ul>
								<li><a
									href="<c:url value='/_02_subLocation.SelectAllSub.controller' />">科目搜尋</a>
								<li><a
									href="<c:url value='/_02_subLocation.SelectAllLoc.controller' />">地點搜尋</a>
							</ul></li>
						<li><a
							href="<c:url value='/_03_product.searchAllProduct.controller'/>">商品資料
								<i class="fa-solid fa-store"></i>
						</a></li>
						<li><a
							href="<c:url value='/_04_shoppingCart.SelectAll.controller' />">訂單資料
								<i class="fa-solid fa-cart-shopping"></i>
						</a></li>
						<li><span class="opener">老師學生資料 <i
								class="fa-solid fa-users"></i></span>
							<ul>
								<li><a
									href="<c:url value='/_05_teacStu.searchAllTeac.controller' />">老師貼文資料</a></li>
								<li><a
									href="<c:url value='/_05_teacStu.searchAllStud.controller' />">學生貼文資料</a></li>
							</ul></li>
						<li><span class="opener">哈拉區 <i
								class="fa-solid fa-comments"></i></span>
							<ul>
								<li><a
									href="<c:url value='/_06_halaAndQa.SelectAllHala.controller' />">討論公告區</a></li>
								<li><a
									href="<c:url value='/_06_halaAndQa.SelectAllQa.controller' />">Q&A解答區</a></li>
							</ul></li>
					</ul>

				</nav>


				<!-- Section -->
				<section>
					<header class="major">
						<h2>聯絡我們</h2>
					</header>
					<Strong>肉丸家教網是一個希望不管是學生還是老師，都能在這裡精進自己，花最少的時間，找到最棒的老師/學生。</Strong>
					<ul class="contact">
						<li class="icon solid fa-envelope"><a href="#">information@untitled.tld</a>
						</li>
						<li class="icon solid fa-phone">(000) 000-0000</li>
						<li class="icon solid fa-home">1234 Somewhere Road #8254<br />
							Nashville, TN 00000-0000
						</li>
					</ul>
				</section>

				<!-- Footer -->
				<footer id="footer">
					<p class="copyright">
						&copy; Untitled. All rights reserved. Demo Images: <a
							href="https://unsplash.com">Unsplash</a>. Design: <a
							href="https://html5up.net">HTML5 UP</a>.
					</p>
				</footer>
			</div>

		</div>
	</div>

	<!-- Scripts -->

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
	<%
	String basePath6 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
			+ "/html/assets/js/jquery-tablepage-1.0.js";
	%>
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src=<%=basePath6%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>
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
	<script>
		$("#tbl").tablepage($("#table_page"), 10);
	</script>
	<script>
        $(function(){
            $('.deleteThisProduct').click(function(){
                let id=$(this).attr("id");
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
                         url:'/SpringBoot_Team5/_03_product.deleteProductById.controller',
                          method:"post",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"id":id},
                        })
                            .done(function () {
                            	window.location='/SpringBoot_Team5/_03_product.searchAllProduct.controller'
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
</body>
</html>
