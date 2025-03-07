<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="co" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Google Fonts를 빠르게 로드하기 위한 사전 연결 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&family=Source+Serif+Pro:wght@400;700&display=swap"
	rel="stylesheet">

<!-- Bootstrap5.3.3 CSS CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">

<!-- Bootstrap5 CSS: 반응형 디자인 및 기본 UI 스타일 제공 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/bootstrap.min.css">

<!-- Owl Carousel: 이미지 슬라이더 관련 CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/owl.carousel.min.css">
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/owl.theme.default.min.css">

<!-- Fancybox: 이미지 및 모달 팝업 효과를 위한 CSS -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/jquery.fancybox.min.css">

<!-- Icomoon 아이콘 폰트: 커스텀 아이콘 사용 가능 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/fonts/icomoon/style.css">

<!-- Flaticon 아이콘 폰트: 추가적인 아이콘 폰트 사용 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/fonts/flaticon/font/flaticon.css">

<!-- Date Range Picker: 날짜 선택기 UI 관련 스타일 -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/daterangepicker.css">

<!-- AOS (Animate On Scroll): 스크롤할 때 애니메이션 효과를 위한 CSSs -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/aos.css">

<!-- 사이트의 메인 스타일시트 (사용자 정의 CSS) -->
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">

<!-- Swiper CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<!-- Swiper JS -->
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- flatpickr CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

<!-- flatpickr JS -->
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>




<title>どきどきkorea</title>
</head>

<body>

	<!-- 모바일 네비게이션 메뉴 전체를 감싸는 컨테이너 -->
	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close">
				<span class="icofont-close js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>

	<!-- 헤더 -->
	<nav class="site-nav">
		<div class="container">
			<div class="site-navigation">
				<!-- 로고 -->
				<a href="/" class="logo m-0">どきどきkorea<span
					class="text-primary"></span></a>
				<!-- 네비게이션 메뉴 -->
				<ul class="js-clone-nav d-none d-lg-inline-block text-left site-menu float-right">
					<li class="active"><a href="<%= request.getContextPath() %>/index.jsp">Home</a></li>
					<li><a href="/pakage/packagesList.do">予約</a></li>
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

				<!-- 모바일에서 표시되는 햄버거 메뉴 버튼 -->
				<a href="#"
					class="burger ml-auto float-right site-menu-toggle js-menu-toggle d-inline-block d-lg-none light"
					data-toggle="collapse" data-target="#main-navbar"> <span></span>
					<!-- 햄버거 메뉴 아이콘을 위한 span -->
				</a>

			</div>
		</div>
	</nav>