<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/fragments/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/managerpage/css/managerstyle.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="/js/jquery-3.4.1.min.js"></script>


<style>
th, td {border:none;}

.vertical-menu a {color: black; display: block; padding: 12px; text-decoration: none;}

.product-addlist {flex: 2; padding-right: 10px; border-right: 1px solid #ccc;}

.product-addbox {display: flex; gap: 20px;}
.product-addbox .context {line-height: 220%; padding-bottom: 40px;}
.product-addbox .btn-group .btnbutton {border: 1px solid #ccc; padding: 8px 12px;}

.product-addtable {width: 315%; height: 420px;}
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
				<b>空地登録</b> <!-- 공지 등록 -->
				<div class="product-addbox">
					<form name="my" method="post" action="/manager/notice_addpro.do" ><!-- onsubmit="return check();" -->
						<table class="product-addtable">
							<tr>
								<th>題目</th> <!-- 제목 -->
								<td><input type="text" name="title" required></td>
							</tr>
							<tr>
								<th>內容</th> <!-- 내용 -->
								<td><textarea class="form-control" rows="3" name="content" required></textarea></td>
							</tr>
							<tr>
								<th>掲示板カテゴリー</th>
								<td>
									<label class="check-container">空地<input type="radio" name="noticeGroup" checked="checked"> 
									<span class="checkmark"></span> 공지
									</label> 
									<label class="check-container">問合せ <input type="radio" name="noticeGroup"> 
									<span class="checkmark"></span> 문의
									</label> 
									<label class="check-container">旅先紹介  여행지 소개
									<input type="radio" name="noticeGroup"> <span class="checkmark"></span>
									</label>
								</td>
							</tr> 
							<tr>
								<th>イメージ</th>
								<td><input type="file" name="imgfile"></td>
							</tr>
							<tr>
								<td colspan="2" class="txtcenter"><input type="submit" value="貯藏"> <!-- 저장 -->
								<input type="reset" value="かきかえ"> <!-- 다시쓰기 -->
								<input type="button" value="目錄" onclick="window.location.href='/manager/notice_list.do'"></td> <!-- 목록 -->
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>

	<script>
		function myFunction() {
			// Get the checkbox
			var checkBox = document.getElementById("myCheck");
			// Get the output text
			var text = document.getElementById("text");

			// If the checkbox is checked, display the output text
			if (checkBox.checked == true) {
				text.style.display = "block";
			} else {
				text.style.display = "none";
			}
		}
	</script>
<%@ include file="../fragments/footer.jsp"%>
