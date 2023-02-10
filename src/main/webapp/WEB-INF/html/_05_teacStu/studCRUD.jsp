<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<style type="text/css">
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
    color: #333333;
}

.page-container {
    width: 100%;
    margin: auto;
    display: flex;
    justify-content: center;
    align-items: center;
}

.list {
    display: flex;
    flex-direction: column;
    gap: 2rem;
    margin: 2rem 0;
    width:60%
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

/* Migrant from Resume to Case list */
/* #region Comment Table */
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

/* #endregion */
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

		<!-- 中間內文 -->
		<div class="page-container">
        <div class="list">
        <!-- 模糊搜尋 -->
			<div style='width:80%; text-align: center; margin: 0 auto;' class="widget">
              <form role="form" method="post" action="<c:url value='/_05_teacStu.searchAllLikeStud.controller/1' />">
                  <div class="search-box">
                      <input name="search" class="form-control" type="text" placeholder="Search..."/>
                      <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
              </form>
            </div>
        <!-- 模糊搜尋結束 -->
        
        <!-- 標題 -->
        <div class="post-header font-alt">
           <h2 class="post-title"><a href="#">案件貼文列表</a></h2>
           <form action="<c:url value='/_05_teacStu.insertdataStudMain.controller' />"><button style="float:right" class="btn btn-b btn-circle" type="submit">發布需求</button></form>
        </div>
        <!-- 標題結束 -->
        
        <!-- 價格區間搜尋與排列方式 -->
        <div>
        	<div>
			<form method="post" action="<c:url value='/_05_teacStu.switchsequenceStud.controller/1' />">
				<select name="case" onchange="this.form.submit()"
								style="width: 17%">
								<option value="">--請選擇排序方式--</option>
								<option value="1">依瀏覽次數排序</option>
								<option value="2">依日期排序</option>
								<option value="3">依價格排序</option>
				</select>
			</form>
			</div>
			<div>
			<form method="post" action="<c:url value='/_05_teacStu.searchAllStudByPrice.controller/1' />">
				<table style="width: 80%">
					<thead>
						<tr>
							<th>請輸入查詢的時薪區間:</th>
							<th><input name="low" type="text" value="最低時薪" onfocus="javascript:if(this.value=='最低時薪')this.value='';"></th>
							<th>至</th>
							<th><input name="high" type="text" value="最高時薪" onfocus="javascript:if(this.value=='最高時薪')this.value='';"></th>
							<th><button class="btn btn-g btn-round btn-xs" type="submit">搜尋</button></th>
						</tr>
					</thead>
				</table>
			</form>
			</div>
		</div>
        <!-- 價格區間搜尋與排列方式結束 -->
        
        <!-- 貼文開始 -->
            
            <div class="case-list">
            <div class="case-list-header">
                <div class="case-list-header-icon">
                    <svg viewbox="0 0 48 48">
                        <path
                            d="m23.95 42-14.5-7.95v-12L2 18 23.95 6 46 18v15.85h-3v-14.1l-4.55 2.3v12Zm0-15.4L39.7 18 23.95 9.55 8.3 18Zm0 12 11.5-6.35v-8.4L23.95 30l-11.5-6.25v8.5Zm.05-12Zm-.05 3.7Zm0 0Z" />
                    </svg>
                </div>
                <h1>案件貼文</h1>
            </div>

            <div class="case-list-body">
                <div class="comment-table">
                    <div class="comment-table-row header">
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                更新日期
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                姓名(暱稱)
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                需求科目
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                需求對象
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                需求地區
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                案件薪資
                            </div>
                        </div>
                    </div>
            		<c:forEach var="bean" items="${pageStud}">
                    <div class="comment-table-row" onclick="window.location='<c:url value='/_05_teacStu.studpostpageMain.controller?studno=${bean.studno}'/>'">
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                               ${bean.updateDate}
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                ${bean.member.memName}(${bean.member.memNickName})
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                ${bean.subjectItem}
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                               	${bean.object}
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                ${bean.studLoc}
                            </div>
                        </div>
                        <div class="comment-table-col">
                            <div class="comment-table-col-content">
                                ${bean.price}
                            </div>
                        </div>
                    </div>
            		</c:forEach>
                </div>
            </div>
        </div>
            
            <!-- ------------------------- -->
            
            <!-- 分頁按鈕 -->
            <div class="pagination font-alt" style="display:flex; justify-content:center; align-items:center">
            	<c:if test="${currentPage != 1}">
    				<a href="/MeetBoth/_05_teacStu.searchAllStud.controller/${currentPage-1}"><i class="fa fa-angle-left"></i></a>
    			</c:if>
				<!-- 迴圈生成每一頁的按鈕 -->
    			<c:forEach var="i" begin="1" end="${totalPages}">
       				<c:choose>
            			<c:when test="${currentPage == i}">
                			<a class="active" href="/MeetBoth/_05_teacStu.searchAllStud.controller/${i}">${i}</a>
                		</c:when>
                		<c:otherwise>
                			<a href="/MeetBoth/_05_teacStu.searchAllStud.controller/${i}">${i}</a>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                <c:if test="${currentPage != totalPages}">
    				<a href="/MeetBoth/_05_teacStu.searchAllStud.controller/${currentPage+1}"><i class="fa fa-angle-right"></i></a>
    			</c:if>
            </div>
            <!-- 分頁按鈕結束 -->
        </div>
    </div>
    <div class="pagination-bar"></div>
    </div>

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
   	document.querySelector('form[action*="_05_teacStu.insertdataStudMain.controller"] button[type="submit"]').addEventListener('click', function (e) {
     	const user = '${pageContext.request.userPrincipal.name}';
     	if (!user) {
       	e.preventDefault();
       	alert('請先登入');
       	window.location.href = '/MeetBoth/login/page.jsp';
     	}
   	});
	</script>
</body>
</html>