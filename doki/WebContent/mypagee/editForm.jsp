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
	margin: 70px auto;
	
}
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>
		
		<main class="main-content">
            <section id="edit" class="edit">
                <h2>개인정보 수정</h2>
                <form action="#">
                    <label for="name">이름</label>
                    <input type="text" id="name" value="홍길동" required>

                    <label for="email">이메일</label>
                    <input type="email" id="email" value="hong@example.com" required>

                    <label for="password">비밀번호</label>
                    <input type="password" id="password" placeholder="새 비밀번호 입력" required>

                    <label for="confirm-password">비밀번호 확인</label>
                    <input type="password" id="confirm-password" placeholder="비밀번호 확인" required>

                    <button type="submit">저장</button>
                </form>
            </section>
        </main>
	</div>
</body>
<%@ include file="../fragments/footer.jsp"%>
</html>