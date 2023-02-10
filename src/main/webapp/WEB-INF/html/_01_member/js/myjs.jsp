<%@ page contentType="text/html; charset=UTF-8" language="java" %>
	<script type="text/javascript">
		function checkpwd() {
			if (document.getElementById("pas1check").value != document.getElementById("pas2check").value) {
				alert("密碼不一致");
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
			memold.value = old;
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
				alert("電子郵件格式錯誤");
				mail.value = "";
			}
		}
	</script>
	<script type="text/javascript">
		function checkID() {
			let check = String(idNumber.value);
			check = check.toUpperCase();
			let firstCheck = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
			if (check.length == 10) {
				if (firstCheck.indexOf(check[0]) != "-1") {
					if (check[1] == 1 || check[1] == 2) {
						let numberCheck = "0123456789"
						for (let i = 2; i < check.length; i++) {
							if (numberCheck.indexOf(check[i]) == (-1)) {
								alert("身分證數字列出現非數字！");
								idNumber.value = "";
								return;
							}
						}
					} else {
						alert("性別數字不合規範！");
						idNumber.value = "";
						return;
					}
				} else {
					alert("首字不是英文！");
					idNumber.value = "";
					return;
				}
			} else {
				alert("身分證長度不符！");
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
				alert("身分證檢查碼錯誤");
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
				alert("密碼過長或過短");
			} else if (password.match(regex) == null) {
				alert("密碼不符合規範！");
				pas1check.value = "";
			}
		}
	</script>