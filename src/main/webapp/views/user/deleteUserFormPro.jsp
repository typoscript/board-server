<%@page import="boardServer.user.UserRequestDto"%>
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
<body>
<%
request.setCharacterEncoding("UTF-8");
UserDao userDao = UserDao.getInstance();
UserResponseDto user = (UserResponseDto) session.getAttribute("user");

String id = user.getId();
String password = "22222";
//request.getParameter("password");

UserRequestDto userDto = new UserRequestDto();

userDto.setId(id);
userDto.setPassword(password);

boolean result = userDao.deleteUser(userDto);

System.out.println("result: " + result);

if (result) {
	response.sendRedirect("/login");
	return;
}
response.sendRedirect("/myPage");

%>
</body>
</html>