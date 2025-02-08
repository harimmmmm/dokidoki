<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 사이트 푸터 (footer) 시작 -->
<div class="site-footer">

	<!-- 첫 번째 푸터 섹션 (기본 정보 및 소셜 링크) -->
	<div class="inner first">
		<div class="container">
			<div class="row">

				<!-- About Tour: 사이트 소개 및 소셜 미디어 링크 -->
				<div class="col-md-6 col-lg-4">
					<div class="widget">
						<h3 class="heading">どきどきKoreaとは？</h3>
						<p>
							韓国旅行の魅力をたっぷりお届けする<br>「どきどきKorea」！<br>
							人気観光地、グルメ、ショッピング、文化体験まで、<br> あなたの理想の韓国旅行を実現するための<br>ベストなツアーをご用意しています。
							<br>手間なしで予約し、安心して韓国を満喫しましょう！
						</p>
					</div>
					<!-- 소셜 미디어 아이콘 -->
					<div class="widget">
						<ul class="list-unstyled social">
							<li><a href="#"><span class="icon-twitter"></span></a></li>
							<!-- 트위터 -->
							<li><a href="#"><span class="icon-instagram"></span></a></li>
							<!-- 인스타그램 -->
							<li><a href="#"><span class="icon-facebook"></span></a></li>
							<!-- 페이스북 -->
							<li><a href="#"><span class="icon-linkedin"></span></a></li>
							<!-- 링크드인 -->
							<li><a href="#"><span class="icon-dribbble"></span></a></li>
							<!-- 드리블 -->
							<li><a href="#"><span class="icon-pinterest"></span></a></li>
							<!-- 핀터레스트 -->
							<li><a href="#"><span class="icon-apple"></span></a></li>
							<!-- 애플 -->
							<li><a href="#"><span class="icon-google"></span></a></li>
							<!-- 구글 -->
						</ul>
					</div>
				</div>
				<!-- About Tour 섹션 종료 -->

				<!-- 사이트 주요 페이지 링크 (Pages) -->
				<div class="col-md-6 col-lg-2 pl-lg-5">
					<div class="widget">
						<h3 class="heading">Pages</h3>
						<ul class="links list-unstyled">
							<li><a href="#">Blog</a></li>
							<!-- 블로그 페이지 -->
							<li><a href="#">About</a></li>
							<!-- 회사 소개 페이지 -->
							<li><a href="#">Contact</a></li>
							<!-- 연락처 페이지 -->
						</ul>
					</div>
				</div>
				<!-- 주요 페이지 섹션 종료 -->

				<!-- 추가적인 리소스 페이지 (Resources) -->
				<div class="col-md-6 col-lg-2">
					<div class="widget">
						<h3 class="heading">Resources</h3>
						<ul class="links list-unstyled">
							<li><a href="#">Blog</a></li>
							<!-- 블로그 페이지 -->
							<li><a href="#">About</a></li>
							<!-- 회사 소개 페이지 -->
							<li><a href="#">Contact</a></li>
							<!-- 연락처 페이지 -->
						</ul>
					</div>
				</div>
				<!-- 리소스 섹션 종료 -->

				<!-- 연락처 정보 (Contact) -->
				<div class="col-md-6 col-lg-4">
					<div class="widget">
						<h3 class="heading">Contact</h3>
						<ul class="list-unstyled quick-info links">
							<li class="email"><a href="#">mail@example.com</a></li>
							<!-- 이메일 -->
							<li class="phone"><a href="#">+82 42 242 4412</a></li>
							<!-- 전화번호 -->
							<li class="address"><a
								href="https://maps.app.goo.gl/jtpxhYeN5ZySwKYR9">大韓民国 大田広域市
									中区 鶏龍路 825 希英ビル 5階・7階<br>5F, 7F, Hwiyeong Building, 825
									Gyeryong-ro, Jung-gu, Daejeon, Republic of Korea
							</a></li>
							<!-- 주소 -->
						</ul>
					</div>
				</div>
				<!-- 연락처 섹션 종료 -->

			</div>
			<!-- row 종료 -->
		</div>
		<!-- container 종료 -->
	</div>
	<!-- 첫 번째 푸터 섹션 종료 -->

	<!-- 두 번째 푸터 섹션 (저작권 정보) -->
	<div class="inner dark">
		<div class="container">
			<div class="row text-center">
				<div class="col-md-8 mb-3 mb-md-0 mx-auto">
					<p>
						Copyright &copy;
						<script>document.write(new Date().getFullYear());</script>
						. All Rights Reserved. &mdash; Designed with love by <a
							href="https://untree.co" class="link-highlight">Untree.co</a>
						<!-- 라이선스 정보: https://untree.co/license/ -->
						Distributed By <a href="https://themewagon.com" target="_blank">ThemeWagon</a>
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- 저작권 정보 섹션 종료 -->

</div>
<!-- 사이트 푸터 종료 -->


<!-- 화면 로딩 오버레이 (로딩 애니메이션을 위한 배경) -->
<div id="overlayer"></div>

<!-- 로딩 애니메이션 (페이지가 로드될 때 표시됨) -->
<div class="loader">
	<!-- Bootstrap의 스피너(로딩 애니메이션) -->
	<div class="spinner-border" role="status">
		<span class="sr-only">Loading...</span>
		<!-- 접근성을 위한 숨겨진 텍스트 -->
	</div>
</div>


<script src="./js/jquery-3.4.1.min.js"></script>
<script src="./js/popper.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/owl.carousel.min.js"></script>
<script src="./js/jquery.animateNumber.min.js"></script>
<script src="./js/jquery.waypoints.min.js"></script>
<script src="./js/jquery.fancybox.min.js"></script>
<script src="./js/aos.js"></script>
<script src="./js/moment.min.js"></script>
<script src="./js/daterangepicker.js"></script>
<script src="./js/typed.js"></script>

<!-- 페이지별 스크립트 실행 여부 체크 -->
<c:if test="${not empty typedJs}">
	<script src="./js/typed.js"></script>
	<script>
	        $(function () {
	            var slides = $('.slides'),
	                images = slides.find('img');
	
	            images.each(function (i) {
	                $(this).attr('data-id', i + 1);
	            });
	
	            var typed = new Typed('.typed-words', {
	                strings: ["ソウル", " プサン", "チェジュ島", " キョンジュ", " チネ"],
	                typeSpeed: 80,
	                backSpeed: 80,
	                backDelay: 4000,
	                startDelay: 1000,
	                loop: true,
	                showCursor: true,
	                preStringTyped: (arrayPos, self) => {
	                    arrayPos++;
	                    console.log(arrayPos);
	                    $('.slides img').removeClass('active');
	                    $('.slides img[data-id="' + arrayPos + '"]').addClass('active');
	                }
	            });
	        });
	    </script>
</c:if>

<script src="./js/custom.js"></script>

</body>

</html>