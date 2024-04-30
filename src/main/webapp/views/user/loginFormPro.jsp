<%@page import="boardServer.user.UserResponseDto"%>
<%@page import="boardServer.user.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<jsp:include page="/views/module/header.jsp"></jsp:include>
<body>
<h1>pro</h1>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");

	boolean isValid = true;
	
	if (id == null || id.isEmpty())
		isValid = false;
	else if (password == null || password.isEmpty())
		isValid = false;	

	if (!isValid) {
		response.sendRedirect("/join");
		return;
	}

	// 연동된 데이터베이스로부터 (DAO)
	// 유저의 정보 확인 (findUserByIdAndPassword)
	// 정보가 일치하면 return된 UserResponseDto가 null이 아니면
	// 로그인 처리 후, 페이지 이동 (jsp 내장객체 중 session에 유저정보 저장)
	
	UserDao userDao = UserDao.getInstance();
	UserResponseDto user = userDao.findUserByIdAndPassword(id, password);
	
	if (user == null) {
		response.sendRedirect("/login");
		return;
	}
	
	session.setAttribute("user", user);
	response.sendRedirect("/myPage");
%>
</body>
	<jsp:include page="/views/module/footer.jsp"></jsp:include>
</html>