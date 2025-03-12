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
					<form name="my" method="post" enctype="" action="" onsubmit="return check();">
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
								<th>価格</th> <!-- 가격 -->
								<td><input type="text" name="price"></td>
							</tr>
							<tr>
								<th>旅行会社</th> <!-- 여행사 -->
								<td><input type="text" name="company"></td>
							</tr>
							<tr>
								<th>旅行開始日 (例: 250401)</th> <!-- 여행 시작일 (ex. 250401) -->
								<td><input type="text" name="departure"></td>
							</tr>
							<tr>
								<th>旅行終了日 (例: 250404)</th> <!-- 여행 종료일 (ex. 250404) -->
								<td><input type="text" name="arrival"></td>
							</tr>
							<tr>
								<th>詳細内容</th> <!-- 상세내용 -->
								<td><textarea class="form-control" rows="3"></textarea></td>
							</tr>
							<tr>
								<th>イメージ</th> <!-- 이미지 -->
								<td><input type="file" name="imgfile"></td>
							</tr>
							<tr>
								<th style="padding-top: 50px; font-size: 20px;">選択事項</th> <!-- 선택사항 -->
								<td></td>
							</tr>
							<tr>
								<th>ショッピング</th> <!-- 쇼핑 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음">なし</button> <!-- 없음 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="1회">1回</button> <!-- 1회 -->
								</td>
							</tr>
							<tr>
								<th>選択観光</th> <!-- 선택관광 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음(노옵션)">なし</button> <!-- 없음(노옵션) -->
								</td>
							</tr>
							<tr>
								<th>自由日程</th> <!-- 자유일정 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="전일정">全日程</button> <!-- 전일정 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="일부(하루이상)">一部（1日以上）</button> <!-- 일부(하루이상) -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="일부(하루미만)">一部（1日未満）</button> <!-- 일부(하루미만) -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음">なし</button> <!-- 없음 -->
								</td>
							</tr>
							<tr>
								<th>現地必須経費 (ガイド & ドライバーのチップ)</th> <!-- 현지 필수 경비 (가이드 & 기사팁) -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="없음(노팁)">なし</button> <!-- 없음(노팁) -->
								</td>
							</tr>
							<tr>
								<th>現地ガイド</th> <!-- 현지 가이드 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="전일정포함">全日程含む</button> <!-- 전일정포함 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="전일정불포함">全日程含まない</button> <!-- 전일정불포함 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="포함(일부불포함)">含む（一部含まない）</button> <!-- 포함(일부불포함) -->
								</td>
							</tr>
							<tr>
								<th>食事料金</th> <!-- 식사료 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="불포함">含まない</button> <!-- 불포함 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="일부 포함">一部含む</button> <!-- 일부 포함 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="전 일정 포함">全日程含む</button> <!-- 전 일정 포함 -->
								</td>
							</tr>
							<tr>
								<th>旅行期間</th> <!-- 여행기간 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="2박 3일">2泊3日</button> <!-- 2박 3일 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="3박 4일">3泊4日</button> <!-- 3박 4일 -->
								</td>
							</tr>
							<tr>
								<th>旅行コンセプト</th> <!-- 여행컨셉 -->
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="관광">観光</button> <!-- 관광 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="휴양">休養</button> <!-- 휴양 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="골프">ゴルフ</button> <!-- 골프 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="크루즈">クルーズ</button> <!-- 크루즈 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="테마파크">テーマパーク</button> <!-- 테마파크 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="축제">祭り</button> <!-- 축제 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="쇼핑">ショッピング</button> <!-- 쇼핑 -->
								</td>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="온천">温泉</button> <!-- 온천 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="전문가">専門家</button> <!-- 전문가 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="아동동반">子連れ</button> <!-- 아동동반 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="자유일정">自由日程</button> <!-- 자유일정 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="미식">美食</button> <!-- 미식 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="효도">孝行</button> <!-- 효도 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="커플">カップル</button> <!-- 커플 -->
								</td>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="가족">家族</button> <!-- 가족 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="친구">友達</button> <!-- 친구 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="리조트">リゾート</button> <!-- 리조트 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="관광+휴양">観光＋休養</button> <!-- 관광+휴양 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="직장인">会社員</button> <!-- 직장인 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="문화">文化</button> <!-- 문화 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="스파">スパ</button> <!-- 스파 -->
								</td>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="로컬">ローカル</button> <!-- 로컬 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="가톨릭 성지순례">カトリック巡礼</button> <!-- 가톨릭 성지순례 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="기독교 성지순례">キリスト教巡礼</button> <!-- 기독교 성지순례 -->
								</td>
							</tr>
							<tr>
								<th>出発時間</th> <!-- 출발시간 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="오전 0~12시">午前 0～12時</button> <!-- 오전 0~12시 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="오후 12~24시">午後 12～24時</button> <!-- 오후 12~24시 -->
								</td>
							</tr>
							<tr>
								<th>航空不含</th> <!-- 항공사 -->
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="항공불포함">航空不含</button> <!-- 항공불포함 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="에어부산">Air Busan</button> <!-- 에어부산 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="대한항공">Korean Air</button> <!-- 대한항공 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="진에어">Jin Air</button> <!-- 진에어 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="아시아나 항공">ASIANA AIRLINES</button> <!-- 아시아나 항공 -->
								</td>
								<td class="checkbox-group" style="border:none;">
									<button type="button" class="toggle-btn" data-checked="false" data-value="AERO K AIRLINES">AERO K AIRLINES</button> <!-- AERO K AIRLINES -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="에어서울">AIR SEOUL</button> <!-- 에어서울 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="티웨이 항공">T'way Air</button> <!-- 티웨이 항공 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="에어프레미아">Air Premia</button> <!-- 에어프레미아 -->
								</td>
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="이스타항공">Eastar Jet</button> <!-- 이스타항공 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="제주항공">JEJU AIR</button> <!-- 제주항공 -->
								</td>
							</tr>
							<tr>
								<th>航空座席等級</th> <!-- 항공좌석등급 -->
								<td class="checkbox-group">
									<button type="button" class="toggle-btn" data-checked="false" data-value="이코노미">エコノミー</button> <!-- 이코노미 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="비즈니스">ビジネス</button> <!-- 비즈니스 -->
									<button type="button" class="toggle-btn" data-checked="false" data-value="불포함">含まない</button> <!-- 불포함 -->
								</td>
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