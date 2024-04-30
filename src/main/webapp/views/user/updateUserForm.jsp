<%@page import="boardServer.user.UserResponseDto"%>
<%@page import="boardServer.user.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보 수정</title>
	<jsp:include page="/views/module/header.jsp"></jsp:include>
</head>
<body>
	<%
	if (session.getAttribute("user") == null)
		response.sendRedirect("/login");
	%>
	<% String birth = "";
				String[] birthData = ((UserResponseDto)session.getAttribute("user")).getBirth().split("-");
				
				for (String data : birthData)
					birth += data;
	%>
	<form method="POST" action="/updateUserPro"> 
		<div>
			<input type="text" id="id" name="id" value="${user.id}" disabled >
			<input type="password" id="password" name="password" placeholder="비밀번호" >
			<input type="password" id="newPassword" name="password-new" placeholder="새 비밀번호" >
			<input type="email" id="email" name="email" placeholder="[선택] 이메일주소" value="${empty user.email ? '' : user.email}" >
		</div>
		<div class="error-container">
				<p class="error-msg" id="error-msg-password">* 비밀번호: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-email">* 이메일: 이메일 주소가 정확한지 확인해 주세요.</p>
			</div>
		<div>
			<input type="text" id="name" name="name" placeholder="이름" value="${user.name}" disabled>
			
			<input type="number" id="birthDate" name="birthDate" placeholder="생년월일 8자리" value="<%=birth %>" disabled >
			<select id="telecom" name="telecom" >
				<option selected disabled value="">통신사 선택</option>
				<option value="SKT" ${user.telecom eq "SKT" ? "selected" : ""} >SKT</option>
				<option value="KT" ${user.telecom eq "KT" ? "selected" : ""} >KT</option>
				<option value="LG+" ${user.telecom eq "LG+" ? "selected" : ""} >LG+</option>

				<option value="SKT" ${user.telecom eq "SKT" ? "selected" : ""} >SKT 알뜰폰</option>
				<option value="KT" ${user.telecom eq "KT" ? "selected" : ""} >KT 알뜰폰</option>
				<option value="LG+" ${user.telecom eq "LG+" ? "selected" : ""} >LG+ 알뜰폰</option>
			</select>	
			<div class="choice-container">
				<div>
					<input type="radio" id="male" name="gender" value="M" ${user.gender eq "M" ? "checked" : ""} disabled >
					<input type="radio" id="female" name="gender" value="F" ${user.gender eq "F" ? "checked" : "" } disabled >
					<label id="label-male" for="male">남자</label>
					<label id="label-female" for="female">여자</label>
				</div>
				<div>
					<input type="radio" id="non-foreigner" name="country" value="local" ${user.country eq "local" ? "checked" : "" } disabled >
					<input type="radio" id="foreigner" name="country" value="foreigner" ${user.country eq "foreigner" ? "checked" : "" } disabled >
					<label id="label-non-foreigner" for="non-foreigner">내국인</label>
					<label id="label-foreigner" for="foreigner">외국인</label>
				</div>
			</div>
			<input type="text" id="phone" name="phone" placeholder="휴대전화번호" value="${user.phone}" >
		</div>
		<div class="error-container">
				<p class="error-msg" id="error-msg-name">* 이름: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-birthDate">* 생년월일: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-birthDate-validation">* 생년월일: 8자리 숫자.</p>
				<p class="error-msg" id="error-msg-telecom">* 통신사: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-gender">* 성별: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-country">* 국가: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-phone">* 전화번호: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-phone-validation">* 전화번호: 010-1234-1234.</p>
		</div>
		<div class="agree-container">
			<input type="checkbox" id="agree" name="agree" checked="${user.agree}" >
			<label for="agree" id="label-agree">
					<p><span><b>[필수]</b></span>&nbsp;인증 약관 전체동의</p>
			</label>
		</div>
		<div class="error-container">
			<p class="error-msg" id="error-msg-agree">* 인증: 필수 체크.</p>
		</div>
		<input type="submit" value="회원정보 수정" >
	</form>
</body>
<jsp:include page="/views/module/footer.jsp"></jsp:include>
<script src="/resources/script/validation-join.js"></script>
</html>