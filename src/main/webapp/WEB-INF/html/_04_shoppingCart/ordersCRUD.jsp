<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />

<!-- datatable -->
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<!-- jq -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<!-- datatable -->

<script type="text/javascript">
	$(document).ready(function() {
		$('#table_id').DataTable();
	});
</script>


</head>

<!--BOBY-->
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">

	<!-- header -->
	<!-- 引入共同的topMVC -->
	<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

	<main>

		<!--       動態搜尋列 -->
		<section class="module-small" style="padding-bottom: 10px;">
			<div class="container" style="">
				<form class="row"
					action="<c:url value='/_03_product.searchProductWithCondition.controller'/>"
					method="post">
					<!-- 					<div class="col-sm-4 mb-sm-20" -->
					<!-- 						style="width: 17%; padding-right: 0;"> -->
					<!-- 						<select name="case" class="form-control" -->
					<!-- 							style="padding-right: 0; font-size: 17px"> -->
					<!-- 							<option value="1">預設排序</option> -->
					<!-- 							<option value="2">依價格由大到小</option> -->
					<!-- 							<option value="3">依價格由小到大</option> -->
					<!-- 							<option value="4">依上架日期排序</option> -->
					<!-- 							<option value="5">依更新日期排序</option> -->
					<!-- 						</select> -->
					<!-- 					</div> -->
					<div class="col-sm-2 mb-sm-20"
						style="width: 15%; padding-right: 0;">
						<select name="ordStstus" class="form-control"
							style="font-size: 17px">
							<option value="0">訂單狀態</option>
							<option value="1">處理中</option>
							<option value="2">備貨中</option>
							<option value="3">已完成</option>
							<option value="3">取消</option>
						</select>
					</div>
					<div class="col-sm-2 mb-sm-20"
						style="width: 15%; padding-right: 0;">
						<select name="paymentStstus" class="form-control"
							style="font-size: 17px">
							<option value="0">付款狀態</option>
							<option value="1">未付款</option>
							<option value="2">已付款</option>
							<option value="3">退款中</option>
							<option value="4">已退款</option>
						</select>
					</div>
					<div class="col-sm-2 mb-sm-20"
						style="width: 15%; padding-right: 0;">
						<select name="deliveryStstus" class="form-control"
							style="font-size: 17px">
							<option value="0">送貨狀態</option>
							<option value="1">無</option>
							<option value="2">備貨中</option>
							<option value="3">已發貨</option>
							<option value="4">已取貨</option>
							<option value="5">退貨中</option>
							<option value="6">已退貨</option>
						</select>
					</div>
					<div class="col-sm-2 mb-sm-20" style="width: 25%">
						<input class="form-control" type="text" name="searchName"
							style="font-size: 17px" placeholder="搜尋名稱" />
					</div>
					<div class="col-sm-3" style="width: 10%">
						<button class="btn btn-d btn-round" type="submit"
							style="font-size: 17px">搜尋</button>
					</div>
				</form>
			</div>
		</section>

		<section>

			<!-- Table -->
			<div class="col-sm-6 col-sm-offset-3">
				<table class="alt" id="table_id" class="display">
					<thead>
						<tr>
							<th width=100px id="eachProdBlock" class="mEvent"
									onclick="window.location='/SpringBoot_Team5/shoppingCart.SelectOrderAllItem.controller?id=${bean.orderNo}'">訂單編號></th>
							<th width=100px>會員編號</th>
							<th width=120px>訂單日期</th>
							<th width=120px>更新日期</th>
							<th width=120px>訂單狀態</th>
							<th width=120px>付款狀態</th>
							<th width=120px>送貨狀態</th>
							<th width=80px>總金額</th>
							<th width=80px>編輯</th>
							<th width=80px>訂單明細</th>
							<th width=80px>刪除</th>
						</tr>
					</thead>
					<c:forEach var="bean" items="${classList}">
						<tbody>
							<tr>
								<td>${bean.orderNo}</td>
								<td>${bean.memberbuy}</td>
								<td>${bean.orderDate}</td>
								<td>${bean.uporderDate}</td>
								<td>${bean.ordStstus}</td>
								<td>${bean.paymentStstus}</td>
								<td>${bean.deliveryStstus}</td>
								<td>${bean.totalAmount}</td>
								<td><form method="post"
										action="<c:url value='/_04_shoppingCart.UpdateOrderMain.controller' />">
										<button name="orderNo" value="${bean.orderNo}">
											<i class="fa-solid fa-pen-to-square"></i>
										</button>
									</form></td>
								<td><form
										action="<c:url value='/_04_shoppingCart.InsertOrderItemMain.controller' />"
										method="post">
										<button name="orderNo" value="${bean.orderNo}">
											<i class="fa-solid fa-file-pen"></i>
										</button>
									</form></td>
								<td><button class="deleteThisOrder" name="orderNo"
										value="${bean.orderNo}">
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
		$(".mEvent")
				.mouseenter(
						function() {
							$(this).css("background-color", "pink");
							$(this).css("cursor", "pointer");
							$(this)
									.url(
											"/_03_product.PathToProductDetail.controller?id=${bean.prodID}")
						})
		$(".mEvent").mouseleave(function() {
			$(this).css("background-color", "white");
		})
	</script>



</body>
</html>
