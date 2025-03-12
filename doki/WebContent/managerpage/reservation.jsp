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
<title>Reservation</title>

<style>
.vertical-menu a {color: black; display: block; padding: 12px; text-decoration: none;}

.center {width: 100%; table-layout: auto; border-collapse: collapse;}
.center th {background-color: #eeeeee;}
.center th, td {padding: 10px;	text-align: center;	border: 1px solid #ccc;	vertical-align: middle;}
.center td {padding:0; border:none;}
/* 첫 번째 열(left)에만 테두리를 없애기 */
.center tr>*:first-child {border-left: none;}
/* 마지막 열(right)에만 테두리를 없애기 */
.center tr>*:last-child {border-right: none;}
</style>

	<!-- 본문 콘텐츠 -->
	<div class="container">
		<div class="row" style="margin-top: 100px;">
			<!-- 사이드바 영역 -->
			<div class="col-md-3">
				<%@ include file="side.jsp"%>
			</div>
			<!-- 메인 콘텐츠 영역 -->
			<div class="col-md-9">
				<b>予約管理</b> <!-- 예약 관리 -->
				<table class="center">
					<tr>
						<th>商品固有番号</th> <!-- 상품 고유번호 -->
						<th>使用者固有番号</th> <!-- 사용자 고유번호 -->
						<th>決済日</th> <!-- 결제일 -->
						<th>決済金額</th> <!-- 결제 금액 -->
						<th>購入顧客</th> <!-- 주문 고객 -->
						<th>旅行開始日</th> <!-- 여행 시작일 -->
						<th>旅行終了日</th> <!-- 여행 종료일 -->
						<th>予約管理</th> <!-- 예약 관리 -->
					</tr>
					<tr>
						<td>001</td>
						<td>101</td>
						<td>2025. 02. 22.</td>
						<td>109,000원</td>
						<td>山田</td>
						<td>2025. 05. 05.</td>
						<td>2025. 05. 08.</td>
						<td>
							<button class="deleteBtn" data-rno="${item.rno }">予約キャンセル</button>  <!-- 예약취소 -->
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

<script>
	$(function() {
		$(".deleteBtn").click(function() {
			var rno = $(this).data("rno");
			var $this = $(this);

			$.ajax({
				url : "",
				type : "post",
				data : {
					rno : rno
				},
				success : function(response) {
					if (response.trim() === "success") {
						$this.closest("").remove();
					} else {
						alert("삭제 실패");
					}
				}
			})
		})
	})
</script>
<%@ include file="../fragments/footer.jsp"%>