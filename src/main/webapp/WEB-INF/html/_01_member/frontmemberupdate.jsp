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
						</script>
						<main>
							<div class="page-loader">
								<div class="loader">Loading...</div>
							</div>

							<!--Register-->

							<section class="register">
								<form class="form-group" method="POST" action="_01_member.frontupdate.controller"
									enctype='multipart/form-data'>

									<div class="table-wrapper">
										<table style="margin: auto; width: 800px;">
											<c:forEach var="Member" items="${Member}">
												<tr>
													<td style="width: 150px;"><label>帳號：</label>
													</td>
													<td><input style="text-transform: none;" class="form-control"
															type="text" style="background-color: #D0D0D0" name="account"
															value="${Member.account}" readonly="readonly" required></td>
													<td rowspan="4" align="center" style="width: 250px; height: 250px">
														<!-- 												<div style="float:right;"> -->
														<input style="padding-left: 35px" name='photofile'
															id="images5278" type='file' /><br> <img id="preImg"
															style="display: flex; flex-direction: flex-end"
															width="250px" height="250px"
															src="<c:url value='/_01_member.ShowPhoto.controller?account=${Member.account}'/>">
														<!-- 												</div> -->
													</td>
												</tr>
												<tr>
													<td style="width: 150px;"><label>密碼：</label>
													</td>
													<td><input class="form-control" style="text-transform: none;"
															type="password" id="pas1check" name="password"
															onblur="pasvalid()" value="${Member.password}" required>
													</td>
												</tr>
												<!-- 										<tr> -->
												<!-- 											<td style="width: 150px;"><label>確認密碼：</label></td> -->
												<!-- 											<td><input type="password" id="pas2check" -->
												<!-- 												onblur="checkpwd()" name="passwordcheck" required></td> -->
												<!-- 										</tr> -->
												<tr>
													<td style="width: 150px;">
														<label>身分證字號：</label>
													</td>
													<td><input class="form-control" type="text"
															style="background-color: #D0D0D0" name="idNumber"
															value="${Member.idNumber}" readonly="readonly" required>
													</td>
												</tr>
												<tr>
													<td style="width: 150px;"><label>姓名：</label>
													</td>
													<td><input class="form-control" style="text-transform: none;"
															type="text" name="memName" value="${Member.memName}"
															required>
													</td>
												</tr>
												<tr>
													<td style="width: 150px;"><label>暱稱：</label>
													</td>
													<td><input class="form-control" style="text-transform: none;"
															type="text" name="memNickName"
															value="${Member.memNickName}"></td>
												</tr>
												<tr>
													<td style="width: 150px;"><label>年齡：</label></td>
													<td><input class="form-control" type="text" name="memOld"
															id="memold" oninput="value=value.replace(/[^\d]/g,'')"
															placeholder="選擇生日後自動計算" value="${Member.memOld}" readonly>
													</td>
												</tr>
												<tr>
													<td style="width: 150px;"><label>生日：</label></td>
													<td><input class="form-control" type="Date" name="memBirth"
															id="Birth" value="${Member.memBirth}" onchange="older()"
															required>
													</td>
												</tr>
												<tr>
													<td style="width: 150px;"><label>性別：</label>
													</td>
													<td colspan="2"><input class="form-control" type="text"
															style="background-color: #D0D0D0" name="memGender"
															value="${Member.memGender}" readonly="readonly" required>
													</td>
												</tr>
												<tr>
													<td style="width: 150px;">
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
													<td colspan="2"><input class="form-control" type="text" name="phone"
															oninput="value=value.replace(/[^\d]/g,'')"
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
															<input type="submit" name="submit" id="submit" value="儲存" />
															<input type="reset" name="cancel" id="cancel" value="重填">
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