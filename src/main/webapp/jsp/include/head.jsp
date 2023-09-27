<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/MyBanking/jsp/css/css.css">

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<style>
.menuline {
	position: relative;
	background-color: #c0e1f5; /* 검은색 */
	width: 100%; /* 너비 조절 */
	height: 30px; /* 높이 조절 */
	top: 50px; /* 필요에 따라 조절 */
	z-index: 6;
}
</style>

<body>
	<section>

		<div class="menu">
			<c:choose>
				<c:when test="${empty loginUser}">
					<a href="${pageContext.request.contextPath}/main.do"
						class="menu-link2">KKP BANK </a>
				</c:when>
				<c:otherwise>

					<a href="${pageContext.request.contextPath}/main.do"
						class="menu-link2">KKP BANK </a>
					<a href="${pageContext.request.contextPath}/jsp/bank/madeaccount.jsp"
						class="menu-link">계좌생성</a>
					<a href="${pageContext.request.contextPath}/getlogin.do"
						class="menu-link">마이페이지</a>
					<a href="${pageContext.request.contextPath}/getac.do"
						class="menu-link">나의계좌</a>
					<a href="${pageContext.request.contextPath}/getpd.do"
						class="menu-link">나의상품</a>
					<a href="${pageContext.request.contextPath}/jsp/bank/sendmoney.jsp"
						class="menu-link">돈주는기계</a>
					<a
						href="${pageContext.request.contextPath}/jsp/bank/financialmarket.jsp"
						class="menu-link">금융상품</a>
					<a href="${pageContext.request.contextPath}/boardlist.do" class="menu-link">문의내역</a>

				</c:otherwise>


			</c:choose>



			<div class="menu-links-right">
				<c:choose>
					<c:when test="${empty loginUser}">
						<a href="${pageContext.request.contextPath}/jsp/login/login.jsp"
							class="menu-link3">로그인</a>
					</c:when>
					<c:otherwise>
					<a href="${pageContext.request.contextPath}/getlogin.do" class="menu4"> [ ${loginUser.name}님 ] </a>
						<a href="${pageContext.request.contextPath}/logout.do" class="menu-link3"> 로그아웃 </a>
					</c:otherwise>
				</c:choose>

			</div>
		</div>
		<div class="menuline"></div>
	</section>
</body>
</html>
<% String message = (String) request.getAttribute("message"); %>
<% if (message != null && !message.isEmpty()) { %>
    <script>
        alert('<%= message %>');
    </script>
<% } %>