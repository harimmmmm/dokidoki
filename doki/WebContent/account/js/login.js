document.getElementById("google-login-btn").addEventListener("click", function() {

 const CLIENT_ID = "902333858114-pekkqua81rkf1bijc1db40asjbj473tv.apps.googleusercontent.com";
const REDIRECT_URI = 'http://localhost:8021/member/callback';
const SCOPE = 'openid email profile';

const url = `https://accounts.google.com/o/oauth2/v2/auth?client_id=${CLIENT_ID}&redirect_uri=${encodeURIComponent(REDIRECT_URI)}&response_type=code&scope=${encodeURIComponent(SCOPE)}&access_type=offline&prompt=consent`;

window.location.href = url;  // 사용자가 이 URL을 통해 구글 로그인 페이지로 리디렉션됨

// 팝업에서 URL 파라미터로 받은 'code' 값 추출
function getCodeFromUrl() {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get('code');
}

// 'code'를 서버로 전송하여 액세스 토큰을 받아오는 과정
function handleCallback() {
    const code = getCodeFromUrl();
alert(code);
    
    if (code) {
        $.ajax({
            url: 'http://localhost:8021/member/callback',
            type: 'POST',
            contentType: 'application/json',
            data: JSON.stringify({ code: code }),
            success: function(response) {
                if (response.success) {
                    // 액세스 토큰을 받아 성공적으로 로그인
                    alert("로그인 성공!");
                    // 로그인 후 페이지 이동 등 처리
                } else {
                    alert("로그인 실패: " + response.message);
                }
            },
            error: function(xhr, status, error) {
                alert("AJAX Error: " + error);
            }
        });
    } else {
        alert("URL에서 'code'를 찾을 수 없습니다.");
    }
}

// 팝업에서 호출될 함수
window.onload = function() {
    handleCallback();  // 팝업 로드 시 callback 처리
};

});
