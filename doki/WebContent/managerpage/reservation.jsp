<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ include file="../fragments/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/js/jquery-3.4.1.min.js"></script>
<title>Reservation</title>
</head>
<body>
	<!-- 본문 콘텐츠 -->
	<div class="container">
		<div class="row" style="margin-top: 100px;">
			<!-- 사이드바 영역 -->
			<div class="col-md-3">
				<%@ include file="side.jsp"%>
			</div>
			<!-- 메인 콘텐츠 영역 -->
			<div class="col-md-9">
				<b>예약 관리</b>
				<table class="center">
					<tr>
						<th>패키지 고유번호</th>
						<th>계정 고유번호</th>
						<th>결제일</th>
						<th>결제 금액</th>
						<th>구매 고객</th>
						<th>여행 시작일</th>
						<th>여행 종료일</th>
						<th>예약 관리</th>
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
							<button class="deleteBtn" data-rno="${item.rno }">예약취소</button>  
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>

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
</html>
<%@ include file="../fragments/footer.jsp"%>