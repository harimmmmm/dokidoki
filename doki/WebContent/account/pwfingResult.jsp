<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/account/css/find.css">
<style type="text/css">
.result-container {
	margin: 17px 0;
	font-size: 20px;
	border: 1px solid lightgray;
	padding: 20px;
}

.idresult {
	background: lightgray;
	margin-bottom: 10px;
}

.signin-container {
	height: 620px;
}

.loginBtn {
	width: 100%;
	padding: 10px;
	background: #486988;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s;
	font-size: 18px;
}

button:hover {
	background: #374d61;
}
</style>
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>

	<div class="signin-container">
		<div class="logoimg">
			<img src="<%=request.getContextPath()%>/account/img/logo.png"
				alt="로고">
		</div>
		<div class="login-container">
			<div class="find-container">

				<!-- 탭 버튼 -->
				<div class="tab-container">
					<a href="/member/idfind.do" class="tab-btn"
						style="background: #486988; margin-right: 10px; color: white;">아이디
						찾기</a> <a href="/member/pwfind.do" class="tab-btn">비밀번호 찾기</a>
				</div>

				<c:choose>
					<c:when test="${not empty userId}">
						<div class="result-container">
							<p class="desc">お客様のIDは以下の通りです。</p>
							<span class="idresult">${userId.user_id}</span>
							<p class="info">いつも当サイトをご利用いただき、誠にありがとうございます。</p>
						</div>
					</c:when>
					<c:otherwise>
						<script type="text/javascript">
							alert("입력하신 정보에 해당하는 아이디가 없습니다.");
							window.location.href = "/member/idfind.do";
						</script>
					</c:otherwise>
				</c:choose>

				<a href="/member/login.do" class="loginBtn">로그인 하러가기</a>
			</div>
		</div>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>