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
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>
		
		 <main class="main-content">
            <br><br><br>
            <section id="upcoming-travel" class="upcoming-travel">
                <h2>예정된 여행</h2>
                <div class="travel-card">
                    <div class="travel-header">
                        <span class="travel-date">2025년 03월 07일 (금)</span>
                        <span class="travel-status"><a href="">예약 상세 보기 <i class="bi bi-chevron-right"></i></a></span>
                    </div>
                    <div class="travel-details">
                        <div class="flight-info">
                            <div class="flight-info-left">
                                <p><strong>[대전] 상품명입니다아아</strong></p>
                                <p>예약번호 59GFQX / 항공사 예약번호 K4NPWL / 2명</p>
                            </div>
                            <div class="flight-info-right">
                                <button class="review-btn" style="margin-top: 20px;">예약 취소하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="travel-card">
                    <div class="travel-header">
                        <span class="travel-date">2025년 03월 07일 (금)</span>
                        <span class="travel-status"><a href="">예약 상세 보기 <i class="bi bi-chevron-right"></i></a></span>
                    </div>
                    <div class="travel-details">
                        <div class="flight-info">
                            <div class="flight-info-left">
                                <p><strong>[대전] 상품명입니다아아</strong></p>
                                <p>예약번호 59GFQX / 항공사 예약번호 K4NPWL / 2명</p>
                            </div>
                            <div class="flight-info-right">
                                <button class="review-btn" style="margin-top: 20px;">예약 취소하기</button>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="travel-card">
                    <div class="travel-header">
                        <span class="travel-date">2025년 03월 07일 (금)</span>
                        <span class="travel-status"><a href="">예약 상세 보기 <i class="bi bi-chevron-right"></i></a></span>
                    </div>
                    <div class="travel-details">
                        <div class="flight-info">
                            <div class="flight-info-left">
                                <p><strong>[대전] 상품명입니다아아</strong></p>
                                <p>예약번호 59GFQX / 항공사 예약번호 K4NPWL / 2명</p>
                            </div>
                            <div class="flight-info-right">
                                <button class="review-btn" style="margin-top: 20px;">예약 취소하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>