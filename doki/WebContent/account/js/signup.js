// 아이디 유효성 검사 (영문 + 숫자 포함)
const idRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@._#\-!]{8,20}$/;  // 영문과 숫자 모두 포함하고 8~20자
// 비밀번호 유효성 검사 (영문 + 숫자 + 특수문자 포함)
const passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[!@#._\-]).{10,16}$/;

const useridInput = document.getElementById('userid');
const useridError = document.getElementById('useridErrormsg');
const passwordInput = document.getElementById('password');
const passwordError = document.getElementById('passwordErrormsg');
const checkpasswordInput = document.getElementById('checkpassword');
const passwordMsg = document.getElementById('checkpasswordmsg');

// 아이디 유효성 검사
function validateID() {
    const id = useridInput.value;
    if (idRegex.test(id)) {
        useridError.textContent = "아이디 형식이 올바릅니다.";
        useridError.style.color = "green"; 
        checkDuplicateID(id);
    } else {
        useridError.textContent = "아이디는 8~20자, 영문과 숫자를 포함해야 합니다."; 
        useridError.style.color = "red"; 
    }
}

// 비밀번호 유효성 검사
function validatePassword() {
    const password = passwordInput.value;
    if (passwordRegex.test(password)) {
        passwordError.textContent = "비밀번호 형식이 올바릅니다.";
        passwordError.style.color = "green";
    } else {
        passwordError.textContent = "비밀번호는 10~16자, 영문, 숫자 및 특수문자(@, ., #, -, _, !)를 포함해야 합니다.";
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
            passwordMsg.innerHTML = "<span style='color:red'>비밀번호 불일치</span>";
        } else {
            passwordMsg.innerHTML = "<span style='color:green'>비밀번호 일치</span>";
        }
    } else {
        passwordMsg.innerHTML = ""; // 값이 없으면 메시지 초기화
    }
}

function checkDuplicateID(id) {
    console.log("아이디 중복 체크 요청: ", id); 

    $.ajax({
        type: 'POST',
        url: '/member/signupro.do',  
        data: { userid: id },  
        success: function(response) {
            console.log("서버 응답: ", response); 

            if (response.trim() === "success") {
                $("#useridErrormsg").html("<span style='color:green'>사용 가능한 아이디입니다.</span>");
            } else {
                $("#useridErrormsg").html("<span style='color:red'>중복된 아이디입니다.</span>");
            }
        },
        error: function(xhr, status, error) {
            console.log("AJAX 요청 실패: ", status, error);
        }
    });
}


useridInput.addEventListener('input', validateID);
passwordInput.addEventListener('input', validatePassword);
checkpasswordInput.addEventListener('blur', checkPasswordMatch);

// 우편번호
document.getElementById("lookup_button").addEventListener("click", function() {
    const postalCodeInput = document.getElementById("postal_code").value.trim();

    // 유효한 7자리 우편번호인지 체크
    if (!/^\d{7}$/.test(postalCodeInput)) {
        alert("올바른 7자리 우편번호를 입력하세요.");
        return;
    }

    // Japan Post API URL (우편번호로 주소 찾기)
    const apiUrl = `https://zipcloud.ibsnet.co.jp/api/search?zipcode=1000001`;

    console.log("📡 API 요청 URL:", apiUrl);

    // API 호출
    fetch(apiUrl) 
        .then(response => response.json())
        .then(data => {
            console.log("📦 API 응답 데이터:", data);
            if (data.results && data.results.length > 0) {
                const result = data.results[0];

                // 각 주소 정보 나누기
                document.getElementById("prefecture").value = result.address1;  
                document.getElementById("city").value = result.address2;        
                document.getElementById("town").value = result.address3;        
            } else {
                alert("주소를 찾을 수 없습니다.");
            }
        })
        .catch(error => {
            console.error("❌ API 요청 오류:", error);
            alert("주소 검색 중 오류가 발생했습니다.");
        });
});

// 이메일
let receivedVerificationCode = ""; // 서버에서 받은 인증번호 저장

function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

document.getElementById("email_verify").addEventListener("click", function() {
    const emailPrefix = document.getElementById("email_prefix").value;
    let emailDomain = document.getElementById("email_domain").value;

    if (emailDomain === "custom") {
        emailDomain = document.getElementById("custom_email").value.trim();

        if (emailDomain === "") {
            email = emailPrefix; 						// 이메일 도메인 없이 emailPrefix만 저장
        } else {
            email = emailPrefix + "@" + emailDomain; 	// 직접 입력한 도메인과 조합
        }
    } else {
        email = emailPrefix + "@" + emailDomain; 		// 선택된 도메인과 조합
    }

	document.getElementById("full_email").value = email;
    console.log("회원가입 이메일: ", email); 

    if (!validateEmail(email)) {
        alert("올바른 이메일 주소를 입력하세요.");
        return;
    }

   $.ajax({
    type: 'POST',
    url: "/member/sendVerificationEmail.do",  
    data: { email: email }, 
    success: function(response) {
    console.log("응답 데이터:", response);

    let verificationCode = null;

    if (response.success === false && response.message.includes('{')) {
        try {
            // JSON 부분만 추출
            const jsonString = response.message.substring(response.message.indexOf('{'));
            const parsedMessage = JSON.parse(jsonString);
            verificationCode = parsedMessage.verificationCode;
        } catch (error) {
            console.error("JSON 파싱 오류:", error);
            alert("인증번호를 가져오는 중 오류가 발생했습니다.");
            return;
        }
    } else if (response.success) {
        verificationCode = response.verificationCode;
    }

    if (verificationCode) {
        receivedVerificationCode = verificationCode; // 인증번호 저장
        alert("인증번호가 이메일로 발송되었습니다.");
        document.getElementById("verification_code").disabled = false;
        document.getElementById("verify_code_btn").disabled = false;
    } else {
        alert("이메일 전송 실패: " + response.message);
    }
},

    error: function(xhr, status, error) {
        alert("이메일 전송 오류: " + error);
    }
});
});


// 인증번호 확인 버튼 이벤트
document.getElementById("verify_code_btn").addEventListener("click", function() {
    const userEnteredCode = document.getElementById("verification_code").value.trim();
    const verificationMessage = document.getElementById("verificationCodeError");

    if (!userEnteredCode) {
        verificationMessage.innerHTML = "<span style='color: red;'>인증번호를 입력하세요.</span>";
        return;
    }

    console.log("사용자가 입력한 인증번호:", userEnteredCode);
    console.log("서버에서 받은 인증번호:", receivedVerificationCode);

    if (userEnteredCode === receivedVerificationCode) {
        verificationMessage.innerHTML = "<span style='color: green;'>인증번호가 일치합니다.</span>";
    } else {
        verificationMessage.innerHTML = "<span style='color: red;'>인증번호가 일치하지 않습니다.</span>";
    }
});


document.getElementById("signupForm").addEventListener("submit", function(event) {
    event.preventDefault(); // 기본 폼 제출 방지

    let isValid = true;

    // 아이디 검사
    const id = useridInput.value;
    if (!idRegex.test(id)) {
        useridError.textContent = "아이디는 8~20자, 영문과 숫자를 포함해야 합니다."; 
        useridError.style.color = "red"; 
        useridInput.focus();
        isValid = false;
        return;
    }

    // 아이디 중복 검사 확인
    if (!useridError.textContent.includes("사용 가능한 아이디입니다.")) {
        alert("아이디 중복 검사를 통과해야 합니다.");
        useridInput.focus();
        isValid = false;
        return;
    }

    // 비밀번호 검사
    const password = passwordInput.value;
    if (!passwordRegex.test(password)) {
        passwordError.textContent = "비밀번호는 10~16자, 영문, 숫자 및 특수문자(@, ., #, -, _, !)를 포함해야 합니다.";
        passwordError.style.color = "red";
        passwordInput.focus();
        isValid = false;
        return;
    }

    // 비밀번호 확인 검사
    const checkpassword = checkpasswordInput.value;
    if (password !== checkpassword) {
        passwordMsg.innerHTML = "<span style='color:red'>비밀번호 불일치</span>";
        checkpasswordInput.focus();
        isValid = false;
        return;
    }

    // 이메일 인증 확인
    const verificationMessage = document.getElementById("verificationCodeError").innerHTML;
    if (!verificationMessage.includes("인증번호가 일치합니다.")) {
        alert("이메일 인증을 완료해야 합니다.");
        document.getElementById("verification_code").focus();
        isValid = false;
        return;
    }

    // 모든 검사를 통과하면 폼 제출
    if (isValid) {
        alert("회원가입이 완료되었습니다!"); // 가입 성공 알림
        document.getElementById("signupForm").submit();
    }
});


