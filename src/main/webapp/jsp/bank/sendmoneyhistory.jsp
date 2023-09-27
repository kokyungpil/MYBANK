<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="bank.BankVO"%>
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
	height: 1500px;
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
	top: 0px;
	left: 25%;
	width: 1000px;
	height: 170px;
	background-color: #ffffff;
	border-radius: 10px;
}

.user-info {
	z-index: 10;
	font-size: 20px;
	font-weight: bold;
}

.text1 {
	font-size: 35px;
	font-weight: bold;
}

.text3 {
	font-size: 20px;
	font-weight: bold;
}
</style>
</head>
<header>
	<%@ include file="/jsp/include/head.jsp"%>
</header>
<body>

	<section>
		<div class="title2">계좌 거래내역</div>
		<a3>
		<div class="user-info">
			<div class="member-container">
				<c:forEach var="bank" items="${historyList}">
					<div class="white-box">
						<p class="text1">[${bank.historyname}]</p>
						<p class="text3">거래 계좌번호:
							${bank.ac_num}&nbsp;&nbsp;&nbsp;&nbsp; 거래 금액 :
							${bank.historymoney}원  &nbsp;&nbsp;&nbsp;&nbsp; 잔액 :</p>
						<p class="text3">거래시간 : ${bank.historytime}</p>
					</div>
				</c:forEach>
			</div>
		</div>
		</a3>
	</section>
</body>
</html>