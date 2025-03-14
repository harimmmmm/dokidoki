document.addEventListener('DOMContentLoaded', function () {
    const dateInput = document.getElementById("datePicker");
    const startDateHidden = document.getElementById("startDateHidden");
    const endDateHidden = document.getElementById("endDateHidden");
    const searchForm = document.getElementById("searchForm");

    const today = new Date();
    const tomorrow = new Date(today);
    tomorrow.setDate(today.getDate() + 1);

    // JSP에서 전달된 날짜값을 JavaScript로 설정
    let defaultDates = [today, tomorrow];

    if (dateInput.value && dateInput.value.includes('to')) {
        const dates = dateInput.value.split(" to ");
        if (dates.length === 2) {
            defaultDates = [new Date(dates[0]), new Date(dates[1])];
            startDateHidden.value = dates[0];
            endDateHidden.value = dates[1];
        }
    }

    flatpickr(dateInput, {
        mode: "range",
        dateFormat: "Y/m/d",
        defaultDate: defaultDates,
        onReady: function (selectedDates, dateStr, instance) {
            startDateHidden.value = formatDate(selectedDates[0]);
            endDateHidden.value = formatDate(selectedDates[1]);
        },
        onChange: function (selectedDates, dateStr, instance) {
            startDateHidden.value = formatDate(selectedDates[0]);
            endDateHidden.value = formatDate(selectedDates[1]);

            if (window.autoSubmit) {
                document.getElementById("searchForm").submit();
            }
        }
    });

    function formatDate(date) {
        const year = date.getFullYear();
        const month = ('0' + (date.getMonth() + 1)).slice(-2);
        const day = ('0' + date.getDate()).slice(-2);
        return `${year}/${month}/${day}`;
    }
});
