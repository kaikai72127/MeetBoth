<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String pathAnimation = request.getContextPath();
String basePathAnimation = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ pathAnimation + "/html/assets/css/animation.css";
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/css/style.css";
System.out.println(basePath);
%>
<%
String baseColor = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/css/colors/default.css";
System.out.println(baseColor);
%>
<%
String pathBootstrap = request.getContextPath();
String baseBootstrap = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/bootstrap/dist/css/bootstrap.min.css";
System.out.println(baseBootstrap);
%>
<%
String pathAnimate = request.getContextPath();
String baseAnimate = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/animate.css/animate.css";
System.out.println(baseAnimate);
%>
<%
String pathComponents = request.getContextPath();
String baseComponents = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/components-font-awesome/css/font-awesome.min.css";
System.out.println(baseComponents);
%>
<%
String pathEt = request.getContextPath();
String baseEt = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/et-line-font/et-line-font.css";
System.out.println(baseEt);
%>

<%
String baseFlexslider = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/flexslider/flexslider.css";
System.out.println(baseFlexslider);
%>

<%
String baseOwl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css";
System.out.println(baseOwl);
%>

<%
String baseOwlDefault = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css";
System.out.println(baseOwlDefault);
%>

<%
String baseMagnificPopup = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/magnific-popup/dist/magnific-popup.css";
System.out.println(baseMagnificPopup);
%>

<%
String baseSimpletextrotator = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ path + "/html/assets/lib/simple-text-rotator/simpletextrotator.css";
System.out.println(baseSimpletextrotator);
%>

<%
String pathimg = request.getContextPath();
String baseMeetbothIcon24x24 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
		+ pathimg + "/html/assets/images/meatball/meatball-24x24-New.png";
System.out.println(baseMeetbothIcon24x24);
%>
<%
String baseMeetboth96x96 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/images/meatball/meatball-96x96-New.png";
System.out.println(baseMeetboth96x96);
%>

<title>肉丸家教網 MEET BOTH</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="robots" content="index,follow" />
<meta name="description" content="全台最優質最快速方便的家教網" />
<meta name="author" content="EEIT56-MEETBOTH" />
<meta name="keywords" content="最棒最優質的家教網" />
<meta name="copyright" content="肉丸家教網" />
<link rel="shortcut icon" href="<%=baseMeetbothIcon24x24%>" />
<link rel="bookmark" href="<%=baseMeetbothIcon24x24%>" />
<!-- Default stylesheets-->
<link href="<%=baseBootstrap%>" rel="stylesheet" />
<!-- Main stylesheet and color file-->
<link rel="stylesheet" href="<%=basePath%>" />
<link id="color-scheme" href="<%=baseColor%>" rel="stylesheet" />
<!-- 動畫css -->
<link rel="stylesheet" href="<%=basePathAnimation%>">
<!-- Template specific stylesheets-->
<link
	href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/css?family=Volkhov:400i"
	rel="stylesheet" />
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800"
	rel="stylesheet" />
<link href="<%=baseAnimate%>" rel="stylesheet" />
<link href="<%=baseComponents%>" rel="stylesheet" />
<link href="<%=baseEt%>" rel="stylesheet" />
<link href="<%=baseFlexslider%>" rel="stylesheet" />
<link href="<%=baseOwl%>" rel="stylesheet" />
<link href="<%=baseOwlDefault%>" rel="stylesheet" />
<link href="<%=baseMagnificPopup%>" rel="stylesheet" />
<link href="<%=baseSimpletextrotator%>" rel="stylesheet" />
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/25590258af.js"
	crossorigin="anonymous"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- Font Awesome -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet" />
<script src="https://kit.fontawesome.com/25590258af.js"
	crossorigin="anonymous"></script>
<link rel="shortcut icon"
	href="assets/images/meatball/meatball-24x24-New.png" />
<link rel="stylesheet" href="./assets/css/animation.css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
<!--  
    Stylesheets
    =============================================
    
    -->


<!-- 動畫 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

<script>
	$(function() {

		$.ajax({
			type : 'POST',
			url : '_01_member.checklog.controller',
			contentType : 'application/json',

			success : function(user) {

				if (user == "" || user == "anonymousUser") {
					console.log(user + "登入");
					$("#loginBtn").show();
					$("#logoutBtn").hide();
					$("#animation").show();
				} else {
					console.log(user + "登出");
					$("#loginBtn").hide();
					$("#logoutBtn").show();
					$("#animation").hide();
				}
			}
		});

	});
</script>