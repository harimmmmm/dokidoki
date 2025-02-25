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
<title>Notice_List</title>
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
				<b>공지 관리</b>
				<table class="center">
					<tr>
						<th>고유번호</th>
						<th>제목</th>
						<th>내용</th>
						<th>게시판 카테고리</th>
						<th>작성날짜</th>
					</tr>
					<tr>
						<td>001</td>
						<td>개인정보처리방침 개정 안내 <2025.02.22.></td>
						<td>대충 개정 내용</td>
						<td>공지</td>
						<td>
							<button class="updateBtn" data-mno="${item.mno }">수정</button>
							<button class="deleteBtn" data-mno="${item.mno }">삭제</button>
						</td>
					</tr>
					<tr>
						<td>002</td>
						<td>결제 방식 문의드립니다.</td>
						<td>대충 고객 문의 내용</td>
						<td>문의</td>
						<td>
							<button class="updateBtn" data-mno="${item.mno }">수정</button>
							<button class="deleteBtn" data-mno="${item.mno }">삭제</button>
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
			var nno = $(this).data("nno");
			var $this = $(this);

			$.ajax({
				url : "",
				type : "post",
				data : {
					nno : nno
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