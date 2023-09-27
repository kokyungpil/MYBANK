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
	background-color: #ffffff;s
	border-radius: 10px;
}

.buttonE {
	position: relative;
	top: 150px;
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


.search-container {
	position: relative;
	top: 100px;
	left: 400px;
	display: flex;
	align-items: center;
	margin-bottom : 30px;
}

.search-container label {
	margin-right: 10px;
	font-size: 20px;
	font-weight : bold;
}

.search-container input[type="text"] {
	padding: 10px;
	width: 400px;
	height: 50px;
	border: 2px solid  #black;
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
	
    <div class="title2">적금 넣기</div>
    
    <form class="validation-form" method="post" action="${pageContext.request.contextPath}/sendproduct.do">
    
        <a3>
            <div class="white-box">
                <div class="search-container">
                    <label for="accountnumber">연결된 계좌번호 : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <input type="text" id="acnum" name="acnum"  value="${param.acnum}" readonly>
                </div>
                <div class="search-container">
                    <label for="money">입금할 금액 :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <input type="text" id="acmoney" name="acmoney" placeholder="금액을 입력하세요" value="" required>
                </div>
                <button class="buttonE" type="submit">입금하기</button>
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
	alert("입금이 완료되었습니다!");
}

// 폼 제출 시에 계좌 생성 완료 알림창을 띄우도록 설정
document.querySelector('.validation-form').addEventListener('submit',
		showCompletionMessage);
</script> 
</html>

