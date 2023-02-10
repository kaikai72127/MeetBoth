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

.tutor-item {
    display: flex;
    width: 100%;
    position: relative;
    gap: 1rem;
    cursor: pointer;
    --avatar-width: 120px;
    padding: 1rem 1.5rem;
    border-radius: 0.25rem;
    background: #FFFFFF;
    overflow: hidden;
    transition: box-shadow 0.5s;
}

.tutor-item::after {
    content: "";
    position: absolute;
    background: #ce7777;
    height: 100%;
    width: 0.25rem;
    top: 0;
    left: 0;
}

.tutor-item:hover {
    box-shadow: 0px 2px 6px rgb(0 0 0 / 33%);
}

.tutor-avatar {
    display: flex;
    width: var(--avatar-width);
    height: var(--avatar-width);
    border-radius: calc(var(--avatar-width) / 8);
    border: #ce7777 0.25rem solid;
    overflow: hidden;
}

.tutor-avatar>img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}

.tutor-detail {
    display: flex;
    flex-direction: column;
    /* gap: 1rem; */
}

.tutor-name {
    font-size: 1.25rem;
    margin-bottom: 1rem;
}

.subject-items {
    color: #ce7777;
}

.detail-table {
    display: inline-grid;
    border-spacing: 1rem 0.5rem;
    margin: -0.5rem -1rem;
}

.detail-item {
    display: table-row;
}

.detail-item-title {
    display: table-cell;
    position: relative;
    color: #777;
    padding-right: 1rem;
    min-width: 80px;
}

.detail-item-content {
    display: table-cell;
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

		<!-- 中間內文 -->
		<div class="page-container">
        <div class="list">
        <!-- 模糊搜尋 -->
			<div style='width:80%; text-align: center; margin: 0 auto;' class="widget">
              <form role="form" method="post" action="<c:url value='/_05_teacStu.searchAllLike.controller/1' />">
                  <div class="search-box">
                      <input name="search" class="form-control" type="text" placeholder="Search..."/>
                      <button class="search-btn" type="submit"><i class="fa fa-search"></i></button>
                  </div>
              </form>
            </div>
        <!-- 模糊搜尋結束 -->
        
        <!-- 標題 -->
        <div class="post-header font-alt">
           <h2 class="post-title"><a href="#">教師貼文列表</a></h2>
           <form action="<c:url value='/_05_teacStu.insertdataMain.controller' />"><button style="float:right" class="btn btn-b btn-circle" type="submit">成為教師</button></form>
        </div>
        <!-- 標題結束 -->
        
        <!-- 價格區間搜尋與排列方式 -->
        <div>
        	<div>
			<form method="post" action="<c:url value='/_05_teacStu.switchsequence.controller/1' />">
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
			<form method="post" action="<c:url value='/_05_teacStu.searchAllByPrice.controller/1' />">
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
            
            <c:forEach var="bean" items="${pageTeac}">
            <a href="<c:url value='/_05_teacStu.teacpostpageMain.controller?teacno=${bean.teacno}'/>">
            <div class="tutor-item">
                <div class="tutor-avatar">
                    <img src="<c:url value='/_01_member.ShowPhoto.controller?${bean.member.memberID}' />" alt="">
                </div>
                <div class="tutor-detail">
                    <div class="subject-items">
                        ${bean.subjectItem}
                    </div>
                    <div class="tutor-name">
                        ${bean.member.memName} (${bean.member.memNickName})
                    </div>
                    <div class="detail-table">
                        <div class="detail-item">
                            <div class="detail-item-title">授課對象</div>
                            <div class="detail-item-content">${bean.teacObject}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-item-title">學歷</div>
                            <div class="detail-item-content">${bean.highEdu}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-item-title">家教經驗</div>
                            <div class="detail-item-content">${bean.tutorExp}</div>
                        </div>
                        <div class="detail-item">
                            <div class="detail-item-title">授課地區</div>
                            <div class="detail-item-content">${bean.teacLoc}</div>
                        </div>
                    </div>
                </div>
            </div>
            </a>
            </c:forEach>
            
            <!-- ------------------------- -->
            
            <!-- 分頁按鈕 -->
            <div class="pagination font-alt" style="display:flex; justify-content:center; align-items:center">
            	<c:if test="${currentPage != 1}">
    				<a href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${currentPage-1}"><i class="fa fa-angle-left"></i></a>
    			</c:if>
    			<!-- 迴圈生成每一頁的按鈕 -->
    			<c:forEach var="i" begin="1" end="${totalPages}">
       				<c:choose>
            			<c:when test="${currentPage == i}">
                			<a class="active" href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${i}">${i}</a>
                		</c:when>
                		<c:otherwise>
                			<a href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${i}">${i}</a>
                		</c:otherwise>
                	</c:choose>
                </c:forEach>
                <c:if test="${currentPage != totalPages}">
    				<a href="/MeetBoth/_05_teacStu.searchAllTeac.controller/${currentPage+1}"><i class="fa fa-angle-right"></i></a>
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
   	document.querySelector('form[action*="_05_teacStu.insertdataMain.controller"] button[type="submit"]').addEventListener('click', function (e) {
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