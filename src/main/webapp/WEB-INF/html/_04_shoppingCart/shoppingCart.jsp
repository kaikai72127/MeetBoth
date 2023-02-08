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
.btn-p td {
	font-weight: 600;
	font-size: 20px;
	background: #f4f7f7;
	border: 3px solid #ce7777;
}

.btn-p td:hover, .btn-p td:focus {
	background: #ce7777;
	color: white;
}

a.ap {
	color: #ce7777
}

a.ap:hover {
	background: #ce7777;
	color: white;
}

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

<!-- SweetAlert js -->
<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<!-- SweetAlert js -->
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
		<!-- check out-->
		<section>
			<form>
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
														value='${shoppingItem.value.qty}' max="50" min="1" />
													<td>
														<h5 class="product-title font-alt" id="itemTotal">${shoppingItem.value.itemTotal}</h5>
													</td>
													<td class="pr-remove"><button
															class="removeProduct btn btn-sm btn-primary"
															name="prodId" id="${shoppingItem.value.prodItem.prodID}"
															value="${shoppingItem.value.prodItem.prodID}">
															<i class="fa-solid fa-trash"></i>
														</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<div class="form-group">
										<input class="form-control" type="text" id="discount" name=""
											placeholder="Coupon code" />
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
								<!-- 								<div class="col-sm-3 col-sm-offset-3"> -->
								<!-- 									<div class="form-group"> -->
								<!-- 										<button class="btn btn-block btn-round btn-p pull-right" -->
								<!-- 											type="submit">Update Cart</button> -->
								<!-- 									</div> -->
								<!-- 								</div> -->
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
							<div
								style="display: flex; justify-content: center; margin-bottom: 50px">

								<table border='1' class="btn-p">
									<tr>
										<td width="265" align='center' class="btn-p"><a
											style="display: block;" class="ap"
											href="<c:url value='/_03_product.searchAllProduct.controller' />">繼續購物</a>
										</td>
										<td width="265" align='center'><a style="display: block"
											class="ap"
											href="<c:url value='/shoppingcartCheck.controller' />"
											onClick="return Checkout(${subtotal});">再次確認</a></td>
										<td width="265" align='center'><a style="display: block"
											class="ap"
											href="<c:url value='/abandonshopping.controller' />"
											onClick="return Abort();">放棄購物</a></td>
									</tr>
								</table>

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



	<script type="text/javascript">
function modify(key, qty, index) {
	var x = "newQty" + index;
	var newQty = document.getElementById(x).value;
	if  (newQty < 0 ) {
		window.alert ('數量不能小於 0');
		return ; 
	}
	if  (newQty == 0 ) {
		window.alert ("請執行刪除功能來刪除此項商品");
		document.getElementById(x).value = qty;
		return ; 
	}
	if  (newQty == qty ) {
		window.alert ("新、舊數量相同，不必修改");
		return ; 
	}
	if (confirm("確定將此商品的數量由" + qty + " 改為 " + newQty + " ? ") ) {
		document.forms[0].action="<c:url value='/_04_ShoppingCart/UpdateItem.do?cmd=MOD&bookId=" + key + "&newQty=" + newQty +"' />" ;
		document.forms[0].method="POST";
		document.forms[0].submit();
	} else {
		document.getElementById(x).value = qty;
	}
}
function isNumberKey(evt)
{
   var charCode = (evt.which) ? evt.which : event.keyCode
   if (charCode > 31 && (charCode < 48 || charCode > 57)){
      return false;
   }
   return true;
}
function Checkout(qty) {
	if (qty == 0)  {
		alert("無購買任何商品，不需結帳");
		return false;
	}
	if (confirm("再次確認訂單內容 ? ") ) {
		return true;
	} else {
		return false;
	}
}

function Abort() {
	if (confirm("確定放棄購物 ? ") ) {
		return true;
	} else {
		return false;
	}
}

</script>

	<script type="text/javascript">
// 	$('.checkout').on('click', function () {

// 		$.ajax({
//             url: '/shoppingCartCheckout.controller',
//             method: "post",
//             dataType: "text",
//             //這邊的"id"是給controller的變數名
// //             data: { "classId": MyValue },
//         })

// 	  });

function Abort() {
	if (confirm("確定放棄購物 ? ")) {
		return true;
	} else {
		return false;
	}
}

$('.removeProduct').on('click', function(e) {
// 	e.preventDefault(); 可以看console
	var result = confirm('是否確定刪除?');
	if (result == true) {
		let MyValue = $(this).attr("id");
		console.log(MyValue);
		console.log("---------------"+MyValue);
		$.ajax({
			url : 'removeShoppingCartItem.controlle/'+MyValue,
			method : "get",
			dataType : "text",
			//這邊的"id"是給controller的變數名
// 			data : {
// 				"prodId" : MyValue
// 			},
		}).done(function() {
			location.reload();
		})
	} else {
		return;
	}
});

$(".addtext").change(function() {
	let MyValue = $(this).attr("id");
	var inputValue = $(this).val();
	console.log("---------------"+MyValue);
	console.log(inputValue);
	$.ajax({
		url : '/removeShoppingCartItem.controlle/' + MyValue,
		method : "post",
		dataType : "text",
		//這邊的"id"是給controller的變數名
		data : {
			"prodId" : MyValue,
			"newQty" : inputValue
		},
	}).done(function() {
		location.reload();
	})

});
</script>
	<script>
      let cartCount = 0;
      document
        .getElementById("removeProduct")
        .addEventListener("click", function () {
          console.log(cartCount);
          cartCount += 1;
          document.getElementById("cartCount").innerHTML =
            "購物車：" + cartCount;
        });
    </script>


	<!--     判斷是否可以使用折扣碼 -->
	<script>
$('#checkDiscount').on('click',function(e){
	e.preventDefault();
	let discountNo= $('#discount').val()
	$.ajax({
		type:"GET",
		url : 'discountCheck.controller',
		dataType : "text",
		data : {
			//controller設定的名稱
			"discountNo" : discountNo,
		},success:function(check){
			if(check == 'OK'){
				$('#discountShow').text('折扣碼可以使用')
			}else{
				$('#discountShow').text('不可以使用請重新輸入')
				$('#discount').val('')
			}
		}
	})
})

</script>




</body>
</html>
