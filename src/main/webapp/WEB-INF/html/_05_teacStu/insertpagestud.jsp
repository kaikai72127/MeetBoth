<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



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

.nav-container {
    display: flex;
    flex-direction: column;
    height: fit-content;
    padding: 1rem 0;
    background: #FFFFFF;
    border-radius: 4px;
    box-shadow: 0px 2px 6px rgb(0 0 0 / 33%);
}

.nav-item {
    display: flex;
    width: 100%;
    transition: all 0.35s;
}

.nav-item > a {
    width: 100%;
    padding: 1rem 1.5rem;
    color: #333333;
    text-decoration: none;
    transition: all 0.5s;
}

.nav-item:hover {
    background: #333333;
}

.nav-item:hover > a {
    color: #f8f8f8;
}

#replace{
font-size:25px;height:25px;
}

#replace:hover{
font-size:25px;height:25px;
color:lightgrey;
}
</style>
</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		<!-- 內容-履歷表 -->
		<div class="page-container">
        <div class="resume-container">
            <h1 class="resume-title">需求列表</h1>
            <form action='<c:url value="/_05_teacStu.insertdataStud.controller" />' enctype='multipart/form-data' method='post'>
            <div class="resume-body">
                <div class="resume-section">
                    <h2 class="resume-body-title">PROFILE</h2>
                    <div class="resume-no">@${bean.account}</div>
                    <div class="resume-name">${bean.memName} (${bean.memNickName})</div>
                    <div class="resume-contact">
                        <div class="resume-contact-item">
                            <svg viewbox="0 0 48 48" width="16">
                                <path
                                    d="M24 44q-4.15 0-7.8-1.575-3.65-1.575-6.35-4.275-2.7-2.7-4.275-6.35Q4 28.15 4 24t1.575-7.8Q7.15 12.55 9.85 9.85q2.7-2.7 6.35-4.275Q19.85 4 24 4t7.8 1.575q3.65 1.575 6.35 4.275 2.7 2.7 4.275 6.35Q44 19.85 44 24v2.65q0 2.8-1.975 4.725Q40.05 33.3 37.2 33.3q-1.8 0-3.4-.875-1.6-.875-2.45-2.475-1.3 1.7-3.25 2.525T24 33.3q-3.9 0-6.625-2.7T14.65 24q0-3.9 2.725-6.65Q20.1 14.6 24 14.6t6.625 2.75Q33.35 20.1 33.35 24v2.65q0 1.55 1.125 2.6T37.2 30.3q1.55 0 2.675-1.05Q41 28.2 41 26.65V24q0-7.1-4.95-12.05Q31.1 7 24 7q-7.1 0-12.05 4.95Q7 16.9 7 24q0 7.1 4.95 12.05Q16.9 41 24 41h10.7v3Zm0-13.7q2.65 0 4.5-1.825T30.35 24q0-2.7-1.85-4.55-1.85-1.85-4.5-1.85t-4.5 1.85Q17.65 21.3 17.65 24q0 2.65 1.85 4.475Q21.35 30.3 24 30.3Z" />
                            </svg>
                            ${bean.eMail}
                        </div>
                        <div class="resume-contact-item">
                            <svg viewbox="0 0 48 48" width="16">
                                <path xmlns="http://www.w3.org/2000/svg"
                                    d="M39.75 42q-6.1 0-12.125-3T16.8 31.2Q12 26.4 9 20.375 6 14.35 6 8.25q0-.95.65-1.6Q7.3 6 8.25 6h7q.7 0 1.225.475.525.475.675 1.275l1.35 6.3q.1.7-.025 1.275t-.525.975l-5 5.05q2.8 4.65 6.275 8.1Q22.7 32.9 27.1 35.3l4.75-4.9q.5-.55 1.15-.775.65-.225 1.3-.075l5.95 1.3q.75.15 1.25.75T42 33v6.75q0 .95-.65 1.6-.65.65-1.6.65Zm-28.3-23.4 4.05-4.1L14.35 9H9q0 1.95.6 4.275t1.85 5.325ZM29.9 36.75q2.05.95 4.45 1.55 2.4.6 4.65.7v-5.35l-5.15-1.05ZM11.45 18.6ZM29.9 36.75Z" />
                            </svg>
                            ${bean.phone}
                        </div>
                    </div>

                    <h2 class="resume-body-title">INFORMATION</h2>
                    <div class="resume-table">
                        <div class="resume-item">
                            <div class="resume-item-title">需求科目</div>
                            <div class="resume-item-content"><input name="subjectItem" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的需求科目...Ex:國小數學"></div>
                        </div>
                        <div class="resume-item">
                            <div class="resume-item-title">上課地點</div>
                            <div class="resume-item-content">
                                <input name="studLoc" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的上課地點...Ex:新北市">
                            </div>
                        </div>
                        <div class="resume-item">
                            <div class="resume-item-title">教學對象</div>
                            <div class="resume-item-content"><input name="object" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的教學對象...Ex:國小"></div>
                        </div>
                        <div class="resume-item">
                            <div class="resume-item-title">自備教材</div>
                            <div class="resume-item-content"><input name="textBook" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的自備教材...Ex:希望有其他課內教材"></div>
                        </div>
                    </div>

                    <h2 class="resume-body-title">LESSON TYPE</h2>
                    <div class="resume-table">
                        <div class="resume-table">
                            <div class="resume-item">
                                <div class="resume-item-title">開始日期</div>
                                <div class="resume-item-content"><input name="startDate" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的開始日期...Ex:隨時"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">課程期間</div>
                                <div class="resume-item-content"><input name="period" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的課程期間...Ex:兩個月以上，每周上課兩次"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">上課時段</div>
                                <div class="resume-item-content"><input name="studTime" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的上課時段...Ex:平日下午"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">上課方式</div>
                                <div class="resume-item-content"><input name="classMode" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的上課模式...Ex:面授"></div>
                            </div>
                        </div>
                    </div>
                    
                    <h2 class="resume-body-title">INTERVIEW</h2>
                    <div class="resume-table">
                        <div class="resume-table">
                            <div class="resume-item">
                                <div class="resume-item-title">薪資</div>
                                <div class="resume-item-content"><input name="price" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您願意給予的待遇...Ex:800"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">老師試教</div>
                                <div class="resume-item-content"><input name="testTeacMode" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的老師試教...Ex:需試教，面授"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">學歷要求</div>
                                <div class="resume-item-content"><input name="educaLimit" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的學歷要求...Ex:大學以上"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">應徵方式</div>
                                <div class="resume-item-content"><input name="conMethod" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的應徵方式...Ex:電話聯絡"></div>
                            </div>
                            <div class="resume-item">
                                <div class="resume-item-title">聯絡時間</div>
                                <div class="resume-item-content"><input name="conTime" style="width:500%" class="form-control input-sm" type="text" placeholder="請輸入您的聯絡時間...Ex:平日早上"></div>
                            </div>
                        </div>
                    </div>
                    	<div style="display:flex">
                        <button style="display:flex; justify-content:center; align-items:center; margin:15px auto 0 auto" class="btn btn-b btn-circle" type="submit">確定新增</button>
                        <button type="button" id="cancel-btn" style="display:flex; justify-content:center; align-items:center; margin:15px auto 0 auto" class="btn btn-b btn-circle">取消</button>
                        </div>
                </div>
                <div class="avatar-section">
                </div>
            </div>
            </form>
        </div>
	</div>
	<!-- 內容-履歷表結束 -->
	
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
	<script>
  		document.getElementById("cancel-btn").addEventListener("click", function(event) {
    	event.preventDefault();
    	window.location.href = "/MeetBoth/_05_teacStu.searchAllStud.controller/1";
  		});
	</script>
</body>
</html>