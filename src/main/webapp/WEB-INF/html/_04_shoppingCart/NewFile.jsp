<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery v1.9.1 -->
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<!-- JQuery lightSlider v1.1.6 -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/css/lightslider.css"
	rel="stylesheet" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/lightslider/1.1.6/js/lightslider.min.js"></script>
<style>
#wrapperPhoto {
	width: 50%;
}
</style>
</head>
<body>
	<div id="wrapperPhoto">
		<ul id="example">
			<!-- 
                屬性設定[註2]
                data-thumb: 縮圖URL
                data-src: 原圖URL
            -->
			<li
				data-thumb="https://static.popdaily.com.tw/wp-content/uploads/2020/03/e0k6z3nzvxck488gk8wssk8g8q6mgg3.jpg">
				<img
				src="https://static.popdaily.com.tw/wp-content/uploads/2020/03/e0k6z3nzvxck488gk8wssk8g8q6mgg3.jpg" />
			</li>
			<li
				data-thumb="https://flipedu-cdn.parenting.com.tw/articles/cover/qAwPmPVuzAdexpsMxQGryaXudMCusnVDPsk2P3RR.jpg">
				<img
				src="https://flipedu-cdn.parenting.com.tw/articles/cover/qAwPmPVuzAdexpsMxQGryaXudMCusnVDPsk2P3RR.jpg" />
			</li>
			<li
				data-thumb="https://hengsuyang.tingmao.com.tw/upload/images/article/202202211756373202397.jpeg">
				<img
				src="https://hengsuyang.tingmao.com.tw/upload/images/article/202202211756373202397.jpeg" />
			</li>
		</ul>
	</div>
	<script>
		$("#example").lightSlider({
			// 參數設定[註1]
			gallery : true, // 相本模式
			item : 1, // 顯示數量
			loop : true, // 無限循環
			thumbItem : 10, // 縮圖數量
			slideMargin : 0, // 間隔寬度
			enableDrag : false, // 當左右拖曳時，則切換上/下項目
		});
	</script>
</body>
</html>