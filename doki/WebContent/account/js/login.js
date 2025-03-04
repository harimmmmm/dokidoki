document.getElementById("google-login-btn").addEventListener("click", function() {
    const CLIENT_ID = "902333858114-pekkqua81rkf1bijc1db40asjbj473tv.apps.googleusercontent.com";
    const REDIRECT_URI = "http://localhost:8021/member/callback"; // 콜백을 받을 URL

    // Google OAuth2 로그인 URL 생성
    const url = 'https://accounts.google.com/o/oauth2/v2/auth'
        + '?client_id=' + CLIENT_ID
        + '&redirect_uri=' + encodeURIComponent(REDIRECT_URI)
        + '&response_type=code'
        + '&scope=' + encodeURIComponent('openid email profile')
        + '&access_type=offline'
        + '&prompt=consent';

    // 팝업을 열어 구글 로그인 진행
    const popup = window.open(url, "GoogleLoginPopup", 'width=1000,height=600,resizable=yes,scrollbars=yes');

    // 팝업 차단 처리
    if (!popup || popup.closed || typeof popup.closed === "undefined") {
        alert("팝업이 차단되었습니다. 팝업 차단을 해제하고 다시 시도해주세요.");
    }

    // 팝업에서 리디렉션 URL을 확인하여 'code' 값을 추출
    const interval = setInterval(function() {
        try {
            if (popup.location.href.indexOf(REDIRECT_URI) !== -1) {
                const url = popup.location.href;
                const urlParams = new URLSearchParams(url.split('?')[1]);
                const code = urlParams.get('code');

                if (code) {
                    console.log("Extracted code: " + code);	// code 값을 알림으로 표시
					clearInterval(interval);  // 코드 추출 후 인터벌 종료
                    popup.close();  // 팝업을 닫음

                    // 부모 창으로 메시지 전송
                    if (window.opener) {
                        window.opener.postMessage({ success: true, redirectUrl: "/doki" }, "*");
                    } else {
                        // 부모 창이 없으면 팝업 창에서 직접 부모 창 리디렉션
                        parent.location.href = "/doki"; // 부모 창으로 리디렉션
                    }
                }else{
		           alert("로그인에 실패했습니다. 다시 시도해주세요.");  // code 값을 알림으로 표시
				}
            }
        } catch (e) {
            // 팝업이 다른 도메인에 있을 때 발생하는 에러를 무시
            console.error("Error while checking popup URL", e);
        }
    }); 
});

// 부모 창에서 메시지를 수신하고 리디렉션 처리
window.addEventListener("message", function(event) {
    if (event.data.success && event.data.redirectUrl) {
        window.location.href = event.data.redirectUrl;  // 메인 페이지로 리디렉션
    }
});
