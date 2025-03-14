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

			<b>使用者管理</b> <!-- 사용자 관리 -->
			
			<table class="center">
				
				<tr>
					<th>ID</th> <!-- 아이디 -->
					<th>英語名</th> <!-- 영문이름 -->
					<th>漢字名</th> <!-- 한자이름 -->
					<th>生年月日</th> <!-- 생년월일 -->
					<th>電話番号</th> <!-- 전화번호 -->
					<th>メール</th> <!-- 이메일 -->
					<th>登録日</th> <!-- 가입일 -->
					<th>管理</th> <!-- 관리 -->

				</tr>
				
				<c:forEach var="list" items="${list }">
					<tr>
						<td>${list.user_id }</td>
						<td>${list.name }</td>
						<td>${list.name_kanji }</td>
						<td>${list.birth_date }</td>
						<td>${list.tel }</td>
						<td>${list.email }</td>
						<td>${list.join_date }</td>
						
						<td>
							<button class="deleteBtn" data-uno="${list.user_id }">削除</button> <!-- 삭제 -->
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
<%@ include file="../fragments/footer.jsp"%>