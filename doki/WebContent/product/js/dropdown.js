document.addEventListener("DOMContentLoaded", function () {
    const dropdown = document.querySelector(".custom-dropdown");
    const selected = dropdown.querySelector(".selected");
    const dropdownMenu = dropdown.querySelector(".dropdown-menu");
    const subOptions = dropdown.querySelectorAll(".sub-option");
    const detailOptions = dropdown.querySelectorAll(".detail-option");

    // ✅ 웹 실행 시 드롭다운 기본적으로 숨기기
    dropdownMenu.style.display = "none"; 

    // ✅ 드롭다운 열고 닫기 (웹 실행 시 기본적으로 닫혀 있음)
    selected.addEventListener("click", (e) => {
        e.stopPropagation(); // 클릭 이벤트 버블링 방지
        dropdownMenu.style.display = dropdownMenu.style.display === "none" ? "flex" : "none";
    });

    // ✅ 외부 클릭 시 드롭다운 닫기
    document.addEventListener("click", (e) => {
        if (!dropdown.contains(e.target)) {
            dropdownMenu.style.display = "none"; // ✅ 드롭다운 닫힘
            subOptions.forEach(opt => opt.classList.remove("active")); // ✅ 2차 선택 초기화
            detailOptions.forEach(detail => detail.classList.add("d-none")); // ✅ 3차 메뉴 초기화
        }
    });

    // ✅ 2단계 지역 선택 → 3단계 메뉴 업데이트
    subOptions.forEach(option => {
        option.addEventListener("click", () => {
            subOptions.forEach(opt => opt.classList.remove("active"));
            option.classList.add("active");

            let target = option.getAttribute("data-target");
            console.log(`선택된 2차 지역: ${target}`); // 디버깅용

            // 🔹 **모든 3차 메뉴 숨기기**
            detailOptions.forEach(detail => {
                detail.classList.add("d-none"); // ✅ 기본적으로 숨김
                detail.style.display = "none";  // ✅ display 속성도 숨김
            });

            // 🔹 **2차 선택 시, 해당하는 3차 메뉴만 표시**
            if (target) {
                detailOptions.forEach(detail => {
                    if (detail.getAttribute("data-parent") === target) {
                        detail.classList.remove("d-none"); // ✅ 선택된 3차 메뉴 표시
                        detail.style.display = "block";  // ✅ flex로 조정 가능
                        console.log(`보이는 3차 지역: ${detail.textContent}`); // 디버깅
                    }
                });
            }
        });
    });

    // ✅ 3단계 지역 선택 시 값 반영 후 닫기
    detailOptions.forEach(option => {
        option.addEventListener("click", () => {
            selected.textContent = option.textContent;
            dropdownMenu.style.display = "none";
        });
    });
});
