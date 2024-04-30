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
	String password = request.getParameter("password");
	String newPassword = request.getParameter("password-new");
	String email = request.getParameter("email");
	String telecom = request.getParameter("telecom");
	String phone = request.getParameter("phone");
	
	UserDao userDao = UserDao.getInstance();
	UserResponseDto user = (UserResponseDto)session.getAttribute("user");
	UserRequestDto userDto = new UserRequestDto();
	
	if (userDao.findUserByIdAndPassword(user.getId(), password) == null) {
		System.out.println("no id password");
		response.sendRedirect("/myPage");
		return;
	}
	
	userDto.setId(user.getId());
	userDto.setPassword(password);
	
	userDao.updateUserPassword(userDto, newPassword);

	userDto.setEmail(email);
	userDao.updateUserEmail(userDto);
	
	userDto.setTelecom(telecom);
	userDao.updateUserTelecom(userDto);

	userDto.setPhone(phone);
	userDao.updateUserPhone(userDto);

	response.sendRedirect("/myPage");
%>
</body>
</html>