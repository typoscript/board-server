<%@page import="boardServer.user.UserResponseDto"%>
<%@page import="java.util.List"%>
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
	<section id="root">
	<%
	// jSP 내장 객체의 유효기간 (Scope)
	pageContext.setAttribute("test", "page data");
	request.setAttribute("test", "request data");
	session.setAttribute("test", "session data");
	application.setAttribute("test", "application data");

	// 페이지 이동 처리 1
	// ㄴ 단순 페이지 이동 (URL 주소 변경)
	//response.sendRedirect("test1.jsp");
	
	// 페이지 이동 처리 2
	// request, response 객체를 전달하면서 페이지 이동 (URL 변경 없음)
	request.getRequestDispatcher("test1.jsp").forward(request, response);
	//System.out.println(result.size());
	%>
	</section>
</body>
</html>