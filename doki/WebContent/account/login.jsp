<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/account/css/signin.css">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="signin-container">
		<div class="logoimg">
			<img src="<%=request.getContextPath()%>/account/img/logo.png"
				alt="로고">
		</div>
		<div class="login-container">
			<div class="login-form">
				<form action="/member/loginpro.do" method="post">
					<div>
						<div class="input-container">
							<input type="text" id="user_id" name="user_id"
								placeholder="아이디 입력" required> <input type="password"
								id="password" name="user_password" placeholder="비밀번호 입력"
								required>
							<button class="loginsubmitBtn" type="submit">로그인</button>
						</div>
					</div>
				</form>
				<div class="idpwfind">
					<a href="/member/idfind.do">아이디 찾기</a> <span class="idpwslash">|</span>
					<a href="/member/pwfind.do">비밀번호 찾기</a> <span class="idpwslash">|</span>
					<a href="/member/signup.do">회원가입</a>
				</div>
			</div>

			<div class="separator">
				<span>or</span>
			</div>

			<div class="social-login">
				<button class="google" id="google-login-btn">
				    <img src="<%=request.getContextPath()%>/account/img/google.png" alt="Google">
				    Google로 로그인
				</button>
				<button class="line">
					<img src="<%=request.getContextPath()%>/account/img/line.jpeg"
						alt="LINE"> LINE으로 로그인
				</button>
				<!-- <button class="kakao">
					<img src="kakao.png" alt="Kakao"> 카카오로 로그인
				</button> 
				<button class="naver">
					<img src="/sign/img/" alt="LINE"> NAVER으로 로그인
				</button> -->
			</div>
		</div>
	</div>
	<c:if test="${not empty loginError}">
		<script>
			alert("${loginError}");
		</script>
	</c:if>
</body>
<%@ include file="../fragments/footer.jsp"%>
<script src="https://accounts.google.com/gsi/client" async defer></script>
<script src="<%=request.getContextPath()%>/account/js/login.js"></script>
</html>