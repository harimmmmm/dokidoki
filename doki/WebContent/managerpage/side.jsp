<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<b>관리자페이지</b>
<div class="vertical-menu">

  <!-- Product -->
  <div class="has-submenu">
    <a href="/managerpage/user.jsp">User</a>
    <a href="/managerpage/product-list.jsp">Product</a>
    <div class="vertical-submenu">
      <a href="/managerpage/product-list.jsp">Product List</a>
      <a href="/managerpage/product-add.jsp">Product Add</a>
    </div>
  </div>

  <a href="/managerpage/reservation.jsp">Reservation</a>
  <a href="/managerpage/payment.jsp">Payment</a>

  <!-- Notice (수정된 부분) -->
  <div class="has-submenu">
    <a href="/managerpage/notice-list.jsp">Notice</a>
    <div class="vertical-submenu">
      <a href="/managerpage/notice-list.jsp">Notice List</a>
      <a href="/managerpage/notice-add.jsp">Notice Add</a>
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
