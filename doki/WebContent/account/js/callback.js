/*
    const sendMessageToParent = (token) => {
        const targetWindow = window.opener || window.parent;

        if (targetWindow) {
            targetWindow.postMessage({
                type: "login_success",
                token: token
            }, "*");

            // 팝업에서 부모 창을 새로 고침
            window.opener.location.reload();  // 부모 창 새로 고침
            window.close();  // 팝업 창 닫기
        } else {
            alert("부모 창을 찾을 수 없습니다.");
        }
    };

    const urlParams = new URLSearchParams(window.location.search);
    const code = urlParams.get("code");

    if (code) {
        fetch("http://localhost:8021/doki/auth/token", {
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: new URLSearchParams({ code: code })
        })
        .then(response => response.json())
        .then(data => {
            if (data.access_token) {
                sendMessageToParent(data.access_token);
            } else {
                alert("로그인 실패: " + data.error);
                window.close();
            }
        })
        .catch(error => {
            console.error("Error:", error);
            alert("로그인 처리 중 오류 발생");
            window.close();
        });
    }
*/