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

#edit h2 {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.edit-btnn {
	margin-left: auto;
	background-color: #486988;
	border-radius: 5px;
	padding: 8px 10px;
	border: 0;
	color: white;
	font-size: 17px;
}

.idmsg {
	color: #c85557;
}

.editTable table {
	width: 100%;
	border-collapse: collapse;
	border-bottom: 1px solid #ebebea;
}

.editTable td {
	padding: 10px;
	/* border: 1px solid #ccc; */
	border-right: 1px solid #ebebea; 
	border-bottom: 1px solid #ebebea;
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
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>

		<main class="main-content">
			<section id="edit" class="edit">
				<h2>
					個人情報修正
					<a  href="/mypage/editformUpdate.do" class="edit-btnn">修正</a>
				</h2>
				<p class="idmsg">* IDは変更できません</p>
				<form action="/mypage/editform.do" method="post">
					<input type="hidden" name="user_id"
						value="${sessionScope.user.user_id}" />
				</form>

				<table class="editTable">
					<tr>
						<td><label for="name_kanji">氏名（漢字）</label></td>
						<td>${vo.name_kanji}</td>
					</tr>
					<tr>
						<td><label for="name_kana">氏名（カナ）</label></td>
						<td>${vo.name_kana}</td>
					</tr>
					<tr>
						<td><label for="name">名前 (英文)</label></td>
						<td>${vo.name}</td>
					</tr>
					<tr>
						<td><label for="birth_date">生年月日</label></td>
						<td>${vo.birth_date}</td>
					</tr>
					<tr>
						<td><label for="tel">電話番号</label></td>
						<td>${vo.tel}</td>
					</tr>
					<tr>
						<td><label for="email">メールアドレス</label></td>
						<td>${vo.email}</td>
					</tr>
					<tr>
						<td><label for="postal_code">郵便番号</label></td>
						<td>${vo.postal_code}</td>
					</tr>
					<tr>
						<td><label for="prefecture">都道府県</label></td>
						<td>${vo.prefecture}</td>
					</tr>
					<tr>
						<td><label for="city">市区町村</label></td>
						<td>${vo.city}</td>
					</tr>
					<tr>
						<td><label for="town">丁目・番地</label></td>
						<td>${vo.town}</td>
					</tr>
					<tr>
						<td><label for="building">建物名</label></td>
						<td>${vo.building}</td>
					</tr>
					<tr>
						<td><label for="passport_number">パスポート番号</label></td>
						<td>${vo.passport_number}</td>
					</tr>
					<tr>
						<td><label for="passport_expiry">パスポート有効期限</label></td>
						<td>${vo.passport_expiry}</td>
					</tr>
				</table>

			</section>
		</main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>