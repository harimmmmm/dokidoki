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
    const selectedDestinationInput = document.getElementById("selectedDestination");
    const departureSelect = document.getElementById("departure");
    const dateInput = document.getElementById("datePicker");
    const startDateHidden = document.getElementById("startDateHidden");
    const endDateHidden = document.getElementById("endDateHidden");

    // 목적지 선택 이벤트 리스너 수정
    // 목적지 클릭시
    document.querySelectorAll(".detail-option").forEach(option => {
        option.addEventListener("click", function () {
            selectedDestinationInput.value = this.textContent.trim();
            if (window.autoSubmit) {
                searchForm.submit();
            }
        });
    });

    // 출발지 선택시
    departureSelect.addEventListener("change", function () {
        if (window.autoSubmit) {
            searchForm.submit();
        }
    });

    // 날짜 입력 필드 변경 시 이벤트 리스너 수정 (customdate.js에서 별도 관리 가능)


    // 입력값 유지 함수 추가
    function ensureValues() {
        // 목적지가 비어있으면 JSP에서 전달된 기존 값으로 복구
        if (!selectedDestinationInput.value) {
            selectedDestinationInput.value = '${param.destination}';
        }

        // 출발지가 비어있으면 JSP에서 전달된 기존 값으로 복구
        if (!departureSelect.value) {
            departureSelect.value = '${param.departure}';
        }

        // 날짜가 비어있으면 JSP에서 전달된 기존 값으로 복구
	    if (!dateInput.value && '${param.startDate}' && '${param.endDate}') {
	        dateInput.value = '${param.startDate} - ${param.endDate}';
	        startDateHidden.value = '${param.startDate}';
	        endDateHidden.value = '${param.endDate}';
	        console.log("1" + startDateHidden.value);
	    } else if (dateInput.value) {
	        const dates = dateInput.value.split(" - ");
	        if (dates.length === 2) {
	            startDateHidden.value = dates[0];
	            endDateHidden.value = dates[1];
	            console.log("2" + startDateHidden.value);
	        }
	    }
	}
// 함수를 글로벌 범위에 등록하여 다른 파일에서 접근 가능하게 합니다.
window.ensureValues = ensureValues;
});


