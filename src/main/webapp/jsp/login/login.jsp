<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/MyBanking/jsp/css/css.css">
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap')
	;

body {
	font-family: 'Nanum Gothic', sans-serif;
}

h4, .mb-3, .btn-primary, .mb-33 {
	font-family: 'Nanum Gothic', sans-serif;
}

.container {
	position: relative;
	top: 70px;
	width: 500px;
	margin: 0 auto;
	padding: 20px;
	background-color: #c0e1f5;
	border: 2px solid #c0e1f5;
	border-radius: 5px;
}

.input-form-background {
	padding: 20px;
	background-color: #ffffff;
	border: 1px solid #ccc;
	border-radius: 5px;
}

h4 {
	text-align: center;
	margin-bottom: 10px;
	color: #333333;
}

.mb-3 {
	margin-bottom: 20px;
	font-weight: bold;
}

.mb-33 {
	position: relative;
	top: -10px;
	font-size: 25px;
	font-weight: bold;
}

.form-control {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.btn-primary {
	background-color: #f7c72a;
	color: #fff;
	border: none;
	padding: 15px 20px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 3px;
	cursor: pointer;
	font-family: Arial, sans-serif;
	text-decoration: none;
	margin-right : 10px;
	margin-left : 10px;
}

.btn-secondary {
	background-color: #f7c72a;
	color: #fff;
	border: none;
	padding: 15px 20px;
	font-size: 18px;
	font-weight: bold;
	border-radius: 3px;
	cursor: pointer;
	font-family: Arial, sans-serif;
	text-decoration: none;
}

.btn-primary:hover {
	background-color: #0056b3;
}

.btn-secondary:hover {
	background-color: #117a8b;
}

.custom-control-input:checked ~ .custom-control-label::before {
	background-color: #c0e1f5;
	border-color: #c0e1f5;
}

.custom-control-label::before {
	border-radius: 3px;
}

.custom-checkbox .custom-control-input:checked ~ .custom-control-label::after
	{
	border-color: #fff;
}

.custom-checkbox .custom-control-input:checked ~ .custom-control-label::before
	{
	background-color: #c0e1f5;
}

.custom-control-label::after, .custom-control-label::before {
	position: absolute;
	top: 0;
	left: -1.25rem;
	display: block;
	width: 1rem;
	height: 1rem;
	pointer-events: none;
	content: "";
}

.custom-control-label::before {
	border: 1px solid #adb5bd;
}

.custom-control-label::after {
	background-repeat: no-repeat;
	background-position: center center;
	background-size: 50% 50%;
	background-image: none;
}

.custom-control-label::before, .custom-control-label::after {
	background-color: #fff;
	transition: background-color 0.2s ease-in-out, border-color 0.2s
		ease-in-out, box-shadow 0.2s ease-in-out;
}
</style>
</head>

<header>
	<%@ include file="/jsp/include/head.jsp"%>
</header>

<body>
	<div class="container">
		<div class="row">
			<div class="col-md-6 mx-auto">
				<div class="input-form-background">
					<h4 class="mb-33">로그인</h4>
					<form method="post" action="loginProcess.jsp" name="loginForm"
						onsubmit="return checkForm()">
						<div class="mb-3">
							<label for="id">ID</label> <input type="text"
								class="form-control" id="id" name="id" placeholder="아이디를 입력하세요"
								required>
						</div>
						<div class="mb-3">
							<label for="pw">비밀번호</label> <input type="password"
								class="form-control" id="pw" name="pw" placeholder="" required>
							<br> <br> <br>
						</div>
						<hr class="mb-4">
						<div class="d-grid gap-2" style="margin-top: -10px; margin-bottom: 15px;">
							<br> <br> 			<button type="submit"
								class="btn-primary">로그인</button> <a
								href="${pageContext.request.contextPath}/jsp/login/join.jsp"
								class="btn-secondary">회원가입</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
</body>
<script>
		function checkForm() {
			let f = document.loginForm;

			if (f.id.value === '') {
				alert('아이디를 입력하세요');
				f.id.focus();
				return false;
			}

			if (f.password.value === '') {
				alert('비밀번호를 입력하세요');
				f.password.focus();
				return false;
			}

			return true;
		}

		function closeLoginBox() {
			document.getElementById('loginbox').style.display = 'none';
		}
	</script>
</html>
