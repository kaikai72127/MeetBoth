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
button.removeProduct {
	background-color: #f4f7f7;
	color: #ce7777;
	border: 1px solid #ce7777;
}

button.removeProduct:hover {
	background-color: #ce7777;
	color: white;
	border: 1px solid #ce7777;
}
</style>

<script type="text/javascript">
	function cancelOrder() {
		if (confirm("確定取消此份訂單 ? ")) {
			// 接收此資料的Servlet會使用 finalDecision 參數的值
			console.log = (forms[0].finalDecision.value)
			document.forms[0].finalDecision.value = "CANCEL";
			document.forms[0].action = "<c:url value='/orderConfirmCancel.controller' />";
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
		<!-- 內容 1-->
		<section style="margin-bottom: 100px">
			<form method="POST"
				action="<c:url value='/shoppingCartPayConfirm.controller' />">
				<div class="main">
					<section class="">
						<div class="container">
							<div class="row">
								<div class="col-sm-6 col-sm-offset-3">
									<h1 class="module-title font-alt">
										請再次 <i class="fa-solid fa-cart-shopping"></i>
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
											</tr>
											<c:forEach var="shoppingItem"
												items="${ShoppingCart.getShoppingCart()}">
												<tr>
													<!-- <td class=""><input type="checkbox"></td> -->
													<td class="hidden-xs"><a
														href="_03_product.PathToProductDetail.controller?id=${shoppingItem.value.prodItem.prodID}"><img
															src="<c:url value='/_03_product.showPicture.controller?id=${shoppingItem.value.prodItem.prodID}' />"
															alt="" style="width: 100px; float: left;"></a></td>
													<td>
														<h5 class="product-title font-alt">${shoppingItem.value.prodItem.prodName}</h5>
													</td>
													<td class="hidden-xs">
														<h5 class="product-title font-alt" id="prodPrice">${shoppingItem.value.prodItem.prodPrice}</h5>
													</td>
													<td><input class="form-control" type="number"
														onblur="itemTotalChange()" name="updateQty"
														value='${shoppingItem.value.qty}' max="50" min="1"
														readonly />
													<td>
														<h5 class="product-title font-alt" id="itemTotal">${shoppingItem.value.itemTotal}</h5>
													</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<input class="form-control" type="text" id="discount"
											name="discount" placeholder="Coupon code" value=""/>
									</div>
								</div>
								<div class="col-sm-2">
									<div class="form-group">
										<button class="btn btn-round btn-p" type="submit"
											id="checkDiscount" style="margin: 0">Apply</button>
									</div>
								</div>
								<div class="col-sm-2" style="margin: 0">
									<div class="form-group">
										<p style="font-size: 16px" id="discountShow"></p>
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
													<th>Total :</th>
													<td>${ShoppingCart.getItemAmount()}</td>
												</tr>
												<tr>
													<th>Discount :</th>
													<td>£2.00</td>
												</tr>
												<tr class="shop-Cart-totalprice">
													<th>Total Amount:</th>
													<td><input type='text' name='totalAmount'
														value="${ShoppingCart.getItemAmount()}" class="fieldWidth"
														style="width: 100px;" readonly /></td>
												</tr>
											</tbody>
										</table>
										<button class="btn btn-lg btn-block btn-round btn-p"
											type="submit">Proceed to Checkout</button>
									</div>
								</div>
							</div>
							<!-- ---訂購者資料--- -->
							<div
								style="display: flex; justify-content: center; margin-bottom: 50px">
								<h3>---訂購者資料---</h3>
								<table class="table table-striped table-border checkout-table">
									<tbody>
										<tr>
											<th>姓名 :</th>
											<td>${Member.memName}</td>
										</tr>
										<tr>
											<th>電話 :</th>
											<td>${Member.phone}</td>
										</tr>
										<tr>
											<th>E-mail :</th>
											<td>${Member.eMail}</td>
										</tr>
										<tr>
											<th>地址 :</th>
											<td>${Member.address}</td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 收件者資料 -->
							<div
								style="display: flex; justify-content: center; margin-bottom: 50px">
								<h3>---收件者資料---</h3>
								<table class="table table-striped table-border checkout-table">
									<tbody>
										<tr>
											<th>姓名 :</th>
											<td><input type='text' name='shippingName'
												value="${Member.memName}" class="fieldWidth"
												style="width: 200px;" /></td>
										</tr>
										<tr>
											<th>電話 :</th>
											<td><input type='text' name='shippingPhone'
												value="${Member.phone}" class="fieldWidth"
												style="width: 200px;" /></td>
										</tr>
										<tr>
											<th>E-mail :</th>
											<td><input type='email' name='email'
												value="${Member.eMail}" class="fieldWidth"
												style="width: 200px;" /></td>
										</tr>
										<tr>
											<th>地址 :</th>
											<td><input type='text' name='shippingAddress'
												value="${Member.address}" class="fieldWidth"
												style="width: 200px;" /></td>
										</tr>
									</tbody>
								</table>
							</div>
							<!-- 							選擇付款方式 -->
							<div>
								<h3>付款方式:</h3>
								<label for="貨到付款">貨到付款</label><input type='radio'
									name='paymentMethod' value="貨到付款" class="fieldWidth"
									style="width: 200px;" /> <label for="信用卡">信用卡</label><input
									type='radio' name='paymentMethod' value="信用卡"
									class="fieldWidth" style="width: 200px;" /> <label for="轉帳">轉帳</label><input
									type='radio' name='paymentMethod' value="轉帳" class="fieldWidth"
									style="width: 200px;" />
							</div>
							<div id="btnArea" align="center">

								<input type="submit" name="submit" id="submit" value="送出訂單"
									style="margin-right: 20px" /> <input type="reset"
									name="cancel" id="cancel" value="重填訂單">
							</div>
							<a href="<c:url value='/shoppingcart.controller' />"
								class="btn border" style="font-size: 18px"> <i
								class="fa-solid fa-angles-left"></i>返回
							</a>
						</div>
					</section>
				</div>
			</form>
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
	<!--     判斷是否可以使用折扣碼 -->
	<script>
		$('#checkDiscount').on('click', function(e) {
			e.preventDefault();
			let discountNo = $('#discount').val()
			$.ajax({
				type : "GET",
				url : 'discountCheck.controller',
				dataType : "text",
				data : {
					//controller設定的名稱
					"discountNo" : discountNo,
				},
				success : function(check) {
					if (check == 'OK') {
						$('#discountShow').text('折扣碼可以使用')
					} else {
						$('#discountShow').text('不可以使用請重新輸入')
						$('#discount').val('')
					}
				}
			})
		})
	</script>


</body>
</html>
