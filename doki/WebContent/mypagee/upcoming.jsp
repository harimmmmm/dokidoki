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
.info-button{
	border: none;
	background : #7e9cb8;
	color: white;
	padding: 5px 8px;
}
.cancelmeg{
    margin-top: 250px;
    justify-content: center;
    align-items: center;
    height: 80vh;
    text-align: center;
    font-size: 18px;
    font-weight: bold;
    letter-spacing: -0.5px;
}
.cancelIcon{
    margin-bottom: 30px;
}
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>
		
		 <main class="main-content">
            <br><br><br>
            <section id="upcoming-travel" class="upcoming-travel">
                <h2>予定された旅行</h2>
                <c:choose>
				    <c:when test="${not empty reservationList}">
				        <c:forEach var="reservation" items="${reservationList}">
				            <div class="travel-card" data-package-id="${reservation.packageInfo.package_id}">
				                <div class="travel-header">
				                    <span class="travel-date">${reservation.packageInfo.package_name}</span>
									<button class="info-button" id="infoBtn">예약 상세 보기 > </button>
									      <!-- 패키지상세 모달 -->
									    <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
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
															<td colspan='3'>${reservation.packageInfo.package_name}</td>
														</tr>
														<tr>
															<th>여행기간</th> 
															<td colspan='3'>${fn:substring(reservation.packageInfo.start_date, 0, 10)} ~ ${fn:substring(reservation.packageInfo.end_date, 0, 10)}</td>
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
									
													<h6>금액</h6>
													<table class="table table-bordered">
														<tr>
															<th>구분</th>
															<th>성인</th>
															<th>아동</th>
															<th>유아</th>
														</tr>
														<tr>
															<td>인원</td>
															<td>${reservation.adult_number}</td>
															<td>${reservation.child_number}</td>
															<td>${reservation.baby_number}</td>
														</tr>
														<tr>
															<td>가격</td>
															<td>${reservation.packageInfo.package_price}円</td>
															<td>${reservation.packageInfo.child_price}円</td>
															<td>${reservation.packageInfo.baby_price}円</td>
														</tr>
														<tr>
															<td>총금액</td>
															<td colspan="3">${reservation.total_amount}円</td>
														</tr>
													</table>
									
									
													<h6>여행경보</h6>
													<p>여행경보 단계는 외교부 해외안전여행 사이트에서 확인하세요.</p>
												</div>
											</div>
										</div>
									</div><!-- 끝 -->
				                </div>
				                <div class="travel-details">
				                    <div class="flight-info">
				                        <div class="flight-info-left">
				                            <p>出発 : ${reservation.packageInfo.start_date} | 도착 : ${reservation.packageInfo.end_date}</p>
				                            <p>予約番号:${reservation.order_id}/ ${reservation.tot_personnel}명</p>
				                            <p>パッケージID: ${reservation.packageInfo.package_id}</p>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </c:forEach>
				    </c:when>
				    <c:otherwise>
					    <div class="cancelmeg">
				            <img alt="empty" src="<%=request.getContextPath()%>/mypagee/img/cancel.png" class="cancelIcon">
				            <p class="op">予定されている旅行はありません。</p>
					    </div>
				    </c:otherwise>
				</c:choose>
				
            </section>
        </main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>