<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 홈</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
</head>
<style>
    .main-content {
        margin-top: 300px;
        /* display: flex; */
        justify-content: center;
        align-items: center;
        height: 80vh;
        text-align: center;
        font-size: 18px;
        font-weight: bold;
        letter-spacing: -0.5px;
    }
    .cancelIcon{
        margin-bottom: 30px;
    }
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>
		
		  <main class="main-content">
            <img alt="empty" src="<%=request.getContextPath()%>/mypagee/img/cancel.png" class="cancelIcon">
            <p class="op">취소된 여행이 없습니다</p>
        </main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>