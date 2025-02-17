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
					<a href="/login/idfind.do" class="tab-btn"
						style="background: #9dd1ca; margin-right: 10px; color: white;">아이디 찾기</a> <a
						href="/login/pwfind.do" class="tab-btn">비밀번호 찾기</a>
				</div>

				<!-- 아이디 찾기 -->
				<div id="find-id" class="tab-content active">
					<form id="find-id-form">
						<input type="text" id="name" name="name" placeholder="이름 입력"
							required> <input type="text" id="user-info"
							placeholder="이메일 또는 휴대폰 번호 입력" required>
						<button type="submit">아이디 찾기</button>
					</form>

					<p id="find-id-result"></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>