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
