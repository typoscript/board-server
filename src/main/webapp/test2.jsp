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
String pageData = (String) pageContext.getAttribute("test");
String requestData = (String) request.getAttribute("test");
String sessionData = (String) session.getAttribute("test");
String applicationData = (String) application.getAttribute("test");

out.print(String.format("<p>page: %s</p>", pageData));
out.print(String.format("<p>request: %s</p>", requestData));
out.print(String.format("<p>session: %s</p>", sessionData));
out.print(String.format("<p>application: %s</p>", applicationData));
%>
</body>
</html>