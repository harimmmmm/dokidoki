<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/account/css/find.css">
</head>
<style>
.signin-container {
	height: 650px;
}
</style>
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
					<a href="/member/idfind.do" class="tab-btn">ID検索</a> <a
						href="/member/pwfind.do" class="tab-btn"
						style="background: #486988; margin-left: 10px; color: white;">パスワード検索</a>
				</div>

				<!-- 비밀번호 찾기 -->
				<div id="find-password" class="tab-content">
					<p class="pwmsg">* セキュリティのため、新しいランダムパスワードを発行します。 <br> * パスワードでログインした後、必ずパスワードを変更してください。  </p>
					<form id="find-password-form" action="/member/pwfindpro.do" method="post">
						<input type="text" id="user_id" name="user_id" placeholder="ID入力" required>
						<input type="text" id="name_kanji" name="name_kanji" placeholder="名前(漢字)入力" required>
						<input type="email" id="email" name="email" placeholder="Eメール入力" required>
						<button type="submit">パスワード検索</button>
					</form>
					<p id="find-password-result"></p>
				</div>
			</div>
		</div>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>