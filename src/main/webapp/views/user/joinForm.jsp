<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입</title>
	<jsp:include page="/views/module/header.jsp"></jsp:include>
</head>
<body>
	<form method="POST" action="/joinPro"> 
		<div>
			<input type="text" id="id" name="id" placeholder="아이디" >
			<input type="password" id="password" name="password" placeholder="비밀번호" >
			<input type="email" id="email" name="email" placeholder="[선택] 이메일주소" >
		</div>
		<div class="error-container">
				<p class="error-msg" id="error-msg-id">* 아이디: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-password">* 비밀번호: 필수 정보입니다.</p>
				<p class="error-msg" id="error-msg-email">* 이메일: 이메일 주소가 정확한지 확인해 주세요.</p>
			</div>
		<div>
			<input type="text" id="name" name="name" placeholder="이름" >
			<input type="number" id="birthDate" name="birthDate" placeholder="생년월일 8자리" >
			<select id="telecom" name="telecom" >
				<option selected disabled value="">통신사 선택</option>
				<option value="SKT">SKT</option>
				<option value="KT">KT</option>
				<option value="LG+">LG+</option>
				<option value="SKT">SKT 알뜰폰</option>
				<option value="KT">KT 알뜰폰</option>
				<option value="LG+">LG+ 알뜰폰</option>
			</select>	
			<div class="choice-container">
				<div>
					<input type="radio" id="male" name="gender" value="M" >
					<input type="radio" id="female" name="gender" value="F" >
					<label id="label-male" for="male">남자</label>
					<label id="label-female" for="female">여자</label>
				</div>
				<div>
					<input type="radio" id="non-foreigner" name="country" value="local" >
					<input type="radio" id="foreigner" name="country" value="foreigner" >
					<label id="label-non-foreigner" for="non-foreigner">내국인</label>
					<label id="label-foreigner" for="foreigner">외국인</label>
				</div>
			</div>
			<input type="text" id="phone" name="phone" placeholder="휴대전화번호" >
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
			<input type="checkbox" id="agree" name="agree" >
			<label for="agree" id="label-agree">
					<p><span><b>[필수]</b></span>&nbsp;인증 약관 전체동의</p>
			</label>
		</div>
		<div class="error-container">
			<p class="error-msg" id="error-msg-agree">* 인증: 필수 체크.</p>
		</div>
		<input type="submit" value="인증요청" >
	</form>
</body>
<jsp:include page="/views/module/footer.jsp"></jsp:include>
<script src="/resources/script/validation-join.js"></script>
</html>