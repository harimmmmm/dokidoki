<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
</head>
<style>
.main-content {
	margin-top: 80px;
	/* display: flex; */
	justify-content: center;
	align-items: center;
	height: 80vh;
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	letter-spacing: -0.5px;
}

.cancelIcon {
	margin-bottom: 30px;
}
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>

		<main class="main-content">
			<header>
				<h1>문의 내역</h1>
			</header>

			<section id="inquiries" class="inquiries">
				<button class="inquire-btn" id="open-modal">문의하기</button>

				<!-- 문의 내역 리스트 -->
				<div class="inquiries-list">
					<table>
						<thead>
							<tr>
								<th>제목</th>
								<th>상태</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>여행 예약 관련 문의</td>
								<td>답변 대기</td>
								<td>2025-01-30</td>
							</tr>
							<tr>
								<td>여행 일정 변경</td>
								<td>답변 완료</td>
								<td>2025-01-28</td>
							</tr>
						</tbody>
					</table>
				</div>

				<!-- 모달 -->
				<div id="modal" class="modal">
					<div class="modal-content">
						<span class="close-btn" id="close-modal">&times;</span>
						<h3>문의사항을 남겨주세요. 가능한 빠르게 답변드리겠습니다.</h3>
						<form id="inquiry-form">
							<label for="subject">제목</label> <input type="text" id="subject"
								placeholder="문의 제목을 입력하세요" required> <label
								for="message">메시지</label>
							<textarea id="message" placeholder="문의 내용을 입력하세요" required></textarea>
							<button type="submit">보내기</button>
						</form>
					</div>
				</div>
			</section>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>