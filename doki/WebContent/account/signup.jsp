<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" href="<%= request.getContextPath() %>/account/css/signup.css">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="signup-container">
		<h2 class="signup-title">회원가입</h2>
		<!-- 회원가입 제목 -->
		<form id="signupForm" action="/signup" method="post">
			<div class="input-container">
				<!-- 필수 입력 필드 -->
				<div class="input-group">
					<label for="userid">아이디</label> <input type="text" id="userid"
						name="userid" placeholder="아이디 (5~20자, 영문/숫자)" required> <span
						class="error-msg" id="useridError"></span>
				</div>

				<div class="input-group">
					<label for="password">비밀번호</label> <input type="password"
						id="password" name="password"
						placeholder="비밀번호 (10~16자, 2가지 조합 필수)" required> <span
						class="error-msg" id="passwordError"></span>
				</div>

				<div class="input-group">
					<label for="confirm_password">비밀번호 확인</label> <input
						type="password" id="confirm_password" name="confirm_password"
						placeholder="비밀번호 확인" required> <span class="error-msg"
						id="confirmPasswordError"></span>
				</div>


				<div class="input-group">
					<label for="name_en">이름 (영어)</label> <input type="text"
						id="name_en" name="name_en" placeholder="이름 (영어)" required>
				</div>

				<div class="input-group">
					<label for="name_kanji">이름 (한자)</label> <input type="text"
						id="name_kanji" name="name_kanji" placeholder="이름 (한자)" required>
				</div>

				<div class="input-group">
					<label for="name_kana">이름 (가타카나)</label> <input type="text"
						id="name_kana" name="name_kana" placeholder="이름 (가타카나)" required>
				</div>

				<div class="input-group">
					<label for="birthdate">생년월일</label> <input type="date"
						id="birthdate" name="birthdate" required>
				</div>

				<div class="input-group">
					<label for="phone">전화번호</label> <input type="tel" id="phone"
						name="phone" placeholder="전화번호" required>
				</div>

				<div class="input-group">
					<label for="email">이메일</label>
					<div class="email-container">
						<input type="text" id="email_prefix" placeholder="이메일 아이디"
							required> <select id="email_domain">
							<option value="gmail.com">@gmail.com</option>
							<option value="yahoo.co.jp">@yahoo.co.jp</option>
							<option value="docomo.ne.jp">@docomo.ne.jp</option>
							<option value="ezweb.ne.jp">@ezweb.ne.jp</option>
							<option value="softbank.ne.jp">@softbank.ne.jp</option>
							<option value="icloud.com">@icloud.com</option>
							<option value="outlook.jp">@outlook.jp</option>
							<option value="custom">직접 입력</option>
						</select> <input type="text" id="custom_email" placeholder="도메인 입력"
							style="display: none;">
						<button type="button" id="email_verify">이메일 인증</button>
					</div>
				</div>


				<div class="input-group">
					<label for="verification_code">인증번호</label>
					<div class="verification-container">
						<input type="text" id="verification_code" name="verification_code"
							placeholder="인증번호 입력" disabled>
						<button type="button" id="verify_code_btn" disabled>확인</button>
					</div>
					<span class="error-msg" id="verificationCodeError"></span>
				</div>


				<div class="separator">
					<span>선택 입력</span>
				</div>

				<div class="input-group">
					<label for="postal_code">우편번호</label>
					<div class="address-container">
						<input type="text" id="postal_code" name="postal_code"
							placeholder="우편번호">
						<button type="button" id="address_lookup">주소 찾기</button>
					</div>
				</div>

				<div class="input-group">
					<label for="prefecture">都道府県 (도도부현)</label> <select id="prefecture"
						name="prefecture">
						<option value="">都道府県 선택</option>
						<option value="北海道">北海道</option>
						<option value="青森県">青森県</option>
						<option value="岩手県">岩手県</option>
						<option value="宮城県">宮城県</option>
						<option value="秋田県">秋田県</option>
						<option value="山形県">山形県</option>
						<option value="福島県">福島県</option>
						<option value="茨城県">茨城県</option>
						<option value="栃木県">栃木県</option>
						<option value="群馬県">群馬県</option>
						<option value="埼玉県">埼玉県</option>
						<option value="千葉県">千葉県</option>
						<option value="東京都">東京都</option>
						<option value="神奈川県">神奈川県</option>
						<option value="新潟県">新潟県</option>
						<option value="富山県">富山県</option>
						<option value="石川県">石川県</option>
						<option value="福井県">福井県</option>
						<option value="山梨県">山梨県</option>
						<option value="長野県">長野県</option>
						<option value="岐阜県">岐阜県</option>
						<option value="静岡県">静岡県</option>
						<option value="愛知県">愛知県</option>
						<option value="三重県">三重県</option>
						<option value="滋賀県">滋賀県</option>
						<option value="京都府">京都府</option>
						<option value="大阪府">大阪府</option>
						<option value="兵庫県">兵庫県</option>
						<option value="奈良県">奈良県</option>
						<option value="和歌山県">和歌山県</option>
						<option value="鳥取県">鳥取県</option>
						<option value="島根県">島根県</option>
						<option value="岡山県">岡山県</option>
						<option value="広島県">広島県</option>
						<option value="山口県">山口県</option>
						<option value="徳島県">徳島県</option>
						<option value="香川県">香川県</option>
						<option value="愛媛県">愛媛県</option>
						<option value="高知県">高知県</option>
						<option value="福岡県">福岡県</option>
						<option value="佐賀県">佐賀県</option>
						<option value="長崎県">長崎県</option>
						<option value="熊本県">熊本県</option>
						<option value="大分県">大分県</option>
						<option value="宮崎県">宮崎県</option>
						<option value="鹿児島県">鹿児島県</option>
						<option value="沖縄県">沖縄県</option>
					</select>
				</div>

				<div class="input-group">
					<label for="city">市区町村 (시구정촌)</label> <input type="text" id="city"
						name="city" placeholder="시구정촌">
				</div>

				<div class="input-group">
					<label for="address">나머지 주소</label> <input type="text" id="address"
						name="address" placeholder="번지, 빌딩명 등">
				</div>


				<div class="input-group">
					<label for="passport_number">여권번호</label> <input type="text"
						id="passport_number" name="passport_number" placeholder="여권번호">
				</div>

				<div class="input-group">
					<label for="passport_expiry">여권 만료일</label> <input type="date"
						id="passport_expiry" name="passport_expiry">
				</div>
			</div>

			<button class="signupsubmitBtn" type="submit">회원가입</button>
		</form>
	</div>
</body>
	 <%@ include file="../fragments/footer.jsp"%>
	<script src="<%= request.getContextPath() %>/js/signup.js"></script>
</html>