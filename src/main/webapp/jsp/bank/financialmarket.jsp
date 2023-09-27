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
	border-radius: 10px;
}

.buttonE {
	position: relative;
	top: 50px;
	left : 45%;
	padding: 20px 300px;
	background-color: #003bff;
	font-size: 23px;
	font-weight: bold;
	color: #FFFFFF;
	text-decoration: none;
	border-radius: 3px;
	margin-right :20px;
}

.text11{
font-size: 30px;
	font-weight: bold;
	color: #000000;

}

.bank-select {
	position: relative;
	top: 110px;
	left: -80px;
	width: 400px;
	height: 50px;
	border: 1px solid  #9c9a9a;
	border-radius: 3px;
	font-size: 20px;
}

.product-list {
	position: relative;
	top: 100px;
	left: 50px;
	width: 1300px;
}

.product-item {
	position: relative;
	left :20%;
	margin-bottom: 20px;
	padding: 10px;
	background-color: #f5f5f5;
	border-radius: 5px;
	font-size: 20px;
}

.product-item a {
	text-decoration: none;
	color: #000000;
}

</style>
</head>
<header>
	<%@ include file="/jsp/include/head.jsp"%>
</header>
<body>

	<section>
		<div class="title2">금융 적금 상품</div>
			
		</div>
	</section>

	<div class="product-list">
		<div class="product-item">
			<a href="#" class="text11">데일리 워킹 적금 </a> <br>
			<br>
			<div> 하루하루 돈을 모으는 적금 상품입니다.</div>
			<div> 첫거래 고객을 우대하는 비대면 전용 고금리 예금 </div>
			<br><br>
			<div> 최고 연 3.80% 기본 2.80% </div>
		</div>
		<div class="product-item">
			<a href="#" class="text11">중년도약적금 </a> <br>
			<br>
			<div> 예금이자를 최대한으로 활용하는 중년용 적금 상품입니다</div>
			<div> 중년고객을 우대하는 비대면 전용 고금리 예금 </div>
			<br><br>
			<div> 최고 연 5.00% 기본 4.80% </div>
		</div>
		<div class="product-item">
			<a href="#" class="text11">우리 사장님 활짝 적금</a> <br>
			<br>
			<div> 사장님 활짝 적금 상품입니다.</div>
			<div> 자영업 하는 고객을 우대하는 비대면 전용 고금리 예금 </div>
			<br><br>
			<div> 최고 연 3.50% 기본 3.00% </div>
		</div>
		<div class="product-item">
			<a href="#" class="text11">장병내일준비 적금</a> <br>
			<br>
			<div>  장병내일준비 적금 상품입니다</div>
			<div> 국군 장병 고객을 우대하는 비대면 전용 고금리 예금 </div>
			<br><br>
			<div> 최고 연 5.00% 기본 3.50% </div>
		</div>
		
		<a href="${pageContext.request.contextPath}/getac2.do" class="buttonE">상품 가입신청</a>
	<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
</body>
</html>

