<%@ page contentType="text/html; charset=UTF-8" language="java" %>
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<script type="text/javascript">
		function checkpwd() {
			if (document.getElementById("pas1check").value != document.getElementById("pas2check").value) {
				Swal.fire('密碼不一樣喔！')
				pas2check.value = "";
			}
		}
	</script>
	<script type="text/javascript">
		function older() {
			var birthdate = Date.parse(Birth.value);
			console.log(birthdate);
			var now = new Date().getTime();
			console.log(now);
			var old = Math.ceil((now - birthdate) / 31536000000);
			if (old - 1 <= 0) {
				memold.value = 0;
			} else {
				memold.value = old - 1;
			}
		}
	</script>
	<script type="text/javascript">
		function checkmail() {
			var check = mail.value;
			var fl = false;
			for (let i = 0; i < check.length; i++) {
				if (check[i] == "@") {
					fl = true;
					break;
				}
			}
			if (fl == false) {
				Swal.fire("電子郵件格式錯誤");
				mail.value = "";
			}
		}
	</script>
	<script type="text/javascript">
		function checkID() {
			let check = String(idNumber.value);
			check = check.toUpperCase();
			let firstCheck = "ABCDEFGHJKLMNPQRSTUVXYWZIO";
			if (check.length == 10) {
				if (firstCheck.indexOf(check[0]) != "-1") {
					if (check[1] == 1 || check[1] == 2) {
						let numberCheck = "0123456789"
						for (let i = 2; i < check.length; i++) {
							if (numberCheck.indexOf(check[i]) == (-1)) {
								Swal.fire("身分證數字列出現非數字！");
								idNumber.value = "";
								return;
							}
						}
					} else {
						Swal.fire("性別數字不合規範！");
						idNumber.value = "";
						return;
					}
				} else {
					Swal.fire("首字不是英文！");
					idNumber.value = "";
					return;
				}
			} else {
				Swal.fire("身分證長度不符！");
				idNumber.value = "";
				return;
			}
			let lastchar = check[9];
			let firstChar = 0;
			let num1 = 0, num2 = 0;
			// 取出第一個字轉換成對應數字
			for (let i = 0; i < 26; i++) {
				if (check[0] == firstCheck[i]) {
					firstChar = i + 10;
					num1 = parseInt(Math.floor(firstChar / 10));
					num2 = firstChar - (num1 * 10);
					break;
				}
			}
			let total = 0;
			for (let i = 1; i < check.length - 1; i++) {
				total += parseInt(check[i]) * (9 - i);
			}
			total = total + num1 * 1 + num2 * 9;
			let checknumber = 10 - (total % 10);
			if (lastchar != checknumber) {
				Swal.fire("身分證檢查碼錯誤");
				idNumber.value = "";
			}
		}
	</script>
	<script type="text/javascript">
		function pasvalid() {
			let password = pas1check.value;
			var regex = new RegExp(
				/^((?=.{8,}$)(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).*|(?=.{8,}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!\u0022#$%&'\''()*+,./:;<=>?@[\]\^_`{|}~-]).*)/,
				"g");
			if (password.length < 6 || password.length > 12) {
				Swal.fire('密碼過長或過短！<br>請輸入6到12字密碼！')
			} else if (password.match(regex) == null) {
				Swal.fire('密碼強度不夠喔！<br>請包含英文大寫、小寫、<br>數字及特殊符號中的三種！')
				pas1check.value = "";
			}
		}
	</script>