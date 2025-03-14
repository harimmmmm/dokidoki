<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/account/css/signup.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">

</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="signup-container">
		<h2 class="signup-title">会員登録</h2>
		<!-- 회원가입 제목 -->
		<form id="signupForm" action="/member/signupInsertpro.do"
			method="post">
			<div class="input-container">
				<!-- 필수 입력 필드 -->
				<div class="input-group">
					<label for="userid">アイディー</label> <input type="text" id="userid"
						name="user_id" placeholder="ID(8~20文字、英数字)" required> <span
						class="useridmsg" id="useridErrormsg"></span>
				</div>

				<div class="input-group">
					<label for="password">パスワード</label> <input type="password"
						id="password" name="user_password"
						placeholder="パスワード(10~16文字、英文、数字及び特殊文字(@、.、#、-、_、!))" required>
					<span class="error-msg" id="passwordErrormsg"></span>
				</div>

				<div class="input-group">
					<label for="confirm_password">パスワード確認</label> <input
						type="password" id="checkpassword" name="user_password"
						placeholder="パスワード確認" required> <span class="error-msg"
						id="checkpasswordmsg"></span>
				</div>

				<div class="input-group">
					<label for="name_en">お名前(英語)</label> <input type="text"
						id="name_en" name="name" placeholder="お名前(英語)" required>
				</div>

				<div class="input-group">
					<label for="name_kanji">お名前(漢字)</label> <input type="text"
						id="name_kanji" name="name_kanji" placeholder="お名前(漢字)" required>
				</div>

				<div class="input-group">
					<label for="name_kana">お名前（カタカナ）</label> <input type="text"
						id="name_kana" name="name_kana" placeholder="お名前（カタカナ）" required>
				</div>

				<div class="input-group">
					<label for="birthdate">生年月日.</label> 
					<input type="text" id="birthdate" name="birth_date" placeholder="生年月日" required>
				</div>

				<div class="input-group">
					<label for="phone">電話番号.</label> <input type="tel" id="phone"
						name="tel" placeholder="電話番号." required>
				</div>

				<div class="input-group">
					<label for="email">イーメール</label>
					<div class="email-container">
						<input type="hidden" id="full_email" name="email"> <input
							type="text" id="email_prefix" name="email_prefix"
							placeholder="イーメール" required> <select id="email_domain">
							<option value="gmail.com">@gmail.com</option>
							<option value="yahoo.co.jp">@yahoo.co.jp</option>
							<option value="docomo.ne.jp">@docomo.ne.jp</option>
							<option value="ezweb.ne.jp">@ezweb.ne.jp</option>
							<option value="softbank.ne.jp">@softbank.ne.jp</option>
							<option value="icloud.com">@icloud.com</option>
							<option value="outlook.jp">@outlook.jp</option>
							<option value="custom">直接入力</option>
						</select> <input type="text" id="custom_email" placeholder="ドメイン入力"
							style="display: none;">
						<button type="button" id="email_verify">Eメール認証</button>
					</div>
				</div>

				<div class="input-group">
					<label for="verification_code">認証番号</label>
					<div class="verification-container">
						<input type="text" id="verification_code" name="verification_code"
							placeholder="認証番号入力" disabled>
						<button type="button" id="verify_code_btn" disabled>確認.</button>
					</div>
					<span class="error-msg" id="verificationCodeError"></span>
				</div>


				<div class="separator">
					<span>選択入力</span>
				</div>

				<div class="input-group">
					<label for="postal_code">郵便番号</label>
					<div class="address-container">
						<input type="text" id="postal_code" name="postal_code"
							placeholder="郵便番号">
						<button type="button" id="lookup_button">住所検索</button>
						<p id="address_result"></p>
					</div>
				</div>


				<div class="input-group">
					<label for="prefecture">都道府県 </label> <input type="text"
						id="prefecture" name="prefecture" placeholder="都道府県" readonly>
				</div>

				<div class="input-group">
					<label for="city">市区町村</label> <input type="text" id="city"
						name="city" placeholder="市区町村" readonly>
				</div>

				<div class="input-group">
					<label for="town"> 町名・番地</label> <input type="text" id="town"
						name="town" placeholder="町名・番地" readonly>
				</div>

				<div class="input-group">
					<label for="passport_number">パスポート番号</label> <input type="text"
						id="passport_number" name="passport_number" placeholder="パスポート番号">
				</div>

				<div class="input-group">
					<label for="passport_expiry">パスポート有効期限</label> 
					<input type="text" id="passport_expiry" name="passport_expiry" placeholder="パスポート有効期限">
				</div>
			</div>

			<button class="signupsubmitBtn" type="submit">会員登録</button>
		</form>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
<script src="<%=request.getContextPath()%>/account/js/signup.js"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ja.js"></script>
<script>
	flatpickr("#birthdate", {
		locale: "ja",
		dateFormat: "Y-m-d"
	});

	flatpickr("#passport_expiry", {
		locale: "ja",
		dateFormat: "Y-m-d"
	});
</script>

</html>