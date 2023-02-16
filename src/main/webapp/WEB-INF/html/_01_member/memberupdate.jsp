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

                                }

                                input {
                                    border-color: azure;
                                    background-color: #000;
                                    color: azure;
                                    caret-color: auto;
                                    /* 預設 */
                                    caret-color: transparent;
                                    /* 透明 */
                                    caret-color: #FF1744;
                                    /* 指定色 */
                                    outline: none;
                                    /* 外框效果 */
                                }

                                .member {

                                    table-layout: auto;
                                    outline: 3px solid rgb(255, 255, 255);
                                    width: 60%;
                                    overflow-y: scroll;
                                    border-radius: 6px;
                                }

                                .member>tbody {
                                    overflow: scroll;
                                    border-radius: 6px;
                                }

                                .member>tbody>tr {
                                    height: 40px;
                                    overflow-y: scroll;
                                    margin: 10px;
                                    padding: 10px;
                                    font-size: 18.5px;
                                }

                                .member>tbody>tr>td {
                                    padding-left: 2%;
                                    padding-right: 2%;
                                    padding-top: 0.5%;
                                    padding-bottom: 0.5%;
                                    border: 2px dotted rgb(255, 255, 255);
                                }

                                /* .member>tbody>tr>td>input {
                                    font-size: 18px;
                                } */

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
                                    padding: 8px 20px;
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
                                }

                                .btn1:hover {
                                    background-color: rgb(255, 255, 255);
                                    color: rgb(0, 0, 0);
                                }
                            </style>
                            <!-- CSS -->
                            <link rel="stylesheet"
                                href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
                            <!-- jq -->
                            <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
                            <script src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
            </head>

            <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
                <main>

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
                                                        <header style="color: aliceblue; text-align: center;">
                                                            <h3>會員資料修改</h3>
                                                        </header>
                                                        <form method="POST" action="_01_member.update.controller"
                                                            enctype='multipart/form-data'>

                                                            <div style="overflow: auto;">
                                                                <table
                                                                    style="color: rgb(255, 255, 255); width: 80%;margin: auto;"
                                                                    class="member">
                                                                    <c:forEach var="Member" items="${Member}">
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>帳號：</label>
                                                                            </td>
                                                                            <td><input type="text" name="account"
                                                                                    value="${Member.account}" required
                                                                                    readonly
                                                                                    style="background-color: darkblue;">
                                                                            </td>
                                                                            <td rowspan="7" align="center"
                                                                                style="width: 250px; height: 250px">
                                                                                <!-- 												<div style="float:right;"> -->
                                                                                <input style="padding-left: 35px"
                                                                                    name='photofile' id="images5278"
                                                                                    type='file' /><br> <img id="preImg"
                                                                                    style="display: flex; flex-direction: flex-end"
                                                                                    width="250px" height="250px"
                                                                                    src="<c:url value='/_01_member.ShowPhoto.controller?account=${Member.account}'/>">
                                                                                <!-- 												</div> -->
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>密碼：</label>
                                                                            </td>
                                                                            <td><input type="password" id="pas1check"
                                                                                    name="password" onblur="pasvalid()"
                                                                                    value="${Member.password}" required
                                                                                    readonly
                                                                                    style="background-color: darkblue;">
                                                                            </td>
                                                                        </tr>
                                                                        <!-- 										<tr> -->
                                                                        <!-- 											<td style="width: 150px;"><label>確認密碼：</label></td> -->
                                                                        <!-- 											<td><input type="password" id="pas2check" -->
                                                                        <!-- 												onblur="checkpwd()" name="passwordcheck" required></td> -->
                                                                        <!-- 										</tr> -->
                                                                        <tr>
                                                                            <td style="width: 150px;">
                                                                                <label>身分證字號：</label>
                                                                            </td>
                                                                            <td><input type="text" name="idNumber"
                                                                                    value="${Member.idNumber}" required
                                                                                    readonly
                                                                                    style="background-color: darkblue;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>姓名：</label>
                                                                            </td>
                                                                            <td><input type="text" name="memName"
                                                                                    value="${Member.memName}" required>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>暱稱：</label>
                                                                            </td>
                                                                            <td><input type="text" name="memNickName"
                                                                                    value="${Member.memNickName}"></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>年齡：</label>
                                                                            </td>
                                                                            <td colspan="2"><input type="text"
                                                                                    name="memOld"
                                                                                    oninput="value=value.replace(/[^\d]/g,'')"
                                                                                    value='${Member.memOld}' required
                                                                                    readonly
                                                                                    style="background-color: darkblue;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>生日：</label>
                                                                            </td>
                                                                            <td colspan="2"><input type="Date"
                                                                                    name="memBirth"
                                                                                    value="${Member.memBirth}" required>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>性別：</label>
                                                                            </td>
                                                                            <td colspan="2"><input type="text"
                                                                                    name="memGender"
                                                                                    value="${Member.memGender}"
                                                                                    required>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;">
                                                                                <label>電子郵件：</label>
                                                                            </td>
                                                                            <td colspan="2"><input type="text"
                                                                                    name="eMail" id="mail"
                                                                                    onblur="checkmail()"
                                                                                    value="${Member.eMail}" required>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>手機：</label>
                                                                            </td>
                                                                            <td colspan="2"><input type="text"
                                                                                    name="phone"
                                                                                    oninput="value=value.replace(/[^\d]/g,'')"
                                                                                    value="${Member.phone}" required
                                                                                    readonly
                                                                                    style="background-color: darkblue;">
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>地址：</label>
                                                                            </td>
                                                                            <td colspan="2"><input type="text"
                                                                                    name="address"
                                                                                    value="${Member.address}" required>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 150px;"><label>權限：</label>
                                                                            </td>
                                                                            <td colspan="2"><select name="role"
                                                                                    style="background-color: black;">
                                                                                    <option
                                                                                        style="background-color: black;"
                                                                                        value="user" selected>使用者
                                                                                    </option>
                                                                                    <option value="admin"
                                                                                        style="background-color: black;">
                                                                                        管理員</option>
                                                                                </select>
                                                                            </td>
                                                                        </tr>



                                                                        <tr height="42">
                                                                            <td colspan='4'>
                                                                                <div align="center">
                                                                                    <input class="btn1" type="submit"
                                                                                        name="submit" id="submit"
                                                                                        value="儲存" />
                                                                                    <input class="btn1" type="reset"
                                                                                        name="cancel" id="cancel"
                                                                                        value="重填">
                                                                                </div>
                                                                            </td>
                                                                        </tr>
                                                                    </c:forEach>
                                                                </table>
                                                            </div>
                                                        </form>

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
                                    <script>
                                        $("#images5278").change(function () {
                                            readURL(this);
                                        });

                                        function readURL(input) {
                                            if (input.files && input.files[0]) {
                                                var reader = new FileReader();
                                                reader.onload = function (e) {
                                                    $("#preImg").attr('src', e.target.result);
                                                }
                                                reader.readAsDataURL(input.files[0]);
                                            }
                                        }
                                    </script>

            </html>