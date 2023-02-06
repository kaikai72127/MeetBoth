<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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

		<div id="main">
			<div class="inner">
				<!-- Header -->
				<header id="header">
					<h1 class="logo">
						<strong>管理者介面 </strong>
					</h1>
				</header>

				<!-- Content -->
				<section class="module-medium" id="demos">
					<header class="main">
						<h2 style="margin: 0; float: left">折扣碼管理</h2>
						<form method="post"
							action="<c:url value='/discountsCreate.controller' />">
							<button>
								<i class="fa-solid fa-square-plus"></i>
							</button>
						</form>
					</header>
					<!-- Search -->
					<section id="search" class="alt">
						<form method="post"
							action="<c:url value='/_04_shoppingCart.SearchAllorders.controller' />">
							<input type="text" name="search" id="search" placeholder="Search" />
						</form>
					</section>

					<!-- Table -->
					<div class="table-wrapper">
						<table class="alt">
							<thead>
								<tr>
									<th width=100px>折扣編號</th>
									<th width=100px>折扣代號</th>
									<th width=120px>折扣名稱</th>
									<th>折扣內容</th>
									<th width=80px>折扣開始日</th>
									<th width=80px>折扣結束日</th>
									<th width=80px>編輯</th>
									<th width=80px>刪除</th>
								</tr>
							</thead>
							<c:forEach var="bean" items="${classList}">
								<tbody>
									<tr>
										<td>${bean.discountId}</td>
										<td>${bean.discountNo}</td>
										<td>${bean.discountName}</td>
										<td>${bean.discountDesc}</td>
										<td>${bean.discountStart}</td>
										<td>${bean.discountEnd}</td>
										<td><form method="post"
												action="<c:url value='discountsUpdate.controller/${bean.discountId}' />">
												<button id="create-discount" name="discountId" value="${bean.discountId}">
													<i class="fa-solid fa-pen-to-square"></i>
												</button>
											</form></td>
										<td><button value="${bean.discountId}"
												class="deleteThisDiscount" name="discountId">
												<i class="fa-solid fa-xmark"></i>
											</button></td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						<div style="display: flex; justify-content: center">
							<a href="backIndex.controller"> 返回<i
								class="fa-solid fa-left-long"></i></a>
						</div>
					</div>
				</section>
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
        $(function(){
            $('.deleteThisDiscount').click(function(){
                let id=$(this).attr("value");
                Swal.fire({
                  title: '你確定要刪除嗎?',
                  text: "將無法恢復此訂單!!!",
                  icon: 'warning',
                  //icon:  "success", "error", "warning", "info" or "question" 這幾種選項
                  showCancelButton: true,
                  confirmButtonColor: '#FFEBAD',
                  cancelButtonColor: '#F0DBDB',
                  confirmButtonText: '確定刪除'
//                   cancelButtonText: '取消',
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                          //專案名稱+servlet
                          url:'/MeetBoth/discounts.controller/'+id,
                          method:"get",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"discountId":id},
                        })
                            .done(function () {
                                location.reload();
                                console.log("delete")
                             })//done
                             .fail(function(error) {
                                 console.log(error)
                             })//fail end
                    }//if
                  })//then

              })//click end
        });
        //function end
    </script>


</body>
</html>
