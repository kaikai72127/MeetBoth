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
                            <!-- <link rel="stylecheet" href="//cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
                            <link rel="script" href="//cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"> -->

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
                                    font-size: 25px;
                                }

                                .prodtable>tbody>tr>td {
                                    border-right: solid 1px white;
                                    border-top: solid 1px white;
                                    font-size: 25px;
                                }

                                .btn1 {
                                    /* 文字颜色 */
                                    color: rgb(255, 179, 179);
                                    /* 清除背景色 */
                                    background: transparent;
                                    /* 边框样式、颜色、宽度 */
                                    border: 2px solid rgb(255, 179, 179);
                                    /* 给边框添加圆角 */
                                    border-radius: 6px;
                                    /* 字母转大写 */

                                    border: none;
                                    color: white;
                                    padding: 0;
                                    text-align: center;
                                    display: inline-block;
                                    font-size: 15px;
                                    margin: 4px 2px;
                                    border-radius: 30px;
                                    -webkit-transition-duration: 0.4s;
                                    /* Safari */
                                    transition-duration: 0.4s;
                                    cursor: pointer;
                                    text-decoration: none;
                                    text-transform: uppercase;
                                }

                                .btn1 {
                                    border: 1px ridge white;
                                    font-size: 18px;
                                }

                                .btn1:hover {
                                    background-color: rgb(255, 255, 255);
                                    color: rgb(0, 0, 0);
                                }

                                input {
                                    width: 150px;
                                    border-color: azure;
                                    background-color: #000;
                                    color: azure;
                                    width: 300px;

                                    caret-color: auto;
                                    /* 預設 */
                                    caret-color: transparent;
                                    /* 透明 */
                                    caret-color: #FF1744;
                                    /* 指定色 */
                                    outline: none;
                                    /* 外框效果 */
                                }

                                input:focus::-webkit-input-placeholder {
                                    color: transparent;
                                }

                                input:focus:-moz-placeholder {
                                    color: transparent;
                                }

                                /* FF 4-18 */
                                input:focus::-moz-placeholder {
                                    color: transparent;
                                }

                                /* FF 19+ */
                                input:focus:-ms-input-placeholder {
                                    color: transparent;
                                }

                                ::placeholder {
                                    font-size: 18px;
                                    color: aliceblue;
                                }
                            </style>
                            <!-- CSS -->

                            <!-- <link rel="stylesheet"
                                href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css"> -->
                            <link rel="stylesheet" href="js/datatable.css">
                            <!-- jq -->
                            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                            <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
                            <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                            <script>
                                $(document).ready(function () {
                                    $('#member').DataTable({
                                        "searching": true,
                                        "lengthMenu": [8],

                                        "language": {
                                            "processing": "處理中...",
                                            "loadingRecords": "載入中...",
                                            "lengthMenu": "顯示 _MENU_ 項結果",
                                            "zeroRecords": "沒有符合的結果",
                                            "info": "顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項",
                                            "infoEmpty": "顯示第 0 至 0 項結果，共 0 項",
                                            "infoFiltered": "(從 _MAX_ 項結果中過濾)",
                                            "infoPostFix": "",
                                            "search": "搜尋:",
                                            "paginate": {
                                                "first": "第一頁",
                                                "previous": "上一頁",
                                                "next": "下一頁",
                                                "last": "最後一頁"
                                            }
                                        },
                                        "ajax": {
                                            url: 'ajaxdata',
                                            dataSrc: "",
                                            type: 'GET'
                                        },
                                        "columns": [ //列的標題一般是從DOM中讀取（你還可以使用這個屬性為表格創建列標題)
                                            { data: "memberID" },
                                            { data: "account" },
                                            { data: "memName" },
                                            { data: "memGender" },
                                            { data: "eMail" },
                                            { data: "phone" },
                                            { data: "registime" },
                                            {
                                                title: "修改", render: function (data, type, row) {
                                                    // 回傳一個 HTML 按鈕，並以 memberID 傳遞參數
                                                    return '<form method="post" action="_01_member.preupdate.controller">'
                                                        + '<button name="preupdate" value="' + row.memberID + '">'
                                                        + '<i style="color: #000;" class="fa-solid fa-user"></i>'
                                                        + '</button>'
                                                        + '</form>';
                                                }
                                            },
                                            {
                                                title: "移除", render: function (data, type, row) {
                                                    // 回傳一個 HTML 按鈕，並以 memberID 傳遞參數
                                                    return '<form id="delete" method="post" action="_01_member.delete.controller">'
                                                        + '<button name="delete" onclick="cb(' + row.memberID + ')" >'
                                                        + '<i style="color: #ff0000;" class=" fa-solid fa-xmark"></i>'
                                                        + '</button>'
                                                        + '</form>';
                                                }
                                            }
                                        ]


                                    });
                                });
                            </script>
                            <script>
                                function cb(memberID) {
                                    event.preventDefault();
                                    console.log(memberID)
                                    Swal.fire({
                                        title: '確定要刪除嗎?',
                                        text: "資料會消失喔!",
                                        icon: 'warning',
                                        showCancelButton: true,
                                        confirmButtonColor: '#3085d6',
                                        cancelButtonColor: '#d33',
                                        confirmButtonText: 'Yes, delete it!'
                                    }).then((result) => {
                                        if (result.isConfirmed) {
                                            $("#delete").append('<input type="hidden" name="delete" value="' + memberID + '">').submit();
                                            Swal.fire(
                                                'Deleted!',
                                                'Your file has been deleted.',
                                                'success'
                                            )
                                        }
                                    })
                                }
                                function registery() {
                                    location.href = "_01_member.backregister.controller";
                                }

                                function allMember() {
                                    location.href = "_01_member.selectAll.controller";
                                }
                            </script>

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
                                    <jsp:include page="/WEB-INF/html/fragment/AdminIndexSideBar.jsp" />
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

                                                    <!-- Content -->
                                                    <section>
                                                        <div>
                                                            <h3 style="color: aliceblue;text-align: center;">會員管理列表</h3>
                                                        </div>
                                                        <div style="text-align: center;">
                                                            <form action="_01_member.selectByKeyword.controller"
                                                                method="POST" modelAttribute="Member">
                                                                <!-- <input type="text" name="value" value="${value}"
                                                                    style="text-align: center;" placeholder="請輸入查詢文字"
                                                                    required>
                                                                <input class="btn1" style="width: 100px;" type="submit"
                                                                    name="selectByAccount" value="查詢" /> -->
                                                                <!-- onclick="this.form.action='_01_member.selectByAccount.controller'" /> -->
                                                                <!-- <input class="btn1" type="submit" name="selectByName"
                                                                    value="以姓名查詢"
                                                                    onclick="this.form.action='_01_member.selectByName.controller'" /> -->
                                                                <button class="btn1" name="register"
                                                                    style="padding: 0% 30px;"
                                                                    onclick="event.preventDefault(); registery()">新增會員</button>
                                                                <!-- <button class="btn1" name="selectAll"
                                                                    style="padding: 0% 30px;"
                                                                    onclick="event.preventDefault(); allMember()">取得所有會員</button> -->
                                                            </form>
                                                            <form action="#" method="POST" modelAttribute="Member">

                                                            </form>
                                                        </div>

                                                        <!-- 
                                                        <form action="#" method="POST" modelAttribute="Member">
                                                        </form> -->

                                                        <div>
                                                            <table id="member"
                                                                style="width: 100%; color: aliceblue; font-size: 19px;">
                                                                <!-- style="color: rgb(255, 255, 255); text-align: center; width: 100%;"
                                                                class="prodtable"> -->
                                                                <thead>
                                                                    <tr>
                                                                        <th>會員編號</th>
                                                                        <th>帳號</th>
                                                                        <!-- <th>密碼</th> -->
                                                                        <!-- <th>身分證字號</th> -->
                                                                        <th>姓名</th>
                                                                        <!-- <th>年齡</th> -->
                                                                        <!-- <th>生日</th> -->
                                                                        <th>性別</th>
                                                                        <th>電子郵件</th>
                                                                        <th>電話號碼</th>
                                                                        <!-- <th>地址</th> -->
                                                                        <th>註冊時間</th>
                                                                        <th>修改</th>
                                                                        <th>移除</th>
                                                                    </tr>
                                                                </thead>

                                                            </table>
                                                        </div>
                                                    </section>

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