<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
.vertical-menu a {color: black; display: block; padding: 12px; text-decoration: none;}

.center {width: 100%; table-layout: auto; border-collapse: collapse;}
.center th {background-color: #eeeeee;}
.center th, td {padding: 10px;	text-align: center;	border: 1px solid #ccc;	vertical-align: middle;}
.center td {padding:0; border:none;}
.underline {border-bottom: 1px solid #ccc;}
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
				<b>決済管理</b>  <!-- 결제 관리 -->
				<table class="center">
					<tr>
						<th>注文番号</th> 	<!-- 주문번호 -->
						<th>商品コード</th>		<!-- 패키지코드 -->
						<th>USER ID</th>		<!-- 유저아이디 -->
						<th>決済金額</th> 	<!-- 결제 금액 -->
						<th>決済時間</th>	<!-- 결제시간 -->
						<th>決済状態</th>	<!-- 결제상태 -->
						<th>PAYPAL ID</th>		<!-- 페이팔아이디 -->
						<th>決済管理</th> 	<!-- 결제 관리 -->
					</tr>
					<c:forEach var="list" items="${paylist }">
						<tr class="underline">
							<td>${list.order_id }</td>
							<td>${list.PACKAGE_ID }</td>
							<td>${list.USER_ID }</td>
							<td>${list.amount }</td>
							<td>${fn:substring(list.pay_time, 2, 16)}</td>
							<td><span style="color: green;">${list.paypal_status }</span></td>
							<td>${list.paypal_payer_id }</td>
							<td>
	
								<button class="deleteBtn" data-pno="">払い戻す</button> <!-- 환불 -->
	
							</td>
						</tr>
					</c:forEach>
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