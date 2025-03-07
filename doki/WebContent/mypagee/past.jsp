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
.star {
    font-size: 30px;
    cursor: pointer;
    color: rgb(221, 221, 221);
    margin-right: 5px;
}
.star.selected {
    color: #486988;
}
.modal-contentt {
    width: 630px;
    top: 95px;
    left: 320px;
    padding: 20px;
    background: #f9f9f9;
    border: 0.5px solid #c9c9c9;
    margin: auto;
    margin-top: 165px;
}

.modal-contentt .close-btn{
	float: right;
    font-size: 25px;
    cursor: pointer;
}

.modal-contentt p{
	text-align: left;
}

.review-btn-view{
	border: none;
	background : #486988;
	color: white;
	padding: 5px 8px;
}

.review-btn{
	border: none;
	background : #486988;
	color: white;
	padding: 5px 8px;
}

.info-button{
border: none;
	background : #7e9cb8;
	color: white;
	padding: 5px 8px;
}

</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>
		
		  <main class="main-content">
            <br><br><br>
            <section id="past-travel" class="past-travel">
                <h2>지난 여행</h2>
                
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
				                            <p> 출발 : ${fn:substring(reservation.packageInfo.start_date, 0, 10)} &nbsp;&nbsp; | &nbsp;&nbsp; 도착 : ${fn:substring(reservation.packageInfo.end_date, 0, 10)}</p>
				                            <p>예약번호 ${reservation.order_id}/ ${reservation.tot_personnel}명</p>
				                            <p>패키지 ID: ${reservation.packageInfo.package_id}</p>
				                        </div>
				                        <div class="flight-info-right">
				                            <c:if test="${not empty reservation.reviewInfo.review_id}">
				                                <button class="review-btn-view" 
												    data-review-id="${reservation.reviewInfo.review_id}"
												    data-review-content="${reservation.reviewInfo.content}"
												    data-review-rating="${reservation.reviewInfo.rating}"
												    data-review-image="${reservation.reviewInfo.image}"
												    data-package-id="${reservation.packageInfo.package_id}">
												    후기 보기
												</button>
				
				                                <!-- 예약별 모달 ID를 고유하게 설정 -->
				                                <div id="reviewModalview_${reservation.packageInfo.package_id}" class="modal">
				                                    <div class="modal-contentt">
				                                        <span class="close-btn" id="closeModal_${reservation.packageInfo.package_id}">&times;</span>
				                                        <h2>후기 내용</h2>
				                                        <div id="reviewContent">
				                                            <p> 후기 내용 : ${reservation.reviewInfo.content}</p>
				                                            <p> 별점  : 
				                                                <c:forEach var="i" begin="1" end="${reservation.reviewInfo.rating}">
				                                              	      ★
				                                                </c:forEach>
				                                            </p>
				              									<c:choose>
																    <c:when test="${not empty reservation.reviewInfo.image}">
																        <img src="${pageContext.request.contextPath}/uploads/${reservation.reviewInfo.image}" alt="写真なし" style="max-width: 300px; display: block;">
																    </c:when>
																    <c:otherwise>
																        <span></span>
																    </c:otherwise>
																</c:choose>
					                                    </div>
				                                    </div>
				                                </div>
				                            </c:if>
				
				                            <c:if test="${empty reservation.reviewInfo.review_id}">
				                                <button class="review-btn" style="margin-top: 20px;" onclick="viewReview('${reservation.packageInfo.package_id}')">후기 작성</button>
				                            </c:if>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </c:forEach>
				    </c:when>
				    <c:otherwise>
				        <div class="no-reservations">
				            <p>현재 예약 내역이 없습니다.</p>
				        </div>
				    </c:otherwise>
				</c:choose>


            </section>
        </main>
        
         <!-- 후기 작성 모달 -->
    <div id="review-modal" class="rModal">
        <div class="rmodal-content">
            <form id="review-form" enctype="multipart/form-data">
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

                <input type="hidden" id="package-id" name="package_id">
            
                <label for="review">후기 내용</label>
                <textarea id="review" placeholder="후기를 작성하세요" name="content" required></textarea>
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