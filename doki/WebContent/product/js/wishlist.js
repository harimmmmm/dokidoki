document.addEventListener("DOMContentLoaded", () => {
    // ⭐️ 페이지 로딩 시 초기 관심 상태 체크 및 설정
    fetch(`${CONTEXT_PATH}/pakage/wishlist/list.do?timestamp=${new Date().getTime()}`)
        .then(resp => {
            if (resp.status === 401) {
                return [];
            }
            return resp.json();
        })
        .then(wishlist => {
            const wishlistSet = new Set(wishlist.map(String)); // 모든 ID를 명시적으로 문자열로 변환

            document.querySelectorAll('.wishlist-btn').forEach(button => {
                const packageId = button.getAttribute('data-package-id').trim();
                const icon = button.querySelector(".wishlist-icon");

                // 이제 항상 문자열 타입으로 비교됩니다.
                if (wishlistSet.has(packageId)){
                    icon.src = `${CONTEXT_PATH}/product/img/hearts.png`;
                } else {
                    icon.src = `${CONTEXT_PATH}/product/img/heart.png`;
                }
            });
        })
        .catch(err => console.error("初期関心リスト照会エラー:", err));

    // ⭐️ 관심 버튼 클릭 이벤트 처리
    document.querySelectorAll('.wishlist-btn').forEach(button => {
        button.addEventListener('click', () => {
            const packageId = button.getAttribute('data-package-id');
            const icon = button.querySelector(".wishlist-icon");

            const isCurrentlyLiked = icon.src.includes("hearts.png");
            const actionUrl = isCurrentlyLiked 
                ? `${CONTEXT_PATH}/pakage/wishlist/remove.do` 
                : `${CONTEXT_PATH}/pakage/wishlist/add.do`;

            fetch(actionUrl, {
                method: "POST",
                headers: {"Content-Type": "application/x-www-form-urlencoded"},
                body: `package_id=${packageId}`
            })
            .then(resp => {
                if(resp.status === 401){
                    alert("ログインが必要です。");
                    location.href = `${CONTEXT_PATH}/member/login.do`;
                    return null;
                }
                return resp.json();
            })
            .then(result => {
                if(result && result.status){
                    if(result.status === "added"){
                        icon.src = `${CONTEXT_PATH}/product/img/hearts.png`;
                    } else if(result.status === "removed"){
                        icon.src = `${CONTEXT_PATH}/product/img/heart.png`;
                    }
                } else {
                    console.error("結果が正しくありません:", result);
                }
            })
            .catch(err => {
                console.error("サーバーエラー:", err);
            });
        });
    });
});
