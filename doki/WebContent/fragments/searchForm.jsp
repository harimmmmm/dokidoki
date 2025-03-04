<form class="form" id="searchForm" action="/pakage/packageSelect.do"
	method="get" data-auto-submit="${autoSubmit}">
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
						<div class="option sub-option" data-target="jeolla">전라</div>
						<!-- 전라 추가 -->
						<div class="option sub-option" data-target="chungcheong">충청</div>
						<div class="option sub-option" data-target="seoul">서울/인천/경기</div>
					</div>

					<div class="column third">
						<div class="option detail-option d-none" data-parent="jeju">ジェジュ島</div>
						<div class="option detail-option d-none" data-parent="ulleung">ウルルン島</div>
						<div class="option detail-option d-none" data-parent="gangwon">カンウォン</div>
						<div class="option detail-option d-none" data-parent="gyeongsang">キョンサンプク道</div>
						<div class="option detail-option d-none" data-parent="gyeongsang">キョンサンナム道</div>
						<div class="option detail-option d-none" data-parent="gyeongsang">プサン</div>
						<div class="option detail-option d-none" data-parent="jeolla">チョルラプク道</div>
						<div class="option detail-option d-none" data-parent="jeolla">チョルラナム道</div>
						<div class="option detail-option d-none" data-parent="chungcheong">チュンチョンプク道</div>
						<div class="option detail-option d-none" data-parent="chungcheong">チュンチョンナム道</div>
						<div class="option detail-option d-none" data-parent="seoul">ソウル</div>
						<div class="option detail-option d-none" data-parent="seoul">インチョン</div>
					</div>
				</div>
			</div>
			<input type="hidden" name="destination" id="selectedDestination"
				value="${param.destination}">
		</div>

		<!-- 출발지 선택 -->
		<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-2">
			<select name="departure" id="departure"
				class="form-control custom-select">
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
		<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-4">
			<input type="text" class="form-control" name="daterange">
		</div>

		<!-- 검색 버튼 (packagesList에서만 보이도록 설정) -->
		<c:if test="${not autoSubmit}">
			<div class="col-sm-12 col-md-6 mb-3 mb-lg-0 col-lg-3">
				<input type="submit" class="btn btn-primary btn-block" value="探す">
			</div>
		</c:if>
	</div>
</form>
