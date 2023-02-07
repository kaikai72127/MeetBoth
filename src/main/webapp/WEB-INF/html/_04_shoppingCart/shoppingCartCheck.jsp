<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html>
<html lang="zh-hant-TW">

<head>
<!-- 引入共同的headMVC -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "CANCEL";
			document.forms[0].action = "<c:url value='/_04_ShoppingCart/ProcessOrder.do' />";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
	function reconfirmOrder() {
		var sa = document.getElementById('ShippingAddress').value;
		if (sa === "") {
			window.alert('出貨地址不能是空白');
			return;
		}
		if (confirm("確定送出此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			document.forms[0].finalDecision.value = "ORDER";
			document.forms[0].action = "<c:url value='/_04_ShoppingCart/ProcessOrder.do' />";
			document.forms[0].method = "POST";
			document.forms[0].submit();
			return;
		} else {
			return;
		}
	}
</script>
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

		<!-- Checkout Start -->
		<h3>請確認下列訂單訊息：</h3>
	<!-- 內容 1-->
		<!-- check out-->
		<section>
			<div class="main">
				<section class="">
					<div class="container">
						<div class="row">
							<div class="col-sm-6 col-sm-offset-3">
								<h1 class="module-title font-alt">
									Checkout <i class="fa-solid fa-cart-shopping"></i>
								</h1>
							</div>
						</div>
						<hr class="divider-w pt-20">
						<div class="row">
							<div class="col-sm-12">
								<table class="table table-striped table-border checkout-table">
									<tbody>
										<tr>
											<!-- <th class=""><input type="checkbox">All</th> -->
											<th class="hidden-xs">photo</th>
											<th>商品名稱</th>
											<th class="hidden-xs">單價</th>
											<th>數量</th>
											<th>小計</th>
											<th>移除</th>
										</tr>
										<c:forEach var="shoppingItem"
											items="${ShoppingCart.getShoppingCart()}">
											<tr>
												<!-- <td class=""><input type="checkbox"></td> -->
												<td class="hidden-xs"><a href="#"><img
														src="<c:url value='/_03_product.showPicture.controller?id=${shoppingItem.value.prodItem.prodID}' />"
														alt="" style="width: 50%; float: left;"></a></td>
												<td>
													<h5 class="product-title font-alt">${shoppingItem.value.prodItem.prodName}</h5>
												</td>
												<td class="hidden-xs">
													<h5 class="product-title font-alt" id="prodPrice">${shoppingItem.value.prodItem.prodPrice}</h5>
												</td>
												<td><input class="form-control" type="number" onblur="itemTotalChange()"
													name="updateQty" value='${shoppingItem.value.qty}' max="50"
													min="1" />
												<td>
													<h5 class="product-title font-alt" id="itemTotal">${shoppingItem.value.itemTotal}</h5>
												</td>
												<td class="pr-remove"><a href="#" title="Remove"><i
														class="fa fa-times"></i></a></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
						<div class="row">
							<div class="col-sm-3">
								<div class="form-group">
									<input class="form-control" type="text" id="" name=""
										placeholder="Coupon code" />
								</div>
							</div>
							<div class="col-sm-3">
								<div class="form-group">
									<button class="btn btn-round btn-p" type="submit">Apply</button>
								</div>
							</div>
							<div class="col-sm-3 col-sm-offset-3">
								<div class="form-group">
									<button class="btn btn-block btn-round btn-p pull-right"
										type="submit">Update Cart</button>
								</div>
							</div>
						</div>
						<hr class="divider-w">
						<div class="row mt-70">
							<div class="col-sm-5 col-sm-offset-7">
								<div class="shop-Cart-totalbox">
									<h4 class="font-alt">Cart Totals</h4>
									<table class="table table-striped table-border checkout-table">
										<tbody>
											<tr>
												<th>Cart Subtotal :</th>
												<td>£40.00</td>
											</tr>
											<tr>
												<th>Shipping Total :</th>
												<td>£2.00</td>
											</tr>
											<tr class="shop-Cart-totalprice">
												<th>Total :</th>
												<td>£42.00</td>
											</tr>
										</tbody>
									</table>
									<button class="btn btn-lg btn-block btn-round btn-p"
										type="submit">Proceed to Checkout</button>
								</div>
							</div>
						</div>
					</div>
				</section>
			</div>
		</section>
		
		<!-- 資料填寫 -->
		<section>
			<div>
				<h3>訂購者資料:</h3>
				<table>
					<tbody>
						<tr>
							<th>姓名:</th>
							<td>肉丸網</td>
						</tr>
						<tr>
							<th>Email:</th>
							<td>abc@gmail.com</td>
						</tr>
						<tr>
							<th>手機號碼:</th>
							<td>0988888888</td>
						</tr>
						<tr>
							<th>地址:</th>
							<td>聖德基督學校</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<h3>收件人資料:</h3>
				<table>
					<tbody>
						<tr>
							<th>姓名:</th>
							<td>肉丸網</td>
						</tr>
						<tr>
							<th>Email:</th>
							<td>abc@gmail.com</td>
						</tr>
						<tr>
							<th>手機號碼:</th>
							<td>0988888888</td>
						</tr>
						<tr>
							<th>地址:</th>
							<td>聖德基督學校</td>
						</tr>
					</tbody>
				</table>
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
