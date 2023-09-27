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

.generate-button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 5px 10px;
	font-size: 15px;
	border-radius: 3px;
	cursor: pointer;
	font-family: Arial, sans-serif;
	/* Add any additional custom styles here */
}

.generate-button:hover {
	background-color: #0056b3;
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
					<h4 class="mb-33">계좌생성</h4>
					<form class="validation-form" method="post"
						action="${pageContext.request.contextPath}/madeac.do">

						<div class="mb-3">
							<label for="ac">계좌 번호</label> <input type="text"
								class="form-control" id="ac_num" name="ac_num"
								placeholder="계좌번호를 선택하세요" value="" required> <a
								class="invalid-feedback">계좌번호를 선택해주세요.</a>
							<button type="button" onclick="generateAccountNumber()"
								class="btn btn-primary generate-button">계좌번호 생성</button>
						</div>

						<div class="mb-3">
							<label for="acname">계좌 명칭 </label> <select class="form-control"
								id="ac_name" name="ac_name" value="">
								<option value="" selected disabled>명칭을 선택해주세요</option>
								<option value="급여 계좌">급여 계좌</option>
								<option value="저축 계좌">저축 계좌</option>
								<option value="법인 계좌">법인 계좌</option>
								<option value="모임 계좌">모임 계좌</option>
								<option value="사업자금 계좌">사업자금 계좌</option>
								<option value="기타">기타</option>
							</select>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label for="id">사용자 아이디</label> <input type="text"
									class="form-control" id="id" name="id" value="${loginUser.id}"
									readonly>
								<div class="invalid-feedback"></div>
							</div>
						</div>

						<div class="col-md-6 mb-3">
							<label for="code">은행 코드</label> <input type="text"
								class="form-control" id="bankcode" name="bankcode"
								placeholder="" value="9999" readonly> <a class="invalid-feedback">은행코드를
								선택해주세요.</a>
						</div>
						<div class="mb-3">
							<label for="pw">계좌 비밀번호</label> <input type="text"
								class="form-control" id="acpw" name="acpw" placeholder="숫자 4자리"
								pattern="\d{4}"  maxlength="4" required>
							<div class="invalid-feedback">숫자 4자리를 입력해주세요.</div>
						</div>
				<div class="mb-3">
					<label for="date">계좌 개설일</label> <input type="date"
						class="form-control" id="acmadedate" name="acmadedate"
						value="<%=java.time.LocalDate.now()%>" required readonly>
				</div>
				<hr class="mb-4">
				<div class="custom-control custom-checkbox">
					<input type="checkbox" class="custom-control-input" id="agreement"
						required> <label class="custom-control-label"
						for="agreement">개인정보 수집 및 이용에 동의합니다.</label>
				</div>
				<br> <br>
				<div class="mb-4"></div>
				<button class="btn btn-primary btn-lg" type="submit"
					style="display: block; margin: 0 auto; width: 100%; font-size: 20px;">계좌
					생성</button>
				</form>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br>
			</div>
		</div>
	</div>
	</div>
</body>
<script>
	function generateAccountNumber() {
		var accountNumber = "";
		var digits = "0123456789";

		for (var i = 0; i < 13; i++) {
			accountNumber += digits.charAt(Math.floor(Math.random()
					* digits.length));
		}

		document.getElementById("ac_num").value = accountNumber;
	}

	function getbankcodeNumber() {
		var bankcode = "";
		var digits = "0123456789ABCDEF";

		for (var i = 0; i < 8; i++) {
			bankcode += digits
					.charAt(Math.floor(Math.random() * digits.length));
		}

		document.getElementById("bankcode").value = bankcode;
	}

	function showCompletionMessage() {
		alert("계좌 생성이 완료되었습니다!");
	}

	// 폼 제출 시에 계좌 생성 완료 알림창을 띄우도록 설정
	document.querySelector('.validation-form').addEventListener('submit',
			showCompletionMessage);
</script>
</html>

