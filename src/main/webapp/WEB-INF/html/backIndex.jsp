<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <! DOCTYPE html>
            <html>

            <head>
                <% String path=request.getContextPath(); String basePath=request.getScheme() + "://" +
                    request.getServerName() + ":" + request.getServerPort() + path + "/html/assets/css/main.css" ; %>
                    <% String pathimg=request.getContextPath(); String basePathimg=request.getScheme() + "://" +
                        request.getServerName() + ":" + request.getServerPort() + pathimg
                        + "/html/images/meatball-icon.png" ; %>
                        <% String basePathimg2=request.getScheme() + "://" + request.getServerName() + ":" +
                            request.getServerPort() + path + "/html/images/meatball-200.png" ; %>

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

                                p {
                                    color: white;
                                    font-size: 25px;
                                    font-width: 550;
                                }
                            </style>
            </head>

            <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
                <main>
                    <div class="page-loader">
                        <div class="loader">Loading...</div>
                    </div>
                    <div class="main" style="background-color: black;">
                        <section class="module" style="padding-top: 10px;padding-bottom:0px;">
                            <div class="container" style="width: 100%; background-color: black;">
                                <!-- 整頁 -->
                                <div class="row">
                                    <!-- 整頁 -->
                                    <!-- 左邊欄位開始 -->
                                    <div class="col-sm-4 col-md-3 sidebar" style="width:20%;padding-right:0px;">
                                        <div class="widget">
                                            <a href="#"><img src="/MeetBoth/html/assets/images/shop/警告.jpg"
                                                    style="padding-bottom: 10px;"></a>
                                            <ul class="cart">
                                                <li><a href="#" style="color: white;font-size:20px;"
                                                        class="btn btn-d btn-round">會員管理&ensp;<i
                                                            class="fa-solid fa-angle-double-down"></i></a>
                                                    <ul style="">
                                                        <li><a href="_01_member.admin.controller"
                                                                style="color: white;font-weight:600;"
                                                                class="btn btn-d btn-round">所有會員清單</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" style="color: white;font-size:20px;"
                                                        class="btn btn-d btn-round">商品管理&ensp;<i
                                                            class="fa-solid fa-angle-double-down"></i></a>
                                                    <ul style="">
                                                        <li><a href="#" style="color: white;font-weight:600;"
                                                                class="btn btn-d btn-round">所有商品清單</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" style="color: white;font-size:20px;"
                                                        class="btn btn-d btn-round">課程管理&ensp;<i
                                                            class="fa-solid fa-angle-double-down"></i></a>
                                                    <ul style="">
                                                        <li><a href="#" style="color: white;font-weight:600;"
                                                                class="btn btn-d btn-round">所有課程清單</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" style="color: white;font-size:20px;"
                                                        class="btn btn-d btn-round">徵才管理&ensp;<i
                                                            class="fa-solid fa-angle-double-down"></i></a>
                                                    <ul style="">
                                                        <li><a href="#" style="color: white;font-weight:600;"
                                                                class="btn btn-d btn-round">所有貼文清單</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" style="color: white;font-size:20px;"
                                                        class="btn btn-d btn-round">討論區管理&ensp;<i
                                                            class="fa-solid fa-angle-double-down"></i></a>
                                                    <ul style="">
                                                        <li><a href="#" style="color: white;font-weight:600;"
                                                                class="btn btn-d btn-round">所有貼文清單</a></li>
                                                    </ul>
                                                </li>
                                                <li><a href="#" style="color: white;font-size:20px;"
                                                        class="btn btn-d btn-round">購物車管理&ensp;<i
                                                            class="fa-solid fa-angle-double-down"></i></a>
                                                    <ul style="">
                                                        <li><a href="#" style="color: white;font-weight:600;"
                                                                class="btn btn-d btn-round">所有購物單清單</a></li>
                                                    </ul>
                                                </li>
                                            </ul>
                                            <a href="#"><img src="/MeetBoth/html/assets/images/shop/警告2.jpg"
                                                    style="padding-bottom: 10px;"></a>
                                        </div>
                                    </div>
                                    <!-- 左邊欄位結束 -->
                                    <!-- 						右邊欄位開始 -->
                                    <div class="col-sm-8 col-sm-offset-1"
                                        style="margin-left: 20px;width:75%;border-left:solid 1px yellow;">
                                        <div class="post">
                                            <!-- 							標題 -->
                                            <div class="post-thumbnail" style="padding-bottom:0;margin-bottom:0;">
                                                <h1
                                                    style="padding-bottom: 0px;margin-bottom:0; text-align: center; font-size: 50px; color:white;">
                                                    網站資料</h1>
                                            </div>
                                            <hr class="divider-w pt-20">
                                            <!-- 							標題 -->
                                            <!--       右邊第一部分開始 -->
                                            <div class="post">
                                                <div class="post-video embed-responsive embed-responsive-16by9">
                                                    <div>
                                                        <p>網站名稱 : 肉丸家教網 MeetBoth</p>
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
                        <%-- <jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" /> --%>
                    </div>
                    <div class="scroll-up">
                        <a href="#totop"><i class="fa fa-angle-double-up"></i></a>
                    </div>
                </main>
                <!--  
    JavaScripts
    =============================================
    -->
                <% String basePath1=request.getScheme() + "://" + request.getServerName() + ":" +
                    request.getServerPort() + path + "/html/assets/js/jquery.min.js" ; %>

                    <% String basePath2=request.getScheme() + "://" + request.getServerName() + ":" +
                        request.getServerPort() + path + "/html/assets/js/browser.min.js" ; %>

                        <% String basePath3=request.getScheme() + "://" + request.getServerName() + ":" +
                            request.getServerPort() + path + "/html/assets/js/breakpoints.min.js" ; %>

                            <% String basePath4=request.getScheme() + "://" + request.getServerName() + ":" +
                                request.getServerPort() + path + "/html/assets/js/util.js" ; %>

                                <% String basePath5=request.getScheme() + "://" + request.getServerName() + ":" +
                                    request.getServerPort() + path + "/html/assets/js/main.js" ; %>
                                    <script src=<%=basePath1%>></script>
                                    <script src=<%=basePath2%>></script>
                                    <script src=<%=basePath3%>></script>
                                    <script src=<%=basePath4%>></script>
                                    <script src=<%=basePath5%>></script>
                                    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
                                    <script src="https://kit.fontawesome.com/25590258af.js"
                                        crossorigin="anonymous"></script>
                                    <script>
                                            $(document).ready(function () {
                                                //以ul li包子選單
                                                $('.cart>li>a').click(function (event) {
                                                    event.preventDefault();
                                                    $(this).toggleClass('active');
                                                    $(this).siblings('ul').slideToggle(500);
                                                });
                                                //html以div h3 h5包子選單
                                                $('.list h3').click(function (event) {
                                                    $(this).toggleClass('active');
                                                    $(this).siblings('h5').slideToggle(500);
                                                });

                                            });
                                    </script>

            </html>