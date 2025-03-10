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
			<div class="d-flex justify-content-end align-items-center">
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
			<div class="d-flex justify-content-between align-items-center paddingtop20">
				<small class="text-muted fontsize14px"> 商品コード <span
					class="copy-text underline fontsize14px" data-copy="${view.package_id }">${view.package_id }</span>
				</small>
				<div>
					<img class="reviewtitlerating" alt="" src="/product/img/review.png">
					<span class="fontsize14px reviewcntfontcolor">${totrating }&emsp;|&ensp;レビュー（${totreivew }件）</span>
				</div>
			</div>
			<h2 class="mt-2 text-break bold">${view.package_name }</h2>
			<div class="tags fontsize18px paddingbottom20">${view.included_services }</div>
			<div class="info-price-container">
				<button class="info-button" id="infoBtn">旅行の基本情報</button>
				<div class="price"><fmt:formatNumber value="${view.package_price}" type="number"/>円～</div>
			</div>

		</div>
	</div>
</div> <!-- end untree_co-section -->

<div class="modal fade" id="infoModal" tabindex="-1"
	aria-labelledby="infoModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="infoModalLabel">旅行の基本情報</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<h6>商品基本情報</h6>
				<table class="table table-bordered">
					<tr>
						<th>商品名</th>
						<td colspan='3'>${view.package_name }</td>
					</tr>
					<tr>
						<th>旅行期間</th>
						<td colspan='3'>${fn:substring(view.start_date, 0, 10)} ~ ${fn:substring(view.end_date, 0, 10)}  <span class="textcolor">${nights }泊${days }日</span></td>
					</tr>
					<tr>
						<th>商品種類</th>
						<td colspan='3'>単独商品</td>
					</tr>
					<tr>
						<th>営業保証保険 </th>
						<td>加入</td>
						<th>企画旅行保証保険</th>
						<td>加入</td>
					</tr>
				</table>

				<h6>旅行費用総額</h6>
				<table class="table table-bordered">
					<tr>
						<th>区分</th>
						<th>大人</th>
						<th>子供</th>
						<th>幼児</th>
					</tr>
					<tr>
						<td>基本商品価格>
						<td><fmt:formatNumber value="${basicadult}" type="number"/>円</td>
						<td><fmt:formatNumber value="${basicchild}" type="number"/>円</td>
						<td><fmt:formatNumber value="${basicbaby}" type="number"/>円</td>
					</tr>
					<tr>
						<td>燃油サーチャージ</td>
						<td>1,540円</td>
						<td>1,540円</td>
						<td>1,540円</td>
					</tr>
					<tr>
						<td>小計</td>
						<td><strong><fmt:formatNumber value="${view.package_price}" type="number"/>円</strong></td>
						<td><strong><fmt:formatNumber value="${view.child_price}" type="number"/>円</strong></td>
						<td><strong><fmt:formatNumber value="${view.baby_price}" type="number"/>円</strong></td>
					</tr>
				</table>


				<h6>旅行警報</h6>
				<p>旅行警報の段階は外務省の海外安全旅行サイトでご確認ください。</p>
			</div>
		</div>
	</div>

</div>

<!-- 상품 가격 및 예약 정보 섹션 추가 -->
<div class="booking-section">
	<div class="container">
	<h3 class="titleunderline">旅行主な日程</h3>
		<div class="row">
			<!-- 왼쪽: 상품 가격 정보 -->
			<div class="col-md-8">
				 <!-- 여행기간 -->
			    <div class="info-box">
			      <span class="info-title">旅行期間</span>
			      <span class="info-content">${fn:substring(view.start_date, 0, 10)} ~ ${fn:substring(view.end_date, 0, 10)}  <span class="textcolor">${nights }泊${days }日</span></span>
			    </div>
			
			    <!-- 여행도시 -->
			    <div class="info-box">
			      <span class="info-title">旅行都市</span>
			      <span class="info-content">${view.category_name } </span>
			    </div>
			
			    <!-- 예약인원 -->
			    <div class="info-box">
			      <span class="info-title">予約人数</span>
			      <span class="info-content">予約人数 現在<span class="bold">${totNumReservation }</span>名 (最小出発人数：<span class="bold">10</span>名)</span>
			    </div>
				<h3 class="paddingtop30 ">商品価格</h3>
				<table class="table">
					<thead>
						<tr>
							<th>区分</th>
							<th>大人（13歳以上）</th>
							<th>子供（13歳未満）</th>
							<th>幼児（2歳未満）</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>商品価格</td>
							<td><fmt:formatNumber value="${view.package_price}" type="number"/>円<br><span class="taxinfo">燃油サーチャージ 1,540円込み</span></td>
							<td><fmt:formatNumber value="${view.child_price}" type="number"/>円<br><span class="taxinfo">燃油サーチャージ 1,540円込み</span></td>
							<td><fmt:formatNumber value="${view.baby_price}" type="number"/>円<br><span class="taxinfo">燃油サーチャージ 1,540円込み</span></td>
						</tr>
					</tbody>
				</table>
				<p><span class="taxinfo">-当商品は個別航空券を利用するため、予約時点によって航空券代の追加料金が発生する場合があります。詳細につきましては予約後のご相談時にご案内いたします。
				<br>-予約時期により、航空券やホテルの原価上昇などの理由で販売価格が変更される場合がございます。予約成立時点の価格が適用されます。燃油サーチャージは毎月変動し、航空券発券時点での金額が確定となります。
				<br>-燃油サーチャージは原油価格や為替レートに応じて随時変動する場合があります。</span></p>
			
			
			
			  <h3 class="titleunderline paddingtop30">含まれるもの／含まれないもの</h3>
			  <div class="container mt-4">
			    <!-- 포함/불포함 사항 -->
			    <div class="info-box-custom">
			      <!-- 포함 사항 -->
			      <div class="info-box-left">
			        <div class="info-title-custom">含まれるもの <span class="circle green">○</span></div>
			        <ul class="info-content-custom">
			          <li>○最大1億ウォン海外旅行保険</li>
			          <li>○燃油サーチャージ</li>
			        </ul>
			      </div>
			
			      <!-- 불포함 사항 -->
			      <div class="info-box-right">
			        <div class="info-title-custom">含まれないもの <span class="circle red">×</span></div>
			        <ul class="info-content-custom">
			          <li>○個人経費（両替はウォン₩をご用意ください）</li>
			        </ul>
			      </div>
			    </div>
			  </div>
				<div class="container d-flex justify-content-center marginbottom20">
				  <button class="btn info-btn" data-bs-toggle="modal" data-bs-target="#reservationNotice">予約時の注意事項 &gt;</button>
				  <button class="btn info-btn" data-bs-toggle="modal" data-bs-target="#travelNotice">旅行時の注意事項 &gt;</button>
				
				  <!-- 예약 시 유의 사항 모달 -->
				  <div class="modal fade" id="reservationNotice" tabindex="-1">
				    <div class="modal-dialog modal-lg">
				      <div class="modal-content">
				        <div class="modal-header">
				          <h5 class="info-title-modal">予約時の注意事項</h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        <div class="modal-body">
				        	<span class="modalcontentfontcolor">
					        	■ 事前発券に関する規定案内<br>
								① 事前発券の特別価格でご提供する料金です。<br>
								② 事前発券後、航空料金の値上げにより商品価格が上昇する場合があります。<br>
								③ 航空会社の規定により、発券後のお名前変更や旅程変更には別途料金が発生します。<br><br>
								
								- 本商品は同じ日程の商品と航空座席を共有しているため、他コードの募集状況によっては早期終了となる場合があります。<br>
								- パスポートの英字表記と予約時の英字表記が異なる場合、航空座席が取り消されることがあり、それによる取消料または追加料金が発生する場合がありますので、ご予約時に必ずご確認ください。<br>
								- 機内サービスのご利用は、出発日の3日前までにお申込みください。<br>
								- 商品価格は、大人2名1室利用時の1名様あたりの料金です。<br><br>
								
								▶ 本商品はパッケージ旅行商品であり、最少催行人数は10名様からとなります。最大催行人数は航空会社の事情により変動する場合があります。（但し、最大催行人数は45名様を超えず、人数に応じてバスのサイズが変更されます。）<br>
								▶ 旅行日程は契約後、予期せぬ事情により事前協議の上で変更される場合がございますので、あらかじめご了承ください。<br><br>
								
								★韓国旅行では、東南アジアや中国など他地域と異なり、担当者が分かれておらず、一人の担当者が集合から現地の案内、ガイド業務まで一括して担当いたします。そのため、より快適で安心な旅をお楽しみいただけます。<br>
								→ 場合により、現地ガイドまたは現地ドライバーガイドがご案内することもあります。（大人基準で最終参加人数が10名未満の場合など）<br><br>
				            </span>
							<span class="modalcontentfontcolorred">
								＜航空券の事前発券について＞<br> 
								航空会社の座席状況により、航空会社の要請で早期に事前発券を行う場合があります。<br> 
								事前発券が行われない場合、座席確保ができない、または該当料金が適用されないため、航空料金が上昇することがありますので、予めご了承ください。
				       		</span>
				        </div>
				      </div>
				    </div>
				  </div>
				
				
				
				  <!-- 여행 시 유의 사항 모달 -->
				  <div class="modal fade" id="travelNotice" tabindex="-1">
				    <div class="modal-dialog modal-lg modalmargin">
				      <div class="modal-content">
				        <div class="modal-header">
				          <h5 class="info-title-modal">旅行時の注意事項</h5>
				          <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
				        </div>
				        <div class="modal-body">
					        <span class="modalcontentfontcolor">
					     	     ▶ ご旅行日程は契約締結時に予測できなかったやむを得ない事情により、事前協議の上で変更される場合があります。<br>
					    	     ▶ 最終的な宿泊予定ホテルのリストは、ご出発の2～3日前に日程表にてご確認いただけます。<br><br>
					
					          ♠ ご旅行の準備について<br>
					          ■ パスポートの有効期間は、必ず6ヶ月以上残っている必要があります。<br>
					          ■ 両替：韓国ウォンへの両替をご準備ください。（米ドルは不要です）<br>
					          ■ 温泉やサウナなどをご利用の際、水着は不要です。<br>
					          ■ 雨具（折りたたみ傘など）のご用意をおすすめいたします。<br>
					          ■ 韓国の電圧は220Vです。日本の電子機器（100～110V対応）をご利用の際は、変圧器とプラグ変換アダプターをご用意ください。<br>
					          ■ 韓国のホテルには基本的なアメニティ（石鹸、シャンプー、歯ブラシ、歯磨き粉など）が備え付けられていますが、一部ホテルではご用意がない場合もありますので、事前のご確認をお願いいたします。<br>
					       	</span>
				        </div>
				      </div>
				    </div>
				  </div>
				</div>
			
				<!-- 리뷰영역 -->
				<h3 class="titleunderline paddingtop30">レビュー	<span class="reviewcntfontcolor bold">${totreivew }</span></h3>
				<div class="container d-flex justify-content-center gap-2 paddingtop30">
					<img class="reviewtotstaricon" alt="" src="/product/img/review.png">
					<span class="reviewtotcnt">${totrating }</span>
				</div>
				<div class="container d-flex justify-content-center reviewboxunderline">
					<div class="reviewcntbox ">
						<span class="reviewcntboxfont ">レビュー（${totreivew }件）</span>
					</div>
				</div>
				
				<!-- 리뷰 목록 -->
				<c:forEach var="review" items="${review}">
					<div class="reviewboxunderline">
						<div class="container">
							<div class="d-flex justify-content-between reviewlistbox">
								<span>${review.user_id }</span><span>${fn:substring(review.review_date, 0, 10)}</span>
							</div>
							
							 <!-- 별점 이미지 표시 -->
						    <div class="d-flex justify-content-start gap-1 paddingtop20">
						        <c:set var="rating" value="${review.rating}" />
						        <c:forEach begin="1" end="5" var="i">
						            <c:choose>
						                <c:when test="${i <= rating}">
						                    <img class="reivewstaricon" alt="star" src="/product/img/review.png">
						                </c:when>
						                <c:otherwise>
						                    <img class="reivewstaricon" alt="empty-star" src="/product/img/emptyreivew.png">
						                </c:otherwise>
						            </c:choose>
						        </c:forEach>
						    </div>
							
							<!-- 리뷰 내용 -->
							<div class="reviewbody paddingtop20">
								<!-- 리뷰 이미지 (파일명만 저장되어 있음, uploads 폴더에서 불러옴) -->
							    <c:if test="${not empty review.image}">
							        <div class="reviewimg marginbottom20">
							           <img 
						                alt="리뷰이미지" 
						                src="${pageContext.request.contextPath}/uploads/${review.image}" 
						                style="max-width:100%; height:auto; cursor:pointer;"
						                onclick="showModal('${pageContext.request.contextPath}/uploads/${review.image}')">
							        </div>
							    </c:if>
								<span class="reviewcontentfont ">
									${review.content }
								</span>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 페이징 -->
				<div class="paging-container">
				    <c:forEach begin="1" end="${totalPages}" var="i">
				        <a href="?package_id=${view.package_id}&page=${i}" class="page-link ${i == currentPage ? 'active' : ''}">
				            ${i}
				        </a>
				    </c:forEach>
				</div>
				
				
				<!-- 이미지 확대 모달 -->
				<div id="imageModal" class="modalimg" style="display:none;">
				    <span class="close" onclick="closeModal()" style="position:absolute; top:10px; right:20px; font-size:40px; cursor:pointer;">&times;</span>
				    <img class="modal-content" id="modalImg" style="width:auto; max-width:90%; max-height:90%; margin:85px auto; display:block;">
				</div>
				
			
			</div><!-- end 왼쪽: 상품 가격 정보 -->



			
			
			<!-- 사이드바 (예약 정보) -->
			<div class="col-md-4">
				<div class="sticky-sidebar">
					<div class="departure-info ">
						<p class="d-flex justify-content-between">
							<strong>${view.departure_name } 出発</strong> <span id="departure-date">${fn:substring(view.start_date, 0, 10)}</span>
						</p>
						<p class="d-flex justify-content-between">
							<strong>${view.category_name } 到着</strong> <span id="arrival-date">${fn:substring(view.end_date, 0, 10)}</span>
						</p>
						
					</div>

					<h4>予約人数選択</h4>
					<!-- 예약 인원 선택 -->
					<div class="booking-options">
						<div class="booking-item" data-type="adult">
							<!-- 🔹 성인 data-type 추가 -->
							<span>大人</span>
							<button class="minus">-</button>
							<span class="count">1</span>
							<button class="plus">+</button>
							<span><fmt:formatNumber value="${view.package_price}" type="number"/>円</span>
						</div>
						<div class="booking-item" data-type="child">
							<!-- 🔹 아동 data-type 추가 -->
							<span>子供</span>
							<button class="minus">-</button>
							<span class="count">0</span>
							<button class="plus">+</button>
							<span><fmt:formatNumber value="${view.child_price}" type="number"/>円</span>
						</div>
						<div class="booking-item" data-type="infant">
							<!-- 🔹 유아 data-type 추가 -->
							<span>幼児</span>
							<button class="minus">-</button>
							<span class="count">0</span>
							<button class="plus">+</button>
							<span><fmt:formatNumber value="${view.baby_price}" type="number"/>円</span>
						</div>
					</div>
					
					<!-- 총 금액 -->
					<h3 class="total-price">総額: ${total.toLocaleString()}円</h3>
					<button class="reserve-btn">予約する</button>
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
<script type="text/javascript">
//모달 열기
function showModal(imageSrc) {
    document.getElementById("modalImg").src = imageSrc;
    document.getElementById("imageModal").style.display = "block";
}

// 모달 닫기
function closeModal() {
    document.getElementById("imageModal").style.display = "none";
}

// 모달 외부 클릭 시 닫기
window.onclick = function(event) {
    var modal = document.getElementById("imageModal");
    if (event.target == modal) {
        closeModal();
    }
}

</script>


<%@ include file="../fragments/footer.jsp"%>

