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
<%
String basePathimg3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/index.jsp";
%>
<%
String basePathimg4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/backIndex.jsp";
%>
<!-- 引入共同的頁首 -->
<%-- <%@ include file="/html/backMVC.jsp" %> --%>
<%-- <jsp:include page="/html/backMVC.jsp" flush="true" /> --%>
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
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
<!-- SweetAlert js -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>
<body class="is-preload">
	<!-- Wrapper -->
	<div id="wrapper">

		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<h1 class="logo">
						<strong>管理者介面</strong>
					</h1>
				</header>

				<!-- Content -->
				<section>
					<header class="main">
						<h2 style="margin: 0; float: left">科目CRUD</h2>
						<form method="get"
							action="<c:url value='/_02_subLocation.InsertSubMain.controller' />">
							<button name="orderNo">
								<i class="fa-solid fa-square-plus"></i>
							</button>
						</form>
					</header>
					<!-- Search -->
					<!-- 					<section id="search" class="alt"> -->
					<form
						action="<c:url value='/_02_subLocation.SearchSub.controller' />"
						method="post">
						<input type="text" name="subclass" id="subclass"
							placeholder="Search" />
					</form>
					<!-- 					</section> -->

					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt">
							<thead>
								<tr>
									<th>科目編號</th>
									<th>科目名稱</th>
									<th>科目分類</th>
									<th width=80px>編輯</th>
									<th width=80px>刪除</th>
								</tr>
							</thead>
							<c:forEach var="bean" items="${classList}">
								<tbody>
									<tr>
										<td>${bean.subjectId}</td>
										<td>${bean.subjectName}</td>
										<td>${bean.subjectClass}</td>
										<td><form method="post"
												action="<c:url value='/_02_subLocation.UpdateSubMain.controller' />">
												<button name="subjectId" value="${bean.subjectId}">
													<i class="fa-solid fa-pen-to-square"></i>
												</button>
											</form></td>
										<td><button class="deleteThisSubjectId" name="subjectId"
												value="${bean.subjectId}">
												<i class="fa-solid fa-xmark"></i>
											</button></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
					</div>
				</section>
			</div>
		</div>

		<!-- Sidebar -->
		<div id="sidebar">
			<div class="inner">
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
					<p>肉丸家教網是一個希望不管是學生還是老師，都能在這裡精進自己，花最少的時間，找到最棒的老師/學生。</p>
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
	<script src=<%=basePath1%>></script>
	<script src=<%=basePath2%>></script>
	<script src=<%=basePath3%>></script>
	<script src=<%=basePath4%>></script>
	<script src=<%=basePath5%>></script>
	<script src="https://kit.fontawesome.com/25590258af.js"
		crossorigin="anonymous"></script>

	<script>
        $(function(){
            $('.deleteThisSubjectId').click(function(){
                let id=$(this).attr("value");
                Swal.fire({
                  title: '你確定要刪除嗎?',
                  text: "將無法恢復此筆貼文!!!",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 這幾種選項
                  showCancelButton: true,
                  confirmButtonColor: '#FFEBAD',
                  cancelButtonColor: '#F0DBDB',
                  confirmButtonText: '確定刪除'
//                   cancelButtonText: '取消',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                          //專案名稱+servlet
                          url:'/SpringMVC_Team5/_02_subLocation.DeleteSub.controller',
                          method:"get",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"subjectId":id},
                        })
                            .done(function () {
                                location.reload();
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
<!--      <td> -->
<%--                      <Form  action="<c:url value='/Servlet/searchAllTeacServlet' />"  --%>
<!--                             method="POST"> -->
<!--                                 教師貼文數量: -->
<!--                         <select name='qty'> -->
<!--                            <option value="1">1</option> -->
<!--                            <option value="2">2</option> -->
<!--                            <option value="3">3</option> -->
<!--                            <option value="4">4</option> -->
<!--                            <option value="5">5</option> -->
<!--                            <option value="6">6</option> -->
<!--                            <option value="7">7</option> -->
<!--                            <option value="8">8</option> -->
<!--                            <option value="9">9</option> -->
<!--                            <option value="10">10</option> -->
<!--                        </select> -->
<!--                        這些隱藏欄位都會送到後端 -->
<%--                        <Input type='hidden' name='bookId' value='${entry.value.bookId}'> --%>
<%--                        <Input type='hidden' name='pageNo' value='${param.pageNo}'> --%>
<!--                        <label><i class="fa-solid fa-cart-shopping"></i><Input type='submit' value='加入購物車'> -->
<!--                        </label> -->
<!--                      </Form> -->
<!--     </td> -->