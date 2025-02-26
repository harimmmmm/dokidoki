<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="co" %> 

<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Google Fonts 로드 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap5.3.3 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- 사용자 스타일 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<title>どきどきkorea</title>
</head>

<body>

	<!-- 헤더 -->
	<nav class="site-nav">
		<div class="container">
			<div class="site-navigation">
				<!-- 로고 -->
				<a href="/doki" class="logo m-0">どきどきkorea<span class="text-primary"></span></a>

				<!-- 네비게이션 메뉴 -->
				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li class="active"><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
					<li><a href="/pakage/packagesList.do">予約</a></li> <!-- ✨ 이 부분을 수정 -->
					<li><a href="/board/services.jsp">旅行先紹介</a></li>

					<co:choose>
						<co:when test="${empty sessionScope.user}">
							<li><a href="/member/login.do">ログイン</a></li>
						</co:when>
						<co:otherwise>
							<li><a href="/member/logout.do">ログアウト</a></li>
							<li><a href="/mypage/home.do">マイページ</a></li>
						</co:otherwise>
					</co:choose>

					<li><a href="/contact.jsp">お問い合わせ</a></li>
				</ul>

				<!-- 모바일 햄버거 메뉴 -->
				<a href="#" class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
					data-toggle="collapse" data-target="#main-navbar"> 
					<span></span>
				</a>
			</div>
		</div>
	</nav>
