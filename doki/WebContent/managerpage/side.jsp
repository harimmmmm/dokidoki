<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<b>管理者ページ</b>

<div class="vertical-menu" style="height: 500px;">

  <!-- Product -->
  <div class="has-submenu">
    <a href="/managerpage/user.jsp">使用者</a> <!-- 유저 -->
    <a href="/managerpage/product-list.jsp">商品</a> <!-- 상품 -->
    <div class="vertical-submenu">
      <a href="/managerpage/product-list.jsp">商品管理</a> <!-- 상품 목록 -->
      <a href="/managerpage/product-add.jsp">商品登録</a> <!-- 상품 등록 -->
    </div>
  </div>

  <a href="/managerpage/reservation.jsp">予約管理</a> <!-- 예약 관리 -->
  <a href="/managerpage/payment.jsp">決済管理</a> <!-- 결제 관리 -->

  <!-- Notice (수정된 부분) -->
  <div class="has-submenu">
    <a href="/managerpage/notice-list.jsp">空地</a> <!-- 공지 -->
    <div class="vertical-submenu">
      <a href="/managerpage/notice-list.jsp">空地管理</a> <!-- 공지 목록 -->
      <a href="/managerpage/notice-add.jsp">空地登録</a> <!-- 공지 등록 -->
    </div>
  </div>
</div>


<script>
	document.addEventListener("DOMContentLoaded", function() {
		var currentPath = window.location.pathname;
		var links = document.querySelectorAll('.vertical-menu a');
		links.forEach(function(link) {
			if (link.getAttribute('href') === currentPath) {
				link.classList.add('active');
			}
		});
	});
</script>
