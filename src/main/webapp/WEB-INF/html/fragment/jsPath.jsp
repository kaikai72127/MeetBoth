<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<%
String path = request.getContextPath();
String basePath1 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/jquery/dist/jquery.js";
%>

<%
String basePath2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/bootstrap/dist/js/bootstrap.min.js";
log(basePath1);
%>

<%
String basePath3 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/wow/dist/wow.js";
%>

<%
String basePath4 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js";
%>

<%
String basePath5 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/isotope/dist/isotope.pkgd.js";
%>

<%
String basePath6 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/imagesloaded/imagesloaded.pkgd.js";
%>
<%
String basePath7 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/flexslider/jquery.flexslider.js";
%>
<%
String basePath8 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/owl.carousel/dist/owl.carousel.min.js";
%>
<%
String basePath9 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/smoothscroll.js";
%>
<%
String basePath10 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/magnific-popup/dist/jquery.magnific-popup.js";
%>
<%
String basePath11 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js";
%>
<%
String basePath12 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/js/plugins.js";
%>
<%
String basePath13 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/js/main.js";
%>
<%
String basePath14 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/js/app.js";
%>
<%
String basePath15 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/js/jquery-tablepage-1.0.js";
%>
<%
String basePath16 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/js/heart.js";
%>
<script src=<%=basePath1%>></script>
<script src=<%=basePath2%>></script>
<script src=<%=basePath3%>></script>
<script src=<%=basePath4%>></script>
<script src=<%=basePath5%>></script>
<script src=<%=basePath6%>></script>
<script src=<%=basePath7%>></script>
<script src=<%=basePath8%>></script>
<script src=<%=basePath9%>></script>
<script src=<%=basePath10%>></script>
<script src=<%=basePath11%>></script>
<script src=<%=basePath12%>></script>
<script src=<%=basePath13%>></script>
<script src=<%=basePath14%>></script>
<script src=<%=basePath15%>></script>
<script src=<%=basePath16%>></script>

<script src="https://kit.fontawesome.com/25590258af.js"
	crossorigin="anonymous"></script>
