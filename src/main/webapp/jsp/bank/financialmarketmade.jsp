<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/MyBanking/jsp/css/css.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 생성</title>
<link rel="stylesheet" href="/MyBanking/jsp/css/css.css">
<style>
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
					<h4 class="mb-33">적금상품 가입신청</h4>

					<form class="validation-form" method="post"
						action="${pageContext.request.contextPath}/madepd.do">

						<div class="col-md-6 mb-3">
							<label for="pdcode">상품 코드</label> <input type="text"
								class="form-control" id="pdcode" name="pdcode" placeholder=""
								value=""> <a class="invalid-feedback">상품 코드를 선택해주세요.</a>
							<button type="button" onclick="getpdcodeNumber()"
								class="btn btn-primary generate-button">상품코드 생성</button>
						</div>

						<div class="mb-3">
							<label for="pdname">상품명</label> <select class="form-control"
								id="pdname" name="pdname" value="">
								<option value="" selected disabled>상품을 선택해주세요</option>
								<option value="데일리 워킹 적금">데일리 워킹 적금</option>
								<option value="청년도약 적금">청년도약적금</option>
								<option value="우리 사장님 활짝 적금">우리 사장님 활짝 적금</option>
								<option value="장병내일준비 적금">장병내일준비 적금</option>
								<option value="우주도약최강 적금">우주도약 최강 적금</option>
							</select>
						</div>

						<div class="mb-3">
							<div class="col-md-6 mb-3">
								<label for="id">사용자 아이디</label> <input type="text"
									class="form-control" id="id" name="id" value="${loginUser.id}"
									readonly>
								<div class="invalid-feedback"></div>
							</div>
						</div>

						<div class="mb-3">
							<label for="acnum">적금에 사용할 계좌</label> <select class="form-control"
								id="acnum" name="acnum" value="">
								<option value="" selected disabled>계좌번호를 선택해주세요</option>

								<c:forEach var="bank" items="${bankList}">

									<option value=${bank.ac_num} >${bank.ac_name} : ${bank.ac_num}</option>

								</c:forEach>
							</select>
						</div>


						<div class="mb-3">
							<label for="date">상품 가입일</label> <input type="date"
								class="form-control" id="pdmadedate" name="pdmadedate"
								value="<%=java.time.LocalDate.now()%>" required readonly>
						</div>

						<br> <br>
						<div class="mb-4"></div>

						<button class="btn btn-primary btn-lg" type="submit"
							style="display: block; margin: 0 auto; width: 100%; font-size: 20px;">상품 
							가입신청</button>
					</form>
					<br> <br> <br> <br> <br> <br> <br>
					<br> <br> <br>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function getpdcodeNumber() {
		var pdcode = "";
		var digits = "0123456789ABCDEF";

		for (var i = 0; i < 8; i++) {
			pdcode += digits.charAt(Math.floor(Math.random() * digits.length));
		}

		document.getElementById("pdcode").value = pdcode;
	}

	function showCompletionMessage() {
		alert("상품 가입이 완료되었습니다!");
	}

	// 폼 제출 시에 계좌 생성 완료 알림창을 띄우도록 설정
	document.querySelector('.validation-form').addEventListener('submit',
			showCompletionMessage);
</script>
</html>


