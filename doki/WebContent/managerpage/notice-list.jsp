<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/fragments/header.jsp"%>
<!DOCTYPE html>
<meta charset="UTF-8">
<title>Notice_List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/js/jquery-3.4.1.min.js"></script>
<%-- JSTL 태그 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	.vertical-menu a { color: black; display: block; padding: 12px; text-decoration: none; }
    .center { width: 100%; table-layout: auto; border-collapse: collapse; }
    .center th { background-color: #eeeeee; }
    .center th, .center td { padding: 10px; text-align: center; border: 1px solid #ccc; vertical-align: middle; }
    .center tr > *:first-child { border-left: none; }
    .center tr > *:last-child { border-right: none; }
</style>

	<!-- 본문 콘텐츠 -->
	<div class="container">
		<div class="row" style="margin-top: 100px;">
			<!-- 사이드바 영역 -->
			<div class="col-md-3">
				<%@ include file="side.jsp"%>
			</div>
			<!-- 메인 콘텐츠 영역 -->
			<div class="col-md-9">
				<b>공지 관리</b>
				<table class="center">
					<tr>
						<th>게시판 번호</th>
						<th>유저 번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>게시판 카테고리</th>
						<th>작성날짜</th>
						<th>관리</th>
					</tr>
					<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
					<p>리스트 크기: ${fn:length(list)}</p>
					<c:forEach var="item" items="${list}">
						<!-- 각 item에 대한 출력 -->
						<tr>
							<td>${item.bno}</td>
							<td>${item.account_id}</td>
							<td>${item.title}</td>
							<td>${item.content}</td>
							<td>${item.category}</td>
							<td>${item.created_date}</td>
							<td>
								<button class="updateBtn" data-nno="${item.bno}">수정</button>
								<button class="deleteBtn" data-nno="${item.bno}">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".deleteBtn").click(function() {
				var nno = $(this).data("nno");
				var $this = $(this);
				$.ajax({
					url : "", // 실제 삭제 처리 URL 작성
					type : "post",
					data : {
						nno : nno
					},
					success : function(response) {
						if (response.trim() === "success") {
							$this.closest("tr").remove();
						} else {
							alert("삭제 실패");
						}
					}
				});
			});
		});
	</script>
	<%@ include file="/fragments/footer.jsp"%>