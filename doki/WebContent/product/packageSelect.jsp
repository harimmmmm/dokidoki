<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">


<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/product/css/sidebars.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/product/css/packageSelect.css"
	rel="stylesheet">

<link href="<%=request.getContextPath()%>/product/css/dropdownstyle.css"
	rel="stylesheet">
<link
	href="<%=request.getContextPath()%>/product/css/selectPackageList.css"
	rel="stylesheet">
<script>
  window.autoSubmit = true;
</script>



<!-- 메인 섹션을 감싸는 div -->
<div class="untree_co-section">
	<div class="container titleunderLine">
		<div class="row">
			<div class="col-12">
				<!-- 전체 너비를 차지하는 컬럼 -->
				<form class="form topnav" id="searchForm" action="/pakage/packageSelect.do" method="post">

					<!-- 여행 검색을 위한 폼 -->

					<!-- 여행 검색 필드 -->
					<div class="row mb-2">
						<div class="col d-flex justify-content-between">
							<!-- 왼쪽 콘텐츠 (여행지 선택) -->
							<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
								<div
									class="custom-dropdown form-control custom-select packagesSelect">
									<div class="selected">여행지 선택</div>
									<div class="dropdown-menu">
										<!-- 1단계 -->
										<div class="column first">
											<div class="option main-option active" data-target="domestic">韓国</div>
										</div>
										<!-- 2단계 -->
										<div class="column second">
											<div class="option sub-option" data-target="jeju">ジェジュ島</div>
											<div class="option sub-option" data-target="ulleung">ウルルン島</div>
											<div class="option sub-option" data-target="gangwon">カンウォン</div>
											<div class="option sub-option" data-target="gyeongsang">경상</div>
											<div class="option sub-option" data-target="jeolla">전라</div>
											<!-- 전라 추가 -->
											<div class="option sub-option" data-target="chungcheong">충청</div>
											<div class="option sub-option" data-target="seoul">서울/인천/경기</div>
										</div>

										<div class="column third">
											<!-- ✅ "제주도"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="jeju">ジェジュ島</div>
											<!-- ✅ "울릉도"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="ulleung">ウルルン島</div>
											<!-- ✅ "강원"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="gangwon">カンウォン</div>
											<!-- ✅ "경상"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="gyeongsang">キョンサンプク道</div>
											<div class="option detail-option d-none" data-parent="gyeongsang">キョンサンナム道</div>
											<div class="option detail-option d-none" data-parent="gyeongsang">プサン</div>
											<!-- ✅ "전라"를 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="jeolla">チョルラプク道</div>
											<div class="option detail-option d-none" data-parent="jeolla">チョルラナム道</div>
											<!-- ✅ "충청"를 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="chungcheong">チュンチョンプク道</div>
											<div class="option detail-option d-none" data-parent="chungcheong">チュンチョンナム道</div>
											<!-- ✅ "서울/인천/경기"를 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="seoul">ソウル</div>
											<div class="option detail-option d-none" data-parent="seoul">インチョン</div>
										</div>
									</div>
								</div>
								<!-- 선택된 목적지 저장 -->
  								<input type="hidden" id="selectedDestination" name="destination" value="${param.destination}" />
							</div>

							<!-- 오른쪽 콘텐츠 (출발지 선택과 날짜 입력을 같이 배치) -->
							<div class="d-flex col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-8">
								<!-- 출발지 선택 -->
								<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-6">
									<select name="departure" id="departure" class="form-control custom-select">
										<option value="" ${param.departure == '' ? 'selected' : ''} selected disabled hidden >출발지 선택</option>
									    <option value="東京" ${param.departure == '東京' ? 'selected' : ''}>東京</option>
									    <option value="大阪" ${param.departure == '大阪' ? 'selected' : ''}>大阪</option>
									    <option value="福岡" ${param.departure == '福岡' ? 'selected' : ''}>福岡</option>
									    <option value="名古屋" ${param.departure == '名古屋' ? 'selected' : ''}>名古屋</option>
									    <option value="札幌" ${param.departure == '札幌' ? 'selected' : ''}>札幌</option>
									    <option value="沖縄" ${param.departure == '沖縄' ? 'selected' : ''}>沖縄</option>
									    <option value="その他" ${param.departure == 'その他' ? 'selected' : ''}>その他</option>
									</select>
								</div>

								<!-- 날짜 입력 -->
								<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-6">
									<input type="text" class="form-control" name="datePicker" id="datePicker" >
								</div>
								<!-- hidden 필드 추가 -->
								<input type="hidden" id="startDateHidden" name="startDate" value="${param.startDate}">
								<input type="hidden" id="endDateHidden" name="endDate" value="${param.endDate}">
							</div>
						</div>
					</div>


				</form>
				<!-- 여행 검색 폼 종료 -->
			</div>
		</div>
		<!-- 검색 폼 영역 종료 -->
	</div>

	<div class="container">
		<div class="searchcountform">
			<p class="searchtotfontsize">
				검색결과 <span class="searchtotalcolor searchtotfontsize">${searchcnt }</span>
			</p>
		</div>
		<!-- 부트스트랩 container 클래스: 반응형 컨테이너 -->
		<!-- Bootstrap의 그리드 시스템을 사용하여 행(row) 생성 -->
		<div class="row">
			<!-- g-5: 열(column)과 행(row) 간 간격 설정 (32px) -->

			<!-- /product/img/jeju1.jpg -->

			<!-- 메인 콘텐츠 영역 (검색 결과 패키지 리스트) -->
			<div class="col-md-12">
				<div class="row row-cols-1 row-cols-md-3 g-4">
					<!-- 여행 패키지 카드 1 -->
					<c:if test="${empty list}">
						<p>검색된 결과가 없습니다.</p>
					</c:if>
					<c:forEach var="item" items="${list}">
						<div class="col">
							<div class="card h-100">
								<img src="/product/img/jeju1.jpg" class="card-img-top"
									alt="도쿄 패키지 4일">
								<div class="card-body">
									<h5 class="card-title">${item.package_name }</h5>
									<p class="card-text">${item.package_info}</p>
									<p class="card-text">
										<small class="text-muted">아시아나 항공 | 에어텔</small>
									</p>
									<div class="d-flex justify-content-between align-items-center">
										<span class="fw-bold text-primary">₩${item.package_price }
											~</span> <a href="/pakage/packages.do?package_id=${item.package_id }"
											class="btn btn-outline-primary">상품 상세 보기</a>
										<button class="wishlist-btn" style="border: none; background: none;" data-package-id="${item.package_id}">
										    <img class="wishlist-icon" style=" width: 15px; height: auto;" src="${pageContext.request.contextPath}/product/img/heart.png">
										</button>												
									</div>
								</div>
							</div>
						</div>
					</c:forEach>

				</div>
			</div>

			<!-- 메인 콘텐츠 영역 (블로그 포스트) end -->


		</div>
		<!-- row end -->

	</div>
	<!-- container 종료 -->
</div>
<!-- 메인 섹션 종료 -->

<script>
    const CONTEXT_PATH = "<%=request.getContextPath()%>";
</script>

<%@ include file="../fragments/footer.jsp"%>