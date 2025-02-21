let selectedFilters = {
    travelPeriod: [],
    travelConcept: []
  };

  // 버튼 클릭 시 선택된 값 저장
  const filterButtons = document.querySelectorAll('.filter-btn');

  filterButtons.forEach(button => {
    button.addEventListener('click', () => {
      const filterType = button.classList.contains('travel-period-btn') ? 'travelPeriod' : 'travelConcept';
      const value = button.dataset.value;

      // 선택된 값 토글 (클릭 시 selected 클래스 추가/제거)
      button.classList.toggle('selected');

      // 필터 값 저장
      if (selectedFilters[filterType].includes(value)) {
        selectedFilters[filterType] = selectedFilters[filterType].filter(val => val !== value);
      } else {
        selectedFilters[filterType].push(value);
      }

      // 선택된 값 출력 (콘솔에 출력)
      console.log('현재 선택된 필터:', selectedFilters);

      // SQL 쿼리에 전달하는 코드 작성 가능
      // 예: sendToSQL(selectedFilters);
    });
  });

  // 초기화 버튼 클릭 시
  function resetFilters() {
    selectedFilters = {
      travelPeriod: [],
      travelConcept: []
    };

    // 모든 버튼에서 'selected' 클래스 제거
    document.querySelectorAll('.filter-btn').forEach(button => {
      button.classList.remove('selected');
    });

    // 필터 초기화 출력
    console.log('필터 초기화됨');
  }