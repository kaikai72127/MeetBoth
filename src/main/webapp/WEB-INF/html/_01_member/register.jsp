<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
			<%@ include file="js/myjs.jsp" %>
				<% String path=request.getContextPath(); String basePathimg2=request.getScheme() + "://" +
					request.getServerName() + ":" + request.getServerPort() + path + "/html/images/meatball-200.png" ;
					%>


					<!DOCTYPE html>
					<html lang="zh-hant-TW">

					<head>
						<!-- 引入共同的headMVC -->
						<jsp:include page="../fragment/headMVC.jsp" />

					</head>

					<!--BOBY-->

					<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

						<!-- header -->
						<!-- 引入共同的topMVC -->
						<jsp:include page="../fragment/topMVC.jsp" />
						<script>
							$(function () {
								$.ajax({
									type: 'POST',
									url: '/MeetBoth/_01_member.checklog.controller',
									contentType: 'application/json',

									success: function (user) {

										if (user != "" && user != "anonymousUser") {
											location.href = '/MeetBoth/justlogin';
										}
									}
								});
							});
						</script>
						<main>
							<div class="page-loader">
								<div class="loader">Loading...</div>
							</div>

							<!--Register-->

							<section class="register">
								<form class="form-controll" action="_01_member.add.controller" method="POST"
									enctype="multipart/form-data">

									<div class="form-group">
										<table style="margin: auto;">
											<tr>
												<td style="width: 150px;"><label>帳號：</label></td>
												<td><input class="form-control" type="text"
														style="text-transform: none;" placeholder="請輸入帳號" name="account"
														value="${param.account}" required></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>密碼：</label></td>
												<td><input class="form-control" type="password"
														style="text-transform: none;" onblur="pasvalid()"
														placeholder="請輸入6 - 12位密碼，且須包含英文大寫、小寫、數字、特殊符號。" id="pas1check"
														name="password" value="${param.password}" required></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>確認密碼：</label></td>
												<td><input class="form-control" type="password"
														style="text-transform: none;" placeholder="請再輸入一次。"
														id="pas2check" onblur="checkpwd()" name="passwordcheck"
														value="${param.passwordcheck}" required></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>身分證字號：</label></td>
												<td><input class="form-control" type="text" placeholder="請輸入中華民國身分證字號"
														id="idNumber" name="idNumber" onblur="checkID()"
														value="${param.idNumber}" required></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>姓名：</label></td>
												<td><input class="form-control" type="text" placeholder="請輸入真實姓名"
														name="memName" value="${param.memname}" required></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>暱稱：</label></td>
												<td><input class="form-control" type="text"
														style="text-transform: none;" placeholder="請輸入暱稱"
														name="memNickName" value="${param.memNickname}">
												</td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>年齡：</label></td>
												<td><input class="form-control" type="text" name="memOld" id="memold"
														oninput="value=value.replace(/[^\d]/g,'')"
														placeholder="選擇生日後自動計算" value="${param.memOld}" readonly>
												</td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>生日：</label></td>
												<td><input class="form-control" type="Date" name="memBirth" id="Birth"
														value="${param.memBirth}" onchange="older()" required>
												</td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>性別：</label></td>
												<td><select name="memGender" style="width: 150px;" required>
														<option value="">請選擇</option>
														<option value="男">男</option>
														<option value="女">女</option>
													</select></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>電子郵件：</label></td>
												<td><input class="form-control" style="text-transform: none;"
														type="text" name="eMail" id="mail" onblur="checkmail()"
														value="${param.email}" required readonly>
												</td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>手機：</label></td>
												<td><input class="form-control" type="text" name="phone"
														oninput="value=value.replace(/[^\d]/g,'')"
														value="${param.phone}" required></td>
											</tr>
											<tr>
												<td style="width: 150px;"><label>地址：</label></td>
												<td><input class="form-control" type="text" name="address"
														value="${param.address}" required>
												</td>
											</tr>
											<tr>
												<td><label class="fontSize">照片：</label><br>&nbsp;</td>
												<td><input class="form-control" name='photofile' id="images5278"
														type='file' accept="image/jpg"
														placeholder="請使用jpg檔案">請使用jpg檔案<br>&nbsp;
													<img id="preImg" style="width: 180px; height: 200px"
														src="<%=basePathimg2%>" />
												</td>
											</tr>
											<tr height="42">
												<td colspan='4'>
													<div align="center">
														<input type="submit" name="submit" id="submit" value="儲存" />
														<input type="reset" name="cancel" id="cancel" value="重填">
													</div>
												</td>
											</tr>
										</table>
								</form>
								</div>
							</section>

							<!-- Footer -->
							<!-- 引入共同的footerMVC -->
							<jsp:include page="../fragment/footerMVC.jsp" />
						</main>
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
						</script>

						<!--  
    JavaScripts
    =============================================
    -->
						<!-- 引入共同的js -->
						<jsp:include page="../fragment/jsPath.jsp" />



					</body>

					</html>