<%@page import="springTeam5._04_shoppingCart.model.*"%>
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
.wrapmain {
	overflow: hidden;
	border-radius: 10px 10px 0px 0px;
	box-shadow: 0 0 20px rgba(0, 0, 0, 0.35);
}

table {
	font-family: 'Oswald', sans-serif;
	border-collapse: collapse;
}

th {
	font-size: 16px;
	background-color: #ce7777;
	color: #ffffff;
	width: 25vw;
	height: 3rem;
	background-color: #ce7777;
}

td {
	background-color: #ffffff;
	width: 25vw;
	height: 50px;
	text-align: center;
}

tr {
	border-bottom: 1px solid #dddddd;
}

tr:last-of-type {
	border-bottom: 2px solid #ce7777;
}

tr:nth-of-type(even) td {
	background-color: #f3f3f3;
}
</style>

<!-- datatable -->
<!-- CSS -->
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.11.3/css/jquery.dataTables.min.css">
<!-- jq -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>

<!-- SweetAlert js -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- SweetAlert js -->
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
					action="<c:url value='/shoppingCart.SearchOrders.controller'/>"
					method="post">
					<div class="col-sm-2 mb-sm-20 main"
						style="width: 15%; padding-right: 0;">
						<select name="ordStstus" class="form-control"
							style="font-size: 17px">
							<option value="0">訂單狀態</option>
							<option value="處理中">處理中</option>
							<option value="備貨中">備貨中</option>
							<option value="已完成">已完成</option>
							<option value="取消">取消</option>
						</select>
					</div>
					<div class="col-sm-2 mb-sm-20"
						style="width: 15%; padding-right: 0;">
						<select name="paymentStstus" class="form-control"
							style="font-size: 17px">
							<option value="0">付款狀態</option>
							<option value="未付款">未付款</option>
							<option value="已付款">已付款</option>
							<option value="退款中">退款中</option>
							<option value="已退款">已退款</option>
						</select>
					</div>
					<div class="col-sm-2 mb-sm-20"
						style="width: 15%; padding-right: 0;">
						<select name="deliveryStstus" class="form-control"
							style="font-size: 17px">
							<option value="0">送貨狀態</option>
							<option value="無">無</option>
							<option value="備貨中">備貨中</option>
							<option value="已發貨">已發貨</option>
							<option value="已取貨">已取貨</option>
							<option value="退貨中">退貨中</option>
							<option value="已退貨">已退貨</option>
						</select>
					</div>
					<div class="col-sm-2 mb-sm-20" style="width: 25%">
						<input class="form-control" type="text" name="search"
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
			<div class="col-sm-6 col-sm-offset-3 ">
				<div class="wrapmain">
					<table class="alt" id="table_id" class="display">
						<thead>
							<tr>
								<th width=120px>訂單編號</th>
								<th width=120px>會員編號</th>
								<th width=120px>訂單日期</th>
								<th width=120px>更新日期</th>
								<th width=120px>訂單狀態</th>
								<th width=120px>付款狀態</th>
								<th width=120px>送貨狀態</th>
								<th width=80px>總計</th>
								<th width=80px>修改</th>
								<th width=80px>刪除</th>
							</tr>
						</thead>
						<c:forEach var="bean" items="${classList}">

							<tbody>
								<tr>
									<td id="eachProdBlock" class="mEvent"
										onclick="window.location='/MeetBoth/shoppingCart.SelectOrderAllItem.controller/${bean.orderNo}'">${bean.orderNo}</td>
									<td>${bean.memberbuy.memberID}</td>
									<td>${bean.orderDate}</td>
									<td>${bean.uporderDate}</td>
									<td><input type="hidden" id="ordS"
										value="${bean.ordStstus}${param.ordS}"><select
										name='ordStstus' class="fieldWidth" style="width: 80px;">
											<option class="A1" value="處理中">處理中</option>
											<option class="A2" value="備貨中">備貨中</option>
											<option class="A3" value="已完成">已完成</option>
									</select></td>
									<td><input type="hidden" id="paymentS"
										value="${bean.paymentStstus}${param.paymentS}"> <select
										name='paymentStstus' class="fieldWidth" style="width: 80px;">
											<option class="B1" value="未付款">未付款</option>
											<option class="B2" value="已付款">已付款</option>
											<option class="B3" value="退款中">退款中</option>
											<option class="B4" value="已退款">已退款</option>
									</select></td>
									<td><input type="hidden" id="deliveryS"
										value="${bean.deliveryStstus}${param.deliveryS}"> <select
										name='deliveryStstus' class="fieldWidth" style="width: 80px;">
											<option class="C1" value="無">無</option>
											<option class="C2" value="備貨中">備貨中</option>
											<option class="C3" value="已發貨">已發貨</option>
											<option class="C4" value="已取貨">已取貨</option>
											<option class="C5" value="退貨中">退貨中</option>
											<option class="C6" value="已退貨">已退貨</option>
									</select></td>
									<td>${bean.totalAmount}</td>
									<td><form
											action="<c:url value='/shoppingCart.UpdateOrder.controller' />"
											method="get">
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
				</div>

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

	<!-- 用於下拉選單 -->
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#ordS').val();
		console.log(v)
		switch (v) {
		case '處理中':
			$(".A1").attr('selected', true)
			break;
		case '備貨中':
			$(".A2").attr('selected', true)
			break;
		case '已完成':
			$(".A3").attr('selected', true)
			break;
		}
	</script>
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#paymentS').val();
		console.log(v)
		switch (v) {
		case '未付款':
			$(".B1").attr('selected', true)
			break;
		case '已付款':
			$(".B2").attr('selected', true)
			break;
		case '退款中':
			$(".B3").attr('selected', true)
			break;
		case '已退款':
			$(".B4").attr('selected', true)
			break;
		}
	</script>
	<script>
		// 	var v = document.querySelector('#ii').getAttribute('value');
		var v = $('#deliveryS').val();
		console.log(v)
		switch (v) {
		case '無':
			$(".C1").attr('selected', true)
			break;
		case '備貨中':
			$(".C2").attr('selected', true)
			break;
		case '已發貨':
			$(".C3").attr('selected', true)
			break;
		case '已取貨':
			$(".C4").attr('selected', true)
			break;
		case '退貨中':
			$(".C5").attr('selected', true)
			break;
		case '已退貨':
			$(".C6").attr('selected', true)
			break;
		}
	</script>
	<!-- 用於下拉選單 -->
	<!-- 刪除Alert -->

	<script>
        $(function(){
            $('.deleteThisOrder').click(function(){
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
                          url:'/MeetBoth/shoppingCart.DeleteOrder.controller',
                          method:"get",
                          dataType:"text",
                          //對應name設定的名稱 並非value的名稱
                          data: {"orderNo":id},
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
	<!-- 	刪除Alert -->


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
