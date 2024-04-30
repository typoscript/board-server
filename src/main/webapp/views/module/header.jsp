<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<h1><a href="/">My board</a></h1>
		<c:choose>
			<c:when test="${not empty user}">
				<button onclick="location.href='/LogoutAction'">로그아웃</button>
			</c:when>
			<c:otherwise>
				<button onclick="location.href='/login'">로그인</button>
			</c:otherwise>
		</c:choose>
	</header>
<body>
</html>