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
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		<!-- Checkout Start -->
		<form action="/payment/checkout" method="post">

			<div class="container-fluid pt-5">
				<div class="row px-xl-5">
					<div class="col-lg-8">
						<div class="mb-4">
							<h4 class="font-weight-semi-bold mb-4">請填寫以下訂購資訊</h4>
							<div class="row">
								<div class="col-md-6 form-group">
									<label>帳號:</label>
									<!-- 							<input class="form-control" type="text"  name="memberId" id="memberId" value="${LoginOK.memberId}" readonly>  -->
									<input class="form-control" type="text" name="memberAccount"
										id="memberAccount" value="${LoginOK.memberAccount}" readonly>
								</div>

								<div class="col-md-6 form-group">
									<label>E-mail</label> <input class="form-control" type="email"
										name="memberEmail" id="memberEmail"
										placeholder="example@email.com" required>
								</div>
								<div class="col-md-6 form-group">
									<label>手機號碼:</label> <input class="form-control" type="text"
										name="memberPhone" id="memberPhone" placeholder="09123 456 78"
										pattern="09\d{2}\d{6}" maxlength="11" required>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="card border-secondary mb-5">
							<div class="card-header bg-secondary border-0">
								<h4 class="font-weight-semi-bold m-0">訂單總明細</h4>
							</div>
							<c:forEach var="shoppingItem" items="${ShoppingCart.getShoppingCart()}">
								<div class="card-body">
									<h5 class="font-weight-medium mb-3">訂購商品</h5>
									<div class="d-flex justify-content-between">
										<p>${shoppingItem.value.prodName}<br />


											<p style="text-align: right">
										x ${shoppingItem.value.qty}<br />
									</p>

								</div>
							</div>
						</c:forEach>

						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mt-2">
								<h5 class="font-weight-bold">總金額</h5>
								<h5 class="font-weight-bold">${ShoppingCart.getSubtotal()}</h5>
							</div>
						</div>
					</div>
					<div class="card border-secondary mb-5">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">Payment</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment"
											id="paypal"> <label class="custom-control-label"
											for="paypal">信用卡付款</label>
								</div>
						<div class="card-footer border-secondary bg-transparent">
							<button onClick="return Abort();"
									class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3 orderConfirm">Place
								Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	
	
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
