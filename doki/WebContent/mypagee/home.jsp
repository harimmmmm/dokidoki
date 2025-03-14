<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
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
				<h2>マイページ·ホーム</h2>
				<p>ようこそ、<span style="font-weight: bolder;">${vo.name_kanji}</span>様！ここで旅行の予約、個人情報などを管理できます。</p>
			</section>

			<section id="inquiries" class="inquiries">
				<div class="recent-booking">
					<h3>📅 最近予約した旅行</h3>
							<span class="travel-status"><a href="/mypage/upcoming.do">みんなで見る <i class="bi bi-chevron-right"></i></a></span>
					<c:choose>
					    <c:when test="${not empty reservationList}">
					        <c:set var="reservation" value="${reservationList[0]}" />
					        <div class="travel-card" data-package-id="${reservation.packageInfo.package_id}">
					            <div class="travel-header">
					                <span class="travel-date">${reservation.packageInfo.package_name}</span>
					            </div>
					            <div class="travel-details">
					                <div class="flight-info">
					                    <div class="flight-info-left">
					                        <p> 出発. : ${reservation.packageInfo.start_date} | 到着. : ${reservation.packageInfo.end_date}</p>
					                        <p> 予約番号 :  ${reservation.order_id}/ ${reservation.tot_personnel}名</p>
					                        <p> パッケージID: ${reservation.packageInfo.package_id}</p>
					                    </div>
					                </div>
					            </div>
					        </div>
					    </c:when>
					    <c:otherwise>
					        <div class="no-reservations">
					            <p>現在、予約履歴がありません。</p>
					        </div>
					    </c:otherwise>
					</c:choose>
				</div>
			</section>
			<section id="box-c" class="box-c">
				<a href="/mypage//editform.do" class="box"> <i class="bi bi-person-circle"></i> <span>個人情報修正</span></a> 
				<a href="/boards/noticelist.do" class="box" style="font-size: 12px;"> <i class="bi bi-headset"></i> <span>カスタマーサポート</span></a> 
				<a href="/notice/frequentlyAsked.jsp" class="box"> <i class="bi bi-question-circle"></i><span>よくある質問</span></a> 
				<a href="/mypage/inquiries.do" class="box"> <i class="bi bi-chat-dots"></i> <span>1:1お問い合わせ</span></a>
			</section>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>