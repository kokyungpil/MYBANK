<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/MyBanking/jsp/css/css.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>은행 회원가입</title>
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
	width: 800px;
	height: 100px;
	margin: 0 auto;
	padding: 20px;
}

.input-form-background {
	padding: 20px;
	background-color: #ffffff;
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
	margin-bottom: 100px;
	font-size: 40px;
	font-weight: bold;
}

.form-control {
	width: 100%; /* 수정: 가로 길이를 100%로 변경 */
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box; /* 수정: 상자 크기를 박스 모델에 맞춤 */
	margin-top: 20px; /* 추가: 입력창 사이의 간격을 조정 */
	margin-bottom: 10px; /* 추가: 입력창 사이의 간격을 조정 */
}

.invalid-feedback {
	color: #dc3545;
}

.btn-primary {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 10px 20px;
	font-size: 16px;
	font-weight: bold;
	border-radius: 3px;
	cursor: pointer;
	font-family: Arial, sans-serif; /* 폰트 설정 */
}

.btn-primary:hover {
	background-color: #0056b3;
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
					<h4 class="mb-33">회원가입</h4>
					<form class="validation-form" method="post"
						action="${pageContext.request.contextPath}/madeid.do">
						
						<div class="mb-3">
							<label for="idname">아이디</label> <input type="text"
								class="form-control is-invalid" id="id" name="id"
								placeholder="아이디를 입력하세요" required>
							<div class="invalid-feedback">아이디 입력 후 중복확인을 꼭 눌러주세요.</div>
							<br>
						<%--	<button type="button" class="btn btn-primary" onclick="checkId()"
								id="check">중복확인</button>--%>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="pw">비밀번호</label> <input type="password"
									class="form-control" id="pw" name="pw" placeholder="" value=""
									required>
								<div class="invalid-feedback">비밀번호를 입력해주세요.</div>
							</div>
							<div class="col-md-6 mb-3">
								<label for="pw">비밀번호 확인</label> <input type="password"
									class="form-control" id="pw2" name="pw2" placeholder=""
									value="" required oninput="checkPasswordMatch()"> <span
									id="password-message"></span><br>
							</div>
						</div>
						<div class="mb-3">
							<label for="name">이름</label> <input type="text"
								class="form-control" id="name" name="name" placeholder="ex.NAME"
								required>
							<div class="invalid-feedback">이름을 입력해주세요.</div>
						</div>
						<div class="mb-3">
							<label for="address">생년월일</label> <input type="text"
								class="form-control" id="birth" name="birth"
								placeholder="ex.19970101" required oninput="checkBirthFormat()">
							<div class="invalid-feedback" id="birth-error-message"></div>
						</div>
						<div class="mb-3">
							<label for="name">이메일</label> <input type="text"
								class="form-control" id="email" name="email"
								placeholder="ex.aaa@naver.com" required>
							<div class="invalid-feedback">이메일을 입력해주세요.</div>
						</div>
						<div class="mb-3">
							<label for="phoneNum">전화번호</label> <input type="text"
								class="form-control" id="phone" name="phone"
								placeholder="ex.01012341234" required>
							<div class="invalid-feedback">전화번호를 형식에 맞게 입력해주세요.</div>
						</div>
						<div class="mb-3">
							<label for="address">주소</label> <input type="text"
								class="form-control" id="address" name="address"
								placeholder="ex.경기도 성남시" required>
							<div class="invalid-feedback">주소를 입력해주세요.</div>
						</div>
						<hr class="mb-4">
						<div class="custom-control custom-checkbox">
							<input type="checkbox" class="custom-control-input"
								id="agreement" required> <label
								class="custom-control-label" for="agreement">개인정보 수집 및
								이용에 동의합니다.</label>
						</div>
						<br> <br>
						<div class="mb-4"></div>
						<button class="btn btn-primary btn-lg" type="submit"
							style="display: block; margin: 0 auto; width: 100%; font-size: 20px;">회원가입</button>
					</form>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	// 비밀번호 일치 확인
	function checkPasswordMatch() {
		var password = document.getElementById('pw').value;
		var confirmPassword = document.getElementById('pw2').value;
		var messageElement = document.getElementById('password-message');

		if (password === confirmPassword) {
			messageElement.textContent = '';
		} else {
			messageElement.textContent = '비밀번호가 일치하지 않습니다.';
			messageElement.style.color = 'red';
		}
	}

	// 생년월일 형식 검사
	function checkBirthFormat() {
		var birth = document.getElementById('birth').value;
		var errorElement = document.getElementById('birth-error-message');
		var birthPattern = /^\d{8}$/; // 8자리 숫자 형식 검사

		if (birthPattern.test(birth)) {
			errorElement.textContent = '';
		} else {
			errorElement.textContent = '생년월일 숫자 8자리를 입력해주세요.';
			errorElement.style.color = 'red';
		}
	}
	function showCompletionMessage() {
		alert("회원가입이 완료되었습니다!");
	}

	// 폼 제출 시에 계좌 생성 완료 알림창을 띄우도록 설정
	document.querySelector('.validation-form').addEventListener('submit', showCompletionMessage);
	
</script>
</html>

