<%@page import="user.MemberVO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	/*
		작업순서
		1. 파라미터 추출(아이디, 패스워드)
		2. 추출된 파라미터를 가진 회원 검색
		3. 검색결과에 따른 화면 구성
	*/
	
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "hr";
	String pass = "hr";
	
	StringBuilder sql = new StringBuilder();
	sql.append("select * ");
	sql.append("  from user_info ");
	sql.append(" where user_id = ? and password = ? ");
	
	try(
		Connection conn = DriverManager.getConnection(url, user, pass);
		PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	) {
		
		pstmt.setString(1, id);
		pstmt.setString(2, pw);
		
		ResultSet rs = pstmt.executeQuery();
		
		String msg = "";
		String locUrl = "";
		if(rs.next()) {
			
			MemberVO loginUser = new MemberVO();
			loginUser.setId(rs.getString("user_id"));
			loginUser.setPw(rs.getString("password"));
			loginUser.setName(rs.getString("name"));
			loginUser.setBirth(rs.getString("birth"));
			loginUser.setEmail(rs.getString("email"));
			loginUser.setPhone(rs.getString("phone_number"));
			loginUser.setAddress(rs.getString("addr"));
			
			msg = loginUser.getName() + "님 환영합니다";
			locUrl = "main.jsp";
			
			session.setAttribute("loginUser", loginUser);
			
			
		} else {
			msg = "입력하신 ID 또는 패스워드가 잘못되었습니다";
			locUrl = "login.jsp";
		}
		
		pageContext.setAttribute("msg", msg);
		pageContext.setAttribute("url", locUrl);
		
		
	} catch(Exception e) {
	    e.printStackTrace();
	}
	%>
	

<script>
	alert('${ msg }')
	location.href = '${ url }'
</script>








