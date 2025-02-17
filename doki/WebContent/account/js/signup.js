document.getElementById("signupForm").addEventListener("submit", function (event) {
    let isValid = true;

    // 아이디 유효성 검사 (영문 또는 숫자 5~20자)
    const userId = document.getElementById("userid").value;
    const userIdRegex = /^[a-zA-Z0-9]{5,20}$/;
    if (!userIdRegex.test(userId)) {
        document.getElementById("useridError").innerText = "아이디는 5~20자의 영문 또는 숫자만 가능합니다.";
        isValid = false;
    } else {
        document.getElementById("useridError").innerText = "";
    }

    // 비밀번호 유효성 검사 (10~16자, 4가지 조합 중 2가지 이상)
    const password = document.getElementById("password").value;
    const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d|.*[\W_]).{10,16}$/;
    const forbiddenRegex = new RegExp(userId.slice(-4) + "$"); // 아이디 또는 전화번호 뒷자리 포함 방지

    if (!passwordRegex.test(password) || forbiddenRegex.test(password)) {
        document.getElementById("passwordError").innerText = "비밀번호는 10~16자이며, 영문, 숫자, 특수문자 중 2가지 이상 포함해야 합니다.";
        isValid = false;
    } else {
        document.getElementById("passwordError").innerText = "";
    }

    if (!isValid) {
        event.preventDefault(); // 유효성 검사 실패 시 폼 제출 방지
    }
});

// 이메일 도메인 선택 기능
document.getElementById("email_domain").addEventListener("change", function() {
    let customEmailInput = document.getElementById("custom_email");
    if (this.value === "custom") {
        customEmailInput.style.display = "block";
    } else {
        customEmailInput.style.display = "none";
    }
});

  // 이메일 도메인 선택 시 custom 입력 필드 보이기/숨기기
  document.getElementById("email_domain").addEventListener("change", function() {
    let customEmailInput = document.getElementById("custom_email");
    if (this.value === "custom") {
        customEmailInput.style.display = "block";
    } else {
        customEmailInput.style.display = "none";
    }
});

// 이메일 인증 버튼 클릭 시
document.getElementById("email_verify").addEventListener("click", function() {
    // 인증번호 보내기 (여기서는 예시로 "123456" 입력)
    let verificationCode = "123456"; // 실제 서버에서 인증번호를 보내면 이를 사용해야 함
    document.getElementById("verification_code").value = verificationCode; // 입력 폼에 인증번호 자동 입력
    alert("인증번호가 발송되었습니다!");
});


// 이메일 인증
document.getElementById("email_verify").addEventListener("click", function () {
    // 이메일 인증 버튼 클릭 시 인증번호 입력 활성화
    document.getElementById("verification_code").disabled = false;
    document.getElementById("verify_code_btn").disabled = false;
    document.getElementById("verify_code_btn").style.cursor = "pointer";
    document.getElementById("verify_code_btn").style.backgroundColor = "#007bff"; // 활성화 시 버튼 색 변경
    document.getElementById("verify_code_btn").style.color = "#fff";
});
