<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KKP BANK</title>
<style>
  /* Table Styles */
  table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    background-color: #fff;
  }

  table th,
  table td {
    padding: 12px;
    text-align: left;
  }

  table th {
    background-color: #c0e1f5;;
    color: #000;
    font-weight: bold;
  }

  table tbody tr:nth-child(even) {
    background-color: #f2f2f2;
  }

  /* Form Styles */
  .text-center {
   	font-size: 30px;
    text-align: center;
    margin-bottom: 10px;
  }
  .search-container {
    text-align: right;
    margin-bottom: 10px;
  }

  .form-control {
    width: 300px;
    padding: 8px;
    border: 1px solid #ccc;
    border-radius: 3px;
    font-size: 16px;
  }

  .btn {
    display: inline-block;
    padding: 8px 16px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    font-size: 16px;
  }

  .btn-primary {
    background-color: #007bff;
  }

  .btn-primary:hover {
    background-color: #0056b3;
  }
  
  .btn2 {
    display: inline-block;
    padding: 8px 16px;
    color: #000000;
    border: none;
    border-radius: 3px;
    cursor: pointer;
    font-size: 13px;
  }

  .btn-primary2 {
    background-color: #fdc033;
  }

  .btn-primary2:hover {
    background-color: #0056b3;
  }



  /* Responsive Styles */
  @media screen and (max-width: 768px) {
    .col-md-8 {
      width: 100%;
    }

    .form-control {
      width: 100%;
    }
  }
</style>
</head>
<body>
<header>
  <jsp:include page="/jsp/include/head.jsp"/>
</header>
<section class="container">
  <div class="row justify-content-center">
    <div class="col-md-12">
      <br><br>
      <h1 class="text-center">문의게시판</h1>

      <div class="search-container">
        <br>
        <input type="text" id="search-input" class="form-control" placeholder="제목 검색">
        <button class="btn btn-primary" onclick="searchBooks()">검색</button>
      </div>
      <br>
      <table class="table">
        <thead>
          <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th></th>
            <th>&nbsp;&nbsp;&nbsp;&nbsp;답변 글</th>
          </tr>
        </thead>
        <tbody>
          <c:forEach var="post" items="${boardList}">
            <tr>
              <td>${post.postNo}</td>
<td>
  <a href="${pageContext.request.contextPath}/post.do?postNo=${post.postNo}" style="text-decoration: none;">
    <c:choose>
      <c:when test="${post.writer == '관리자'}">
  [답글] : ${post.title}
</c:when>
      <c:otherwise>
        ${post.title}
      </c:otherwise>
    </c:choose>
  </a>
</td>
              <td>${post.writer}</td>
              <td>${post.regDate}</td>
              <td></td>
              <td><form action="${pageContext.request.contextPath}/posting2.do" method="post" >
        <button type="submit" class="btn2 btn-primary2">답변 글작성</button></td>
            </tr>
          </c:forEach>
        </tbody>
        
      </table>
       
      </form>
    </div>
  </div>
   <a href="${pageContext.request.contextPath}/posting.do"><button type="submit" class="btn btn-primary">글쓰기</button></a>
</section>
</body>
<script>
function searchBooks() {
  var searchInput = document.getElementById("search-input").value;
  var bookList = document.querySelectorAll(".table tbody tr");

  for (var i = 0; i < bookList.length; i++) {
    var bookTitle = bookList[i].querySelector("td:nth-child(2) a").textContent;

    if (bookTitle.includes(searchInput)) {
      bookList[i].style.display = "";
    } else {
      bookList[i].style.display = "none";
    }
  }
}
</script>
</html>
