<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



            <!DOCTYPE html>
            <html lang="zh-hant-TW">

            <head>
                <!-- 引入共同的headMVC -->
                <jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
                <style>
                    * {
                        padding: 0;
                        margin: 0;
                    }

                    *,
                    ::before,
                    ::after {
                        background-repeat: no-repeat;
                        box-sizing: inherit;
                    }

                    body {
                        background: #F8F8F8;
                    }

                    .page-container {
                        width: 80%;
                        margin: auto;
                        display: flex;
                        justify-content: center;
                        padding: 2rem 0;
                    }

                    .resume-container {
                        color: #333333;
                        width: 100%;
                        padding: 1.5rem 2.5rem;
                        border-radius: 0.25rem;
                        box-shadow: 0px 2px 6px rgb(0 0 0 / 33%);

                        --avatar-width: 120px;
                        --avatar-height: 180px;
                    }

                    .resume-title {
                        font-size: 2rem;
                        padding-bottom: 0.25rem;
                        position: relative;
                    }

                    .resume-title::after {
                        content: "";
                        position: absolute;
                        background: #ce7777;
                        height: 4px;
                        width: 5rem;
                        border-radius: 2px;
                        bottom: 0;
                        left: 0;
                    }

                    .resume-last-update {
                        color: #787878;
                        font-size: 1rem;
                        text-align: end;
                    }

                    .resume-body {
                        display: flex;
                        gap: 1rem;
                        padding: 4rem 0 1rem;
                    }

                    .avatar-section {
                        flex: 1 0 var(--avatar-width);
                        max-width: var(--avatar-width);
                    }

                    .avatar-container {
                        display: flex;
                        width: var(--avatar-width);
                        height: var(--avatar-height);
                        /* box-sizing: border-box; */
                        border-radius: calc(var(--avatar-width) / 8);
                        border: #ce7777 0.25rem solid;
                        overflow: hidden;
                    }

                    .avatar-container>img {
                        width: 100%;
                        height: 100%;
                        object-fit: contain;
                    }

                    .resume-section {
                        flex: 1;
                    }

                    .resume-body-title {
                        font-size: 1rem;
                        letter-spacing: 0.5em;
                        padding-bottom: 0.25rem;
                        margin-bottom: 1rem;
                        position: relative;
                        color: #ce7777;
                    }

                    .resume-body-title::after {
                        content: "";
                        position: absolute;
                        background: #ce7777;
                        height: 2px;
                        width: 100%;
                        border-radius: 1px;
                        bottom: 0;
                        left: 0;
                    }

                    .resume-no {
                        font-size: 0.75rem;
                        color: #0089ac;
                    }

                    .resume-name {
                        font-size: 1.5rem;
                        margin-bottom: 0.5rem;
                    }

                    .resume-contact {
                        margin-bottom: 4rem;
                    }

                    .resume-contact-item {
                        display: flex;
                        gap: 0.5rem;
                        margin-bottom: 0.25rem;
                    }

                    .resume-table {
                        display: table;
                        border-spacing: 1rem 2rem;
                        margin: -2rem -1rem 2rem;
                    }

                    .resume-item {
                        display: table-row;
                    }

                    .resume-item-title {
                        display: table-cell;
                        position: relative;
                        color: #777;
                        padding-right: 1rem;
                        min-width: 100px;
                    }

                    .resume-item-title::after {
                        content: "";
                        position: absolute;
                        background: #ce7777;
                        height: 100%;
                        width: 2px;
                        border-radius: 1px;
                        top: 0;
                        right: 0;
                    }

                    .resume-item-content {
                        display: table-cell;
                    }

                    .case-list {
                        border-radius: 0.25rem;
                        box-shadow: 0px 2px 6px rgb(0 0 0 / 33%);
                        overflow: hidden;
                    }

                    .case-list-header {
                        display: flex;
                        align-items: center;
                        background: #efd9d9;
                        color: #ce7777;
                        padding: 0.5rem 0.25rem;
                    }

                    .case-list-header-icon {
                        width: 2rem;
                        height: 2rem;
                        padding-left: 1rem;
                    }

                    .case-list-header-icon>svg {
                        fill: #ce7777;
                    }

                    .case-list-header h1 {
                        font-size: 1rem;
                        flex: 1;
                        padding-left: 1rem;
                    }

                    .case-list-header .more-button {
                        font-size: 1rem;
                        padding: 0.25rem 0.75rem;
                        cursor: pointer;
                    }

                    .case-list-header .more-button:hover {
                        background: #eaeaea;
                    }

                    .case-list-body {
                        padding: 1.5rem 1.5rem 2rem;
                    }

                    .comment-table {
                        display: table;
                        table-layout: fixed;
                        position: relative;
                        width: 100%;
                        border-spacing: 0 1rem;
                        margin: -1rem 0;
                    }

                    .comment-table-row {
                        display: table-row;
                    }

                    .comment-table-row:hover:not(.header) .comment-table-col-content {
                        background: #e7e7e7;
                    }

                    .comment-table-col {
                        display: table-cell;
                    }

                    .comment-table-col-content {
                        display: flex;
                        padding: 0.75rem 1rem;
                        border-top: 1px #777 solid;
                        border-bottom: 1px #777 solid;
                    }

                    .comment-table-col:first-child>.comment-table-col-content {
                        border-top-left-radius: 1rem;
                        border-bottom-left-radius: 1rem;
                        border-left: 1px #777 solid;
                    }

                    .comment-table-col:last-child>.comment-table-col-content {
                        border-top-right-radius: 1rem;
                        border-bottom-right-radius: 1rem;
                        border-right: 1px #777 solid;
                    }

                    .comment-table-row.header .comment-table-col-content {
                        background: #ce7777;
                        color: #f8f8f8;
                        border: none;
                    }

                    #replace {
                        font-size: 25px;
                        height: 25px;
                    }

                    #replace:hover {
                        font-size: 25px;
                        height: 25px;
                        color: lightgrey;
                    }
                </style>

            </head>

            <!--BOBY-->

            <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

                <!-- header -->
                <!-- 引入共同的topMVC -->
                <jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

                <!-- 內容-履歷表 -->
                <main>
                    <div class="page-container">
                        <div class="resume-container">
                            <h1 class="resume-title">會員簡歷</h1>
                            <div class="resume-body">
                                <div class="resume-section">
                                    <h2 class="resume-body-title">PROFILE</h2>
                                    <input style="display: none;" value="${member.memberID}" id="idvalue"></input>
                                    <div class="resume-no">@${member.account}<span
                                            style="color: #0089ac;">#${member.memberID}</span></div>
                                    <div class="resume-name">${member.memName}
                                        (${member.memNickName})
                                    </div>
                                    <div class="resume-contact">
                                        <div class="resume-contact-item">
                                            <span style="color: #ce7777; font-size: medium;">✉</span><a
                                                href="mailto:${member.eMail}">${member.eMail}</a>
                                        </div>
                                        <div class="resume-contact-item">
                                            <span>📞</span>${member.phone}
                                        </div>
                                    </div>

                                    <h2 class="resume-body-title">PRODUCT</h2>
                                    <div>

                                        <div class="post-entry"
                                            style="overflow-y: scroll; overflow-x: hidden; width: 110%; height: 720px;">
                                            <div class="widget">
                                                <ul class="widget-posts">
                                                    <c:forEach var="prodBean" items="${member.product}">
                                                        <li class="clearfix"
                                                            style="background-image: url('/MeetBoth/html/assets/images/shop/backgroundimg.jpg'); background-size: cover; padding-left: 10px; height: 322.5px;">
                                                            <div class="widget-posts-image"
                                                                style="height: 300px; width: 200px; margin: auto; display: flex; justify-content: center; align-items: center; margin-right: 15px;">
                                                                <a href="<c:url value='/_03_product.PathToProductDetail.controller?id=${prodBean.prodID}' />"
                                                                    style="margin: auto; display: flex; justify-content: center; align-items: center;"><img
                                                                        style="padding: auto;"
                                                                        src="<c:url value='/_03_product.showPicture.controller?id=${prodBean.prodID}' />" /></a>
                                                            </div>
                                                            <div style="font-size: 22px; width:auto;">
                                                                <div class="widget-posts-title">
                                                                    <a
                                                                        href="<c:url value='/_03_product.PathToProductDetail.controller?id=${prodBean.prodID}' />">商品名稱
                                                                        : ${prodBean.prodName}</a>
                                                                </div>
                                                                <div class="widget-posts-meta"
                                                                    style="display: flex;height:38px;">
                                                                    商品狀態 : ${prodBean.prodState}

                                                                </div>
                                                                <div class="widget-posts-meta" style="display: flex">
                                                                    商品價格 : NT$${prodBean.prodPrice}
                                                                </div>
                                                                <div class="widget-posts-meta">商品庫存 :
                                                                    ${prodBean.inventory}</div>
                                                                <div class="widget-posts-meta">商品瀏覽次數 :
                                                                    ${prodBean.prodCheck}</div>
                                                                <div id="scoreAVG" class="widget-posts-meta">
                                                                    <c:forEach var="commentBean"
                                                                        items="${prodBean.productComment}">
                                                                        <input type="hidden" id="starAVG"
                                                                            value="${commentBean.prodScore}">
                                                                    </c:forEach>
                                                                    <div id="starAVGDiv" style="font-size: 17px;">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    </c:forEach>
                                                </ul>
                                            </div>
                                        </div>

                                    </div>


                                    <div style="display:flex">
                                        <button
                                            onclick="window.location='/MeetBoth/_05_teacStu.searchAllTeac.controller/1'"
                                            style="display:flex; justify-content:center; align-items:center; margin:15px auto 0 auto"
                                            class="btn btn-b btn-circle" type="submit">返回上一頁</button>
                                    </div>
                                </div>
                                <div class="avatar-section">
                                    <div class="avatar-container">
                                        <img src="<c:url value='/_01_member.ShowPhoto.controller?account=${Member.account}'/>"
                                            alt="">
                                    </div>
                                    <div id="replacediv" style="padding-top: 530%;">
                                        <div id="hiddenitem" style="display:none; margin-bottom:10px; margin-left:15%"
                                            class="nav-container">
                                            <div class="nav-item">
                                                <a
                                                    href="/MeetBoth/_05_teacStu.updatedataMain.controller?teacno=${bean.teacno}">修改履歷</a>
                                            </div>
                                            <div class="nav-item">
                                                <a class="delete" id="${bean.teacno}" href="#">刪除履歷</a>
                                            </div>
                                        </div>
                                        <div id="hiddenitem2" style="display:inline-block; height:86.75px"
                                            class="nav-container">
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 內容-履歷表結束 -->

                    <!-- 內容-評分回覆 -->
                    <div class="page-container">
                        <div class="case-list">
                            <div class="case-list-header">
                                <div class="case-list-header-icon">
                                    <svg viewbox="0 0 48 48">
                                        <path
                                            d="m23.95 42-14.5-7.95v-12L2 18 23.95 6 46 18v15.85h-3v-14.1l-4.55 2.3v12Zm0-15.4L39.7 18 23.95 9.55 8.3 18Zm0 12 11.5-6.35v-8.4L23.95 30l-11.5-6.25v8.5Zm.05-12Zm-.05 3.7Zm0 0Z" />
                                    </svg>
                                </div>
                                <h1>評價</h1>
                            </div>

                            <div class="case-list-body">
                                <!-- Migrant from Resume to Case list -->
                                <div class="comment-table">
                                    <div class="comment-table-row header">
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">
                                                日期
                                            </div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">
                                                滿意度
                                            </div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">
                                                科目
                                            </div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">
                                                上課對象
                                            </div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">
                                                地點
                                            </div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">
                                                留言
                                            </div>
                                        </div>
                                    </div>
                                    <c:forEach var="bean" items="${reply}">
                                        <div class="comment-table-row">
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.replyDate}
                                                </div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    <div id="star-show">
                                                        <input type="hidden" value="${bean.score}" id="score">
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.teacher.subjectItem}
                                                </div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.teacher.teacObject}
                                                </div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.teacher.teacLoc}
                                                </div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.reply}
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 內容-評分回覆結束 -->

                    <!-- 新增回覆 -->
                    <div class="page-container">
                        <div class="case-list">
                            <div class="case-list-header">
                                <div class="case-list-header-icon">
                                    <svg viewbox="0 0 48 48">
                                        <path
                                            d="m23.95 42-14.5-7.95v-12L2 18 23.95 6 46 18v15.85h-3v-14.1l-4.55 2.3v12Zm0-15.4L39.7 18 23.95 9.55 8.3 18Zm0 12 11.5-6.35v-8.4L23.95 30l-11.5-6.25v8.5Zm.05-12Zm-.05 3.7Zm0 0Z" />
                                    </svg>
                                </div>
                                <h1>新增評價</h1>
                            </div>

                            <div class="case-list-body">
                                <!-- Migrant from Resume to Case list -->
                                <div class="comment-table">
                                    <form action="<c:url value='/_05_teacStu.insertreply.controller' />" method="Get">
                                        <!-- 星星 -->
                                        <h4>請輸入您給的評分:</h4>
                                        <input name="teacno" value="${bean.teacno}" type="hidden">
                                        <div class="star">
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <span><i class="fa fa-star star-off"></i></span>
                                            <input name="score" type="hidden" id="rating-input" value="0">
                                        </div>
                                        <!-- 星星 -->
                                        <textarea name="reply" class="form-control" rows="7"
                                            placeholder="Textarea"></textarea>
                                        <button
                                            style="display:flex; justify-content:center; align-items:center; margin:15px auto 0 auto"
                                            class="btn btn-b btn-circle" type="submit">留言</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 新增回覆結束 -->

                    <!-- Footer -->
                    <!-- 引入共同的footerMVC -->
                    <jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
                </main>

                <!--  
    JavaScripts
    =============================================
    -->
                <!-- 引入共同的js -->
                <jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />
                <!-- SweetAlert js -->
                <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
                <!-- SweetAlert js -->
                <script>
                    const ratingElements = document.querySelectorAll('.star span i');
                    const ratingInput = document.querySelector('#rating-input');

                    for (let i = 0; i < ratingElements.length; i++) {
                        ratingElements[i].addEventListener('mouseenter', function () {
                            for (let j = 0; j <= i; j++) {
                                ratingElements[j].classList.remove('star-off');
                                ratingElements[j].classList.add('star');
                            }
                            for (let j = i + 1; j < ratingInput.value; j++) {
                                ratingElements[j].classList.remove('star');
                                ratingElements[j].classList.add('star-off');
                            }
                        });

                        ratingElements[i].addEventListener('mouseleave', function () {
                            for (let j = 0; j < ratingElements.length; j++) {
                                if (ratingElements[j].classList.contains('star')) {
                                    ratingElements[j].classList.remove('star');
                                    ratingElements[j].classList.add('star-off');
                                }
                            }
                        });

                        ratingElements[i].addEventListener('click', function () {
                            ratingInput.value = i + 1;
                            for (let j = 0; j < ratingElements.length; j++) {
                                ratingElements[j].classList.remove('star');
                            }
                        });
                    }
                </script>
                <script>
                    const scores = document.querySelectorAll("#score");
                    document.addEventListener(
                        "DOMContentLoaded",
                        function () {
                            for (let i = 0; i < scores.length; i++) {
                                const starNum = scores[i].value;
                                const starDiv = scores[i].closest("#star-show");
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
                    document.getElementById("replace").onclick = function () {
                        var item = document.getElementById("hiddenitem");
                        var item2 = document.getElementById("hiddenitem2");
                        if (item.style.display === "none") {
                            item.style.display = "inline-block";
                            item2.style.display = "none";
                        } else {
                            item2.style.display = "inline-block";
                            item.style.display = "none";
                        }
                    }
                </script>
                <script>
                    $(function () {
                        $('.delete').click(function () {
                            let id = $(this).attr("id");
                            Swal.fire({
                                title: '你確定要刪除嗎?',
                                text: "將無法恢復此筆貼文!!!",
                                icon: 'warning',
                                //icon:  "success", "error", "warning", "info" or "question" 這幾種選項
                                showCancelButton: true,
                                confirmButtonColor: 'lightred',
                                cancelButtonColor: 'lightgrey',
                                confirmButtonText: '確定刪除'
                                //                   cancelButtonText: '取消',
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    $.ajax({
                                        //專案名稱+servlet
                                        url: '/MeetBoth/_05_teacStu.deletedata.controller',
                                        method: "get",
                                        dataType: "text",
                                        //對應name設定的名稱 並非value的名稱
                                        data: { "teacno": id },
                                    })
                                        .done(function () {
                                            window.location = '/MeetBoth/_05_teacStu.searchAllTeac.controller/1'
                                            console.log("delete")
                                        })//done
                                        .fail(function (error) {
                                            console.log(error)
                                        })//fail end
                                }//if
                            })//then

                        })//click end
                    });
        //function end
                </script>
                <script>
                    const user = document.querySelector('input[name="user"]').value;
                    const owner = document.querySelector('input[name="owner"]').value;
                    if (user !== owner) {
                        document.getElementById("replace").style.display = "none";
                    }
                </script>
            </body>

            </html>