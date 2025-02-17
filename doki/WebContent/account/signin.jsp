<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<img src="<%=request.getContextPath()%>/account/img/logo.png" alt="로고">
		</div>
		<div class="login-container">
			<div class="login-form">
				<form action="/login" method="post">
					<div>
						<div class="input-container">
							<input type="email" id="email" name="email" placeholder="아이디 입력"
								required> <input type="password" id="password"
								name="password" placeholder="비밀번호 입력" required>
							<button class="loginsubmitBtn" type="submit">로그인</button>
						</div>
					</div>
					<div class="idpwfind">
						<a href="/login/idfind.do">아이디 찾기</a> <span class="idpwslash">|</span>
						<a href="/login/pwfind.do">비밀번호 찾기</a> <span class="idpwslash">|</span>
						<a href="/login/signup.do">회원가입</a>
					</div>
				</form>
			</div>

			<div class="separator">
				<span>or</span>
			</div>

			<div class="social-login">
				<button class="google">
					<img src="<%=request.getContextPath()%>/account/img/google.png"
						alt="Google"> Google로 로그인
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
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>