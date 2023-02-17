<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String baseMeetboth96x96 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/images/meatball/meatball-96x96-New.png";
System.out.println(baseMeetboth96x96);
%>
<c:set value="${CartSize}" var="cartsize" />
<c:set value="${ShoppingCart}" var="ShoppingCart" />
<c:set value="${Member}" var="Member" />
<!-- header -->
<nav class="navbar navbar-custom navbar-fixed-top headershadow"
	role="navigation">
	<div class="container-nav">
		<!--Navbar橫幅 -->
		<div class="navbar-header">
			<button class="navbar-toggle" type="button" data-toggle="collapse"
				data-target="#custom-collapse">
				<span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span
					class="icon-bar"></span><span class="icon-bar"></span>
			</button>
			<img src="<%=baseMeetboth96x96%>" style="float: left" /> <a 
				class="navbar-brand" href="<c:url value='/index.controller' />">
				肉丸家教網</a>
			<!-- <a class="navbar-brand" href="index.html">肉丸家教網-MEET BOTH</a> -->
		</div>

		<div class="collapse navbar-collapse" id="custom-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<!--Navbar橫幅 搜尋教師 --> <a class="dropdown-toggle" href="#"
					data-toggle="dropdown">MeetBoth</a>
					<ul class="dropdown-menu">
						<li><a href="/MeetBoth/_05_teacStu.searchAllTeac.controller/1">履歷貼文</a>
						</li>
						<li><a href="/MeetBoth/_05_teacStu.searchAllStud.controller/1">需求貼文</a>
						</li>
					</ul>
				</li>

				<!--Navbar橫幅 隨堂測驗 -->
				<li class="dropdown"><a class="dropdown-toggle" href="#"
					data-toggle="dropdown">線上課程</a>
					<ul class="dropdown-menu">
					<li class="dropdown">
						<a href="/MeetBoth/searchAllCourse.controller">線上課程目錄</a>
							</li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">課程管理</a>
							<ul class="dropdown-menu">
								<li><a href="/MeetBoth/pathToSearchAllCourseMember.controller">我購買的課程</a>
							</ul></li>
					</ul></li>

				<!--Navbar橫幅 Shop -->
				<li class="dropdown"><a class="dropdown-toggle" href="#"
					data-toggle="dropdown">地圖搜尋</a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="/MeetBoth/searchAllMap.controller">我的地圖</a></li>
<!-- 						<li><a href="shop_checkout.html">Checkout</a></li> -->
					</ul></li>

				<!--Navbar橫幅 Pages -->
				<!-- <li class="dropdown">
                <a class="dropdown-toggle" href="#" data-toggle="dropdown"
                  >科目與地區</a
                >
                <ul class="dropdown-menu">
                  <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown"
                      >科目搜尋管理</a
                    >
                    <ul class="dropdown-menu">
                      <li><a href="about1.html">英文</a></li>
                      <li><a href="about2.html">數學</a></li>
                      <li><a href="about3.html">理化</a></li>
                      <li><a href="about4.html">音樂</a></li>
                      <li><a href="about5.html">美術</a></li>
                    </ul>
                  </li>
                  <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown"
                      >地區搜尋管理</a
                    >
                    <ul class="dropdown-menu">
                      <li><a href="service1.html">北部</a></li>
                      <li><a href="service2.html">中部</a></li>
                      <li><a href="service3.html">南部</a></li>
                      <li><a href="#">東部</a></li>
                      <li><a href="#">離島</a></li>
                      <li><a href="#">海外</a></li>
                    </ul>
                  </li>
                </ul>
              </li> -->

				<!--Navbar橫幅 Prorfolio -->
				<li class="dropdown"><a class="dropdown-toggle" href="#"
					data-toggle="dropdown">買賣專區</a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown">
						<a href="/MeetBoth/_03_product.searchAllProduct.controller/1">商品目錄</a>
							</li>
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">熱門商品類別</a>
							<ul class="dropdown-menu">
								<li><a href="/MeetBoth/_03_product.searchProductByType.controller/1/1">學生用品</a></li>
								<li><a href="/MeetBoth/_03_product.searchProductByType.controller/1/2">教學用品</a></li>
								<li><a href="/MeetBoth/_03_product.searchProductByType.controller/1/6">好書推薦</a></li>
							</ul></li>
					</ul></li>

				<!--Navbar橫幅 Blog -->
				<li class="dropdown"><a class="dropdown-toggle" href=""
					data-toggle="dropdown">哈拉討論區</a>
					<ul class="dropdown-menu" role="menu">
						<li class="dropdown"><a class="dropdown-toggle" href="#"
							data-toggle="dropdown">隨便聊聊</a>
							<ul class="dropdown-menu">
								<li><a href="/MeetBoth/_06_halaAndQa.SelectAllHala.controller/1">HALA</a></li>
							</ul></li>
					</ul></li>

				<!-- <li>
                 我的最愛 
                <a href="" class="btn border">
                  <i class="fas fa-heart text-primary"></i>
                  <span class="badge">0</span>
                </a>
              </li> -->
				<li>
					<!-- 購物車 --> <a href="<c:url value='/shoppingcart.controller' />"
					class="btn border"> <i
						class="fas fa-shopping-cart text-primary"></i>
						<c:if test="${not empty cartsize}">
							<span class="badge" id="cartCount">${cartsize}</span>
							</c:if>
							<c:if test="${empty cartsize}">
								<span class="badge" id="cartCount">0</span>
							</c:if></a>
				</li>

              <!--Navbar橫幅 Login會員登入 -->
              <li id="loginBtn" class="nav-item dropdown"><a href="<%=request.getContextPath()%>/login/page"
                  class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                  <img class="rounded-circle me-lg-2"
                    src="<%=request.getContextPath()%>/html/assets/images/meatball/meatball-32x32.png" alt=""
                    style="width: 24px; height: 24px" /> <span class="d-none d-lg-inline-flex">登入/註冊<i
                      class="fa-solid fa-right-to-bracket"></i>
                  </span>
                </a>
              <li id="logoutBtn" class="nav-item dropdown"><a href="#" class="nav-link dropdown-toggle"
                  data-bs-toggle="dropdown">
                  <img class="rounded-circle me-lg-2"
                    src="/MeetBoth/_01_member.ShowPhoto.controller?account=${pageContext.request.userPrincipal.name}"
                    alt="" style="width: 24px; height: 24px" /> <span id="username" class="d-none d-lg-inline-flex"
                    style="border-radius: 200px
                  ;"><i class="fa-solid fa-right-to-bracket"></i>
                  </span>
                </a>
                <ul class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                  <li><a href="/MeetBoth/myMemberResume" class="dropdown-item">我的會員頁面<i
                        class="fa-solid fa-right-from-bracket"></i>
                    </a></li>  
                  <li>
                    <form action="/MeetBoth/_01_member.membercenter.controller" method="post" id="memberCenter"></form>
                    <a href="#" onclick="document.getElementById('memberCenter').submit();return false"
                      class="dropdown-item">會員資料修改<i class="fa-solid fa-user"></i></a>
                  </li>
                  <li><a href="/MeetBoth/_03_product/pathToMyPDP.controller" class="dropdown-item">我的平台<i
                        class="fa-solid fa-right-from-bracket"></i>
                    </a></li>
                  <li id="admincontroller"><a href="/MeetBoth/_03_product.index.controller" class="dropdown-item">後臺管理
                      <i class="fa-solid fa-right-from-bracket"></i>
                    </a></li>
                  <li><a href="/MeetBoth/logout" class="dropdown-item">登出<i class="fa-solid fa-right-from-bracket"></i>
                    </a></li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </nav>