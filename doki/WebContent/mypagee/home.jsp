<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>
<style>
.main-content {
	/* 	margin: 70px auto; */
	
}

.box-c {
	background-color: #fff;
	padding: 30px;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-around;
	align-items: center;
	gap: 20px;
	padding: 20px;
}

.box {
	flex: 1;
	max-width: 200px;
	background: #f8f8f8;
	padding: 15px;
	border-radius: 8px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
	transition: all 0.3s ease;
	cursor: pointer;
	display: flex;
	align-items: center;
	gap: 10px;
	text-decoration: none; 
	color: black; 
}

.box i {
	font-size: 32px;
}

.box:hover {
	background: #e0e0e0;
}

@media ( max-width : 768px) {
	.box-c {
		flex-direction: column;
		align-items: center;
	}
}
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>
		<!-- 메인 콘텐츠 -->
		<main class="main-content">
			<br> <br> <br>
			<section id="home" class="home">
				<h2>마이 페이지 홈</h2>
				<p>환영합니다, 홍길동님! 여기서 여행 예약, 개인정보를 관리할 수 있습니다.</p>
			</section>

			<section id="inquiries" class="inquiries">
				<div class="recent-booking">
					<h3>📅 최근 예약한 여행</h3>
					<div class="travel-card">
						<div class="travel-header">
							<span class="travel-date">2025년 03월 07일 (금)</span> <span
								class="travel-status"><a href="">모두보기 <i
									class="bi bi-chevron-right"></i></a></span>
						</div>
						<div class="travel-details">
							<div class="flight-info">
								<div class="flight-info-left">
									<p>
										<strong>[대전] 상품명입니다아아</strong>
									</p>
									<p>예약번호 59GFQX / 항공사 예약번호 K4NPWL / 2명</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<section id="box-c" class="box-c">
				<a href="#" class="box"> <i class="bi bi-person-circle"></i> <span>개인정보수정</span>
				</a> <a href="#" class="box"> <i class="bi bi-headset"></i> <span>고객센터</span>
				</a> <a href="#" class="box"> <i class="bi bi-question-circle"></i>
					<span>자주 묻는 질문</span>
				</a> <a href="#" class="box"> <i class="bi bi-chat-dots"></i> <span>1:1
						문의</span>
				</a>
			</section>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>