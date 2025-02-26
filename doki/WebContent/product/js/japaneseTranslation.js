document.addEventListener("DOMContentLoaded", function () {
    const destinationOptions = document.querySelectorAll(".detail-option");
    const selectedDestinationInput = document.getElementById("selectedDestination");
    const selectedText = document.querySelector(".selected");

    // 영문 → 일본어 변환 매핑 (검색 시 hidden input에 저장된 값과 비교)
    const destinationMap = {
        "ジェジュ島": "jeju",
        "ウルルン島": "ulleung",
        "カンウォン": "gangwon",
        "キョンサンプク道": "gyeongsangbuk",
        "キョンサンナム道": "gyeongsangnam",
        "プサン": "busan",
        "チョルラプク道": "jeollabuk",
        "チョルラナム道": "jeollanam",
        "チュンチョンプク道": "chungcheongbuk",
        "チュンチョンナム道": "chungcheongnam",
        "ソウル": "seoul",
        "インチョン": "incheon"
    };

    // 기존 검색 값이 있으면 선택된 상태로 설정
    if (selectedDestinationInput.value) {
        const selectedKey = destinationMap[selectedDestinationInput.value] || selectedDestinationInput.value;
        
        destinationOptions.forEach(option => {
            if (option.getAttribute("data-parent") === selectedKey) {
                option.classList.add("active"); // 선택된 항목에 'active' 추가
                selectedText.textContent = option.textContent.trim(); // 선택된 값 표시
            }
        });
    }

    // 사용자가 새로 선택할 경우
    destinationOptions.forEach(option => {
        option.addEventListener("click", function () {
            const selectedKey = this.getAttribute("data-parent");
            const selectedValue = this.textContent.trim();

            // hidden input 값 업데이트
            selectedDestinationInput.value = selectedValue;

            // 선택 UI 업데이트
            selectedText.textContent = selectedValue;

            // 기존 선택 제거 후 새 선택 적용
            destinationOptions.forEach(opt => opt.classList.remove("active"));
            this.classList.add("active");
        });
    });
});

document.addEventListener("DOMContentLoaded", function () {
    const searchForm = document.getElementById("searchForm");

    // 목적지 선택 이벤트 리스너
    const destinationOptions = document.querySelectorAll(".detail-option");
    const selectedDestinationInput = document.getElementById("selectedDestination");
    const selectedText = document.querySelector(".selected");

    destinationOptions.forEach(option => {
        option.addEventListener("click", function () {
            const selectedValue = this.textContent.trim();
            selectedDestinationInput.value = selectedValue;
            selectedText.textContent = selectedValue;

            // 폼 자동 제출 (검색 실행)
            searchForm.submit();
        });
    });

    // 출발지 선택 시 자동 검색 실행
    const departureSelect = document.getElementById("departure");
    departureSelect.addEventListener("change", function () {
        searchForm.submit();
    });

    // 날짜 입력 필드 변경 시 자동 검색 실행
    const dateInput = document.querySelector("input[name='daterange']");
    if (dateInput) {
        dateInput.addEventListener("change", function () {
            searchForm.submit();
        });
    }
});

document.addEventListener("DOMContentLoaded", function () {
    const dateInput = document.getElementById("datePicker");
    const startDateHidden = document.getElementById("startDateHidden");
    const endDateHidden = document.getElementById("endDateHidden");

    dateInput.addEventListener("change", function () {
        const dateRange = this.value.split(" - "); // 예: "2024-03-01 - 2024-03-05"
        if (dateRange.length === 2) {
            startDateHidden.value = dateRange[0].trim(); // 출발일
            endDateHidden.value = dateRange[1].trim(); // 종료일
        }
        console.log("출발일: " + startDateHidden.value);
        console.log("종료일: " + endDateHidden.value);
    });

    // 폼 제출 시 hidden input 값 확인
    document.getElementById("searchForm").addEventListener("submit", function () {
        console.log("폼 제출 시 startDate: " + startDateHidden.value);
        console.log("폼 제출 시 endDate: " + endDateHidden.value);
    });
});
document.addEventListener("DOMContentLoaded", function () {
    const dateInput = document.getElementById("datePicker");
    const startDateHidden = document.getElementById("startDateHidden");
    const endDateHidden = document.getElementById("endDateHidden");

    dateInput.addEventListener("change", function () {
        console.log("선택된 daterange 값: ", this.value);

        if (this.value.trim() === "") {
            console.log("⚠️ 날짜가 선택되지 않았음! (공백 상태)");
        }

        const dateRange = this.value.split(" - "); // 예: "2024-03-01 - 2024-03-05"
        if (dateRange.length === 2) {
            startDateHidden.value = dateRange[0].trim(); // 출발일
            endDateHidden.value = dateRange[1].trim(); // 종료일
            console.log("출발일:", startDateHidden.value, "종료일:", endDateHidden.value);
        } else {
            console.log("⚠️ 날짜 형식이 올바르지 않음!", this.value);
        }
    });

    // 폼 제출 시 hidden input 값 확인
    document.getElementById("searchForm").addEventListener("submit", function () {
        console.log("폼 제출 시 startDate: " + startDateHidden.value);
        console.log("폼 제출 시 endDate: " + endDateHidden.value);
    });
});
