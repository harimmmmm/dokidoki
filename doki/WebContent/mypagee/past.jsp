<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
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
            <section id="past-travel" class="past-travel">
                <h2>先達ての旅行</h2>
                
				<c:choose>
				    <c:when test="${not empty reservationList}">
				        <c:forEach var="reservation" items="${reservationList}">
				            <div class="travel-card" data-package-id="${reservation.packageInfo.package_id}">
				                <div class="travel-header">
				                    <span class="travel-date">${reservation.packageInfo.package_name}</span>
									<button class="info-button" id="infoBtn">予約の詳細を見る > </button>
									      <!-- 패키지상세 모달 -->
									    <div class="modal fade" id="infoModal" tabindex="-1" aria-labelledby="infoModalLabel" aria-hidden="true">
										<div class="modal-dialog modal-lg">
											<div class="modal-content">
												<div class="modal-header">
													<h5 class="modal-title" id="infoModalLabel">旅行の核心情報</h5>
													<button type="button" class="btn-close" data-bs-dismiss="modal"
														aria-label="Close"></button>
												</div>
												<div class="modal-body">
													<h6>商品 基本 情報</h6>
													<table class="table table-bordered">
														<tr>
															<th>商品名</th>
															<td colspan='3'>${reservation.packageInfo.package_name}</td>
														</tr>
														<tr>
															<th>旅行期間</th> 
															<td colspan='3'>${fn:substring(reservation.packageInfo.start_date, 0, 10)} ~ ${fn:substring(reservation.packageInfo.end_date, 0, 10)}</td>
														</tr>
														<tr>
															<th>商品の種類</th>
															<td colspan='3'>単独商品</td>
														</tr>
														<tr>
															<th>営業保証保険 </th>
															<td>加入</td>
															<th>企画旅行保証保険</th>
															<td>加入</td>
														</tr>
													</table>
									
													<h6>旅行費用</h6>
													<table class="table table-bordered">
														<tr>
															<th>区分</th>
															<th>大人</th>
															<th>子供</th>
															<th>幼児</th>
														</tr>
														<tr>
															<td>人員.</td>
															<td>${reservation.adult_number}</td>
															<td>${reservation.child_number}</td>
															<td>${reservation.baby_number}</td>
														</tr>
														<tr>
															<td>価格.</td>
															<td>${reservation.packageInfo.package_price}円</td>
															<td>${reservation.packageInfo.child_price}円</td>
															<td>${reservation.packageInfo.baby_price}円</td>
														</tr>
														<tr>
															<td>総額</td>
															<td colspan="3">${reservation.total_amount}円</td>
														</tr>
													</table>
													
													<h6>旅行警報</h6>
													<p>旅行警報の段階は外務省の海外安全旅行サイトでご確認ください。</p>
												</div>
											</div>
										</div>
									</div><!-- 끝 -->

				                </div>
				                <div class="travel-details">
				                    <div class="flight-info">
				                        <div class="flight-info-left">  
				                            <p> 出発. : ${fn:substring(reservation.packageInfo.start_date, 0, 10)} &nbsp;&nbsp; | &nbsp;&nbsp; 到着. : ${fn:substring(reservation.packageInfo.end_date, 0, 10)}</p>
				                            <p>予約番号 : ${reservation.order_id}/ ${reservation.tot_personnel}人</p>
				                            <p>パッケージID: ${reservation.packageInfo.package_id}</p>
				                        </div>
				                        <div class="flight-info-right">
				                            <c:if test="${not empty reservation.reviewInfo.review_id}">
				                                <button class="review-btn-view" 
												    data-review-id="${reservation.reviewInfo.review_id}"
												    data-review-content="${reservation.reviewInfo.content}"
												    data-review-rating="${reservation.reviewInfo.rating}"
												    data-review-image="${reservation.reviewInfo.image}"
												    data-package-id="${reservation.packageInfo.package_id}">
												    レビューを見る
												</button>
				
				                                <!-- 예약별 모달 ID를 고유하게 설정 -->
				                                <div id="reviewModalview_${reservation.packageInfo.package_id}" class="modal">
				                                    <div class="modal-contentt">
				                                        <span class="close-btn" id="closeModal_${reservation.packageInfo.package_id}">&times;</span>
				                                        <h2>後記の内容</h2>
				                                        <div id="reviewContent">
				                                            <p> 後記の内容 : ${reservation.reviewInfo.content}</p>
				                                            <p> 星占い  : 
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
				                                <button class="review-btn" style="margin-top: 20px;" onclick="viewReview('${reservation.packageInfo.package_id}')">レビュー作成</button>
				                            </c:if>
				                        </div>
				                    </div>
				                </div>
				            </div>
				        </c:forEach>
				    </c:when>
				    <c:otherwise>
				        <div class="cancelmeg">
				            <img alt="empty" src="<%=request.getContextPath()%>/mypagee/img/cancel.png" class="cancelIcon">
				            <p class="op">過去の旅行がありません。</p>
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
            <h3>レビュー作成</h3>

            <div class="star-rating">
                <label>星占い</label>
                <span class="star" data-value="1">★</span>
                <span class="star" data-value="2">★</span>
                <span class="star" data-value="3">★</span>
                <span class="star" data-value="4">★</span>
                <span class="star" data-value="5">★</span>
            </div>

                <input type="hidden" id="package-id" name="package_id">
            
                <label for="review">後記の内容</label>
                <textarea id="review" placeholder="レビューを書いてください" name="content" required></textarea>
                <p id="char-count" class="char-count">0/500字</p>
                <p id="policy-warning" class="policy-warning">
                 	 * 商品と関係のない内容や同じ文字の繰り返しなど不適切な内容は削除されます。 <br>
                	 * レビューの内容に個人情報が漏れないように注意してください。
                </p>
                <label for="review-image">写真を共有してください。</label>
                <input type="file" id="review-image" accept="image/*">
                <button type="submit">提出.</button>
            </form>
        </div>
    </div>

	</div>
	
</body>
<%@ include file="../fragments/footer.jsp"%>
<script src="<%=request.getContextPath()%>/mypagee/js/buy.js"></script>

</html>