document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById("datePicker");
    const startDateHidden = document.getElementById("startDateHidden");
    const endDateHidden = document.getElementById("endDateHidden");
    const searchForm = document.getElementById("searchForm");

    // flatpickr 적용
    flatpickr(dateInput, {
        mode: "range", // 날짜 범위 선택
        dateFormat: "Y-m-d", // 날짜 형식 (선택된 날짜는 이 형식으로 저장)
        onChange: function (selectedDates, dateStr, instance) {
            if (selectedDates.length > 0) {
                // 선택된 날짜를 서버에 맞게 변환 (YY/MM/DD 형식으로)
                const startDate = selectedDates[0];
                const endDate = selectedDates[1];

                // YYYY-MM-DD => YY/MM/DD로 변환
                const formattedStartDate = startDate.getFullYear().toString().slice(2) + '/' + 
                                           (startDate.getMonth() + 1 < 10 ? '0' : '') + (startDate.getMonth() + 1) + '/' + 
                                           (startDate.getDate() < 10 ? '0' : '') + startDate.getDate();

                const formattedEndDate = endDate.getFullYear().toString().slice(2) + '/' + 
                                         (endDate.getMonth() + 1 < 10 ? '0' : '') + (endDate.getMonth() + 1) + '/' + 
                                         (endDate.getDate() < 10 ? '0' : '') + endDate.getDate();

                // hidden 필드에 변환된 날짜 값 저장
                startDateHidden.value = formattedStartDate;
                endDateHidden.value = formattedEndDate;
            }
            console.log("선택된 날짜 범위: ", dateStr);
            searchForm.submit(); // 자동 검색 실행
        }
    });
});
