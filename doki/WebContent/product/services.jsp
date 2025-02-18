<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ include file="/fragments/header.jsp" %>
		<link href="<%=request.getContextPath()%>/product/css/allpakagestyle.css" rel="stylesheet">

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
		<!-- 주간상품 섹션 -->
		<section id="weeklyBest">
			<div class="container weeklybesttitle">
				<img src="/product/img/crown.png" alt="crown" class="weeklyBesticon">
				<h2>주간베스트 TOP4</h2>
				<p>지난 한 주간 인기 많았던 상품!</p>
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
		<!-- 주간상품 end -->


		<%@ include file="/fragments/footer.jsp" %>