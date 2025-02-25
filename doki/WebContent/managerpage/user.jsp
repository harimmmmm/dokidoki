<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/js/jquery-3.4.1.min.js"></script>
<title>User</title>
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<!-- 본문 콘텐츠 -->
	<div class="container">
		<div class="row" style="margin-top: 100px;">
			<!-- 사이드바 영역 -->
			<div class="col-md-3">
				<%@ include file="side.jsp"%>
			</div>
			<!-- 메인 콘텐츠 영역 -->
			<div class="col-md-9">
				<b>유저 관리</b>
				<table class="center">
					<tr>
						<th>아이디</th>
						<th>영문이름</th>
						<th>한자이름</th>
						<th>생년월일</th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입일</th>
						<th>권한</th>
						<th>관리</th>
					</tr>
					<tr>
						<td>java01</td>
						<td>yamada</td>
						<td>山田</td>
						<td>2001. 01. 01.</td>
						<td>010</td>
						<td>abc@gmail.com</td>
						<td>2025. 02. 25.</td>
						<td>유저</td>
						<td>
							<button class="deleteBtn" data-uno="${item.uno }">삭제</button>  
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
			var uno = $(this).data("uno");
			var $this = $(this);

			$.ajax({
				url : "",
				type : "post",
				data : {
					uno : uno
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