<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/MyBanking/jsp/css/css.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
a3 {
	position: relative;
	display: flex;
	top: 100px;
	left: 200px;
	width: 80%;
	height: 550px;
	background-color: #c0e1f5;
}

.title2 {
	position: relative;
	top: 50px;
	left: 0px;
	width: 300px;
	font-size: 40px;
	font-weight: bold;
	color: #000000;
}

.white-box {
	position: relative;
	top: 50px;
	left: 50px;
	width: 1375px;
	height: 450px;
	background-color: #ffffff;
	s border-radius: 10px;
}

.buttonE {
	position: relative;
	top: 35px;
	width: 400px;
	height: 70px;
	padding: 16px 80px;
	background-color: #807d7d;
	font-size: 23px;
	font-weight: bold;
	color: #ffffff;
	text-decoration: none;
	border-radius: 3px;
}

.bank-select {
	position: relative;
	top: 100px;
	left: 0px;
	width: 200px;
	height: 50px;
	border: 1px solid #9c9a9a;
	border-radius: 3px;
	font-size: 20px;
}

.search-container {
	position: relative;
	top: 30px;
	left: 400px;
	display: flex;
	align-items: center;
	margin-bottom: 30px;
}

.search-container label {
	margin-right: 10px;
	font-size: 20px;
	font-weight: bold;
}

.search-container input[type="text"] {
	padding: 10px;
	width: 400px;
	height: 50px;
	border: 2px solid #black;
	border-radius: 3px;
	font-size: 20px;
}
</style>
</head>
<header>
	<%@ include file="/jsp/include/head.jsp"%>
</header>
<body>

	<section>
		<div class="title2">송금하기</div>

		<form class="validation-form" method="post"
			action="${pageContext.request.contextPath}/sendmoney2.do">
			<a3>
			<div class="white-box">
				<div class="search-container">
					<label for="account-number">나의 계좌번호 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input type="text" id="ac_num1"
						name="ac_num1" value="${param.ac_num}" readonly>
				</div>
				
				<div class="search-container">
					<label for="account-number">받는 계좌번호 :
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
						 <input type="text" id="ac_num2"
						name="ac_num2" placeholder="계좌번호를 입력하세요" value="" required>
				</div>
				
				<div class="search-container">
					<label for="money">송금할 금액
						:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label> <input
						type="text" id="money" name="money" placeholder="금액을 입력하세요"
						value="" required>
				</div>
				
				<div class="search-container">
					<label for="ac_pw">비밀번호
						:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
					<input type="text" id="ac_pw" name="ac_pw" placeholder="비밀번호 4자리"
						pattern="\d{4}" maxlength="4" value="" required>
				</div>
				<button class="buttonE" type="submit">송금</button>
			</div>
			</a3>
		</form>
	</section>

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
	function showCompletionMessage() {
		alert("송금이 완료되었습니다!");
	}

	// 폼 제출 시에 계좌 생성 완료 알림창을 띄우도록 설정
	document.querySelector('.validation-form').addEventListener('submit',
			showCompletionMessage);
	
</script>
</html>

