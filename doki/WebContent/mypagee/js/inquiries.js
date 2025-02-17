// 모달 관련 코드
const openModalBtn = document.getElementById("open-modal");
const modal = document.getElementById("modal");
const closeModalBtn = document.getElementById("close-modal");

// 모달 열기
openModalBtn.addEventListener("click", () => {
    modal.style.display = "block";
});

// 모달 닫기a
closeModalBtn.addEventListener("click", () => {
    modal.style.display = "none";
});

// 모달 외부 클릭 시 닫기
window.addEventListener("click", (event) => {
    if (event.target === modal) {
        modal.style.display = "none";
    }
});

// 폼 제출 (이곳에서 서버와 연동하여 처리하면 됩니다)
document.getElementById("inquiry-form").addEventListener("submit", function(e) {
    e.preventDefault();
    alert("문의가 제출되었습니다!");
    modal.style.display = "none"; // 문의 후 모달 닫기
});
