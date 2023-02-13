<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>



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
						border: 2px solid #ce7777;
					}

					#btnArea input[type="submit"],
					#btnArea input[type="reset"] {
						background-color: #f4f7f7;
						color: #ce7777;
						padding: 10px 20px;
						border-radius: 5px;
						border: none;
						font-size: 18px;
						cursor: pointer;
						border: 2px solid #ce7777;
						font-weight: 1000;
					}

					#btnArea input[type="submit"]:hover,
					#btnArea input[type="reset"]:hover {
						background-color: #ce7777;
						color: #f4f7f7;
					}
				</style>

			</head>

			<!--BOBY-->

			<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

				<!-- header -->
				<!-- 引入共同的topMVC -->
				<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />

				<main>
					<div class="page-loader">
						<div class="loader">Loading...</div>
					</div>

					<!-- Checkout Start -->
					<!-- 內容 1-->
					<section style="margin-bottom: 50px; margin-top: 100px">
						<form method="POST" action="<c:url value='/shoppingCartPayAioConfirm.controller' />">
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
														</tr>
														<c:forEach var="shoppingItem"
															items="${ShoppingCart.getShoppingCart()}">
															<tr>
																<!-- <td class=""><input type="checkbox"></td> -->
																<td class="hidden-xs"><a
																		href="_03_product.PathToProductDetail.controller?id=${shoppingItem.value.prodItem.prodID}"><img
																			src="<c:url value='/_03_product.showPicture.controller?id=${shoppingItem.value.prodItem.prodID}' />"
																			alt=""
																			style="width: 100px; float: left;"></a></td>
																<td>
																	<h5 class="product-title font-alt">
																		${shoppingItem.value.prodItem.prodName}</h5>
																</td>
																<td class="hidden-xs">
																	<h5 class="product-title font-alt" id="prodPrice">
																		${shoppingItem.value.prodItem.prodPrice}</h5>
																</td>
																<td>
																	<h5 class="product-title font-alt"
																		id="${shoppingItem.value.prodItem.prodID}">
																		${shoppingItem.value.prodItem.prodID}</h5>
																<td>
																	<h5 class="product-title font-alt itemTotal"
																		id="itemTotal">${shoppingItem.value.itemTotal}
																	</h5>
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
														name="discount" placeholder="Coupon Code" />
												</div>
											</div>
											<div class="col-sm-2">
												<div class="form-group">
													<button class="btn btn-round btn-p" type="submit" id="checkDiscount"
														style="margin: 0">Apply</button>
												</div>
											</div>
											<div class="col-sm-2" style="margin: 0">
												<div class="form-group">
													<p style="font-size: 16px" id="discountShow"></p>
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
																<td id="itemAmount">${ShoppingCart.getItemAmount()}</td>
															</tr>
															<tr>
																<th>Discount :</th>
																<td style="color: red" id="discountPrice"></td>
															</tr>
															<tr class="shop-Cart-totalprice">
																<th>Total Amount:</th>
																<td><input type="hidden" name="totalAmount"
																		value="${ShoppingCart.getItemAmount()}"
																		id="totalAmount" /><span
																		id="showPrice">${ShoppingCart.getItemAmount()}</span>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
										<!-- ---資料填寫--- -->
										<div style="width: 500px; text-align: center;">
											<div style="margin: auto">
												<h3>---訂購者資料---</h3>
												<div
													style="display: flex; justify-content: center; margin-bottom: 50px">

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
											</div>

											<div>
												<!-- 收件者資料 -->
												<h3>---收件者資料---</h3>
												<div
													style="display: flex; justify-content: center; margin-bottom: 50px">

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
											</div>


										</div>

										<!-- 							選擇付款方式 -->
										<!-- 							<div> -->
										<!-- 								<h3>付款方式:</h3> -->
										<!-- 								<label for="貨到付款">貨到付款</label><input type='radio' -->
										<!-- 									name='paymentMethod' value="貨到付款" class="fieldWidth" -->
										<!-- 									style="width: 200px;" /> <label for="信用卡">信用卡</label><input -->
										<!-- 									type='radio' name='paymentMethod' value="信用卡" -->
										<!-- 									class="fieldWidth" style="width: 200px;" /> <label for="轉帳">轉帳</label><input -->
										<!-- 									type='radio' name='paymentMethod' value="轉帳" class="fieldWidth" -->
										<!-- 									style="width: 200px;" /> -->
										<!-- 							</div> -->
										<div id="btnArea" align="center">
											<input type="submit" name="submit" id="submit" value="送出訂單"
												style="margin-right: 20px" /> <input type="reset" name="cancel"
												id="cancel" value="重填訂單">
										</div>
										<div align="center">
											<a href="<c:url value='/shoppingcart.controller' />" class="btn border"
												style="font-size: 20px; color: #ce7777; font-weight: 1000;">
												<i class="fa-regular fa-circle-left"></i>返回
											</a>

										</div>

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
					$('#checkDiscount').on('click', function (e) {
						e.preventDefault();
						let discountNo = $('#discount').val()
						$.ajax({
							type: "GET",
							url: 'discountCheck.controller',
							dataType: "text",
							data: {
								//controller設定的名稱
								"discountNo": discountNo,
							},
							success: function (check) {
								if (check == 'CANTUSE') {
									$('#discountShow').text('不可以使用請重新輸入')
									$('#discount').val('')
								} else {
									var price = $('#itemAmount').text()
									var totalAmount = price - check
									$('#discountShow').text('折扣碼可以使用')
									$('#discountPrice').text(check)
									if (totalAmount > 0) {
										$('#totalAmount').val(totalAmount)
										$('#showPrice').text(totalAmount)
									} else {
										$('#totalAmount').val(0)
										$('#showPrice').text(0)
									}
								}
							}
						})
					})
				</script>

			</body>

			</html>