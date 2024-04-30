<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/views/module/header.jsp"></jsp:include>
</head>
<body>
	<section id="root">
		<h1>${user.getName()} 환영합니다</h1>
		
		<button onclick="location.href='/updateUser'">회원정보 수정</button>
		<button onclick="location.href='/deleteUser'">회원탈퇴</button>
	</section>
</body>
<jsp:include page="/views/module/footer.jsp"></jsp:include>
</html>