<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<%@ page import="vo.PackagesVo" %>
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
				<c:forEach var="imgPath" items="${imagePaths}">
					<div>
				    	<img src="${pageContext.request.contextPath}/${imgPath}">
				    </div>
				</c:forEach>
			</div>
		</div>

		<!-- 상품 상세 정보 -->
		<div class="detail-info">
			<div class="d-flex justify-content-between align-items-center">
				<small class="text-muted"> 상품코드 <span
					class="copy-text underline" data-copy="${view.package_id }">${view.package_id }</span>
				</small>

				<div class="interest-icons">
					<button class="wishlist-btn" data-package-id="${view.package_id}">
					    <img src="${pageContext.request.contextPath}/product/img/heart.png" alt="관심" class="wishlist-icon">
					</button>
					<button id="share">
						<img src="/product/img/share.png" alt="공유">
					</button>
					<button id="print" onclick="window.print();">
						<img src="/product/img/print.png" alt="프린트">
					</button>
				</div>
			</div>
			<h2 class="mt-2">${view.package_name }</h2>
			<div class="tags">${view.included_services }</div>
			<div class="info-price-container">
				<button class="info-button" id="infoBtn">여행핵심정보</button>
				<div class="price">${view.package_price }円～</div>
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
						<td colspan='3'>${view.package_name }</td>
					</tr>
					<tr>
						<th>여행기간</th>
						<td colspan='3'>${fn:substring(view.start_date, 0, 10)} ~ ${fn:substring(view.end_date, 0, 10)}</td>
					</tr>
					<tr>
						<th>상품종류</th>
						<td colspan='3'>단독상품</td>
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
						<th>아동</th>
						<th>유아</th>
					</tr>
					<tr>
						<td>기본 상품가격</td>
						<td><fmt:formatNumber value="${basicadult}" type="number"/>円</td>
						<td><fmt:formatNumber value="${basicchild}" type="number"/>円</td>
						<td><fmt:formatNumber value="${basicbaby}" type="number"/>円</td>
					</tr>
					<tr>
						<td>유류할증료</td>
						<td>1,540円</td>
						<td>1,540円</td>
						<td>1,540円</td>
					</tr>
					<tr>
						<td>소계</td>
						<td><strong><fmt:formatNumber value="${view.package_price}" type="number"/>円</strong></td>
						<td><strong><fmt:formatNumber value="${view.child_price}" type="number"/>円</strong></td>
						<td><strong><fmt:formatNumber value="${view.baby_price}" type="number"/>円</strong></td>
					</tr>
				</table>


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
							<th>유아 (만 2세 미만)</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>상품가격</td>
							<td><fmt:formatNumber value="${view.package_price}" type="number"/>円<br><span class="taxinfo">유류할증료 1,540円 포함</span></td>
							<td><fmt:formatNumber value="${view.child_price}" type="number"/>円<br><span class="taxinfo">유류할증료 1,540円 포함</span></td>
							<td><fmt:formatNumber value="${view.baby_price}" type="number"/>円<br><span class="taxinfo">유류할증료 1,540円 포함</span></td>
						</tr>
					</tbody>
				</table>
				<p><span class="taxinfo">-当商品は個別航空券を利用するため、予約時点によって航空券代の追加料金が発生する場合があります。詳細につきましては予約後のご相談時にご案内いたします。
				<br>-予約時期により、航空券やホテルの原価上昇などの理由で販売価格が変更される場合がございます。予約成立時点の価格が適用されます。燃油サーチャージは毎月変動し、航空券発券時点での金額が確定となります。
				<br>-燃油サーチャージは原油価格や為替レートに応じて随時変動する場合があります。</span></p>
			</div>

			<!-- 사이드바 (예약 정보) -->
			<div class="col-md-4">
				<div class="sticky-sidebar">
					<div class="departure-info">
						<p>
							<strong>${view.departure_name } 출발</strong> <span id="departure-date">${fn:substring(view.start_date, 0, 10)}</span>
						</p>
						<p>
							<strong>${view.category_name } 도착</strong> <span id="arrival-date">${fn:substring(view.end_date, 0, 10)}</span>
						</p>
						
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
							<span><fmt:formatNumber value="${view.package_price}" type="number"/>円</span>
						</div>
						<div class="booking-item" data-type="child">
							<!-- 🔹 아동 data-type 추가 -->
							<span>아동</span>
							<button class="minus">-</button>
							<span class="count">0</span>
							<button class="plus">+</button>
							<span><fmt:formatNumber value="${view.child_price}" type="number"/>円</span>
						</div>
						<div class="booking-item" data-type="infant">
							<!-- 🔹 유아 data-type 추가 -->
							<span>유아</span>
							<button class="minus">-</button>
							<span class="count">0</span>
							<button class="plus">+</button>
							<span><fmt:formatNumber value="${view.baby_price}" type="number"/>円</span>
						</div>
					</div>
					
					<!-- 총 금액 -->
					<h3 class="total-price">총 금액: ${total.toLocaleString()}円</h3>
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

<script>
    const IS_LOGGED_IN = <%= session.getAttribute("user") != null %>;
    const ADULT_PRICE = parseInt('${view.package_price}');
    const CHILD_PRICE = parseInt('${view.child_price}');
    const INFANT_PRICE = parseInt('${view.baby_price}');
    const CONTEXT_PATH = "<%=request.getContextPath()%>";

    <% if (request.getAttribute("view") != null) { %>
        const PACKAGE_ID = '<%= ((PackagesVo)request.getAttribute("view")).getPackage_id() %>';
    <% } else { %>
        const PACKAGE_ID = null;
    <% } %>
</script>

<script src="${pageContext.request.contextPath}/product/js/payment.js"></script>

<script>
    window.addEventListener('message', function(event){
        if(event.data === 'payment_success'){
            let successMessage = document.createElement("div");
            successMessage.textContent = "결제가 완료되었습니다.";
            successMessage.style.cssText = `
                position: fixed;
                bottom: 20px;
                left: 50%;
                transform: translateX(-50%);
                background-color: #333;
                color: #fff;
                padding: 10px 20px;
                border-radius: 5px;
                z-index: 9999;
            `;
            document.body.appendChild(successMessage);
            setTimeout(() => successMessage.remove(), 3000);
        }
    });
</script>



<%@ include file="../fragments/footer.jsp"%>

