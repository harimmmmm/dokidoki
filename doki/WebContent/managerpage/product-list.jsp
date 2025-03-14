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
<title>Product_List</title>

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
				<b>商品管理</b> <!-- 상품 관리 -->
			<table class="center">
				<tr>
					<th>固有番号</th> <!-- 고유번호 -->
					<th>商品名</th> <!-- 상품명 -->
					<th>価格</th> <!-- 가격 -->
					<th>出発日/到着日</th> <!-- 출발일/도착일 -->
					<th>管理</th> <!-- 관리 -->
				</tr>
				<c:forEach var="list" items="${palist }">
					<tr class="underline">
						<td>${list.package_id }</td>
						<td>${list.package_name }</td>
						<td>${list.package_price }</td>
						<td>${fn:substring(list.start_date, 0, 10)}<br> ~ <br>${fn:substring(list.end_date, 0, 10)}</td>
						<td>
							<button class="updateBtn" data-mno="${item.pno }">修正</button> <!-- 수정 -->
							<button class="deleteBtn" data-mno="${item.pno }">削	除</button> <!-- 삭제 -->
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