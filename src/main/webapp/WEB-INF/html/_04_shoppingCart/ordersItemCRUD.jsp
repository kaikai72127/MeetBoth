<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<main>
		<!-- 內容 1-->
		<section>
			<div class="col-sm-6 col-sm-offset-3">
				<div class="table-wrapper">
					<table class="alt">
						<thead>
							<tr>
								<th width=60px>item</th>
								<th width=80px>商品名稱</th>
								<th width=80px>數量</th>
								<th width=80px>單價</th>
								<th width=80px>總計</th>
								<th width=80px>編輯</th>
								<th width=80px>刪除</th>
							</tr>
						</thead>
						<c:forEach var="bean" items="${classList}">
							<tbody>
								<tr>
									<td><div id="photo">
											<img id="preImg" style="width: 100px; height: 100px"
												src="<c:url value='/_03_product.showPicture.controller?id=${bean.prodItem.prodID}' />" />
										</div></td>
									<td>${bean.prodItem.prodName}</td>
									<td>${bean.qty}</td>
									<td>${bean.prodItem.prodPrice}</td>
									<td>${bean.itemTotal}</td>
									<td><form method="post"
											action="<c:url value='/_04_shoppingCart.UpdateOrderItemMain.controller' />">
											<button name="seqno" value="${bean.seqno}">
												<i class="fa-solid fa-pen-to-square"></i>
											</button>
										</form></td>
									<td><button class="deleteThisOrder" name="seqno"
											value="${bean.seqno}">
											<i class="fa-solid fa-xmark"></i>
										</button></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
					<div style="display: flex; justify-content: center">
						<a href="<c:url value='/_04_shoppingCart.SelectAll.controller' />">
							返回<i class="fa-solid fa-left-long"></i>
						</a>
					</div>
				</div>
			</div>
		</section>




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



</body>
</html>
