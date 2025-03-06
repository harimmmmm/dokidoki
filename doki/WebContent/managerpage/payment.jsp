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
<title>Payment</title>

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
				<b>결제 관리</b>
				<table class="center">
					<tr>
						<th>주문번호</th>
						<th>패키지명</th>
						<th>결제일</th>
						<th>결제 금액</th>
						<th>거래 상세정보</th>
						<th>결제 관리</th>
					</tr>
					<tr>
						<td>001</td>
						<td>서울-부산 투어</td>
						<td>2025. 02. 22.</td>
						<td>109,000원</td>
						<td>신용카드</td>
						<td>
							<button class="deleteBtn" data-pno="${item.pno }">환불</button>  
						</td>
					</tr>
					<tr>
						<td>002</td>
						<td>서울-부산 투어</td>
						<td>2025. 02. 22.</td>
						<td>109,000원</td>
						<td>카카오페이</td>
						<td>
							<button class="deleteBtn" data-pno="${item.pno }">환불</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>

<script>
	$(function() {
		$(".deleteBtn").click(function() {
			var pno = $(this).data("pno");
			var $this = $(this);

			$.ajax({
				url : "",
				type : "post",
				data : {
					pno : pno
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