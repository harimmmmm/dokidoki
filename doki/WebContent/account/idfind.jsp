<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID検索</title>
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
					<a href="/member/idfind.do" class="tab-btn"
						style="background: #486988; margin-right: 10px; color: white;">ID検索</a> <a
						href="/member/pwfind.do" class="tab-btn">パスワード検索</a>
				</div>

				<!-- 아이디 찾기 -->
				<div id="find-id" class="tab-content active">
					<form id="find-id-form" action="/member/idfindpro.do" method="post">
						<input type="text" id="name" name="name" placeholder="名前入力" required> 
						<input type="text" id="user-info" name="email" placeholder="Eメール入力" required>
						<button type="submit">ID検索</button>
					</form>

					<p id="find-id-result"></p>
				</div>
				
			</div>
		</div>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>