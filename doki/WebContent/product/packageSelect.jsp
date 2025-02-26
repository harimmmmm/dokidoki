<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

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
  								<input type="hidden" name="destination" id="selectedDestination" value="${param.destination}">
							</div>

							<!-- 오른쪽 콘텐츠 (출발지 선택과 날짜 입력을 같이 배치) -->
							<div class="d-flex col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-8">
								<!-- 출발지 선택 -->
								<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-6">
									<select name="departure" id="departure" class="form-control custom-select">
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
									<input type="text" class="form-control" name="datePicker" id="datePicker">
								</div>
								<!-- hidden 필드 추가 -->
								<input type="hidden" id="startDateHidden" name="startDate">
								<input type="hidden" id="endDateHidden" name="endDate">
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
		<div class="row g-5">
			<!-- g-5: 열(column)과 행(row) 간 간격 설정 (32px) -->

			<!-- 사이드바 (최근 글, 아카이브, SNS 링크) -->
			<div class="col-md-4">
				<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
					<span
						class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom d-flex justify-content-between">
						<span class="fs-5 fw-semibold">검색 필터</span> <!-- 초기화 버튼 -->
						<button class="resetbtnform" onclick="resetFilters()">
							초기화<img class="img-fluid resetbtn" alt="resetbtn"
								src="/product/img/reset.png">
						</button>

					</span>

					<!-- 투어조건 필터 -->
					<div class="mb-3 filterUnderLine">
						<button class="btn btn-toggle bordernone"
							data-bs-toggle="collapse"
							data-bs-target="#tour-conditions-collapse" aria-expanded="false">
							투어조건 <span class="toggle-icon"> <img
								src="/product/img/arrow.png" alt="토글 아이콘">
							</span>
						</button>
						<div class="collapse" id="tour-conditions-collapse">

							<!-- 쇼핑 필터 -->
							<div class="mb-2">
								<label class="fw-bold">쇼핑</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn shopping-btn"
											data-value="없음">없음</button></li>
									<li><button class="filter-btn shopping-btn"
											data-value="1회">1회</button></li>
								</ul>
							</div>

							<!-- 선택관광 필터 -->
							<div class="mb-2">
								<label class="fw-bold">선택관광</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn optional-tour-btn"
											data-value="없음(노옵션)">없음(노옵션)</button></li>
								</ul>
							</div>

							<!-- 자유일정 필터 -->
							<div class="mb-2">
								<label class="fw-bold">자유일정</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn free-schedule-btn"
											data-value="전일정">전일정</button></li>
									<li><button class="filter-btn free-schedule-btn"
											data-value="일부(하루이상)">일부(하루이상)</button></li>
									<li><button class="filter-btn free-schedule-btn"
											data-value="일부(하루미만)">일부(하루미만)</button></li>
									<li><button class="filter-btn free-schedule-btn"
											data-value="없음">없음</button></li>
								</ul>
							</div>

							<!-- 현지 필수 경비 필터 -->
							<div class="mb-2">
								<label class="fw-bold">현지 필수 경비 (가이드&기사팁)</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn local-expense-btn"
											data-value="없음(노팁)">없음(노팁)</button></li>
								</ul>
							</div>

							<!-- 현지 가이드 필터 -->
							<div class="mb-2">
								<label class="fw-bold">현지 가이드</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn local-guide-btn"
											data-value="전일정포함">전일정포함</button></li>
									<li><button class="filter-btn local-guide-btn"
											data-value="전일정불포함">전일정불포함</button></li>
									<li><button class="filter-btn local-guide-btn"
											data-value="포함(일부불포함)">포함(일부불포함)</button></li>
								</ul>
							</div>

							<!-- 식사료 필터 -->
							<div class="mb-2">
								<label class="fw-bold">식사료</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn meal-btn" data-value="불포함">불포함</button></li>
									<li><button class="filter-btn meal-btn" data-value="일부 포함">일부
											포함</button></li>
									<li><button class="filter-btn meal-btn"
											data-value="전 일정 포함">전 일정 포함</button></li>
								</ul>
							</div>

						</div>
					</div>


					<!-- 여행기간 필터 -->
					<div class="mb-3 filterUnderLine">
						<button class="btn btn-toggle bordernone"
							data-bs-toggle="collapse" data-bs-target="#home-collapse"
							aria-expanded="false">
							여행기간<span class="toggle-icon"> <img
								src="/product/img/arrow.png" alt="토글 아이콘">
							</span>
						</button>
						<div class="collapse" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><button class="filter-btn travel-period-btn"
										data-value="2박 3일">2박 3일</button></li>
								<li><button class="filter-btn travel-period-btn"
										data-value="3박 4일">3박 4일</button></li>
							</ul>
						</div>
					</div>

					<!-- 여행컨셉 필터 -->
					<div class="mb-3 filterUnderLine">
						<button class="btn btn-toggle bordernone"
							data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
							aria-expanded="false">
							여행컨셉<span class="toggle-icon"> <img
								src="/product/img/arrow.png" alt="토글 아이콘">
							</span>
						</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><button class="filter-btn travel-concept-btn"
										data-value="관광">관광</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="휴양">휴양</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="골프">골프</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="크루즈">크루즈</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="테마파크">테마파크</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="축제">축제</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="쇼핑">쇼핑</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="온천">온천</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="전문가">전문가</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="아동동반">아동동반</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="자유일정">자유일정</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="미식">미식</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="효도">효도</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="커플">커플</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="가족">가족</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="친구">친구</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="리조트">리조트</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="관광+휴양">관광+휴양</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="직장인">직장인</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="문화">문화</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="스파">스파</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="로컬">로컬</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="가톨릭 성지순례">가톨릭 성지순례</button></li>
								<li><button class="filter-btn travel-concept-btn"
										data-value="기독교 성지순례">기독교 성지순례</button></li>
							</ul>
						</div>
					</div>


					<!-- 출발시간 필터 -->
					<div class="mb-3 filterUnderLine">
						<button class="btn btn-toggle bordernone"
							data-bs-toggle="collapse"
							data-bs-target="#departure-time-collapse" aria-expanded="false">
							출발시간<span class="toggle-icon"> <img
								src="/product/img/arrow.png" alt="토글 아이콘">
							</span>
						</button>
						<div class="collapse" id="departure-time-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><button class="filter-btn departure-time-btn"
										data-value="오전 0~12시">오전 0~12시</button></li>
								<li><button class="filter-btn departure-time-btn"
										data-value="오후 12시~24시">오후 12시~24시</button></li>
							</ul>
						</div>
					</div>

					<!-- 항공 필터 -->
					<div class="mb-3 filterUnderLine">
						<button class="btn btn-toggle bordernone"
							data-bs-toggle="collapse" data-bs-target="#airline-collapse"
							aria-expanded="false">
							항공<span class="toggle-icon"> <img
								src="/product/img/arrow.png" alt="토글 아이콘">
							</span>
						</button>
						<div class="collapse" id="airline-collapse">

							<!-- 항공사 필터 -->
							<div class="mb-2">
								<label class="fw-bold">항공사</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn airline-btn"
											data-value="항공불포함">항공불포함</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="에어부산">에어부산</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="대한항공">대한항공</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="진에어">진에어</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="아시아나 항공">아시아나 항공</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="AERO K AIRLINES">AERO K AIRLINES</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="에어서울">에어서울</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="티웨이 항공">티웨이 항공</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="에어프레미아">에어프레미아</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="이스타항공">이스타항공</button></li>
									<li><button class="filter-btn airline-btn"
											data-value="제주항공">제주항공</button></li>
								</ul>
							</div>

							<!-- 항공 좌석 등급 필터 -->
							<div class="mb-2">
								<label class="fw-bold">항공좌석등급</label>
								<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
									<li><button class="filter-btn seat-class-btn"
											data-value="이코노미">이코노미</button></li>
									<li><button class="filter-btn seat-class-btn"
											data-value="비즈니스">비즈니스</button></li>
									<li><button class="filter-btn seat-class-btn"
											data-value="불포함">불포함</button></li>
								</ul>
							</div>

						</div>
					</div>



				</div>
			</div>

			<!-- /product/img/jeju1.jpg -->

			<!-- 메인 콘텐츠 영역 (검색 결과 패키지 리스트) -->
			<div class="col-md-8">
				<div class="row row-cols-1 row-cols-md-2 g-4">
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
											~</span> <a href="/product/packages.jsp"
											class="btn btn-outline-primary">상품 상세 보기</a>
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



<%@ include file="../fragments/footer.jsp"%>