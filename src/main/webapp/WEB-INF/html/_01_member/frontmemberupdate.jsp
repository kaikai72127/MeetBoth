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
						<jsp:include page="js/myjs.jsp" />
						<style>
							.member {
								table-layout: auto;
								outline: 3px solid rgb(255, 179, 179);
								width: 60%;
								border-radius: 6px;
							}

							.member>tbody {
								box-shadow: 10px 10px rgb(255, 225, 225);
								border-radius: 6px;
							}

							.member>tbody>tr {
								height: 60px;
								overflow: hidden;
								margin: 10px;
								padding: 10px;
								font-size: 18.5px;
							}

							.member>tbody>tr>td {
								padding: 1.5%;
								border: 2px dotted rgb(255, 179, 179);
							}

							.member>tbody>tr>td>input {
								font-size: 18px;
							}

							.btn1 {
								/* 文字颜色 */
								color: rgb(255, 179, 179);
								/* 清除背景色 */
								background: transparent;
								/* 边框样式、颜色、宽度 */
								border: 2px solid rgb(255, 179, 179);
								/* 给边框添加圆角 */
								border-radius: 6px;
								/* 字母转大写 */
								border: none;
								color: white;
								padding: 8px 16px;
								text-align: center;
								display: inline-block;
								font-size: 20px;
								margin: 4px 2px;
								-webkit-transition-duration: 0.4s;
								/* Safari */
								transition-duration: 0.4s;
								cursor: pointer;
								text-decoration: none;
								text-transform: uppercase;
							}

							.btn1 {
								background-color: white;
								color: rgb(254, 105, 105);
								border: 2px solid rgb(255, 179, 179);
							}

							/* 悬停样式 */
							.btn1:hover {
								background-color: rgb(255, 179, 179);
								color: white;
							}
						</style>
						<script>
							function updatepwd() {
								console.log("進入密碼更新")
								var email = document.getElementById("mail").value;
								var account = document.getElementById("account").value;
								$.ajax({
									type: 'POST',
									url: '/MeetBoth/updatepass',
									ontentType: 'application/json',
									data: {
										"mail": email,
										"account": account
									}
								}).done(function () { });
							};

							function hint() {
								var email = document.getElementById("mail").value;
								Swal.fire('已將密碼更新驗證信寄到：<br>' + email);
								updatepwd();
							}
						</script>
					</head>

					<!--BOBY-->

					<body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">

						<!-- header -->
						<!-- 引入共同的topMVC -->
						<jsp:include page="../fragment/topMVC.jsp" />
						</script>
						<main>
							<div class="page-loader">
								<div class="loader">Loading...</div>
							</div>

							<!--Register-->
							<section>
								<div class="register">
									<form class="form" method="POST" action="_01_member.frontupdate.controller"
										enctype='multipart/form-data'>
										<h1 style="color: darksalmon; text-align: center;">資料修改</h1>
										<div>
											<table class="member" style="margin: auto; ">
												<c:forEach var="Member" items="${Member}">
													<tr>
														<td><label>帳號：</label>
														</td>
														<td><input style="text-transform: none;" class="form-control"
																id="account" type="text"
																style="background-color: #D0D0D0" name="account"
																value="${Member.account}" readonly="readonly" required>
														</td>
														<td rowspan="7" align="center"
															style="width: 250px; height: 250px;">
															<!-- 												<div style="float:right;"> -->
															<input style="overflow: hidden;" name='photofile'
																id="images5278" type='file' /><br> <img id="preImg"
																style="display: flex; flex-direction: flex-end;overflow: hidden;
																width:250px ;height:250px" src="<c:url value='/_01_member.ShowPhoto.controller?account=${Member.account}'/>">
															<!-- 												</div> -->
														</td>
													</tr>
													<tr>
														<td style="width: 100px;"><label>密碼：</label>
														</td>
														<td>
															<input type="hidden" id="mail" value="${Member.eMail}">
															<input class="btn1" style="padding: 3px 5px;" type="button"
																onclick="event.preventDefault();hint();"
																value=" 點我前往更新密碼！">
														</td>
													</tr>
													<!-- <tr>
														<td style="width: 150px;"><label>確認密碼：</label></td>
														<td><input type="password" id="pas2check" onblur="checkpwd()"
																name="passwordcheck" required></td>
													</tr> -->
													<tr>
														<td style="width: 100px;">
															<label>身分證字號：</label>
														</td>
														<td><input class="form-control" type="text"
																style="background-color: #D0D0D0" name="idNumber"
																value="${Member.idNumber}" readonly="readonly" required>
														</td>
													</tr>
													<tr>
														<td style="width: 100px;"><label>姓名：</label>
														</td>
														<td><input class="form-control" style="text-transform: none;"
																type="text" name="memName" value="${Member.memName}"
																required>
														</td>
													</tr>
													<tr>
														<td style="width: 100px;"><label>暱稱：</label>
														</td>
														<td><input class="form-control" style="text-transform: none;"
																type="text" name="memNickName"
																value="${Member.memNickName}"></td>
													</tr>
													<tr>
														<td style="width: 100px;"><label>年齡：</label></td>
														<td><input class="form-control" type="text" name="memOld"
																id="memold" oninput="value=value.replace(/[^\d]/g,'')"
																placeholder="選擇生日後自動計算" value="${Member.memOld}"
																readonly>
														</td>
													</tr>
													<tr>
														<td style="width: 100px;"><label>生日：</label></td>
														<td><input class="form-control" type="Date" name="memBirth"
																id="Birth" value="${Member.memBirth}" onchange="older()"
																required>
														</td>
													</tr>
													<tr>
														<td style="width: 100px;"><label>性別：</label>
														</td>
														<td colspan="2"><input class="form-control" type="text"
																style="background-color: #D0D0D0" name="memGender"
																value="${Member.memGender}" readonly="readonly"
																required>
														</td>
													</tr>
													<tr>
														<td style="width: 100px;">
															<label>電子郵件：</label>
														</td>
														<td colspan="2"><input style="text-transform: none;"
																class="form-control" type="text" name="eMail" id="mail"
																onblur="checkmail()" value="${Member.eMail}" required
																readonly>
														</td>
													</tr>
													<tr>
														<td style="width: 150px;"><label>手機：</label>
														</td>
														<td colspan="2"><input class="form-control" type="text"
																name="phone" oninput="value=value.replace(/[^\d]/g,'')"
																value="${Member.phone}" required>
														</td>
													</tr>
													<tr>
														<td style="width: 150px;"><label>地址：</label>
														</td>
														<td colspan="2"><input class="form-control" type="text"
																name="address" value="${Member.address}" required>
														</td>
													</tr>

													<tr height="42">
														<td colspan='4'>
															<div align="center">
																<input class="btn1" type="button" name="cancel"
																	id="allin" value="一鍵輸入">
																<input class="btn1" type="submit" name="submit"
																	id="submit" value="儲存" />
																<input class="btn1" type="reset" name="cancel"
																	id="cancel" value="重填">
															</div>
														</td>
													</tr>
												</c:forEach>
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