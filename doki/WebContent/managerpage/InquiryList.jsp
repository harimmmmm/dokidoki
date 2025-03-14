<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>

<meta charset="UTF-8">
<title>Notice_List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/inquiries.css">
<script src="/js/jquery-3.4.1.min.js"></script>

<%-- JSTL 태그 선언 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.vertical-menu a {
	color: black;
	display: block;
	padding: 12px;
	text-decoration: none;
}

.center {
	width: 100%;
	table-layout: auto;
	border-collapse: collapse;
}

.center th {
	background-color: #eeeeee;
}

.center th, .center td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
	vertical-align: middle;
}

.center tr>*:first-child {
	border-left: none;
}

.center tr>*:last-child {
	border-right: none;
}
.rmodal-content {
	top: -100px;
}
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
			<b>空地管理</b>
			<!-- 공지 관리 -->
			<table class="center">
				<tr>

					<th>掲示板番号</th>
					<!-- 게시판 번호 -->
					<th>ユーザー番号</th>
					<!-- 사용자 번호 -->
					<th>題目.</th>
					<!-- 문의제목 -->
					<th>內容</th>
					<!-- 문의내용 -->
					<th>問い合わせの日付</th>
					<!-- 문의 날짜-->
					<th>状態</th>
					<!-- 상태-->
					<th>答弁</th>
					<!-- 작성날짜 -->

				</tr>

				<c:forEach var="item" items="${boardList}">
					<tr>
						<td>${item.bno}</td>
						<td>${item.account_id}</td>
						<td>${item.title}</td>
						<td>${item.content}</td>
						<td>${item.created_date}</td>
						<td>
							<c:choose>
								<c:when test="${not empty item.comments}">
									<p style="margin: auto 0; color: green;">回答完了</p>
								</c:when>
								<c:otherwise>
									<p style="margin: auto 0; color: red;">回答待ち</p>
								</c:otherwise>
							</c:choose>
						</td>
						<td><c:choose>
								<c:when test="${not empty item.comments}">
									<p style="margin: auto 0;">回答完了</p>
								</c:when>
								<c:otherwise>
									<button style="margin: 0; float: none;" class="inquire-btn"
										id="open-inquiry-modal" data-bno="${item.bno}">回答する</button>
								</c:otherwise>
							</c:choose>
						</td>
					</tr>

					<!-- 문의하기 모달 -->
					<div id="inquiry-modal" class="modal">
						<div class="rmodal-content">
							<span class="rclose-btn" id="close-inquiry-modal">&times;</span>
							<h3>問い合わせの返事</h3>
							<p>問い合わせ番号 : ${item.bno} &nbsp;&nbsp;&nbsp;| &nbsp;&nbsp;&nbsp; ユーザー番号 : ${item.account_id} &nbsp;&nbsp;&nbsp; | &nbsp;&nbsp;&nbsp; 問い合わせの日付 : ${item.created_date}</p>
							<p>題目 : ${item.title}</p>
							<p>內容 : ${item.content}</p>
							
							<form id="inquiry-form" action="/manager//Inquirypro.do"
								method="post">
								<input type="hidden" name="bno" value="${item.bno}"> <input
									type="hidden" name="title" value="${item.bno}"> <label
									for="title">題目.</label> <input type="text" id="title"
									name="title" required> <label for="content">内容.</label>
								<textarea id="content" name="content" required></textarea>
								<button type="submit">堰から水路をひくこと.</button>
							</form>
						</div>
					</div>
				</c:forEach>
			</table>
		</div>
	</div>
</div>

<!-- 문의 상세 모달 -->
<div id="detail-modal" class="modal">
	<div class="rmodal-content">
		<span class="rclose-btn" id="close-detail-modal">&times;</span>

		<!-- 문의 상세보기 출력 -->
		<div id="board-detail-content"></div>
	</div>
</div>

<%@ include file="/fragments/footer.jsp"%>
<script src="<%=request.getContextPath()%>/mypagee/js/inquiries.js"></script>

<script>
	// boardList를 JSON으로 넘겨줍니다.
	var boardListJson = $
	{
		boardListJson
	};
	console.log(boardListJson);
</script>

