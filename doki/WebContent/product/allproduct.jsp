<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/@docsearch/css@3">
<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">


<!-- Custom styles for this template -->
<link href="<%=request.getContextPath()%>/product/css/sidebars.css"
	rel="stylesheet">
	
	
	
<div class="hero hero-inner">
	<div class="container">
		<div class="row align-items-center">
			<div class="col-lg-6 mx-auto text-center">
				<div class="intro-wrap">
					<h1 class="mb-0">Our Services</h1>
					<p class="text-white">Far far away, behind the word mountains,
						far from the countries Vokalia and Consonantia, there live the
						blind texts.</p>
				</div>
			</div>
		</div>
	</div>
</div>



<!-- 메인 섹션을 감싸는 div -->
<div class="untree_co-section">
	<div class="container">
		<!-- 부트스트랩 container 클래스: 반응형 컨테이너 -->
		<!-- Bootstrap의 그리드 시스템을 사용하여 행(row) 생성 -->
		<div class="row g-5">
			<!-- g-5: 열(column)과 행(row) 간 간격 설정 (32px) -->

			<!-- 사이드바 (최근 글, 아카이브, SNS 링크) -->
			<div class="col-md-4">
				<!-- 중간 크기 이상에서 4/12 너비 차지 -->
				<div class="position-sticky" style="top: 2rem;">
					<!-- 스크롤 시 고정되는 스타일 -->

					<div class="flex-shrink-0 p-3 bg-white" style="width: 280px;">
						<a href="/"
							class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
							<svg class="bi me-2" width="30" height="24">
								<use xlink:href="#bootstrap"></use></svg> <span
							class="fs-5 fw-semibold">Collapsible</span>
						</a>
						<ul class="list-unstyled ps-0">
							<li class="mb-1">
								<button
									class="btn btn-toggle align-items-center rounded collapsed"
									data-bs-toggle="collapse" data-bs-target="#home-collapse"
									aria-expanded="false">Home</button>
								<div class="collapse" id="home-collapse" style="">
									<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
										<li><a href="#" class="link-dark rounded">Overview</a></li>
										<li><a href="#" class="link-dark rounded">Updates</a></li>
										<li><a href="#" class="link-dark rounded">Reports</a></li>
									</ul>
								</div>
							</li>
							<li class="mb-1">
								<button
									class="btn btn-toggle align-items-center rounded collapsed"
									data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
									aria-expanded="false">Dashboard</button>
								<div class="collapse" id="dashboard-collapse" style="">
									<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
										<li><a href="#" class="link-dark rounded">Overview</a></li>
										<li><a href="#" class="link-dark rounded">Weekly</a></li>
										<li><a href="#" class="link-dark rounded">Monthly</a></li>
										<li><a href="#" class="link-dark rounded">Annually</a></li>
									</ul>
								</div>
							</li>
							<li class="mb-1">
								<button class="btn btn-toggle align-items-center rounded"
									data-bs-toggle="collapse" data-bs-target="#orders-collapse"
									aria-expanded="true">Orders</button>
								<div class="collapse show" id="orders-collapse" style="">
									<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
										<li><a href="#" class="link-dark rounded">New</a></li>
										<li><a href="#" class="link-dark rounded">Processed</a></li>
										<li><a href="#" class="link-dark rounded">Shipped</a></li>
										<li><a href="#" class="link-dark rounded">Returned</a></li>
									</ul>
								</div>
							</li>
							<li class="border-top my-3"></li>
							<li class="mb-1">
								<button class="btn btn-toggle align-items-center rounded"
									data-bs-toggle="collapse" data-bs-target="#account-collapse"
									aria-expanded="true">Account</button>
								<div class="collapse show" id="account-collapse" style="">
									<ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
										<li><a href="#" class="link-dark rounded">New...</a></li>
										<li><a href="#" class="link-dark rounded">Profile</a></li>
										<li><a href="#" class="link-dark rounded">Settings</a></li>
										<li><a href="#" class="link-dark rounded">Sign out</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</div>

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
