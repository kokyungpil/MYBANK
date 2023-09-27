<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="bank.BankDAO"%>
<%@ page import="bank.BankVO"%>
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
	top: 80px;
	left: 100px;
	width: 90%;
	height: 700px;
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

.text_ac {
	position: relative;
	top: 25px;
	left: -25px;
	width: 300px;
	height: 100px;
	font-size: 35px;
	font-weight: bold;
	color: #000000;
}

.white-box {
	position: relative;
	top: 180px;
	left: -150px;
	width: 500px;
	height: 300px;
	flex: 1;
	margin: 30px;
	background-color: #ffffff;
	padding: 20px;
	border-radius: 10px;
}

.buttonH {
	position: relative;
	left : 0px;
	top: 40px;
	width: 50px;
	height: 50px;
	padding: 10px 15px;
	background-color: #ffffff;
	font-size: 16.5px;
	font-weight: bold;
	color: #000000;
	text-decoration: none;
	border: 2px solid black;
	border-radius: 3px;
}

.buttoncopy {
	position: relative;
	top: -160px;
	left: 160px;
	width: 50px;
	height: 30px;
	background-color: #ffffff;
	font-size: 15px;
	font-weight: bold;
	color: #000000;
	text-decoration: none;
	border: 2px solid black;
	border-radius: 5px;
}

.text1 {
	postion: relative;
	top: 50px;
	margin-top: 20px;
	font-size: 25px;
	font-weight: bold;
	color: #000000;
}

.text2 {
	postion: relative;
	margin-top: 40px;
	font-size: 19px;
	font-weight: bold;
	color: #000000;
}

.text3 {
	postion: relative;
	margin-top: 40px;
	font-size: 25px;
	font-weight: bold;
	color: #000000;
}
</style>
</head>
<header>
	<%@ include file="/jsp/include/head.jsp"%>
</header>
<body>
<section>
    <div class="title2">나의 계좌</div>
    <a3>
        <div class="text_ac">KKP 은행</div>

        <c:forEach var="bank" items="${bankList}">
            <div class="white-box">
                <p class="text1">${bank.ac_name}</p>
                <p class="text2">계좌번호 <span class="account-number">${bank.ac_num}</span></p>
                <p class="text3">잔액: ${bank.money} 원</p>
                <a href="${pageContext.request.contextPath}/gethistory.do?ac_num=${bank.ac_num}" class="buttonH">거래내역</a>
                <a href="${pageContext.request.contextPath}/jsp/bank/sendmoney2.jsp?ac_num=${bank.ac_num}" class="buttonH">송금하기</a>
            </div>
        </c:forEach>
    </a3>
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
    function copyAccountNumber(accountNumber) {
        
        // 첫 번째 계좌번호 입력칸에 복사한 계좌번호 설정
        var firstAccountNumberInput = document.getElementById("ac_num_1");
        firstAccountNumberInput.value = accountNumber;
    }
</script>
</html>