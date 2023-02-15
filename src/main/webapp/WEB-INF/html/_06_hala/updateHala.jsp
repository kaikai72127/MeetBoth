<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <!DOCTYPE html>
    <html lang="en-US" dir="ltr">

    <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <!--  
    Document Title
    =============================================
    -->
      <title>Titan | Multipurpose HTML5 Template</title>
      <!--  
    Favicons
    =============================================
    -->
      <link rel="apple-touch-icon" sizes="57x57" href="html/assets/images/favicons/apple-icon-57x57.png">
      <link rel="apple-touch-icon" sizes="60x60" href="html/assets/images/favicons/apple-icon-60x60.png">
      <link rel="apple-touch-icon" sizes="72x72" href="html/assets/images/favicons/apple-icon-72x72.png">
      <link rel="apple-touch-icon" sizes="76x76" href="html/assets/images/favicons/apple-icon-76x76.png">
      <link rel="apple-touch-icon" sizes="114x114" href="html/assets/images/favicons/apple-icon-114x114.png">
      <link rel="apple-touch-icon" sizes="120x120" href="html/assets/images/favicons/apple-icon-120x120.png">
      <link rel="apple-touch-icon" sizes="144x144" href="html/assets/images/favicons/apple-icon-144x144.png">
      <link rel="apple-touch-icon" sizes="152x152" href="html/assets/images/favicons/apple-icon-152x152.png">
      <link rel="apple-touch-icon" sizes="180x180" href="html/assets/images/favicons/apple-icon-180x180.png">
      <link rel="icon" type="image/png" sizes="192x192" href="html/assets/images/favicons/android-icon-192x192.png">
      <link rel="icon" type="image/png" sizes="32x32" href="html/assets/images/favicons/favicon-32x32.png">
      <link rel="icon" type="image/png" sizes="96x96" href="html/assets/images/favicons/favicon-96x96.png">
      <link rel="icon" type="image/png" sizes="16x16" href="html/assets/images/favicons/favicon-16x16.png">
      <link rel="manifest" href="/manifest.json">
      <meta name="msapplication-TileColor" content="#ffffff">
      <meta name="msapplication-TileImage" content="html/assets/images/favicons/ms-icon-144x144.png">
      <meta name="theme-color" content="#ffffff">
      <!--  
    Stylesheets
    =============================================
    
    -->
      <!-- Default stylesheets-->
      <link href="html/assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
      <!-- Template specific stylesheets-->
      <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
      <link href="html/assets/lib/animate.css/animate.css" rel="stylesheet">
      <link href="html/assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
      <link href="html/assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
      <link href="html/assets/lib/flexslider/flexslider.css" rel="stylesheet">
      <link href="html/assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
      <link href="html/assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
      <link href="html/assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
      <link href="html/assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
      <!-- Main stylesheet and color file-->
      <link href="html/assets/css/style.css" rel="stylesheet">
      <link id="color-scheme" href="html/assets/css/colors/default.css" rel="stylesheet">
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
	padding:5px;
	font-size:14px;
}
</style>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
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
              <div class="col-sm-8 col-sm-offset-1" style='width:80%'>
                <div class="post">
                  <div class="post-header font-alt">
                    <h2 class="post-title"><a href="#">修改貼文</a></h2>
                  </div>
                  <div class="post-entry">
                  	<div>
                  		<form action='<c:url value="/_06_halaAndQa.updateHala.controller?halaId=${bean.halaId}" />' enctype='multipart/form-data' method='post'>
                  		<div style="float:left; width:50%">
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
						
                  		<input type="text" class="form-control" name="title" value="${bean.title}" placeholder="請輸入文章標題⋯">
                  		<textarea name="halacontent" class="form-control" rows="7" placeholder="">${bean.halacontent}</textarea>
                  		<input name="images" id="images5278" type="file" style="width:80%" accept=".jpg, .png">
						<br>
						<img id="preImg" style="width:150px; height:200px" src="<c:url value='/_06_halaAndQa.picsave.controller?id=${bean.halaId}'/>" />
						<div>
						<button class="btn btn-primary btn-circle" type="submit">確定送出</button>
						<button class="btn btn-danger btn-circle" type="button"onclick="window.location.href='http://localhost:8080/MeetBoth/_06_halaAndQa.SelectAllHala.controller/{page}'">取消</button>
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


      </main>
      <jsp:include page="/WEB-INF/html/fragment/footerMVC.jsp" />
      <!--  
    JavaScripts
    =============================================
    -->
      <script src="html/assets/lib/jquery/dist/jquery.js"></script>
      <script src="html/assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
      <script src="html/assets/lib/wow/dist/wow.js"></script>
      <script src="html/assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
      <script src="html/assets/lib/isotope/dist/isotope.pkgd.js"></script>
      <script src="html/assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
      <script src="html/assets/lib/flexslider/jquery.flexslider.js"></script>
      <script src="html/assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
      <script src="html/assets/lib/smoothscroll.js"></script>
      <script src="html/assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
      <script src="html/assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
      <script src="html/assets/js/plugins.js"></script>
      <script src="html/assets/js/main.js"></script>
      <script>
        $("#images5278").change(function () {
          readURL(this);
        });

        function readURL(input) {
          if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
              $("#preImg").attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          }
        }
        function onlyNumberKey(event) {
          var ASCIICode = (event.which) ? event.which : event.keyCode
          if (ASCIICode > 31 && (ASCIICode < 48 || ASCIICode > 57))
            return false;
          return true;
        }
      </script>
      <script>
        document.querySelector("textarea[name='halacontent']").value = "${bean.halacontent}";
      </script>
    </body>

    </html>