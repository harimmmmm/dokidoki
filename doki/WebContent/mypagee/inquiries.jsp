<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/inquiries.css">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>

		<main class="main-content">
			<section id="inquiries" class="inquiries">
			
				<h2>問い合わせの内訳</h2>
				<button class="inquire-btn" id="open-inquiry-modal">問い合わせ</button>

				<!-- 문의 내역 리스트 -->
				<c:if test="${not empty boardList}">
					<table>
						<thead>
							<tr>
								<th>題目.</th>
								<th>作成日</th>
								<th>状態</th>
								<th>詳細</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="board" items="${boardList}">
								<tr>
									<td>${board.title}</td>
									<td>${board.created_date}</td>
									<td>
										<c:choose>
											<c:when test="${empty board.comments}"><span style="color: red;">返事待ち</span></c:when>
											<c:when test="${not empty board.comments}"><span style="color: green;">回答完了</span></c:when>
										</c:choose>
									</td>
									<td>
										<button class="showBoardDetailBtn" data-bno="${board.bno}">詳細を見る</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>

				<!-- boardList가 비어 있으면 -->
				<c:if test="${empty boardList}">
					<p>お問い合わせがありません。</p>
				</c:if>


				<script>
				    // boardList를 JSON으로 넘겨줍니다.
				    var boardListJson = ${boardListJson};
				    console.log(boardListJson); 
				</script>


					<!-- 문의 상세 모달 -->
					<div id="detail-modal" class="modal">
						<div class="rmodal-content">
							<span class="rclose-btn" id="close-detail-modal">&times;</span>

							<!-- 문의 상세보기 출력 -->
							<div id="board-detail-content"></div>
						</div>
					</div>


					<!-- 문의하기 모달 -->
					<div id="inquiry-modal" class="modal">
						<div class="rmodal-content">
							<span class="rclose-btn" id="close-inquiry-modal">&times;</span>
							<h3>お問い合わせを残してください。</h3>
							<form id="inquiry-form" action="/mypage/inquiriespro.do"
								method="post">
								<label for="title">題目.</label> <input type="text" id="title"
									name="title" required> <label for="content">内容.</label>
								<textarea id="content" name="content" required></textarea>
								<button type="submit">堰から水路をひくこと.</button>
							</form>
						</div>
					</div>
					
			</section>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
<script src="<%=request.getContextPath()%>/mypagee/js/inquiries.js"></script>
</html>