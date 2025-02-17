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
            <section id="past-travel" class="past-travel">
                <h2>지난 여행</h2>
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
                                <button class="review-btn" style="margin-top: 20px;">후기 작성하기</button>
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
                                <button class="review-btn" style="margin-top: 20px;">후기 작성하기</button>
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
                                <button class="review-btn" style="margin-top: 20px;">후기 작성하기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
         <!-- 후기 작성 모달 -->
    <div id="review-modal" class="rModal">
        <div class="rmodal-content">
            <span class="rclose-btn" id="close-review-modal">&times;</span> <!-- X 버튼 -->
            <h3>후기 작성</h3>

            <div class="star-rating">
                <label>별점</label>
                <span class="star" data-value="1">★</span>
                <span class="star" data-value="2">★</span>
                <span class="star" data-value="3">★</span>
                <span class="star" data-value="4">★</span>
                <span class="star" data-value="5">★</span>
            </div>

            <form id="review-form">
                <label for="review">후기 내용</label>
                <textarea id="review" placeholder="후기를 작성하세요" required></textarea>
                <p id="char-count" class="char-count">0/500자</p>
                <p id="policy-warning" class="policy-warning">
                    * 상품과 무관한 내용이나 동일한 문자의 반복 등 부적절한 내용은 삭제됩니다. <br>
                    * 후기 내용에 개인 정보가 노출되지 않도록 주의해주세요.
                </p>
                <label for="review-image">사진을 공유해주세요.</label>
                <input type="file" id="review-image" accept="image/*">
                <button type="submit">제출</button>
                <button type="button" id="edit-review-btn" style="display:none;">수정</button> <!-- 수정 버튼 -->
            </form>
        </div>
    </div>
	</div>
	
	
</body>
<%@ include file="../fragments/footer.jsp"%>
<script src="<%=request.getContextPath()%>/mypagee/js/buy.js"></script>
</html>