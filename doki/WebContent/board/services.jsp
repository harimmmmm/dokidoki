<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
 
<!-- Link Swiper's CSS -->
<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />

<link rel="stylesheet"
   href="<%=request.getContextPath()%>/css/boardstyle.css">

<!-- Swiper -->
<div class="swiper mySwiper">
   <div class="swiper-wrapper">
      <div class="swiper-slide">
         <img src="/images/boardimg/seoulYG.jpg" alt="Image 1">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/jeju1.jpg" alt="Image 2">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/ndm.jpg" alt="Image 3">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/0101.jpg" alt="Image 4">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/sga.jpg" alt="Image 5">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/bkk.webp" alt="Image 6">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/spbc.jpg" alt="Image 7">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/urwj.jpg" alt="Image 8">
      </div>
      <div class="swiper-slide">
         <img src="/images/boardimg/daenamu.jpg" alt="Image 9">
      </div>
   </div>

   <!-- Pagination -->
   <div class="swiper-pagination"></div>
</div>

<div class="untree_co-section1" style="padding-top: 0px; margin-bottom: 60px;"> <!-- padding-top 줄임 -->
   <div class="container">
      <div class="row">
         <div class="col-12">
            <h2 style="text-align: center; color: #1b4772; margin: 35px 0; font-size: 38px;">韓国の人気旅行地</h2>
            <!-- 여백 조정 -->
         </div>
      </div>
      <div class="row">
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img src="/images/hero-slider-1.jpg" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Excellence in Travel</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img src="/images/boardimg/hero-slider-2.jpg" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Discovering Best</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img src="/images/hero-slider-3.jpg" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">A New Moments of Life</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img src="/images/hero-slider-4.jpg" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Joy To Your Journey</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>





<div class="untree_co-section2" style="margin-bottom: 40px;">
   <div class="container">
      <div class="row">
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/1.jinhae.png" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Excellence in Travel</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/1.sokcho.png" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Discovering Best</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/1.daejeon.png" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">A New Moments of Life</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/1.damyang.png" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Joy To Your Journey</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>



<div class="untree_co-section3">
   <div class="container">
      <div class="row">
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/1.jeonju.jpg" alt="Image" class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Excellence in Travel</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/1.yangyang.png" alt="Image"
                  class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Discovering Best</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/hero-slider-2.jpg" alt="Image"
                  class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">A New Moments of Life</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
         <div class="col-6 col-md-6 col-lg-3">
            <div class="media-1">
               <a href="#" class="d-block mb-3"><img
                  src="/images/boardimg/hero-slider-2.jpg" alt="Image"
                  class="img-fluid"></a>
               <div class="d-flex">
                  <div>
                     <h3>
                        <a href="#">Joy To Your Journey</a>
                     </h3>
                     <p>Far far away, behind the word mountains, far from the
                        countries Vokalia and Consonantia, there live the blind texts.</p>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>



<div class="untree_co-section">
   <div class="container">
      <div class="row mb-5 justify-content-center">
         <div class="col-lg-6 text-center" style="margin-top: 60px;"> <!-- 여백 추가 -->
            <h2 class="section-title text-center mb-3" style=" color: #1b4772;">韓国の人気旅行地を紹介します </h2>
            <p style="margin-top: 30px; color: #365471;">韓国の旅は毎日新しい物語を提供します。海辺では波の音に心が安らぎ、夜は温かな光に包まれます。伝統文化がある場所では過去の美しさを感じることができます。各季節には特別な瞬間があり、春には桜、夏には涼しい風、秋には紅葉、冬には静かな雪景色が広がります。これらすべての瞬間があなたの心を温かく包み、特別な思い出を作ることでしょう あなたの好みに合った旅行地を選んでください</p>
         </div>
      </div>
      <div class="row align-items-stretch">
         <div class="col-lg-4 order-lg-1">
            <div class="h-100">
               <div class="frame h-100">
                  <div class="feature-img-bg h-100"
                     style="background-image: url('images/hero-slider-1.jpg');"></div>
               </div>
            </div>
         </div>

         <div class="col-6 col-sm-6 col-lg-4 feature-1-wrap d-md-flex flex-md-column order-lg-1">
         </div>
      </div>
   </div>
</div>



<!-- Swiper JS -->
<script
   src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>

<!-- Initialize Swiper -->
<script>
   var swiper = new Swiper(".mySwiper", {
      slidesPerView : 1, // 한 번에 보여줄 슬라이드 수
      spaceBetween : 0, // 슬라이드 간의 간격
      loop : true, // 루프 설정
      speed : 800, // 슬라이드 전환 속도 (800ms)
      autoplay : {
         delay : 2250, // 2.25초마다 자동으로 슬라이드 전환
         disableOnInteraction : false, // 사용자가 상호작용해도 autoplay 유지
      },
      pagination : {
         el : ".swiper-pagination",
         clickable : true,
      },
      centeredSlides : true, // 슬라이드를 중앙에 배치
   });
</script>
<%@ include file="../fragments/footer.jsp"%>
