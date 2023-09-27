<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 작성</title>
<style>
  /* Global Styles */
  body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f2f2f2;
  }

  /* Form Styles */
  .container {
    max-width: 800px;
    margin: 0 auto;
    padding: 40px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
  }

  .form-title {
    text-align: center;
    margin-bottom: 40px;
    font-size: 36px;
    font-weight: bold;
  }

  .form-label {
  text-align: left;
  font-size: 25px;
  font-weight: bold;
  position: relative;
  left: 0;
}

 .form-control {
  width: 100%;
  padding: 16px;
  border: 1px solid #ccc;
  border-radius: 5px;
  box-sizing: border-box;
  margin-bottom: 20px;
  font-size: 18px;
}

.form-textarea {
  resize: vertical;
}
  .btn {
    display: inline-block;
    padding: 12px 24px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 18px;
  }

  .btn:hover {
    background-color: #0056b3;
  }
</style>
</head>
<body>
  <header>
    <jsp:include page="/jsp/include/head.jsp" />
    <br><br><br>
  </header>
  <section class="d-flex justify-content-center align-items-center" style="height: 100vh;">
    <div class="container">
      <h1 class="form-title">문의사항</h1>
      <br>
      <form action="${pageContext.request.contextPath}/postingprocess.do" method="POST">
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">글 제목</label>
          <br><br>
          <input type="text" class="form-control" id="exampleFormControlInput1" name="title" placeholder="글 제목">
        </div>
        <div class="mb-3">
          <label for="exampleFormControlTextarea1" class="form-label">글 내용</label>
          <br><br>
          <textarea class="form-control form-textarea" id="exampleFormControlTextarea1" name="content" rows="6" placeholder="글 내용을 입력하세요"></textarea>
        </div>
        <button type="submit" class="btn">등록</button>
      </form>
    </div>
  </section>
</body>
</html>
