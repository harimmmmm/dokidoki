// 부모 페이지에서 메시지 받기
window.addEventListener("message", function(event) {
    if (event.origin !== 'http://localhost:8021') return;  // 안전을 위해 출처 확인
    
    if (event.data.type === 'loginSuccess') {
        const accessToken = event.data.accessToken;
        
        // 로그인 성공 처리 (예: 세션에 accessToken 저장)
        console.log('로그인 성공, accessToken:', accessToken);

        // 메인 페이지를 로그인 상태로 갱신하는 작업
        // 예: 로그인된 상태로 페이지 갱신
        location.reload();  // 또는 다른 로그인 후 처리 방식
    }
});
