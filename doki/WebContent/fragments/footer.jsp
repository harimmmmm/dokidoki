<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 사이트 푸터 (footer) 시작 -->
<div class="site-footer">
	<!-- 첫 번째 푸터 섹션 -->
	<div class="inner first">
		<div class="container">
			<div class="row">
				<!-- 사이트 소개 -->
				<div class="col-md-6 col-lg-4">
					<div class="widget">
						<h3 class="heading">どきどきKoreaとは？</h3>
						<p>
							韓国旅行の魅力をたっぷりお届けする<br>「どきどきKorea」！<br>
							人気観光地、グルメ、ショッピング、文化体験まで、<br> あなたの理想の韓国旅行を実現するための<br>ベストなツアーをご用意しています。
							<br>手間なしで予約し、安心して韓国を満喫しましょう！
						</p>
					</div>
					<!-- 소셜 미디어 -->
					<div class="widget">
						<ul class="list-unstyled social">
							<li><a href="#"><span class="icon-twitter"></span></a></li>
							<li><a href="#"><span class="icon-instagram"></span></a></li>
							<li><a href="#"><span class="icon-facebook"></span></a></li>
							<li><a href="#"><span class="icon-linkedin"></span></a></li>
							<li><a href="#"><span class="icon-dribbble"></span></a></li>
							<li><a href="#"><span class="icon-pinterest"></span></a></li>
						</ul>
					</div>
				</div>

				<!-- 연락처 정보 -->
				<div class="col-md-6 col-lg-4">
					<div class="widget">
						<h3 class="heading">Contact</h3>
						<ul class="list-unstyled quick-info links">
							<li class="email"><a href="mailto:mail@example.com">mail@example.com</a></li>
							<li class="phone"><a href="tel:+82422424412">+82 42 242 4412</a></li>
							<li class="address">
								<a href="https://maps.app.goo.gl/jtpxhYeN5ZySwKYR9">
									大韓民国 大田広域市 中区 鶏龍路 825 希英ビル 5階・7階<br>
									5F, 7F, Hwiyeong Building, 825 Gyeryong-ro, Jung-gu, Daejeon, Republic of Korea
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 스크롤 탑 버튼 -->
	<button onclick="scrollToTop()" id="topBtn">
	    <img src="/images/up-arrow.png" alt="TOP">
	</button>

	<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
	    var swiper = new Swiper(".swiper", {
	        loop: true,
	        autoplay: { delay: 5000, disableOnInteraction: false },
	        pagination: { el: ".swiper-pagination", clickable: true },
	        navigation: { nextEl: ".swiper-button-next", prevEl: ".swiper-button-prev" },
	    });
	});

	window.onscroll = function () {
	    var topBtn = document.getElementById("topBtn");
	    if (document.body.scrollTop > 300 || document.documentElement.scrollTop > 300) {
	        topBtn.style.display = "block";  
	    } else {
	        topBtn.style.display = "none";   
	    }
	};

	function scrollToTop() {
	    window.scrollTo({ top: 0, behavior: 'smooth' });
	}
	</script>
</div>
