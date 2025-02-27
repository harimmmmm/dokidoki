<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../fragments/header.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/boardstyle.css">


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 100%;
  padding: 10px; /* 내부 여백 조정 */
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
  font-size: 14px; /* 글씨 크기 조정 */
}

label {
  padding: 10px 10px 10px 0; /* 패딩 조정 */
  display: inline-block;
  font-size: 14px; /* 글씨 크기 조정 */
}

input[type=submit] {
  background-color: #04AA6D;
  color: white;
  padding: 5px 10px; /* 내부 여백 조정 (좌우 줄임) */
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  font-size: 14px; /* 글씨 크기 조정 */
}

input[type=submit]:hover {
  background-color: #45a049;
}

.a {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  margin-bottom: 130px; /* 전체 영역 아래 여백 추가 */
  margin-top: 50px; /* 위쪽 여백 추가하여 아래로 내림 */
}

.col-25 {
  float: left;
  width: 12.5%; /* 너비 조정 */
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 37.5%; /* 너비 조정 */
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* 추가된 여백 스타일 */
h2 {
  margin-top: 130px; /* h2 태그 위 여백 */
  margin-bottom: 20px; /* h2 태그 아래 여백 (조정) */
  text-align: center; /* 가운데 정렬 */
  font-size: 30px; /* 글씨 크기 조정 (키움) */
}

p {
  margin-bottom: 10px; /* p 태그 아래 여백 (조정) */
  text-align: center; /* 가운데 정렬 */
  font-size: 18px; /* 글씨 크기 조정 (키움) */
}
</style>
</head>
<body>

<h2>글쓰기</h2>
<p>INSERT 작성해보세요!</p>

<div class="container a">
  <form action="/action_page.php" enctype="multipart/form-data">
    <div class="row">
      <div class="col-25">
        <label for="fname">제목</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="제목" placeholder="제목을 입력하세요">
      </div>
    </div>

    <div class="row">
      <div class="col-25">
        <label for="subject">내용</label>
      </div>
      <div class="col-75">
        <textarea id="subject" name="subject" placeholder="내용을 입력하세요" style="height:200px"></textarea>
      </div>
    </div>

    <!-- 첨부파일 입력란 추가 -->
    <div class="row file-upload">
      <div class="col-25">
        <label for="file">첨부파일</label>
      </div>
      <div class="col-75">
        <input type="file" id="file" name="file">
      </div>
    </div>

    <div class="row">
      <input type="submit" value="글쓰기" style="width: 150px; margin-left: 405px; margin-top: 10px; background-color: #486988; color: white;"> <!-- 가로 길이 조정과 왼쪽 여백, 위 여백, 색상 추가 -->
    </div>
  </form>
</div>

</body>
</html>








<%@ include file="../fragments/footer.jsp"%>
