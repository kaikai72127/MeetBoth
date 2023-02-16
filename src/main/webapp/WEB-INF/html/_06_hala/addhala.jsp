<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<! DOCTYPE html>
<html>
<head>
<%
String path = request.getContextPath();
String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/assets/css/main.css";
%>
<%
String pathimg = request.getContextPath();
String basePathimg = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + pathimg
		+ "/html/images/meatball-icon.png";
%>
<%
String basePathimg2 = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path
		+ "/html/images/meatball-200.png";
%>

<!-- 引入共同的頁首 -->
<jsp:include page="/WEB-INF/html/fragment/headMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/topMVC.jsp" />
<jsp:include page="/WEB-INF/html/fragment/jsPath.jsp" />


<style>
.tab {
	width: 110%;
	border: 5px dashed gray;
}

.trr {
	border: 1px dashed gray
}

.td1 {
	padding: 20px;
	padding-right: 60px;
	font-size: 18px
}

.td2 {
	padding: 5px;
	font-size: 14px;
}
</style>
</head>
<body data-spy="scroll" data-target=".onpage-navigation"
	data-offset="60">
	<main>
		<div class="page-loader">
			<div class="loader">Loading...</div>
		</div>

		

		<!-- 中間欄位開始 -->
		<div class="main">
			<section class="module">
				<div class="container">
					<div class="row">

						<!-- 表格欄位開始 -->
						<div class="col-sm-8 col-sm-offset-1" style='width: 80%'>
							<div class="post">
								<div class="post-header font-alt">
									<h2 class="post-title">
										<a href="#">新增貼文</a>
									</h2>
								</div>
								<div class="post-entry">
									<div>
										<form
											action='<c:url value="/_06_halaAndQa.AddHala.controller" />'
											enctype='multipart/form-data' method='post'>
											<div style="float: left; width: 50%">
												<select name="halaclassname" style="width: 40%">
													<option value="">--請選擇您的分類--</option>
													<option value="公告">公告</option>
													<option value="閱讀心得">閱讀心得</option>
													<option value="資料分享">資料分享</option>
													<option value="圖書推薦">圖書推薦</option>
													<option value="教學文章">教學文章</option>
													<option value="JAVA">JAVA</option>
													<option value="HTML">HTML</option>
													<option value="Spring">Spring</option>
													<option value="SpringBoot">SpringBoot</option>
													<option value="SQL Server">SQL Server</option>
													<option value="SpringMVC">SpringMVC</option>
													<option value="My SQL">My SQL</option>
													<option value="Hibernate">Hibernate</option>
													<option value="VScode">VScode</option>
													<option value="eclipse">eclipse</option>
													<option value="SpringTool">SpringTool</option>
													<option value="JDBC">JDBC</option>
													<option value="Servlet">Servlet</option>
													<option value="JavaScript">JavaScript</option>
													<option value="jQuery">jQuery</option>
													<option value="Azure">Azure</option>
													<option value="RESTful">RESTful</option>
													<option value="c++">c++</option>
													<option value="python">python</option>
													<option value="其他">其他</option>

												</select>
											</div>
											<div style="float: right; width: 30%">
												id:<input type="text" class="form-control" name="memberid"
													value="${Member.memberID}" placeholder="id"  readonly>
											</div>
											<input type="text" class="form-control" name="title" value=""
												placeholder="請輸入文章標題⋯">
											<textarea id="editor" name="halacontent" class="form-control"
												rows="30" placeholder="請輸入文章內容"></textarea>
											<input name="images" id="images5278" type="file"
												style="width: 80%" accept=".jpg, .png"> <br> <img
												id="preImg" style="width: 150px; height: 200px"
												src="<c:url value='html/images/meatball-200.png'/>" />

											<div>
												<button class="btn btn-primary btn-circle" type="submit">確定送出</button>
												<button class="btn btn-danger btn-circle" type="button"
													onclick="window.location.href='http://localhost:8080/MeetBoth/_06_halaAndQa.SelectAllHala.controller/{page}'">取消</button>
													<button class="btn btn-primary btn-circle" type="button" id="fill-form-btn">一鍵輸入</button>

											</div>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- 表格欄位結束 -->
			<!-- 中間欄位結束 -->

<jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
	</main>
	<!--  
    JavaScripts
    =============================================
    -->
	<script src="html/assets/lib/jquery/dist/jquery.js"></script>
	<script src="html/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
	<script src="html/assets/lib/wow/dist/wow.js"></script>
	<script
		src="html/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
	<script src="html/assets/lib/isotope/dist/isotope.pkgd.js"></script>
	<script src="html/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
	<script src="html/assets/lib/flexslider/jquery.flexslider.js"></script>
	<script src="html/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
	<script src="html/assets/lib/smoothscroll.js"></script>
	<script
		src="html/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
	<script
		src="html/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
	<script src="html/assets/js/plugins.js"></script>
	<script src="html/assets/js/main.js"></script>
	<script>
		$("#images5278").change(function(){
	     readURL(this);
	   	});
		
		function readURL(input){
			  if(input.files && input.files[0]){
			    var reader = new FileReader();
			    reader.onload = function (e) {
			       $("#preImg").attr('src', e.target.result);
			    }
			    reader.readAsDataURL(input.files[0]);
			  }
			}
		function onlyNumberKey(event){
			var ASCIICode = (event.which) ? event.which : event.keyCode
		            if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
		            return false;
		            return true;
		}
	</script>
	<script>
                        ClassicEditor
                                .create( document.querySelector( '#editor' ) )
                                .then( editor => {
                                        console.log( editor );
                                } )
                                .catch( error => {
                                        console.error( error );
                                } );
                </script>
                <script>
                document.getElementById('fill-form-btn').addEventListener('click', function() {
                    // 範例標題文字
                    var title = 'MEETBOTH的老師有推薦的嗎';
                    
                    // 範例內容文字
                    var content = '我最近想學JAVA，不知道有沒有推薦的老師';

                    // 將範例文字填入標題與內容欄位
                    document.getElementsByName('title')[0].value = title;
                    document.getElementsByName('halacontent')[0].value = content;
                });

</script>
</body>
</html>