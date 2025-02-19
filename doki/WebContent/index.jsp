<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="typedJs" value="true" />
<%@ include file="./fragments/header.jsp"%>


	<div class="hero"> <!-- 히어로 섹션: 메인 배경 영역 -->
		<div class="container"> <!-- 컨텐츠를 감싸는 부트스트랩 컨테이너 -->
			<div class="row align-items-center"> <!-- 세로 중앙 정렬된 그리드 행 -->
	
				<!-- 왼쪽 컨텐츠 영역 -->
				<div class="col-lg-7"> <!-- 화면이 큰 경우 7칸을 차지 -->
					<div class="intro-wrap"> <!-- 여행 소개 문구 및 검색 폼을 감싸는 영역 -->
	
						<!-- 제목 -->
						<h1 class="mb-5">
							<!-- 동적으로 변경될 여행지 이름 -->
							<span class="typed-words"></span> で <br>
							<span class="d-block">素敵な旅を楽しもう！</span> <!-- 동적으로 변경될 여행지 이름 -->
						</h1>
	
						<!-- 여행 검색 폼 -->
						<div class="row">
							<div class="col-12"> <!-- 전체 너비를 차지하는 컬럼 -->
								<form class="form"> <!-- 여행 검색을 위한 폼 -->
	
									<!-- 여행 검색 필드 -->
									<div class="row mb-2">
										<!-- 목적지 선택 -->
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<select name="" id="" class="form-control custom-select">
												<option value="">제주도</option>
												<option value="">서울</option>
												<option value="">충청도</option>
												<option value="">전라도</option>
												<option value="">경상도</option>
												<option value="">강원도</option>
												<option value="">Israel</option>
												<option value="">China</option>
												<option value="">Russia</option>
											</select>
										</div>
	
										<!-- 날짜 입력 -->
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-5">
											<input type="text" class="form-control" name="daterange">
										</div>
	
										<!-- 인원 수 입력 -->
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
											<input type="text" class="form-control"
												placeholder="# 参加人数">
										</div>
									</div>
	
									<!-- 검색 버튼 및 체크박스 -->
									<div class="row align-items-center">
										<!-- 검색 버튼 -->
										<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
											<input type="submit" class="btn btn-primary btn-block"
												value="探す">
										</div>
	
										<!-- 검색 저장 체크박스 -->
										<div class="col-lg-8">
											<label class="control control--checkbox mt-3">
												<span class="caption">この検索を保存する</span> 
												<input type="checkbox" checked="checked" />
												<div class="control__indicator"></div> <!-- 체크박스 스타일용 -->
											</label>
										</div>
									</div>
									
								</form> <!-- 여행 검색 폼 종료 -->
							</div>
						</div> <!-- 검색 폼 영역 종료 -->
	
					</div> <!-- 여행 소개 및 검색 영역 종료 -->
				</div> <!-- 왼쪽 컨텐츠 영역 종료 -->
	
				<!-- 오른쪽 이미지 슬라이더 영역 -->
				<div class="col-lg-5"> <!-- 화면이 큰 경우 5칸을 차지 -->
					<div class="slides"> <!-- 이미지 슬라이드 영역 -->
						<img src="images/hero-slider-11111.jpg" alt="Image" class="img-fluid active"> 
						<img src="images/hero-slider-222.jpg" alt="Image" class="img-fluid">
						<img src="images/hero-slider-333.jpg" alt="Image" class="img-fluid">
						<img src="images/hero-slider-44.jpg" alt="Image" class="img-fluid">
						<img src="images/hero-slider-55.jpg" alt="Image" class="img-fluid">
					</div>
				</div> <!-- 이미지 슬라이드 영역 종료 -->
	
			</div> <!-- 전체 그리드 행 종료 -->
		</div> <!-- 컨테이너 종료 -->
	</div> <!-- 히어로 섹션 종료 -->

	<!-- 컨텐츠 섹션을 감싸는 컨테이너 -->
	<div class="untree_co-section"> 
	    <div class="container"> <!-- 컨텐츠를 담는 컨테이너 -->
	        
	        <!-- 섹션 제목 및 소개 -->
	        <div class="row mb-5 justify-content-center"> <!-- 행을 생성하고 중앙 정렬 -->
	            <div class="col-lg-6 text-center"> <!-- 너비를 6로 설정하고 텍스트 중앙 정렬 -->
	                <h2 class="section-title text-center mb-3">私たちのサービス</h2> <!-- 섹션 제목 -->
	                <p>快適で思い出に残る韓国旅行を、私たちがサポートします！</p> <!-- 섹션 설명 -->
	            </div>
	        </div>
	
	        <div class="row align-items-stretch"> <!-- 세 개의 열을 포함하는 행 -->
	
	            <!-- 왼쪽 이미지 섹션 -->
	            <div class="col-lg-4 order-lg-1"> <!-- 너비 4, 큰 화면에서는 첫 번째 위치 -->
	                <div class="h-100"> <!-- 높이를 100%로 설정 -->
	                    <div class="frame h-100"> <!-- 프레임을 설정 -->
	                        <div class="feature-img-bg h-100"
	                            style="background-image: url('images/hero-slider-2.jpg');">
	                        </div> <!-- 배경 이미지 설정 -->
	                    </div>
	                </div>
	            </div>
	
	            <!-- 가운데 서비스 목록 -->
	            <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-1"> <!-- 가운데 열 -->
	
	                <!-- 첫 번째 서비스: Beautiful Condo -->
	                <div class="feature-1 d-md-flex"> <!-- 서비스 항목 -->
	                    <div class="align-self-center"> <!-- 자체 정렬 -->
	                        <span class="flaticon-house display-4 text-primary"></span> <!-- 아이콘 -->
	                        <h3>オールインワンの快適な宿泊</h3> <!-- 서비스 제목 -->
	                        <p class="mb-0">宿泊・食事・移動が全部込み！選び抜かれた快適なホテルやコンドミニアムをご用意しています。</p> <!-- 서비스 설명 -->
	                    </div>
	                </div>
	
	                <!-- 두 번째 서비스: Restaurants & Cafe -->
	                <div class="feature-1"> <!-- 서비스 항목 -->
	                    <div class="align-self-center"> <!-- 자체 정렬 -->
	                        <span class="flaticon-restaurant display-4 text-primary"></span> <!-- 아이콘 -->
	                        <h3>本場のグルメ体験</h3> <!-- 서비스 제목 -->
	                        <p class="mb-0">人気の韓国グルメやカフェ巡りもおまかせ！地元で評判のレストランをご案内します。</p> <!-- 서비스 설명 -->
	                    </div>
	                </div>
	
	            </div>
	
	            <!-- 오른쪽 서비스 목록 -->
	            <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-3"> <!-- 오른쪽 열 -->
	
	                <!-- 세 번째 서비스: Easy to Connect -->
	                <div class="feature-1 d-md-flex"> <!-- 서비스 항목 -->
	                    <div class="align-self-center"> <!-- 자체 정렬 -->
	                        <span class="flaticon-mail display-4 text-primary"></span> <!-- 아이콘 -->
	                        <h3>簡単・便利な予約</h3> <!-- 서비스 제목 -->
	                        <p class="mb-0" style="padding-bottom:22px;">ワンクリックで簡単予約！日本語対応だから安心してご利用いただけます。</p> <!-- 서비스 설명 -->
	                    </div>
	                </div>
	
	                <!-- 네 번째 서비스: 24/7 Support -->
	                <div class="feature-1 d-md-flex"> <!-- 서비스 항목 -->
	                    <div class="align-self-center"> <!-- 자체 정렬 -->
	                        <span class="flaticon-phone-call display-4 text-primary"></span> <!-- 아이콘 -->
	                        <h3>24時間日本語サポート</h3> <!-- 서비스 제목 -->
	                        <p class="mb-0" style="padding-bottom:58px;">旅行中も安心！24時間対応の日本語カスタマーサポートでいつでもお手伝いします。</p> <!-- 서비스 설명 -->
	                    </div>
	                </div>
	
	            </div>
	
	        </div>
	    </div>
	</div> <!-- 컨텐츠 섹션 종료 -->

	<!-- 숫자 카운터 섹션 -->
	<div class="untree_co-section count-numbers py-5"> 
		<div class="container"> <!-- 부트스트랩 컨테이너 -->
			<div class="row"> <!-- 부트스트랩 행 (Row) -->
				<!-- 첫 번째 카운터: 여행 횟수 -->
				<div class="col-6 col-sm-6 col-md-6 col-lg-3"> <!-- 반응형 그리드: 작은 화면에선 6칸, 큰 화면에선 3칸 -->
					<div class="counter-wrap"> <!-- 카운터 감싸는 컨테이너 -->
						<div class="counter"> <!-- 카운터 숫자를 표시하는 영역 -->
							<span class="" data-number="9313">0</span> <!-- data-number 속성을 사용하여 숫자를 애니메이션으로 증가 -->
						</div>
						<span class="caption">旅行回数</span> <!-- 설명 텍스트 -->
					</div>
				</div>
				<!-- 두 번째 카운터: 고객 수 -->
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="8492">0</span>
						</div>
						<span class="caption">ご利用者数</span>
					</div>
				</div>
				<!-- 세 번째 카운터: 직원 수 -->
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="100">0</span>
						</div>
						<span class="caption">スタッフ数 / 従業員数</span>
					</div>
				</div>
				<!-- 네 번째 카운터: 제휴 관광지 수 -->
				<div class="col-6 col-sm-6 col-md-6 col-lg-3">
					<div class="counter-wrap">
						<div class="counter">
							<span class="" data-number="120">0</span>
						</div>
						<span class="caption">提携観光地数</span>
					</div>
				</div>
			</div>
		</div>
	</div> <!-- 숫자 카운터 섹션  종료 -->


	<!-- 여행지 슬라이드 섹션을 감싸는 컨테이너 -->
	<div class="untree_co-section"> 
	    <div class="container"> <!-- 내부 컨텐츠를 감싸는 컨테이너 -->
	        
	        <!-- 섹션 제목 -->
	        <div class="row text-center justify-content-center mb-5"> <!-- 행을 생성하고 중앙 정렬 -->
	            <div class="col-lg-7"> <!-- 너비를 설정하여 제목 영역 지정 -->
	                <h2 class="section-title text-center">人気の旅行先</h2> <!-- 섹션 제목 -->
	            </div>
	        </div>
	
	        <!-- 이미지 슬라이더 (Owl Carousel 사용) -->
	        <div class="owl-carousel owl-3-slider"> <!-- Owl Carousel을 적용한 슬라이더 컨테이너 -->
	
	            <!-- 첫 번째 여행지: Pragser Wildsee, Italy -->
	            <div class="item"> <!-- 슬라이더 아이템 -->
	                <a class="media-thumb" href="images/hero-slider-1.jpg" data-fancybox="gallery"> <!-- 이미지 확대 기능 (Fancybox 사용) -->
	                    <div class="media-text"> <!-- 이미지 위에 표시될 텍스트 -->
	                        <h3>ソウル</h3> <!-- 여행지 이름 -->
	                        <span class="location"></span> <!-- 여행지 국가 -->
	                    </div> 
	                    <img src="images/hero-slider-1.jpg" alt="Image" class="img-fluid" style="height: 300px"> <!-- 여행지 이미지 -->
	                </a>
	            </div>
	
	            <!-- 두 번째 여행지: Oia, Greece -->
	            <div class="item">
	                <a class="media-thumb" href="images/hero-slider-2.jpg" data-fancybox="gallery">
	                    <div class="media-text">
	                        <h3>プサン</h3>
	                        <span class="location"></span>
	                    </div> 
	                    <img src="images/hero-slider-2.jpg" alt="Image" class="img-fluid" style="height: 300px">
	                </a>
	            </div>
	
	            <!-- 세 번째 여행지: Perhentian Islands, Malaysia -->
	            <div class="item">
	                <a class="media-thumb" href="images/hero-slider-3.jpg" data-fancybox="gallery">
	                    <div class="media-text">
	                        <h3>チェジュ島</h3>
	                        <span class="location"></span>
	                    </div> 
	                    <img src="images/hero-slider-3.jpg" alt="Image" class="img-fluid" style="height: 300px">
	                </a>
	            </div>
	
	            <!-- 네 번째 여행지: Rialto Bridge, Italy -->
	            <div class="item">
	                <a class="media-thumb" href="images/hero-slider-4.jpg" data-fancybox="gallery">
	                    <div class="media-text">
	                        <h3>キョンジュ</h3>
	                        <span class="location"></span>
	                    </div> 
	                    <img src="images/hero-slider-4.jpg" alt="Image" class="img-fluid" style="height: 300px">
	                </a>
	            </div>
	
	            <!-- 다섯 번째 여행지: San Francisco, United States -->
	            <div class="item">
	                <a class="media-thumb" href="images/hero-slider-5.jpg" data-fancybox="gallery">
	                    <div class="media-text">
	                        <h3>チネ</h3>
	                        <span class="location"></span>
	                    </div> 
	                    <img src="images/hero-slider-5.jpg" alt="Image" class="img-fluid" style="height: 300px">
	                </a>
	            </div>
	
	            <!-- 여섯 번째 여행지: Lake Thun, Switzerland -->
	            <div class="item">
	                <a class="media-thumb" href="images/hero-slider-1.jpg" data-fancybox="gallery">
	                    <div class="media-text">
	                        <h3>チョンジュ</h3>
	                        <span class="location"></span>
	                    </div> 
	                    <img src="images/hero-slider-2.jpg" alt="Image" class="img-fluid" style="height: 300px">
	                </a>
	            </div>
	
	        </div> <!-- 슬라이더 끝 -->
	
	    </div> <!-- 컨테이너 끝 -->
	</div> <!-- 여행지 슬라이드 섹션 끝 -->

	
	<!-- 전체 Testimonials(사용자 리뷰) 섹션 -->
	<div class="untree_co-section testimonial-section mt-5">
	    <div class="container"> <!-- 컨텐츠를 감싸는 컨테이너 -->
	
	        <div class="row justify-content-center"> <!-- 행을 중앙 정렬 -->
	            <div class="col-lg-7 text-center"> <!-- 너비를 설정하고 텍스트 중앙 정렬 -->
	                
	                <!-- 섹션 제목 -->
	                <h2 class="section-title text-center mb-5">お客様の声</h2>
	
	                <!-- Owl Carousel (슬라이더) -->
	                <div class="owl-single owl-carousel no-nav"> <!-- 슬라이더 컨테이너 (Owl Carousel 사용) -->
	
	                    <!-- 첫 번째 후기 (Adam Aderson) -->
	                    <div class="testimonial mx-auto"> <!-- 개별 리뷰 카드 -->
	                        <figure class="img-wrap"> <!-- 이미지 래퍼 -->
	                            <img src="images/person_2.jpg" alt="Image" class="img-fluid"> <!-- 사용자 사진 -->
	                        </figure>
	                        <h3 class="name">Dr.ヒルルク</h3> <!-- 리뷰 작성자 이름 -->
	                        <blockquote> <!-- 인용구 -->
	                            <p>&ldquo;人は 何時死ぬと思う<br>心臓を ピストルで 撃ち抜かれた とき<br>違う<br>不治の 病に おかされた とき<br>違う<br>人に 忘れられた ときさ&rdquo;</p> <!-- 리뷰 내용 -->
	                        </blockquote>
	                    </div>
	
	                    <!-- 두 번째 후기 (Lukas Devlin) -->
	                    <div class="testimonial mx-auto">
	                        <figure class="img-wrap">
	                            <img src="images/person_3.jpg" alt="Image" class="img-fluid">
	                        </figure>
	                        <h3 class="name">桜木 花道</h3>
	                        <blockquote>
	                            <p>&ldquo;左手はそえるだけ。&rdquo;</p>
	                        </blockquote>
	                    </div>
	
	                    <!-- 세 번째 후기 (Kayla Bryant) -->
	                    <div class="testimonial mx-auto">
	                        <figure class="img-wrap">
	                            <img src="images/person_4.jpg" alt="Image" class="img-fluid">
	                        </figure>
	                        <h3 class="name">ショウ・タッカー</h3>
	                        <blockquote>
	                            <p>&ldquo;君のような勘のいいガキは嫌いだよ&rdquo;</p>
	                        </blockquote>
	                    </div>
	
	                </div> <!-- Owl Carousel 끝 -->
	
	            </div> <!-- 중앙 컬럼 끝 -->
	        </div> <!-- 행 끝 -->
	
	    </div> <!-- 컨테이너 끝 -->
	</div> <!-- 전체 사용자 리뷰 섹션  끝 -->



	<!-- Special Offers & Discounts 섹션 시작 -->
	<div class="untree_co-section">
	    <!-- 부트스트랩 컨테이너: 전체 콘텐츠를 감싸는 역할 (반응형) -->
	    <div class="container">
	        
	        <!-- 제목 및 소개 문구 (가운데 정렬) -->
	        <div class="row justify-content-center text-center mb-5">
	            <div class="col-lg-6">
	                <!-- 섹션 제목 -->
	                <h2 class="section-title text-center mb-3">スペシャルオファー & 割引情報</h2>
	                <!-- 섹션 설명 문구 -->
					<p>遠く離れた場所でも、特別な旅をお得に楽しみましょう！<br> 今だけの限定プランや、お得なパッケージツアーをご用意しています。<br>
						夢のような韓国旅行を、最高の価格で体験してください！</p>
				</div>
	        </div>
	        <!-- 제목 및 소개 문구 끝 -->
	
	        <!-- 여행 상품 목록 (4개의 개별 상품 카드) -->
	        <div class="row">
	            
	            <!-- 첫 번째 여행 상품 -->
	            <div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
	                <div class="media-1">
	                    <!-- 여행지 이미지 (링크 포함) -->
	                    <a href="#" class="d-block mb-3">
	                        <img src="images/hero-slider-1.jpg" alt="Image" class="img-fluid">
	                    </a>
	                    <!-- 여행지 위치 정보 -->
	                    <span class="d-flex align-items-center loc mb-2">
	                        <span class="icon-room mr-3"></span> <!-- 위치 아이콘 -->
	                        <span>韓国</span> <!-- 여행지 국가명 -->
	                    </span>
	                    <!-- 여행지 이름 및 가격 정보 -->
	                    <div class="d-flex align-items-center">
	                        <div>
	                            <h3><a href="#">ソウル</a></h3> <!-- 여행지 명칭 -->
	                            <div class="price ml-auto">
	                                <span>52,000円</span> <!-- 여행 가격 -->
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <!-- 두 번째 여행 상품 -->
	            <div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
	                <div class="media-1">
	                    <a href="#" class="d-block mb-3">
	                        <img src="images/hero-slider-2.jpg" alt="Image" class="img-fluid">
	                    </a>
	                    <span class="d-flex align-items-center loc mb-2">
	                        <span class="icon-room mr-3"></span>
	                        <span>韓国</span>
	                    </span>
	                    <div class="d-flex align-items-center">
	                        <div>
	                            <h3><a href="#">プサン</a></h3>
	                            <div class="price ml-auto">
	                                <span>52,000円</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <!-- 세 번째 여행 상품 -->
	            <div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
	                <div class="media-1">
	                    <a href="#" class="d-block mb-3">
	                        <img src="images/hero-slider-3.jpg" alt="Image" class="img-fluid" style="height: 170px;">
	                    </a>
	                    <span class="d-flex align-items-center loc mb-2">
	                        <span class="icon-room mr-3"></span>
	                        <span>韓国</span>
	                    </span>
	                    <div class="d-flex align-items-center">
	                        <div>
	                            <h3><a href="#">チェジュ島</a></h3>
	                            <div class="price ml-auto">
	                                <span>75,000円</span> <!-- 가격이 다른 상품 -->
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	            <!-- 네 번째 여행 상품 -->
	            <div class="col-6 col-sm-6 col-md-6 col-lg-3 mb-4 mb-lg-0">
	                <div class="media-1">
	                    <a href="#" class="d-block mb-3">
	                        <img src="images/hero-slider-4.jpg" alt="Image" class="img-fluid">
	                    </a>
	                    <span class="d-flex align-items-center loc mb-2">
	                        <span class="icon-room mr-3"></span>
	                        <span>韓国</span>
	                    </span>
	                    <div class="d-flex align-items-center">
	                        <div>
	                            <h3><a href="#">キョンジュ</a></h3>
	                            <div class="price ml-auto">
	                                <span>52,000円</span>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	
	        </div> <!-- 여행 상품 목록 끝 -->
	    </div> <!-- 컨테이너 끝 -->
	</div> <!-- Special Offers & Discounts 섹션 끝 -->


	<!-- "영상으로 보는 한국 여행!" 섹션 시작 -->
	<div class="untree_co-section">
	    <!-- 전체 레이아웃을 조정하는 Bootstrap 컨테이너 -->
	    <div class="container">
	
	        <!-- row: 왼쪽에는 영상, 오른쪽에는 설명 -->
	        <div class="row justify-content-between align-items-center">
	
	            <!-- 왼쪽: 영상 썸네일과 재생 버튼 -->
	            <div class="col-lg-6">
	                <figure class="img-play-video">
	                    <!-- Fancybox를 사용하여 YouTube 영상 팝업 재생 -->
	                    <a id="play-video" class="video-play-button"
	                        href="https://youtu.be/O35g4st43ks?si=cYqXEoMKYq7ABIV9" data-fancybox>
	                        <span></span> <!-- CSS로 디자인된 재생 버튼 아이콘 -->
	                    </a>
	                    <!-- YouTube 썸네일 이미지 (클릭 시 영상 재생) -->
	                    <img src="https://img.youtube.com/vi/O35g4st43ks/maxresdefault.jpg" alt="YouTube Thumbnail"
	                        class="img-fluid rounded-20">
	                </figure>
	            </div>
	            <!-- 왼쪽 (영상) 섹션 종료 -->
	
	            <!-- 오른쪽: 제목, 설명, 여행 정보 리스트, 버튼 -->
	            <div class="col-lg-5">
	                <!-- 섹션 제목 -->
	                <h2 class="section-title text-left mb-4">動画で見る韓国の旅！</h2>
	
	                <!-- 짧은 소개 문구 -->
	                <p>"動画で体感する、忘れられない韓国の旅！"</p>
	
	                <!-- 여행 소개 문구 -->
	                <p class="mb-4">
	                    韓国の人気観光地、絶品グルメ、文化体験をまとめてご紹介！<br>
	                    美しい風景と活気あふれる都市を動画で楽しもう！
	                </p>
	
	                <!-- 여행 관련 서비스 리스트 (2열로 정렬) -->
	                <ul class="list-unstyled two-col clearfix">
	                    <li>アクティビティ体験</li> <!-- 다양한 야외 활동 -->
	                    <li>クルーズ & 列車旅</li> <!-- 크루즈 여행 및 기차 여행 -->
	                    <li>ホテル & 航空券</li> <!-- 숙박 및 항공권 예약 -->
	                    <li>レンタカー & 保険</li> <!-- 렌터카 서비스 및 보험 가입 -->
	                    <li>ガイド付き旅行</li> <!-- 현지 가이드 포함 여행 -->
	                    <li>韓国人気観光地</li> <!-- 유명 관광지 리스트 -->
	                    <li>伝統文化体験</li> <!-- 한옥 체험, 한복 대여 등 -->
	                    <li>グルメ & ショッピング</li> <!-- 한국의 유명 맛집과 쇼핑 정보 -->
	                    <li>快適な移動手段</li> <!-- 공항 이동, 대중교통 안내 -->
	                    <li>お得なツアー情報</li> <!-- 할인 투어 및 프로모션 정보 -->
	                </ul>
	
	                <!-- 예약하기 버튼 -->
	                <p>
	                    <a href="#" class="btn btn-primary">今すぐ予約</a>
	                </p>
	
	            </div>
	            <!-- 오른쪽 (설명 & 서비스 정보) 섹션 종료 -->
	
	        </div> <!-- row 종료 -->
	    </div> <!-- container 종료 -->
	</div> <!-- "영상으로 보는 한국 여행!" 섹션 종료 -->




	<!-- "문의하기 (Contact Us)" CTA(Call to Action) 섹션 시작 -->
	<div class="py-5 cta-section"> <!-- 상하 패딩(padding) 5 적용된 CTA 섹션 -->
	    <div class="container"> <!-- 콘텐츠를 정렬하는 Bootstrap 컨테이너 -->
	        <div class="row text-center"> <!-- 텍스트를 가운데 정렬하는 행(row) -->
	            <div class="col-md-12"> <!-- 전체 너비를 차지하는 컬럼 -->
	                
	                <!-- CTA 제목 (문의 유도 메시지) -->
	                <h2 class="mb-2 text-white">最高の韓国旅行へ！今すぐお問い合わせ</h2>
	
	                <!-- 부가 설명 (희미한 흰색 텍스트) -->
	                <p class="mb-4 lead text-white text-white-opacity">
	                   	 あなたの理想の旅を、私たちがサポートします！<br>「お得なツアー情報や特別プランをご案内中！」
	                </p>
	
	                <!-- "Get in touch" 버튼 (문의 페이지로 이동) -->
	                <p class="mb-0">
	                    <a href="booking.html"
	                        class="btn btn-outline-white text-white btn-md font-weight-bold">
	                        	お問い合わせはこちら
	                    </a>
	                </p>
	
	            </div> <!-- 컬럼 종료 -->
	        </div> <!-- row 종료 -->
	    </div> <!-- container 종료 -->
	</div> <!-- CTA 섹션 종료 -->


<%@ include file="./fragments/footer.jsp"%>
