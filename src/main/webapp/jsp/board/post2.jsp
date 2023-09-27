<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KKP BANK</title>
<style>
/* Global Styles */
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	background-color: #f2f2f2;
}

.container {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: flex-start;
}

/* Card Styles */
.card {
	max-width: 1000px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #fff;
	margin: 20px;
	padding: 40px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.card-title {
	margin: 0;
	font-size: 36px;
	font-weight: bold;
	text-align: center;
}

hr {
	margin: 20px 0;
	border: none;
	border-top: 1px solid #ccc;
}

.card-text {
	margin-top: 20px;
	font-size: 24px;
}

.post-info {
	font-size: 18px;
	color: #888;
	margin: 0;
}

.content-area {
	margin-top: 20px;
	font-size: 24px;
}

/* Responsive Styles */
@media screen and (max-width: 768px) {
	.card {
		max-width: 100%;
		padding: 20px;
	}
	.card-title {
		font-size: 24px;
	}
	.card-text, .post-info, .content-area {
		font-size: 16px;
	}
}

.backbutton {
    position: absolute;
    top: 250px;
    right: 200px;
    display: inline-block;
    padding: 10px 20px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 15px;
  }

  .backbutton:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/head.jsp" />
		<br><br><br>
	</header>

	<section class="container">

		<div class="row justify-content-center">
			<div class="col-md-8">
				<div class="card">
					<h3 class="card-title">문의글 제목 :
						${post.title}</h3>
					<hr>
					<!-- 날짜와 콘텐츠 구분선 -->
					<div class="card-text">
						<p class="post-info">작성자 :
							${post.writer}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 작성일자 ${post.regDate}</p>
						<br>
						<br>
						<div class="content-area">

							<p>${post.content}</p>
						</div>
					</div>
				</div>
			</div>
		</div>
		<a href="${pageContext.request.contextPath}/postingprocess.do">
			<button class="backbutton">뒤로가기</button>
		</a>
	</section>

</body>
</html>
