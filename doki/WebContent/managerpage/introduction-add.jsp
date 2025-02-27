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
<title>Notice_Add</title>
</head>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="container">
		<div class="row" style="margin-top: 130px;">
			<!-- 사이드바 영역 -->
			<div class="col-md-3">
				<%@ include file="side.jsp"%>
			</div>
			<!-- 메인 콘텐츠 영역 -->
<div class="col-md-9">
    <b style="text-align: center; font-size: 30px;">여행지소개 등록</b> <!-- 가운데 정렬 -->
    <div class="product-addbox" style="margin-bottom: 130px;"> <!-- 여백 추가 -->
        <form name="my" method="post" enctype="" action="" onsubmit="return check();">
            <table class="product-addtable">
                <tr>
                    <th>지역</th>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <th>한줄 소개</th>
                    <td><input type="text" name="price"></td>
                </tr>
                <tr>
                    <th>소개 내용</th>
                    <td><textarea class="form-control" rows="7"></textarea></td>
                </tr>
                <tr>
                    <th>이미지</th>
                    <td><input type="file" name="imgfile"></td>
                </tr>
                <tr>
                    <td colspan="2" class="txtcenter"><input type="submit" value="저장"> <input type="reset" value="다시쓰기"> <input type="button" value="목록" onclick=""></td>
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
</html>
<%@ include file="../fragments/footer.jsp"%>