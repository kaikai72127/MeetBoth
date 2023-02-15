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
                        width: 330px;
                        height: fit-content;
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
                        flex: 0.8;
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

                <!-- 內容-會員 -->
                <main>
                    <div class="page-container">
                        <div class="resume-container">
                            <h1 class="resume-title" style="color: #ce7777;">會員資訊PROFILE</h1>
                            <div class="resume-body">
                                <div class="resume-section">
                                    <h2 class="resume-body-title"></h2>
                                    <input style="display: none;" value="${member.memberID}" id="idvalue"></input>
                                    <div class="resume-no" style="font-size: 8px;">@${member.account}<span
                                            style="color: #0089ac;">#${member.memberID}</span></div>
                                    <div class="resume-name" style="font-size: 20px;">${member.memName}
                                        <span style="font-size: 10px;">(${member.memNickName})</span>
                                    </div>
                                    <div class="resume-contact">
                                        <div class="resume-contact-item">
                                            <span style="color: #ce7777; font-size: 20px;">✉</span><a
                                                href="mailto:${member.eMail}"
                                                style="font-size: 20px;">${member.eMail}</a>
                                        </div>
                                        <div class="resume-contact-item" style="font-size: 20px;">
                                            <span>📞</span>${member.phone}
                                        </div>
                                    </div>


                                </div>
                                <div class="avatar-section">
                                    <div class="avatar-container">
                                        <img src="<c:url value='/_01_member.ShowPhoto.controller?account=${member.account}'/>"
                                            alt="">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 內容-會員結束 -->

                    <!-- 內容-哈拉區貼文 -->
                    <div class="page-container cart">
                        <div class="resume-container">
                            <h1 class="resume-title">
                                哈拉區貼文
                            </h1>
                            <div class="case-list-body">
                                <!-- Migrant from Resume to Case list -->
                                <div class="comment-table">
                                    <div class="comment-table-row header">
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">貼文編號</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">標題</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">瀏覽次數</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">發文日期</div>
                                        </div>

                                    </div>
                                    <div class="comment-table-row">
                                        <c:forEach var="bean" items="${classList}">
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.halaId}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.title}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.watch}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${bean.postdate}</div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    </div>
                    <!-- 內容-哈拉區貼文 -->

                    <!-- 內容-教師履歷 -->
                    <div class="page-container">
                        <div class="resume-container">
                            <h1 class="resume-title">
                                教師履歷
                            </h1>
                            <div class="case-list-body">

                                <div class="comment-table">
                                    <div class="comment-table-row header">
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">更新日期</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">最高學歷</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">授課科目</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">授課對象</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">授課地區</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">案件薪資</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">瀏覽次數</div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <div class="case-list-body">
                                <div class="comment-table">
                                    <div class="comment-table-row">
                                        <c:forEach var="teac" items="${teac}">
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${teac.updateDate}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${teac.highEdu}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${teac.subjectItem}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${teac.teacObject}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${teac.teacLoc}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${teac.price}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${teac.views}</div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 內容-教師履歷 -->

                    <!-- 內容-課程訊息 -->
                    <div class="page-container">
                        <div class="resume-container">
                            <h1 class="resume-title">
                                教師履歷
                            </h1>
                            <div class="case-list-body">

                                <div class="comment-table">
                                    <div class="comment-table-row header">
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">更新日期</div>
                                        </div>

                                    </div>
                                </div>

                            </div>
                            <div class="case-list-body">
                                <div class="comment-table">
                                    <div class="comment-table-row">
                                        <c:forEach var="" items="${teac}">
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${teac.updateDate}
                                                </div>
                                            </div>

                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- 內容-課程訊息 -->

                    <!-- 內容-學生需求 -->
                    <div class="page-container">
                        <div class="resume-container">
                            <h1 class="resume-title">
                                學生需求
                            </h1>
                            <div class="case-list-body">
                                <!-- Migrant from Resume to Case list -->
                                <div class="comment-table">
                                    <div class="comment-table-row header">
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">更新日期</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">需求科目</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">需求對象</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">需求地區</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">案件薪資</div>
                                        </div>
                                        <div class="comment-table-col">
                                            <div class="comment-table-col-content">瀏覽次數</div>
                                        </div>
                                    </div>
                                    <div class="comment-table-row">
                                        <c:forEach var="stud" items="${stud}">
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${stud.updateDate}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">
                                                    ${stud.subjectItem}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${stud.object}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${stud.studLoc}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${stud.price}</div>
                                            </div>
                                            <div class="comment-table-col">
                                                <div class="comment-table-col-content">${stud.views}</div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 內容-學生需求 -->

                    <!-- 內容-會員商品 -->
                    <div class="page-container">
                        <div class="resume-container">
                            <h1 class="resume-title">會員商品</h1>
                            <div style="overflow-x: auto; overflow-y: hidden; display: -webkit-box;">
                                <c:forEach var="prodBean" items="${prodBean}">
                                    <div id="eachProd" style="margin: 0 20px;">
                                        <div id="photo" style="width:200px;height:250px;text-align:center;">
                                            <a
                                                href="/MeetBoth/_03_product.PathToProductDetail.controller?id=${prodBean.prodID}">
                                                <img style="max-width: 100%; max-height: 100%; height: auto; width: auto;"
                                                    src="<c:url value='/_03_product.showPicture.controller?id=${prodBean.prodID}' />"
                                                    style="height: 250px; width: 200px;" />
                                            </a>
                                        </div>
                                        <div id="info" style="text-align:center;">
                                            <div id="prodName">
                                                <strong style="font-size: 16px">${prodBean.prodName}</strong>
                                            </div>
                                            <div id="price">
                                                <strong style="font-size: 16px">
                                                    瀏覽次數:&nbsp;${prodBean.prodCheck}&nbsp;次</strong>
                                            </div>
                                            <div id="scoreAVG">
                                                <c:forEach var="commentBean" items="${prodBean.productComment}">
                                                    <input type="hidden" id="starAVG" value="${commentBean.prodScore}">
                                                </c:forEach>
                                                <div id="starAVGDiv" style="font-size: 17px;"></div>
                                            </div>
                                            <div id="price">
                                                <strong style="font-size: 16px">價格 :
                                                    NT$${prodBean.prodPrice}</strong>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <!-- 內容-會員商品 -->

                    <!-- Footer -->
                    <!-- 引入共同的footerMVC -->
                </main>
                <jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />

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
                    function roundToTwo(num) {
                        return +(Math.round(num + "e+2") + "e-2");
                    }

                    const score = document.querySelectorAll("#starAVG");

                    document
                        .addEventListener(
                            "DOMContentLoaded",
                            function () {
                                const scores = document
                                    .querySelectorAll("#scoreAVG");
                                for (let i = 0; i < scores.length; i++) {
                                    const score = scores[i];
                                    const starAVGs = score
                                        .querySelectorAll("#starAVG");
                                    let totalScore = 0;
                                    for (let j = 0; j < starAVGs.length; j++) {
                                        const starNum = starAVGs[j].value;
                                        totalScore += Number(starNum);
                                    }
                                    let avgScore = roundToTwo(totalScore
                                        / starAVGs.length);
                                    let stars = '';
                                    if (isNaN(avgScore)) {
                                        stars = '&nbsp;(0)';
                                    } else {
                                        stars = '&nbsp;(' + avgScore + ')';
                                    }
                                    let onstar = '<span><i class="fa fa-star star"></i></span>';
                                    let offstar = '<span><i class="fa fa-star star-off"></i></span>';
                                    for (var k = 0; k < 5; k++) {
                                        if (k < avgScore) {
                                            stars += onstar;
                                        } else {
                                            stars += offstar;
                                        }
                                    }
                                    stars += '&nbsp;(' + starAVGs.length + '則評論)'
                                    score.querySelector("#starAVGDiv").innerHTML = stars;
                                }
                            });
                </script>
            </body>

            </html>