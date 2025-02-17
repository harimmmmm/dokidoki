<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/sidebar.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<!-- 사이드바 -->
<aside class="sidebar">
	<div class="sidebar-header">
		<h2>&nbsp;&nbsp;마이 페이지</h2>
		<br> <br>
	</div>
	<ul class="menu">
		<li id="home-link"><a href="/mypage/home.do">HOME</a></li>
		<li id="edit-link"><a href="/mypage//editform.do">개인정보수정</a></li>
		<li class="submenu" id="travel-link"><a href="#">내여행</a>
			<ul class="submenu-items">
				<li id="upcoming-link"><a href="/mypage/upcoming.do">예정된 여행</a></li>
				<li id="past-link"><a href="/mypage/past.do">지난 여행</a></li>
				<li id="canceled-link"><a href="/mypage/canceled.do">취소된 여행</a></li>
			</ul></li>
		<li id="interest-link"><a href="/mypage/interest.do">관심내역</a></li>
		<li id="inquiries-link"><a href="/mypage/inquiries.do">문의</a></li>
	</ul>
</aside>

<script src="<%=request.getContextPath()%>/mypagee/js/sidebar.js"></script>