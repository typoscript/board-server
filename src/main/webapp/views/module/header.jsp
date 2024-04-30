<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/style/form.css">
<link rel="stylesheet" href="/resources/style/grid.css">
</head>
<body>
	<header>
		<h1>Naver</h1>
		<%
			if (session.getAttribute("user") == null) {
		%>
				<button onclick="location.href='/login'">로그인</button>
		<% } else { %>
				<button onclick="location.href='/logoutPro'">로그아웃</button>
		<% } %>
		%>
	</header>
<body>
</html>