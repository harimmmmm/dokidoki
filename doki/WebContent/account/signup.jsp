<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/account/css/signup.css">
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="signup-container">
		<h2 class="signup-title">회원가입</h2>
		<!-- 회원가입 제목 -->
		<form id="signupForm" action="/member/signupInsertpro.do"
			method="post">
			<div class="input-container">
				<!-- 필수 입력 필드 -->
				<div class="input-group">
					<label for="userid">아이디</label> <input type="text" id="userid"
						name="user_id" placeholder="아이디 (8~20자, 영문/숫자)" required>
					<span class="useridmsg" id="useridErrormsg"></span>
				</div>

				<div class="input-group">
					<label for="password">비밀번호</label> <input type="password"
						id="password" name="user_password"
						placeholder="비밀번호 (10~16자, 영문, 숫자 및 특수문자(@, ., #, -, _, !))"
						required> <span class="error-msg" id="passwordErrormsg"></span>
				</div>

				<div class="input-group">
					<label for="confirm_password">비밀번호 확인</label> <input
						type="password" id="checkpassword" name="user_password"
						placeholder="비밀번호 확인" required> <span class="error-msg"
						id="checkpasswordmsg"></span>
				</div>

				<div class="input-group">
					<label for="name_en">이름 (영어)</label> <input type="text"
						id="name_en" name="name" placeholder="이름 (영어)" required>
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
						id="birthdate" name="birth_date" required>
				</div>

				<div class="input-group">
					<label for="phone">전화번호</label> <input type="tel" id="phone"
						name="tel" placeholder="전화번호" required>
				</div>

				<div class="input-group">
					<label for="email">이메일</label>
					<div class="email-container">
						<input type="hidden" id="full_email" name="email">
						<input type="text" id="email_prefix" name="email_prefix"
							placeholder="이메일 아이디" required> <select id="email_domain">
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
						<button type="button" id="lookup_button">주소 찾기</button>
						<p id="address_result"></p>
					</div>
				</div>


				<div class="input-group">
					<label for="prefecture">都道府県 </label> <input type="text"
						id="prefecture" name="prefecture" placeholder="시/도" readonly>
				</div>

				<div class="input-group">
					<label for="city">市区町村</label> <input type="text" id="city"
						name="city" placeholder="구/군" readonly>
				</div>

				<div class="input-group">
					<label for="town"> 町名・番地</label> <input type="text" id="town"
						name="town" placeholder="동/읍/면" readonly>
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
<script src="<%=request.getContextPath()%>/account/js/signup.js"></script>
</html>