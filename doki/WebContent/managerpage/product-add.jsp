<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="../fragments/header.jsp"%>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/js/jquery-3.4.1.min.js"></script>
<title>Product_Add</title>

<style>
th, td {border:none;}

.vertical-menu a {color: black; display: block; padding: 12px; text-decoration: none;}

.product-addlist {flex: 2; padding-right: 10px; border-right: 1px solid #ccc;}

.product-addbox {display: flex; gap: 20px;}
.product-addbox .context {line-height: 220%; padding-bottom: 40px;}
.product-addbox .btn-group .btnbutton {border: 1px solid #ccc; padding: 8px 12px;}

.product-addtable {width: 200%;}
.product-addtable th, .product-addtable td {padding: 8px; border-bottom: 1px solid #ccc;}
.product-addtable input[type="text"] {border: 1px solid #ccc; padding: 6px; width: 100%; margin: 1px 0;}
.product-addtable textarea {width: 100%; height: 190px; padding: 10px;	border: 1px solid #ccc;	padding: 10px;}
.product-addtable input[type="submit"], .product-addtable input[type="reset"], .product-addtable input[type="button"]{border: 1px solid #aaa; padding: 8px 16px; background-color:#fff;}
.product-addtable {text-align: center;}
</style>
	<div class="container">
		<div class="row" style="margin-top: 100px;">
			<!-- 사이드바 영역 -->
			<div class="col-md-3">
				<%@ include file="side.jsp"%>
			</div>
			<!-- 메인 콘텐츠 영역 -->
			<div class="col-md-9">
				<b>商品登録</b> <!-- 상품 등록 -->
				<div class="product-addbox">

					<form name="my" method="post" enctype="multipart/form-data" action="/manager/product_addpro.do"
						onsubmit="return check();">

						<table class="product-addtable" style="width:100%;">
							<tr>
								<th style="padding-top: 10px; font-size: 20px;">必須事項</th> <!-- 필수사항 -->
								<td></td>
							</tr>
							<tr>
								<th>商品名</th> <!-- 상품명 -->
								<td><input type="text" name="name"></td>
							</tr>
							<tr>

								<th>목적지</th>
								<td>
									<select name="destination" id="destination" class="form-control custom-select">
										<option value="목적지 선택" selected disabled hidden>목적지 선택</option>
										<option value="1">ジェジュ島</option>
										<option value="2">ウルルン島</option>
										<option value="3">カンウォン</option>
										<option value="4">キョンサンプク道</option>
										<option value="5">キョンサンナム道</option>
										<option value="6">プサン</option>
										<option value="7">チョルラプク道</option>
										<option value="8">チョルラナム道</option>
										<option value="9">チュンチョンプク道</option>
										<option value="10">チュンチョンナム道</option>
										<option value="11">ソウル</option>
										<option value="12">インチョン</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>출발지</th>
							<td>
								<select name="departure" id="departure" class="form-control custom-select">
									<option value="출발지 선택" selected disabled hidden>출발지 선택</option>
									<option value="13">東京</option>
									<option value="14">大阪</option>
									<option value="15">福岡</option>
									<option value="16">名古屋</option>
									<option value="17">札幌</option>
									<option value="18">沖縄</option>
									<option value="19">その他</option>
								</select>
							</td>
						</tr>														
							<tr>
								<th>성인 가격</th>
								<td><input type="text" name="package_price" required></td>
							</tr>
							<tr>
								<th>아동 가격</th>
								<td><input type="text" name="child_price" required></td>
							</tr>
							<tr>
								<th>유아 가격</th>
								<td><input type="text" name="baby_price" required></td>
							</tr>
							<tr>
								<th>여행 태그</th>
								<td><input type="text" name="included_services"></td>
							</tr>
							<tr>
								<th>여행 시작일</th>
								<td><input type="date" name="start_date"></td>
							</tr>
							<tr>
								<th>여행 종료일</th>
								<td><input type="date" name="end_date"></td>
							</tr>
							<tr>
								<th>상세내용</th>
								<td><textarea class="form-control" rows="3" name="content"></textarea></td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td><input type="file" name="imgfile" multiple></td>

							</tr>
							<tr>
								<th style="padding-top: 50px; font-size: 20px;">選択事項</th> <!-- 선택사항 -->
								<td></td>
							</tr>

							<tr>
								<td colspan="2" class="txtcenter" style="padding-bottom:120px;">

								<input type="submit" value="貯藏"> <!-- 저장 -->
								<input type="reset" value="かきかえ"> <!-- 다시쓰기 -->
								<input type="button" value="目錄" onclick="window.location.href='/manager/product_list.do'"></td> <!-- 목록 -->

							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		document.querySelectorAll('.toggle-btn').forEach(function(btn) {
		  btn.addEventListener('click', function() {
		    // 현재 상태를 boolean으로 변환
		    var isChecked = this.getAttribute('data-checked') === 'true';
		    // 상태 토글: 독립적으로 변경되도록 함.
		    this.setAttribute('data-checked', !isChecked);
		  });
		});

	</script>
<%@ include file="../fragments/footer.jsp"%>