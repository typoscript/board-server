<%@page import="boardServer.user.UserResponseDto"%>
<%@page import="boardServer.user.UserDao"%>
<%@page import="boardServer.user.UserRequestDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 완료</title>
	<jsp:include page="/views/module/header.jsp"></jsp:include>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String email = request.getParameter("email");

	String name = request.getParameter("name");
	String birthDate = request.getParameter("birthDate");
	String gender = request.getParameter("gender");
	String country = request.getParameter("country");

	String telecom = request.getParameter("telecom");
	String phone = request.getParameter("phone");
	String agree = request.getParameter("agree");
	
	boolean isValid = true;
	
	if (id == null || id.isEmpty())
		isValid = false;
	else if (password == null || password.isEmpty())
		isValid = false;	
	else if (name == null || name.isEmpty())
		isValid = false;	
	else if (birthDate == null || birthDate.isEmpty())
		isValid = false;	
	else if (gender == null || gender.isEmpty())
		isValid = false;	
	else if (country == null || country.isEmpty())
		isValid = false;	
	else if (telecom == null || telecom.isEmpty())
		isValid = false;	
	else if (phone == null || phone.isEmpty())
		isValid = false;	
	else if (agree == null) {
		isValid = false;
	}
	
	/*
		JSP Basic Tag
		1. <%  % > Scriptlet		- 자바 코드
		2. <%=  % > Expression		- 화면에 출력할 자바 코드
		3. <% @  % > Directive		- 
		4. <%-- --% >				- 주석
	*/ 
	
	// Processing Page 에서는 사용자에게 보여주는 화면을 작성하지 않음 
	// 요청에 대한 응답 처리를 작성 
	// 1) 페이지 이동 처리 (흐름을 제어)
	// 데이터베이스에서 유저 정보와 입력된 유저 정보 비교
	// 중복 유효 검사
	// 가입 처리 후, 페이지 이동

	// DAO (Data Access Object)
	// ㄴ 데이터베이스 접근 돕는 객체
	// ㄴ CRUD 메소드로 데이터 조작하기

	// DTO (Data Transfer Object)
	// ㄴ 데이터 요청/수신용 객체
	// ㄴ Request DTO - 유저가 입력한 데이터 모음 객체 (신뢰하지 않음)
	// ㄴ Response DTO - 선별된 VO 객체를 clone()한 객체

	// VO (Value Object)
	// ㄴ 데이터 조회 객체 (Getter만 가능)
	
	// SQL
	// ㄴ DML -> SELECT, INSERT, UPDATE, DELETE (CRUD)
	
	// createUser
	// getUser
	// updateUser
	// deleteUser

	if (isValid) {
		UserRequestDto userDto = new UserRequestDto(id, password, email, name, birthDate, gender, country, telecom, phone, agree);
		
		UserDao userDao = UserDao.getInstance();
		UserResponseDto user = userDao.createUser(userDto);
		
		if (user == null) {
			response.sendRedirect("/join");
			return;
		}

		response.sendRedirect("/login");
	}
	else
		response.sendRedirect("/join");
%>
</body>
<jsp:include page="/views/module/footer.jsp"></jsp:include>
</html>