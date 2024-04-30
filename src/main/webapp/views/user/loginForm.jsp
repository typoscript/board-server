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
		<h2>로그인</h2>
		<form method="POST" action="/loginPro">
			<div>
				<input type="text" id="id" name="id" placeholder="아이디">
				<input type="password" id="password" name="password" placeholder="비밀번호">
			</div>
			<div>
				<p class="error-msg" id="error-msg-id">* 아이디: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-password">* 비밀번호: 필수 정보입니다.</p>
			</div>
			<input type="submit" value="로그인">
		</form>
	</section>
</body>
<jsp:include page="/views/module/footer.jsp"></jsp:include>
<script src="/resources/script/validation-login.js"></script>
</html>