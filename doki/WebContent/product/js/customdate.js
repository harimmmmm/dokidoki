document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById("datePicker");
    const startDateHidden = document.getElementById("startDateHidden");
    const endDateHidden = document.getElementById("endDateHidden");
    const searchForm = document.getElementById("searchForm");

    const today = new Date();
    const tomorrow = new Date(today);  // 오늘 날짜 복사
    tomorrow.setDate(today.getDate() + 1);  // 하루 더하기
    const formattedToday = formatDate(today);

    // Ensure values are set (including the date range) from JSP
    if (dateInput.value) {
        const dates = dateInput.value.split(" - ");
        if (dates.length === 2) {
            startDateHidden.value = dates[0];
            endDateHidden.value = dates[1];
        }
    } else {
        // JSP에서 전달된 값으로 초기화
        startDateHidden.value = '${param.startDate}';
        endDateHidden.value = '${param.endDate}';
    }

    flatpickr(dateInput, {
        mode: "range",
        dateFormat: "Y/m/d",
        defaultDate: (dateInput.value && dateInput.value.split(" - ").length === 2) 
            ? dateInput.value.split(" - ") 
            : [today, tomorrow], // 기존 값이 있으면 그 값 사용, 없으면 오늘과 내일
        onReady: function(selectedDates, dateStr, instance) {
            if (!dateInput.value) {

                startDateHidden.value = formattedToday;	
                endDateHidden.value = formattedToday;
            }
        },
        onChange: function (selectedDates, dateStr, instance) {
            if (selectedDates.length === 2) {
                startDateHidden.value = formatDate(selectedDates[0]);
                endDateHidden.value = formatDate(selectedDates[1]);

                // 페이지별 자동검색 여부 조건 추가
                if (window.autoSubmit) {
                    searchForm.submit();
                }
            }
        }
    });

    function formatDate(date) {
        return date.getFullYear().toString().slice(2) + '/' +
            ('0' + (date.getMonth() + 1)).slice(-2) + '/' +
            ('0' + date.getDate()).slice(-2);
    }

});
