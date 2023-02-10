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
			<table
				style="margin-left: auto; margin-right: auto; width: 810; background: #F5EBFF; border: 2px solid blue; border-style: outset;">

				<tr id='borderA' height='50'>
					<th id='borderA' colspan="4" align="center">${LoginOK.name}的訂購紀錄</th>
				</tr>
				<tr id='borderA' height='36'>
					<th id='borderA'>訂單編號</th>
					<th id='borderA'>訂購日期</th>
					<th id='borderA'>總金額</th>
					<th id='borderA'>送貨地址</th>
				</tr>
				<c:forEach var="anOrderBean" varStatus="stat"
					items="${memberOrders}">
					<TR id='borderA' height='30'>
						<TD id='borderA' width="86" align="center"><a
							href='<c:url value='/_05_orderProcess/orderDetail.do?memberId=${LoginOK.memberId}&orderNo=${anOrderBean.orderNo}' />'>
								${anOrderBean.orderNo} </a></TD>
						<TD id='borderA' width="100" align="center">${anOrderBean.orderDate}</TD>
						<TD id='borderA' width="80" align="right">${anOrderBean.totalAmount}</TD>
						<TD id='borderA' width="400" align="left">&nbsp;${anOrderBean.shippingAddress}</TD>

					</TR>
				</c:forEach>
				<tr height='36' id='borderA'>
					<td id='borderA' align="center" colspan="4"><a
						href="<c:url value='/index.jsp' />">回首頁</a></td>
				</tr>
			</table>
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
