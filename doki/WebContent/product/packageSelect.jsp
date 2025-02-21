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




<!-- 메인 섹션을 감싸는 div -->
<div class="untree_co-section">
	<div class="container titleunderLine">
		<div class="row">
			<div class="col-12">
				<!-- 전체 너비를 차지하는 컬럼 -->
				<form class="form topnav">
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
											<div class="option main-option active" data-target="domestic">국내</div>
										</div>
										<!-- 2단계 -->
										<div class="column second">
											<div class="option sub-option" data-target="jeju">제주도</div>
											<div class="option sub-option" data-target="ulleung">울릉도</div>
											<div class="option sub-option" data-target="gangwon">강원</div>
											<div class="option sub-option" data-target="gyeongsang">경상</div>
											<div class="option sub-option" data-target="jeolla">전라</div>
											<!-- 전라 추가 -->
											<div class="option sub-option" data-target="chungcheong">충청</div>
											<div class="option sub-option" data-target="seoul">서울/인천/경기</div>
										</div>

										<div class="column third">
											<!-- ✅ "제주도"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="jeju">제주도</div>
											<!-- ✅ "울릉도"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none"
												data-parent="ulleung">울릉도</div>
											<!-- ✅ "강원"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none"
												data-parent="gangwon">강원</div>
											<!-- ✅ "경상"을 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none"
												data-parent="gyeongsang">경상북도</div>
											<div class="option detail-option d-none"
												data-parent="gyeongsang">경상남도</div>
											<div class="option detail-option d-none"
												data-parent="gyeongsang">부산</div>
											<!-- ✅ "전라"를 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="jeolla">전라북도</div>
											<div class="option detail-option d-none" data-parent="jeolla">전라남도</div>
											<!-- ✅ "충청"를 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none"
												data-parent="chungcheong">충청북도</div>
											<div class="option detail-option d-none"
												data-parent="chungcheong">충청남도</div>
											<!-- ✅ "서울/인천/경기"를 선택하면 보일 3차 메뉴 -->
											<div class="option detail-option d-none" data-parent="seoul">서울</div>
											<div class="option detail-option d-none" data-parent="seoul">인천</div>
										</div>


									</div>
								</div>
							</div>

							<!-- 오른쪽 콘텐츠 (출발지 선택과 날짜 입력을 같이 배치) -->
							<div class="d-flex col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-8">
								<!-- 출발지 선택 -->
								<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-6">
									<select name="" id="" class="form-control custom-select">
										<option value="">도쿄</option>
										<option value="">오사카</option>
										<option value="">후쿠오카</option>
										<option value="">나고야</option>
										<option value="">삿포로</option>
										<option value="">오키나와</option>
										<option value="">기타</option>
									</select>
								</div>

								<!-- 날짜 입력 -->
								<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-6">
									<input type="text" class="form-control" name="daterange">
								</div>
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
		<!-- 부트스트랩 container 클래스: 반응형 컨테이너 -->
		<!-- Bootstrap의 그리드 시스템을 사용하여 행(row) 생성 -->
		<div class="row g-5">
			<!-- g-5: 열(column)과 행(row) 간 간격 설정 (32px) -->

			<!-- 사이드바 (최근 글, 아카이브, SNS 링크) -->
			<div class="col-md-4">
				<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
					<span
						class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
						<span class="fs-5 fw-semibold">검색 필터</span>
					</span>

					<!-- 여행기간 드롭다운 -->
					<div class="mb-3">
						<button class="btn btn-toggle" data-bs-toggle="collapse"
							data-bs-target="#home-collapse" aria-expanded="false">
							여행기간</button>
						<div class="collapse" id="home-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><button class="travel-period-btn filter-btn"
										onclick="setFilter('travelPeriod', '2박')">2박</button></li>
								<li><button class="travel-period-btn filter-btn"
										onclick="setFilter('travelPeriod', '3박')">3박</button></li>
							</ul>
						</div>
					</div>

					<!-- 여행컨셉 드롭다운 -->
					<div class="mb-3">
						<button class="btn btn-toggle" data-bs-toggle="collapse"
							data-bs-target="#dashboard-collapse" aria-expanded="false">
							여행컨셉</button>
						<div class="collapse" id="dashboard-collapse">
							<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
								<li><button class="travel-concept-btn filter-btn"
										onclick="setFilter('travelConcept', '관광')">관광</button></li>
								<li><button class="travel-concept-btn filter-btn"
										onclick="setFilter('travelConcept', '트래킹')">트래킹</button></li>
								<li><button class="travel-concept-btn filter-btn"
										onclick="setFilter('travelConcept', '아동동반')">아동동반</button></li>
								<li><button class="travel-concept-btn filter-btn"
										onclick="setFilter('travelConcept', '효도')">효도</button></li>
							</ul>
						</div>
					</div>

					<!-- 초기화 버튼 -->
					<button class="btn btn-secondary" onclick="resetFilters()">초기화</button>
				</div>
			</div>



			<!-- 메인 콘텐츠 영역 (블로그 포스트) -->
			<div class="col-md-8">
				<!-- col-md-8: 중간 화면(md) 이상에서는 전체 너비의 8/12 차지 -->

				<!-- 블로그 섹션 헤더 -->
				<h3 class="pb-4 mb-4 fst-italic border-bottom">From the
					Firehose</h3>

				<!-- 첫 번째 블로그 포스트 -->
				<article class="blog-post">
					<h2 class="display-5 link-body-emphasis mb-1">Sample blog post</h2>
					<p class="blog-post-meta">
						January 1, 2021 by <a href="#">Mark</a>
					</p>

					<p>이 블로그 포스트는 부트스트랩에서 지원하는 다양한 콘텐츠 유형(타이포그래피, 목록, 테이블 등)을
						보여줍니다.</p>
					<hr>
					<p>추가적인 더미 텍스트 내용...</p>

					<!-- 블록 인용문 -->
					<h2>Blockquotes</h2>
					<p>이것은 블록 인용문 예제입니다:</p>
					<blockquote class="blockquote">
						<p>인용된 텍스트가 여기에 표시됩니다.</p>
					</blockquote>

					<!-- 목록 예제 -->
					<h3>Example lists</h3>
					<p>순서 없는 목록(Unordered list):</p>
					<ul>
						<li>첫 번째 리스트 아이템</li>
						<li>설명이 긴 두 번째 리스트 아이템</li>
						<li>마지막 리스트 아이템</li>
					</ul>

					<p>순서 있는 목록(Ordered list):</p>
					<ol>
						<li>첫 번째 리스트 아이템</li>
						<li>설명이 긴 두 번째 리스트 아이템</li>
						<li>마지막 리스트 아이템</li>
					</ol>

					<!-- 정의 목록 -->
					<p>정의 목록(Definition list):</p>
					<dl>
						<dt>HTML</dt>
						<dd>웹 페이지의 콘텐츠를 정의하는 마크업 언어</dd>
						<dt>CSS</dt>
						<dd>웹 콘텐츠의 스타일을 정의하는 스타일 시트 언어</dd>
						<dt>JavaScript</dt>
						<dd>동적 웹 사이트 및 애플리케이션을 구축하는 프로그래밍 언어</dd>
					</dl>

					<!-- 인라인 HTML 요소 예제 -->
					<h2>Inline HTML elements</h2>
					<p>부트스트랩에서 지원하는 인라인 HTML 요소:</p>
					<ul>
						<li><strong>굵은 텍스트</strong>는 <code>&lt;strong&gt;</code>을 사용.</li>
						<li><em>기울임꼴 텍스트</em>는 <code>&lt;em&gt;</code>을 사용.</li>
						<li>약어(예: <abbr title="HyperText Markup Language">HTML</abbr>)는
							<code>&lt;abbr&gt;</code>을 사용.
						</li>
						<li><cite>인용문</cite>은 <code>&lt;cite&gt;</code>을 사용.</li>
						<li><del>삭제된 텍스트</del>는 <code>&lt;del&gt;</code>, <ins>추가된
								텍스트</ins>는 <code>&lt;ins&gt;</code>을 사용.</li>
						<li>위 첨자 <sup>텍스트</sup>와 아래 첨자 <sub>텍스트</sub>를 사용할 수 있음.
						</li>
					</ul>

					<!-- 코드 블록 -->
					<h3>Sub-heading</h3>
					<pre>
						<code>Example code block</code>
					</pre>
				</article>

				<!-- 두 번째 블로그 포스트 -->
				<article class="blog-post">
					<h2 class="display-5 link-body-emphasis mb-1">Another blog
						post</h2>
					<p class="blog-post-meta">
						December 23, 2020 by <a href="#">Jacob</a>
					</p>

					<blockquote>
						<p>
							긴 인용문 예제, 강조된 <strong>텍스트</strong> 포함.
						</p>
					</blockquote>

					<!-- 테이블 예제 -->
					<h3>Example table</h3>
					<table class="table">
						<thead>
							<tr>
								<th>Name</th>
								<th>Upvotes</th>
								<th>Downvotes</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>Alice</td>
								<td>10</td>
								<td>11</td>
							</tr>
							<tr>
								<td>Bob</td>
								<td>4</td>
								<td>3</td>
							</tr>
						</tbody>
					</table>
				</article>

				<!-- 블로그 페이지네이션 -->
				<nav class="blog-pagination" aria-label="Pagination">
					<a class="btn btn-outline-primary rounded-pill" href="#">Older</a>
					<a class="btn btn-outline-secondary rounded-pill disabled"
						aria-disabled="true">Newer</a>
				</nav>
			</div>


		</div>

	</div>
	<!-- container 종료 -->
</div>
<!-- 메인 섹션 종료 -->



<%@ include file="../fragments/footer.jsp"%>
