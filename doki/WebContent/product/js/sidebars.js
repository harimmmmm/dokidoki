// 버튼 클릭 시 선택된 값 저장
const buttons = document.querySelectorAll('.filter-button');

buttons.forEach(button => {
  button.addEventListener('click', () => {
    // 선택된 버튼에 'selected' 클래스 추가
    button.classList.toggle('selected');
    
    // 선택된 값 가져오기
    const selectedValues = [];
    buttons.forEach(button => {
      if (button.classList.contains('selected')) {
        selectedValues.push(button.dataset.value);
      }
    });
    
    // 선택된 값 확인 (여기서는 콘솔에 출력)
    console.log('선택된 값:', selectedValues);
    
    // SQL 쿼리에 전달하는 코드 작성 가능
    // 예: sendToSQL(selectedValues);
  });
});
