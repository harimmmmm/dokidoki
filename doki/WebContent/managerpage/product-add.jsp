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
				<b>상품 등록</b>
				<div class="product-addbox">
					<form name="my" method="post" enctype="multipart/form-data" action="/manager/product_addpro.do"
						onsubmit="return check();">
						<table class="product-addtable" style="width:100%;">
							<tr>
								<th style="padding-top: 10px; font-size: 20px;">필수사항</th>
								<td></td>
							</tr>
							<tr>
								<th>패키지명</th>
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
								<th style="padding-top: 50px; font-size: 20px;">선택사항</th>
								<td></td>
							</tr>
							<tr>
								<th>쇼핑</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음">없음</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="1회">1회</button>
								</td>
							</tr>

							<tr>
								<th>선택관광</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음(노옵션)">없음(노옵션)</button>
								</td>
							</tr>
							<tr>
								<th>자유일정</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="전일정">전일정</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="일부(하루이상)">일부(하루이상)</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="일부(하루미만)">일부(하루미만)</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음">없음</button>
								</td>
							</tr>
							<tr>
								<th>현지 필수 경비 (가이드 & 기사팁)</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음(노팁)">없음(노팁)</button>
								</td>
							</tr>
							<tr>
								<th>현지 가이드</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="전일정포함">전일정포함</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="전일정불포함">전일정불포함</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="포함(일부불포함)">포함(일부불포함)</button>
								</td>
							</tr>
							<tr>
								<th>식사료</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="불포함">불포함</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="일부 포함">일부 포함</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="전 일정 포함">전 일정 포함</button>
								</td>
							</tr>
							<tr>
								<th>여행기간</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="2박 3일">2박 3일</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="3박 4일">3박 4일</button>
								</td>
							</tr>
							<tr>
								<th>여행컨셉</th>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="관광">관광</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="휴양">휴양</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="골프">골프</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="크루즈">크루즈</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="테마파크">테마파크</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="축제">축제</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="쇼핑">쇼핑</button>
								</td>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="온천">온천</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="전문가">전문가</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="아동동반">아동동반</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="자유일정">자유일정</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="미식">미식</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="효도">효도</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="커플">커플</button>
								</td>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="가족">가족</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="친구">친구</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="리조트">리조트</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="관광+휴양">관광+휴양</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="직장인">직장인</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="문화">문화</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="스파">스파</button>
								</td>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="로컬">로컬</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="가톨릭 성지순례">가톨릭 성지순례</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="기독교 성지순례">기독교 성지순례</button>
								</td>
							</tr>
							<tr>
								<th>출발시간</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="오전 0~12시">오전 0~12시</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="오후 12~24시">오후 12~24시</button>
								</td>
							</tr>
							<tr>
								<th>항공사</th>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="항공불포함">항공불포함</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="에어부산">에어부산</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="대한항공">대한항공</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="진에어">진에어</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="아시아나 항공">아시아나 항공</button>
								</td>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="AERO K AIRLINES">AERO K AIRLINES</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="에어서울">에어서울</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="티웨이 항공">티웨이 항공</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="에어프레미아">에어프레미아</button>
								</td>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="이스타항공">이스타항공</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="제주항공">제주항공</button>
								</td>
							</tr>
							<tr>
								<th>항공좌석등급</th>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="이코노미">이코노미</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="비즈니스">비즈니스</button>
									<button type="button" class="toggle-btn" data-checked="false" data-value="불포함">불포함</button>
								</td>
							</tr>
							<tr>
								<td colspan="2" class="txtcenter" style="padding-bottom:120px;">
									<input type="submit" value="저장"> 
									<input type="reset" value="다시쓰기"> 
									<input type="button" value="목록" onclick="">
								</td>
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