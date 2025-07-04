<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>どきどきkorea</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/mypagee/css/mypage.css">
</head>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.containerr {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	margin: 70px auto;
}

.pw-title {
	font-family: Arial, sans-serif;
	margin-bottom: 20px;
	font-size: 24px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: bold;
	margin-top: 20px;
}

input {
	width: 100%;
	padding: 10px;
	margin-bottom: 15px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

.pwbtn {
	width: 100%;
	padding: 10px;
	background-color: #486988;
	color: white;
	border: none;
	border-radius: 4px;
	font-size: 16px;
	cursor: pointer;
	margin-top: 20px;
}

.pwbtn:hover {
	background-color: #374d61;
}
</style>
<body>
	<%@ include file="../fragments/header.jsp"%>
	<div class="mypage-container">
		<%@ include file="mypageSidebar.jsp"%>

		<main class="main-content">
			<div class="containerr">
				<p class="pw-title">パスワード変更</p>
				<form id="passwordForm" action="/mypage/passwordEditpro.do" method="post" onsubmit="return validatePasswords()">
					<label for="currentPassword">現在のパスワード</label> 
					<input type="password" id="currentPassword" name="user_password" placeholder="現在のパスワード入力" required autocomplete="current-password">
					
					
					<label for="newPassword">新しいパスワード</label> 
					<input type="password" id="newPassword" name="newPassword" placeholder="パスワード(10~16文字、英文、数字及び特殊文字(@、.、#、-、_、!))" required oninput="validatePassword()">
					<span class="error-msg" id="passwordErrormsg"></span> <br>
					
					<label for="confirmPassword">新しいパスワードの確認</label> 
					<input type="password" id="confirmPassword" name="confirmPassword" placeholder="パスワード確認" required oninput="checkPasswordMatch()">
					<span class="error-msg" id="checkpasswordmsg"></span>
					
					<button type="submit" class="pwbtn">パスワード変更</button>
				</form>
			</div>
		</main>
	</div>
	<c:if test="${not empty msg}">
    <script>
        alert("${msg}");
        <% session.removeAttribute("msg"); %>
    </script>
</c:if>

</body>
<%@ include file="../fragments/footer.jsp"%>
<script type="text/javascript">

const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#._\-]).{10,16}$/;

const passwordInput = document.getElementById('newPassword');
const passwordError = document.getElementById('passwordErrormsg');
const checkpasswordInput = document.getElementById('confirmPassword');
const passwordMsg = document.getElementById('checkpasswordmsg');

// 비밀번호 유효성 검사
function validatePassword() {
    const password = passwordInput.value;
    if (passwordRegex.test(password)) {
        passwordError.textContent = "パスワードの形式が正しいです。";
        passwordError.style.color = "green";
    } else {
        passwordError.textContent = "パスワードには10~16文字、英数字、特殊文字(@、.、#、-、_、!)が含まれなければなりません。";
        passwordError.style.color = "red";
    }
}

// 비밀번호 확인 일치 검사
function checkPasswordMatch() {
    const password = passwordInput.value;
    const checkpassword = checkpasswordInput.value;

    // 비밀번호가 일치하는지 확인
    if (password && checkpassword) { // 두 필드 모두 값이 있을 때만 비교
        if (password !== checkpassword) {
            passwordMsg.innerHTML = "<span style='color:red'>パスワードの不一致</span>";
        } else {
            passwordMsg.innerHTML = "<span style='color:green'>パスワード一致</span>";
        }
    } else {
        passwordMsg.innerHTML = ""; // 값이 없으면 메시지 초기화
    }
}

function validatePasswords() {
    var newPassword = document.getElementById("newPassword").value;
    var confirmPassword = document.getElementById("confirmPassword").value;

    if (newPassword !== confirmPassword) {
        alert("新しいパスワードと確認パスワードが一致しません。");
        return false; // 폼 제출을 막음
    }

    // 비밀번호 유효성 검사 추가
    if (!passwordRegex.test(newPassword)) {
        alert("パスワードには10~16文字、英数字、特殊文字(@、.、#、-、_、!)が含まれなければなりません。");
        return false;
    }

    // 비밀번호가 일치하고 유효하면 제출
    return true;
}
</script>
</html>