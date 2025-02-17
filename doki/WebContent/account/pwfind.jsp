<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/account/css/find.css">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>

	<div class="signin-container">
		<div class="logoimg">
			<img src="<%=request.getContextPath()%>/account/img/logo.png" alt="로고">
		</div>
		<div class="login-container">
			<div class="find-container">

				<!-- 탭 버튼 -->
				<div class="tab-container">
					<a href="/login/idfind.do" class="tab-btn">아이디 찾기</a> <a
						href="/login/pwfind.do" class="tab-btn"
						style="background: #9dd1ca; margin-left: 10px; color: white;">비밀번호
						찾기</a>
				</div>

				<!-- 비밀번호 찾기 -->
				<div id="find-password" class="tab-content">
					<form id="find-password-form">
						<input type="text" id="ie" placeholder="가입한 아이디 입력" required>
						<input type="email" id="email" placeholder="가입한 이메일 입력" required>
						<button type="submit">비밀번호 찾기</button>
					</form>
					<p id="find-password-result"></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>