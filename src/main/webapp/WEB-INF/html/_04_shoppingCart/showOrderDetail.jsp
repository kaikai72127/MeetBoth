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

		<!-- 內容 1-->
		<section class="bg-dark-30 showcase-page-header module parallax-bg"
			data-background="assets/images/showcase_bg.jpg">
			<TABLE
				style="margin-left: auto; margin-right: auto; background: #F0E4F4; border: 1px blue solid;">
				<tr id='borderA' height='50'>
					<th id='borderA' align="center" colspan="7"><h3>的訂單明細</h3></th>
				</tr>
				<tr id='borderA' height='36'>
					<td colspan="7">
						<table>
							<tr id='borderA'>
								<td align="Left" width="350px"><b>出貨地址：</b>${OrderBean.shippingAddress}
								</td>
								<td align="center" width="300px"><b>訂購日期：</b>${OrderBean.orderDate}
								</td>
								<td align="center" width="280px"><b>訂單編號：</b>${OrderBean.orderNo}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr id='borderA' height='36'>
					<th id='borderA' width="100px" align="center">書籍編號</th>
					<th id='borderA' width="400px" align="center">書籍資訊</th>
					<th id='borderA' width="70px" align="center">單價</th>
					<th id='borderA' width="50px" align="center">數量</th>
					<th id='borderA' width="100px" align="center">總價</th>
					<th id='borderA' width="80px" align="center">折扣</th>
					<th id='borderA' width="100px" align="center">售價</th>
				</tr>
				<c:set var="subtotal" value="0" />
				<c:forEach var="aBean" varStatus="stat" items="${OrderBean.items}">
					<tr id='borderA' bgColor="${aColor}" height='30'>
						<td id='borderA' align="center">${aBean.bookId}</td>
						<td id='borderA' align="left">${aBean.description}</td>
						<td id='borderA' align="right">${aBean.unitPrice}&nbsp;</td>
						<td id='borderA' align="right">${aBean.quantity}&nbsp;</td>
						<td id='borderA' align="right">${aBean.unitPrice*aBean.quantity}&nbsp;</td>
						<td id='borderA' align="center">${aBean.discount}&nbsp;</td>
						<td id='borderA' align="right">元</td>
						<c:set var="subtotal"
							value="${ subtotal + aBean.unitPrice * aBean.discount * aBean.quantity }" />
					</tr>
				</c:forEach>
				<tr height='30'>
					<TD id='borderA' align="center" rowspan="3" colspan="5">&nbsp;</TD>
					<TD id='borderA' width="60px" align="center"><b>合 計</b></TD>
					<TD id='borderA' width="100px" align="right">元</TD>
				</tr>
				<tr height='30'>
					<TD id='borderA' width="60px" align="center"><b>總金額</b></TD>
					<TD id='borderA' width="100px" align="right">元</TD>
				</tr>
			</TABLE>
		</section>

		<!-- Footer -->
		<!-- 引入共同的footerMVC -->
		<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
	</main>

	<!--  
    JavaScripts
    =============================================
    -->
	<!-- 引入共同的 -->
	<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />



</body>
</html>
