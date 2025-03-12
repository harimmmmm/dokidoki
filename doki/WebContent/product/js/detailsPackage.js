document.addEventListener('DOMContentLoaded', function() {
    // ✅ 슬라이더 설정
    $('.slider').slick({
        dots: true,
        infinite: true,
        speed: 500,
        slidesToShow: 1,
        slidesToScroll: 1
    });

    // ✅ 여행 핵심 정보 모달
    var infoModalEl = document.getElementById('infoModal');
    if (infoModalEl) {
        var infoModal = new bootstrap.Modal(infoModalEl);
        document.getElementById('infoBtn').addEventListener('click', function() {
            infoModal.show();
        });
        document.querySelector('#infoModal .btn-close').addEventListener('click', function() {
            infoModal.hide();
        });
    }

    // ✅ 공유 버튼 (URL 복사)
    var shareBtn = document.getElementById('share');
    if (shareBtn) {
        shareBtn.addEventListener('click', function() {
            var pageUrl = window.location.href;
            navigator.clipboard.writeText(pageUrl)
                .then(() => {
                    showToast("URL 복사 성공! 🎉");
                })
                .catch(err => {
                    console.error("URL 복사 실패:", err);
                    showToast("URL 복사 실패! 😢");
                });
        });
    }

    // ✅ 상품 코드 & 단체번호 클릭 시 복사
    document.querySelectorAll('.copy-text').forEach(function(element) {
        element.addEventListener('click', function() {
            var textToCopy = this.getAttribute('data-copy');
            navigator.clipboard.writeText(textToCopy)
                .then(() => {
                    showToast("복사 완료: " + textToCopy);
                })
                .catch(err => {
                    console.error("복사 실패:", err);
                    showToast("복사 실패! 😢");
                });
        });
    });

    // ✅ 토스트 메시지 함수
    function showToast(message) {
        var toast = document.createElement("div");
        toast.className = "custom-toast";
        toast.innerText = message;
        document.body.appendChild(toast);

        setTimeout(() => {
            toast.classList.add("show");
        }, 100);

        setTimeout(() => {
            toast.classList.remove("show");
            setTimeout(() => toast.remove(), 1000);
        }, 4000);
    }

    // ✅ 인원 선택 기능
    document.querySelectorAll('.booking-item button').forEach(button => {
        button.addEventListener('click', function() {
            let countElement = this.parentElement.querySelector('.count');
            let count = parseInt(countElement.innerText);
            let type = this.parentElement.getAttribute('data-type');

            if (this.classList.contains('plus')) {
                count++;
            } else if (this.classList.contains('minus')) {
                if (type === "adult" && count === 1) return; // ✅ 성인은 최소 1명 제한
                if (count > 0) count--;
            }

            countElement.innerText = count;
            updateTotalPrice(); // ✅ 총 금액 업데이트
        });
    });



	function updateTotalPrice() {

	    let adultElement = document.querySelector('[data-type="adult"] .count');
	    let childElement = document.querySelector('[data-type="child"] .count');
	    let infantElement = document.querySelector('[data-type="infant"] .count');
	
	    let adultCount = adultElement ? parseInt(adultElement.innerText) : 1;
	    let childCount = childElement ? parseInt(childElement.innerText) : 0;
	    let infantCount = infantElement ? parseInt(infantElement.innerText) : 0;
	
	    let total = (adultCount * ADULT_PRICE) + (childCount * CHILD_PRICE) + (infantCount * INFANT_PRICE);
	    let totalPriceElement = document.querySelector('.total-price');
	
	    if (totalPriceElement) {
	        totalPriceElement.innerText = `총 금액: ${total.toLocaleString()}円`;
	    }
	}

    // ✅ 성인의 기본값을 1로 설정하고 총 금액 업데이트
    let adultElement = document.querySelector('[data-type="adult"] .count');
    if (adultElement) {
        adultElement.innerText = "1";
    }
    updateTotalPrice();

    // ✅ 출발일 변경 기능
    var modal = document.getElementById('date-picker-modal');
    var btn = document.getElementById('change-date-btn');
    var closeBtn = document.querySelector('.date-picker-close');
    var confirmDateBtn = document.getElementById('confirm-date-btn');
    var currentMonth = document.getElementById('current-month');
    var prevMonthBtn = document.getElementById('prev-month');
    var nextMonthBtn = document.getElementById('next-month');
    var calendarContainer = document.getElementById('calendar');

    let selectedDate = null;
    let currentYear = 2025;
    let currentMonthIndex = 4;

    if (btn && modal) {
        btn.onclick = function() {
            modal.style.display = "block";
            generateCalendar(currentYear, currentMonthIndex);
        };

        closeBtn.onclick = function() {
            modal.style.display = "none";
        };

        window.onclick = function(event) {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        };
    }

    function generateCalendar(year, month) {
        calendarContainer.innerHTML = '';
        currentMonth.innerText = `${year}.${String(month + 1).padStart(2, '0')}`;

        const daysOfWeek = ['일', '월', '화', '수', '목', '금', '토'];
        daysOfWeek.forEach(day => {
            let dayElement = document.createElement('div');
            dayElement.innerText = day;
            calendarContainer.appendChild(dayElement);
        });

        for (let day = 1; day <= 31; day++) {
            let dayElement = document.createElement('div');
            dayElement.classList.add('calendar-day');
            dayElement.innerText = day;
            dayElement.addEventListener('click', function() {
                document.querySelectorAll('.calendar-day').forEach(d => d.classList.remove('selected'));
                this.classList.add('selected');
                selectedDate = new Date(year, month, day);
                confirmDateBtn.disabled = false;
            });

            calendarContainer.appendChild(dayElement);
        }
    }

    function getDayOfWeek(date) {
        const days = ["일", "월", "화", "수", "목", "금", "토"];
        return days[date.getDay()];
    }

    confirmDateBtn.addEventListener('click', function() {
        if (selectedDate) {
            let departureDay = getDayOfWeek(selectedDate);
            let departureDateStr = `${selectedDate.getFullYear()}.${String(selectedDate.getMonth() + 1).padStart(2, '0')}.${String(selectedDate.getDate()).padStart(2, '0')} (${departureDay})`;
            document.getElementById('departure-date').innerText = departureDateStr;

            let arrivalDate = new Date(selectedDate);
            arrivalDate.setDate(arrivalDate.getDate() + 2);
            let arrivalDay = getDayOfWeek(arrivalDate);
            let arrivalDateStr = `${arrivalDate.getFullYear()}.${String(arrivalDate.getMonth() + 1).padStart(2, '0')}.${String(arrivalDate.getDate()).padStart(2, '0')} (${arrivalDay})`;
            document.getElementById('arrival-date').innerText = arrivalDateStr;

            modal.style.display = "none";
        }
    });

    generateCalendar(currentYear, currentMonthIndex);
});
