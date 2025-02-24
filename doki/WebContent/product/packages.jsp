<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/product/css/sidebars.css"
	rel="stylesheet">

<!-- Custom styles for this template -->


<link href="<%=request.getContextPath()%>/product/css/dropdownstyle.css"
	rel="stylesheet">

<!-- slide css -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">

<link
	href="<%=request.getContextPath()%>/product/css/detailsPackage.css"
	rel="stylesheet">

<!-- 메인 섹션을 감싸는 div -->
<!-- 상품 상세 페이지 -->
<div class="untree_co-section">
	<div class="container detail-container">
		<!-- 상품 이미지 슬라이더 -->
		<div class="slider-container">
			<div class="slider">
				<div>
					<img src="/product/img/jejuslide1.jpg" alt="상품 이미지 1">
				</div>
				<div>
					<img src="/product/img/jejuslide2.jpg" alt="상품 이미지 2">
				</div>
				<div>
					<img src="/product/img/jejuslide3.jpg" alt="상품 이미지 3">
				</div>
			</div>
		</div>

		<!-- 상품 상세 정보 -->
		<div class="detail-info">
			<div class="d-flex justify-content-between align-items-center">
				<small class="text-muted"> 상품코드 <span
					class="copy-text underline" data-copy="DCNS2OKETQ">DCNS2OKETQ</span>
					| 단체번호 <span class="copy-text underline" data-copy="89863773">89863773</span>
				</small>

				<div class="interest-icons">
					<button id="wishlist">
						<img src="/product/img/heart.png" alt="찜">
					</button>
					<button id="share">
						<img src="/product/img/share.png" alt="공유">
					</button>
					<button id="print" onclick="window.print();">
						<img src="/product/img/print.png" alt="프린트">
					</button>
				</div>
			</div>
			<h2 class="mt-2">[모두단독] 제주도 SNS 핫플 3일 &lt;노팁/노옵션/스누피가든/승마/4명부터
				출발확정&gt;</h2>
			<div class="tags">#모두단독 #회정식 #흑돼지 #스누피가든 #월정리카페거리 #요트투어 #목장카페</div>
			<div class="info-price-container">
				<button class="info-button" id="infoBtn">여행핵심정보</button>
				<div class="price">900,900 원</div>
			</div>
			<div class="additional-info">
				<span>출발예정</span> | <span>가격예정</span> | <span>일정예정</span> | <span>호텔예정</span>
				| <span class="text-muted text-decoration-line-through">항공예정</span>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="infoModal" tabindex="-1"
	aria-labelledby="infoModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="infoModalLabel">여행 핵심정보</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h6>상품 기본 정보</h6>
				<table class="table table-bordered">
					<tr>
						<th>상품명</th>
						<td>[모두단독] 제주도 SNS핫플 3일 &lt;노팁/노옵션/스누피가든/승마/4명부터출발확정&gt;</td>
					</tr>
					<tr>
						<th>여행기간</th>
						<td>2025.02.28 ~ 2025.03.02 (2박 3일)</td>
					</tr>
					<tr>
						<th>상품종류</th>
						<td>단독상품</td>
					</tr>
					<tr>
						<th>영업보증 보험</th>
						<td>가입</td>
						<th>기획여행 보증보험</th>
						<td>가입</td>
					</tr>
				</table>

				<h6>여행 경비 총액</h6>
				<table class="table table-bordered">
					<tr>
						<th>구분</th>
						<th>성인</th>
						<th>아동 Extra Bed</th>
						<th>아동 No Bed</th>
						<th>유아</th>
					</tr>
					<tr>
						<td>기본 상품가격</td>
						<td>885,500원</td>
						<td>-원</td>
						<td>804,900원</td>
						<td>40,000원</td>
					</tr>
					<tr>
						<td>유류할증료</td>
						<td>15,400원</td>
						<td>-원</td>
						<td>15,400원</td>
						<td>15,400원</td>
					</tr>
					<tr>
						<td>소계</td>
						<td><strong>900,900원</strong></td>
						<td>-원</td>
						<td><strong>820,300원</strong></td>
						<td><strong>55,400원</strong></td>
					</tr>
				</table>

				<h6>쇼핑정보</h6>
				<p>
					일정에 포함된 쇼핑 횟수: <span class="text-primary">1회</span> (농수특산&기념품)
				</p>

				<h6>여행경보</h6>
				<p>여행경보 단계는 외교부 해외안전여행 사이트에서 확인하세요.</p>
			</div>
		</div>
	</div>

</div>

<!-- 상품 가격 및 예약 정보 섹션 추가 -->
<div class="booking-section">
	<div class="container">
		<div class="row">
			<!-- 왼쪽: 상품 가격 정보 -->
			<div class="col-md-8">
				<h3>상품가격</h3>
				<table class="table">
					<thead>
						<tr>
							<th>구분</th>
							<th>성인 (만 13세 이상)</th>
							<th>아동 Extra Bed (만 13세 미만)</th>
							<th>아동 No Bed (만 13세 미만)</th>
							<th>유아 (만 2세 미만)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>상품가격</td>
							<td>879,900원</td>
							<td>-</td>
							<td>796,100원</td>
							<td>55,400원</td>
						</tr>
						<tr>
							<td>유류할증료</td>
							<td>15,400원 포함</td>
							<td>-</td>
							<td>15,400원 포함</td>
							<td>15,400원 포함</td>
						</tr>
					</tbody>
				</table>
			</div>

			<!-- 사이드바 (예약 정보) -->
			<div class="col-md-4">
				<div class="sticky-sidebar">
					<div class="departure-info">
						<p>
							<strong>서울(김포) 출발</strong> <span id="departure-date">2025.05.06(화)
								00:00</span>
						</p>
						<p>
							<strong>서울(김포) 도착</strong> <span id="arrival-date">2025.05.08(목)
								00:00</span>
						</p>
						<button id="change-date-btn">출발일 변경</button>
					</div>

					<h4>예약인원 선택</h4>
					<!-- 예약 인원 선택 -->
					<div class="booking-options">
						<div class="booking-item" data-type="adult">
							<!-- 🔹 성인 data-type 추가 -->
							<span>성인</span>
							<button class="minus">-</button>
							<span class="count">1</span>
							<button class="plus">+</button>
							<span>879,900원</span>
						</div>
						<div class="booking-item" data-type="child">
							<!-- 🔹 아동 data-type 추가 -->
							<span>아동 No Bed</span>
							<button class="minus">-</button>
							<span class="count">0</span>
							<button class="plus">+</button>
							<span>796,100원</span>
						</div>
						<div class="booking-item" data-type="infant">
							<!-- 🔹 유아 data-type 추가 -->
							<span>유아</span>
							<button class="minus">-</button>
							<span class="count">0</span>
							<button class="plus">+</button>
							<span>55,400원</span>
						</div>
					</div>
					
					<!-- 총 금액 -->
					<h3 class="total-price">총 금액: 879,900원</h3>
					<button class="reserve-btn">예약하기</button>
				</div>
			</div>

			<!-- 출발일 선택 모달 (ID 및 클래스 변경) -->
			<div id="date-picker-modal" class="date-picker-container">
				<div class="date-picker-content">
					<span class="date-picker-close">&times;</span>
					<h3>출발일 선택</h3>
					<div class="calendar-container">
						<div class="month-selector">
							<button id="prev-month">&lt;</button>
							<span id="current-month">2025.05</span>
							<button id="next-month">&gt;</button>
						</div>
						<div id="calendar"></div>
					</div>
					<button id="confirm-date-btn" disabled>선택 완료</button>
				</div>
			</div>



		</div>
	</div>
</div>




<%@ include file="../fragments/footer.jsp"%>
