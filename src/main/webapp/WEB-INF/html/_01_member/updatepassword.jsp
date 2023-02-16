<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


            <!DOCTYPE html>
            <html lang="zh-hant-TW">

            <head>
                <!-- 引入共同的headMVC -->
                <jsp:include page="../fragment/headMVC.jsp" />
                <jsp:include page="js/myjs.jsp" />
                <script>
                    function verify() {
                        console.log("檢查信箱");
                        var mailcheck = $('#mailcheck').val();
                        var mail = $('#email').val();
                        console.log(mailcheck);
                        console.log(mail);
                        if (mailcheck == mail) {
                            console.log("提交");
                            swal.fire('已將密碼更新信函寄到' + mail + "囉！");
                            $('#check').submit();
                        } else {
                            swal.fire('你輸入的信箱不是你的喔！');
                            $('#email').val() = "";
                        }
                    }
                </script>
            </head>

            <!--BOBY-->

            <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

                <!-- header -->
                <!-- 引入共同的topMVC -->
                <jsp:include page="../fragment/topMVC.jsp" />

                <main>
                    <div class="page-loader">
                        <div class="loader">Loading...</div>
                    </div>

                    <!-- LoginRegister-->

                    <section class="forgotpassword">
                        <div class="container">
                            <div class="row">
                                <div class="col-sm-5 col-sm-offset-1 mb-sm-40">
                                    <h4 class="font-alt h4-p">請填寫驗證信地址</h4>
                                    <hr class="divider-w mb-10">
                                    <form id="check" class="form" action="<%=request.getContextPath()%>/forgotpassword"
                                        method="Post">

                                        <div class="form-group">
                                            <input class="form-control" style="text-transform: none;" id="account"
                                                type="text" name="account" value='${member.account}' placeholder="請輸入帳號"
                                                readonly />
                                            <input type="hidden" class="form-control" style=" text-transform: none;"
                                                id="mailcheck" type="text" name="mailcheck" value='${member.eMail}'
                                                readonly />123
                                            <input class="form-control" style="text-transform: none;" id="email"
                                                type="text" name="mail" value='${value}' placeholder="請輸入信箱" />
                                        </div>

                                        <div class="form-group">
                                            <button class="btn btn-round btn-p"
                                                onclick="event.preventDefault();verify();">進行驗證</button>
                                        </div>


                                    </form>

                                </div>

                            </div>
                        </div>
                    </section>

                    <!-- Footer -->
                    <!-- 引入共同的footerMVC -->
                    <jsp:include page="../fragment/footerMVC.jsp" />
                </main>

                <!--  
    JavaScripts
    =============================================
    -->
                <!-- 引入共同的js -->
                <jsp:include page="../fragment/jsPath.jsp" />



            </body>

            </html>