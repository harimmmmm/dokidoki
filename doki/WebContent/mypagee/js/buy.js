// 후기 작성 버튼 클릭 시 모달 열기
document.querySelectorAll('.review-btn').forEach((btn) => {
    btn.addEventListener('click', function () {
        document.getElementById('review-modal').style.display = 'block'; // 모달 열기
    });
});

// 모달 닫기 버튼 기능 추가
document.getElementById('close-review-modal').addEventListener('click', function () {
    document.getElementById('review-modal').style.display = 'none'; // 모달 닫기
});

// 모달 닫기
document.getElementById('close-review-modal').addEventListener('click', () => {
    document.getElementById('review-modal').style.display = 'none';
});

// 후기 작성 제출 처리
document.getElementById('review-form').addEventListener('submit', function (e) {
    e.preventDefault();
    const reviewText = document.getElementById('review').value;
    const reviewImage = document.getElementById('review-image').files[0];

    if (selectedRating > 0 && reviewText.trim() !== '') {
        // 후기 내용 및 선택 사항을 서버에 제출하는 로직 추가
        alert('후기가 제출되었습니다!');
        document.getElementById('review-modal').style.display = 'none';
        purchases[currentPurchaseIndex].hasReview = true;
        displayPurchases(purchases);  // 구매 목록 재갱신
    } else {
        alert('별점과 후기 내용을 작성해주세요!');
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const stars = document.querySelectorAll(".star");
    let selectedRating = 0; // 현재 선택된 별점

    // 별점을 클릭하면 선택된 별점 값 저장 & 색상 변경
    stars.forEach((star) => {
        star.addEventListener("click", function () {
            selectedRating = parseInt(this.getAttribute("data-value")); // 선택한 별점 값 저장
            updateStars(selectedRating);
        });
    });

    // 별점 색상 업데이트 함수
    function updateStars(rating) {
        stars.forEach((star) => {
            const starValue = parseInt(star.getAttribute("data-value"));
            if (starValue <= rating) {
                star.classList.add("selected"); // 선택한 별까지 색상 변경
            } else {
                star.classList.remove("selected"); // 선택 안 된 별은 기본 색상 유지
            }
        });
    }

    // 후기 작성 제출 처리
function viewReview(packageId) {
    console.log("후기 작성 버튼 클릭됨, packageId:", packageId); // 패키지 ID 값 확인

    // 모달 내부의 숨겨진 input에 packageId 설정
    document.getElementById("package-id").value = packageId;

    // 모달 열기
    document.getElementById('review-modal').style.display = 'block';
}

// 후기 작성 모달 닫기 기능 추가
document.getElementById("close-review-modal").addEventListener("click", function () {
    document.getElementById('review-modal').style.display = 'none';
});

// 폼 제출 이벤트
// 후기 작성 버튼 클릭 시 패키지 ID를 가져와서 모달에 전달
function viewReview(packageId) {
    console.log("후기 작성 버튼 클릭됨, packageId:", packageId); // 패키지 ID 확인

    if (!packageId || packageId.trim() === "") {
        alert("패키지 ID가 올바르지 않습니다. 다시 시도해주세요.");
        return;
    }

    // hidden input에 packageId 저장
    document.getElementById("package-id").value = packageId;
    console.log("모달에 설정된 packageId:", document.getElementById("package-id").value);

    // 모달 열기
    document.getElementById('review-modal').style.display = 'block';
}

// 후기 작성 버튼 클릭 시 이벤트 추가
document.querySelectorAll(".review-btn").forEach(button => {
    button.addEventListener("click", function () {
        const packageId = this.closest(".travel-card").getAttribute("data-package-id");
        console.log("클릭된 패키지 ID:", packageId);
        viewReview(packageId);
    });
});

// 후기 작성 폼 제출 이벤트
document.getElementById('review-form').addEventListener('submit', function (e) {
    e.preventDefault(); // 폼 제출 기본 동작 방지

    const packageId = document.getElementById('package-id').value; // hidden input에서 가져오기
    const reviewText = document.getElementById('review').value;
    const reviewImage = document.getElementById('review-image').files[0];

    console.log("폼 제출 시 packageId:", packageId); // 콘솔에 packageId 출력

    if (!packageId) {
        alert("패키지 ID를 찾을 수 없습니다. 다시 시도해주세요.");
        return;
    }

    if (selectedRating > 0 && reviewText.trim() !== '') {
        const formData = new FormData();
        formData.append('packageid', packageId);
        formData.append('rating', selectedRating);
        formData.append('content', reviewText);
        if (reviewImage) {
            formData.append('image', reviewImage);
        }

        console.log("전송되는 packageId:", packageId);

        const xhr = new XMLHttpRequest();
        xhr.open('POST', '/mypage/reviewpro.do', true);

        xhr.onload = function () {
            if (xhr.status === 200) {
                console.log('후기 저장 성공');
                alert('후기가 제출되었습니다!');
                document.getElementById('review-modal').style.display = 'none';
                window.location.href = "/mypage/past.do"; // 리다이렉트할 페이지
            } else {
                console.log('후기 저장 실패');
                alert('후기 저장 실패');
            }
        };

        xhr.send(formData);
    } else {
        alert('별점과 후기 내용을 작성해주세요!');
    }
});



});


// 글자수
document.getElementById('review').addEventListener('input', function () {
    const charCount = this.value.length;
    const maxLength = 500;
    const charCountElement = document.getElementById('char-count');

    charCountElement.textContent = `${charCount}/${maxLength}자`;

    if (charCount > maxLength) {
        charCountElement.style.color = 'red'; 
    } else {
        charCountElement.style.color = '#aaa'; 
    }
});


// 후기 보기
document.querySelectorAll('.review-btn-view').forEach((btn) => {
    btn.addEventListener('click', function () {
        // 가까운 부모 요소에서 packageId 가져오기
        const packageId = this.closest('.travel-card').getAttribute('data-package-id');

        if (!packageId) {
            console.error("패키지 ID를 찾을 수 없습니다.");
            return;
        }

        // 해당 packageId를 가진 모달 ID 찾기
        const modalId = `reviewModalview_${packageId}`;
        const modal = document.getElementById(modalId);

        if (modal) {
            modal.style.display = 'block'; // 모달 열기
        } else {
            console.error(`모달을 찾을 수 없습니다. ID: ${modalId}`);
        }
    });
});


document.querySelectorAll('.close-btn').forEach((btn) => {
    btn.addEventListener('click', function () {
        // 이 버튼이 속한 모달 찾기
        const modal = this.closest('.modal');
        if (modal) {
            modal.style.display = 'none'; // 모달 닫기
        }
    });
});

function openReviewModal(reviewId, content, rating, image, packageId) {
    console.log("openReviewModal 실행, packageId:", packageId, "reviewId:", reviewId);

    if (!packageId) {
        alert("패키지 ID가 없습니다. 다시 시도해주세요.");
        return;
    }

    let modalId = `reviewModalview_${packageId}`; // 모달 ID 생성
    let modal = document.getElementById(modalId);

    if (!modal) {
        alert("해당 리뷰 모달을 찾을 수 없습니다.");
        return;
    }

    // 모달 내부 값 설정
    document.getElementById('reviewContent').innerHTML = `
        <p>後記の内容: ${content}</p>
        <p>星占い: ${"★".repeat(rating)}</p>
        <img src="/uploads/${image}" alt="Review Image" style="max-width: 300px; display: block;">
    `;

    modal.style.display = 'block';
}

document.querySelectorAll(".review-btn-view").forEach(button => {
    button.addEventListener("click", function () {
        const packageId = this.closest(".travel-card").getAttribute("data-package-id");
        const reviewId = this.getAttribute("data-review-id");
        const content = this.getAttribute("data-review-content");
        const rating = this.getAttribute("data-review-rating");
        const image = this.getAttribute("data-review-image");

        console.log("후기 보기 버튼 클릭, packageId:", packageId);

        openReviewModal(reviewId, content, rating, image, packageId);
    });
});
