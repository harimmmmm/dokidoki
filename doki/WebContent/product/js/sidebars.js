// 선택된 필터 값을 저장하는 객체
let selectedFilters = {
  travelPeriod: [], // 여행 기간 필터
  travelConcept: [], // 여행컨셉 필터
  departureTime: [], // 출발 시간 필터
  airline: [],		// 항공사 필터
  seatClass: [],	// 항공 좌석 등급 필터
  shopping: [],       // 쇼핑 필터
  optionalTour: [],   // 선택관광 필터
  freeSchedule: [],   // 자유일정 필터
  localExpense: [],   // 현지 필수 경비 필터
  localGuide: [],     // 현지 가이드 필터
  meal: []           // 식사료 필터
};

// 버튼 클릭 시 선택된 값 저장
const buttons = document.querySelectorAll('.filter-btn');

buttons.forEach(button => {
  button.addEventListener('click', (e) => {
    const filterType =
      button.classList.contains('travel-period-btn') ? 'travelPeriod' :		// 여행 기간 필터
      button.classList.contains('travel-concept-btn') ? 'travelConcept' :	// 여행컨셉 필터
      button.classList.contains('departure-time-btn') ? 'departureTime' :	// 출발 시간 필터
      button.classList.contains('airline-btn') ? 'airline' :				 // 항공사 필터
      button.classList.contains('seat-class-btn') ? 'seatClass' :			// 항공 좌석 등급 필터
      button.classList.contains('shopping-btn') ? 'shopping' :				// 쇼핑 필터
      button.classList.contains('optional-tour-btn') ? 'optionalTour' :		// 선택관광 필터
      button.classList.contains('free-schedule-btn') ? 'freeSchedule' :		// 자유일정 필터
      button.classList.contains('local-expense-btn') ? 'localExpense' :		// 현지 필수 경비 필터
      button.classList.contains('local-guide-btn') ? 'localGuide' :			// 현지 가이드 필터
      button.classList.contains('meal-btn') ? 'meal' :						 // 식사료 필터
      null;

    if (!filterType) return;

    const value = button.dataset.value;

    // 선택된 버튼에 'selected' 클래스 추가/제거
    button.classList.toggle('selected');

    // 선택된 값 업데이트
    if (selectedFilters[filterType].includes(value)) {
      selectedFilters[filterType] = selectedFilters[filterType].filter(val => val !== value);
    } else {
      selectedFilters[filterType].push(value);
    }

    // 선택된 값 출력 (콘솔 로그)
    console.log('현재 선택된 필터:', selectedFilters);
  });
});

// 초기화 버튼 클릭 시 모든 필터 초기화
function resetFilters() {
  selectedFilters = {
    travelPeriod: [],
    travelConcept: [],
    departureTime: [],
    airline: [],
    seatClass: [],
    shopping: [],
    optionalTour: [],
    freeSchedule: [],
    localExpense: [],
    localGuide: [],
    meal: []
  };

  // 모든 버튼에서 'selected' 클래스 제거
  document.querySelectorAll('.filter-btn').forEach(button => {
    button.classList.remove('selected');
  });

  console.log('필터 초기화됨');
}

