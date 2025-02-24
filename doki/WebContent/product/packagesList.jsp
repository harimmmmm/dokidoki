<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/fragments/header.jsp" %>
		<link href="<%=request.getContextPath()%>/product/css/allpakagestyle.css" rel="stylesheet">
		<link href="<%=request.getContextPath()%>/product/css/dropdownstyle.css" rel="stylesheet">
		<div class="hero"> <!-- 히어로 섹션: 메인 배경 영역 -->
			<div class="container"> <!-- 컨텐츠를 감싸는 부트스트랩 컨테이너 -->
				<div class="row align-items-center"> <!-- 세로 중앙 정렬된 그리드 행 -->
					
					<!-- 왼쪽 컨텐츠 영역 -->
					<div class="col-lg-7"> <!-- 화면이 큰 경우 7칸을 차지 -->
						<div class="intro-wrap"> <!-- 여행 소개 문구 및 검색 폼을 감싸는 영역 -->

							<!-- 제목 -->
							<h1 class="mb-5">
								<!-- 동적으로 변경될 여행지 이름 -->
								<span class="d-block"></span>  <br>
								<span class="d-block"> </span> <!-- 동적으로 변경될 여행지 이름 -->
							</h1>

							

						</div> <!-- 여행 소개 및 검색 영역 종료 -->
					</div> <!-- 왼쪽 컨텐츠 영역 종료 -->

					<!-- 오른쪽 이미지 슬라이더 영역 -->
					<div class="col-lg-5"> <!-- 화면이 큰 경우 5칸을 차지 -->
						<div class="swiper productslid">
							<div class="swiper-wrapper ">
								<div class="swiper-slide"><img src="/product/img/productslidimg1.jpg" alt="이미지1"></div>
								<div class="swiper-slide"><img src="/product/img/productslidimg2.jpg" alt="이미지2"></div>
								<div class="swiper-slide"><img src="/product/img/productslidimg3.jpg" alt="이미지3"></div>
								<div class="swiper-slide"><img src="/product/img/productslidimg4.jpg" alt="이미지4"></div>
								<div class="swiper-slide"><img src="/product/img/productslidimg5.jpg" alt="이미지5"></div>
							</div>
							<!-- 네비게이션 & 페이지네이션 -->
							<div class="swiper-button-next"></div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div> <!-- 이미지 슬라이드 영역 종료 -->
					<!-- 여행 검색 폼 -->
					<div class="row">
						<div class="col-12"> <!-- 전체 너비를 차지하는 컬럼 -->
							<form class="form" action="/product/packageSelect.jsp"> <!-- 여행 검색을 위한 폼 -->

								<!-- 여행 검색 필드 -->
								<div class="row mb-2">
									<!-- 목적지 선택 -->
									<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
										<div class="custom-dropdown form-control custom-select">
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
													<div class="option sub-option" data-target="jeolla">전라</div> <!-- 전라 추가 -->
													<div class="option sub-option" data-target="chungcheong">충청</div>
													<div class="option sub-option" data-target="seoul">서울/인천/경기</div>
												</div>

												<div class="column third">
													<!-- ✅ "제주도"을 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="jeju">제주도</div>
													<!-- ✅ "울릉도"을 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="ulleung">울릉도</div>
													<!-- ✅ "강원"을 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="gangwon">강원</div>
													<!-- ✅ "경상"을 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="gyeongsang">경상북도</div>
													<div class="option detail-option d-none" data-parent="gyeongsang">경상남도</div>
													<div class="option detail-option d-none" data-parent="gyeongsang">부산</div>
													<!-- ✅ "전라"를 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="jeolla">전라북도</div>
													<div class="option detail-option d-none" data-parent="jeolla">전라남도</div>
													<!-- ✅ "충청"를 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="chungcheong">충청북도</div>
													<div class="option detail-option d-none" data-parent="chungcheong">충청남도</div>
													<!-- ✅ "서울/인천/경기"를 선택하면 보일 3차 메뉴 -->
													<div class="option detail-option d-none" data-parent="seoul">서울</div>
													<div class="option detail-option d-none" data-parent="seoul">인천</div>
												</div>
												
												
											</div>
										</div>
										
									</div>

									<!-- 출발지 선택 -->
									<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-2">
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
									<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
										<input type="text" class="form-control" name="daterange">
									</div>

									<!-- 검색 버튼 -->
									<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
										<input type="submit" class="btn btn-primary btn-block" value="探す">
									</div>
								</div>


									

							</form> <!-- 여행 검색 폼 종료 -->
						</div>
					</div> <!-- 검색 폼 영역 종료 -->
				</div> <!-- 전체 그리드 행 종료 -->
			</div> <!-- 컨테이너 종료 -->
		</div> <!-- 히어로 섹션 종료 -->

		<!-- 주간상품 섹션 -->
		<section id="weeklyBest">
			<div class="container weeklybesttitle">
				<h2 class="weeklyBestfont"><img src="/product/img/crown.png" alt="crown" class="weeklyBesticon">주간베스트
					TOP4</h2>
				<p class="textcolorccc">지난 한 주간 인기 많았던 상품!</p>
			</div>

			<div class="untree_co-section">
				<div class="container">
					<div class="row">

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="/product/packages.jsp" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

					</div> <!-- row end -->
				</div> <!-- container end -->
			</div> <!-- 상품섹션 end -->
		</section>
		<!-- 주간상품 end -->

		<!-- 패키지지상품 섹션 -->
		<section id="weeklyBest">
			<div class="container weeklybesttitle">
				<h2 class="weeklyBestfont"><img src="/product/img/suitcase.png" alt="suitcase" class="weeklyBesticon">제주
					패키지 여행</h2>
				<p class="textcolorccc">숙소, 식사, 일정 포함! 편하고 알찬 여행!</p>
			</div>

			<div class="untree_co-section">
				<div class="container">
					<div class="row">

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="/product/packages.jsp" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div> <!-- row end -->
				</div> <!-- container end -->
			</div> <!-- 상품섹션 end -->
		</section>
		<!-- 패키지상품 end -->

		<!-- 신상품 섹션 -->
		<section id="weeklyBest">
			<div class="container weeklybesttitle">
				<h2 class="weeklyBestfont"><img src="/product/img/star.png" alt="star" class="weeklyBesticon">따끈따끈 신규상품
				</h2>
				<p class="textcolorccc">새로 오픈한 제주여행 상품!</p>
			</div>

			<div class="untree_co-section">
				<div class="container">
					<div class="row">

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

						<div class="col-6 col-md-6 col-lg-3">
							<div class="media-1">
								<a href="#" class="d-block mb-3">
									<img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid">
									<div class="d-flex">
										<div>
											<h3>
												title
											</h3>
											<p>price</p>
										</div>
									</div>
								</a>
							</div>
						</div>

					</div> <!-- row end -->
				</div> <!-- container end -->
			</div> <!-- 상품섹션 end -->
		</section>
		<!-- 신상품 end -->
		
		<%@ include file="/fragments/footer.jsp" %>