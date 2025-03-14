<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
</head>
<style>
.main-content {
	margin: 70px auto;
}

.editTable table {
	width: 100%;
	border-collapse: collapse;
	border: none;
}

.editTable td {
	padding: 8px;
	/* border: 1px solid #ccc; */
}

.editTable td:first-child {
	width: 100px;
}

.editTable td:last-child {
	border-right: none;
	padding-left: 20px;
}

.editTable label {
	white-space: nowrap; /* 레이블이 줄 바꿈되지 않도록 방지 */
}

.saveBtn {
	width: 100%;
}
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>

		<main class="main-content">
			<section id="edit" class="edit">
				<h2>個人情報修正</h2>
				<form action="/mypage/editformUpdatepro.do" method="post">
					<table class="editTable">
						<tr>
							<td><label for="name_kanji">氏名（漢字）</label></td>
							<td><input type="text" id="name_kanji" name="name_kanji"
								value="${vo.name_kanji}" required></td>
						</tr>
						<tr>
							<td><label for="name_kana">氏名（カナ）</label></td>
							<td><input type="text" id="name_kana" name="name_kana"
								value="${vo.name_kana}" required></td>
						</tr>
						<tr>
							<td><label for="name">名前 (英文)</label></td>
							<td><input type="text" id="name" name="name"
								value="${vo.name}" required></td>
						</tr>
						<tr>
							<td><label for="birth_date">生年月日</label></td>
							<td><input type="text" id="birth_date" name="birth_date"
								value="${vo.birth_date}" required></td>
						</tr>
						<tr>
							<td><label for="tel">電話番号</label></td>
							<td><input type="tel" id="tel" name="tel" value="${vo.tel}"
								required></td>
						</tr>
						<tr>
							<td><label for="email">メールアドレス</label></td>
							<td><input type="email" id="email" name="email"
								value="${vo.email}" required></td>
						</tr>

						<tr>
						<tr>
							<td colspan="2" style="border-bottom: 1px solid #ccc;"></td>
						</tr>
						<tr>
							<td colspan="2" style="padding-top: 20px; color: #c85557;">*
								選択入力</td>
						</tr>
						<tr>
							<td><label for="postal_code">郵便番号</label></td>
							<td><input type="text" id="postal_code" name="postal_code"
								value="${vo.postal_code}"></td>
						</tr>
						<tr>
							<td><label for="prefecture">都道府県</label></td>
							<td><input type="text" id="prefecture" name="prefecture"
								value="${vo.prefecture}"></td>
						</tr>
						<tr>
							<td><label for="city">市区町村</label></td>
							<td><input type="text" id="city" name="city"
								value="${vo.city}"></td>
						</tr>
						<tr>
							<td><label for="town">丁目・番地</label></td>
							<td><input type="text" id="town" name="town"
								value="${vo.town}"></td>
						</tr>
						<tr>
							<td><label for="building">建物名</label></td>
							<td><input type="text" id="building" name="building"
								value="${vo.building}"></td>
						</tr>
						<tr>
							<td><label for="passport_number">パスポート番号</label></td>
							<td><input type="text" id="passport_number"
								name="passport_number" value="${vo.passport_number}"></td>
						</tr>
						<tr>
							<td><label for="passport_expiry">パスポート有効期限</label></td>
							<td><input type="text" id="passport_expiry"
								name="passport_expiry" value="${vo.passport_expiry}"></td>
						</tr>
					</table>

					<button type="submit" class="saveBtn">貯蔵</button>
				</form>

			</section>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>