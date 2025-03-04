document.querySelector('.reserve-btn').addEventListener('click', function(){
	if(!IS_LOGGED_IN) {
        alert("로그인 후 예약이 가능합니다.");
        window.location.href = CONTEXT_PATH + "/member/login.do"; // 로그인 페이지 경로
        return;
    }

    let adultCount = parseInt(document.querySelector('[data-type="adult"] .count').innerText);
    let childCount = parseInt(document.querySelector('[data-type="child"] .count').innerText);
    let infantCount = parseInt(document.querySelector('[data-type="infant"] .count').innerText);

    let adultPrice = ADULT_PRICE;
    let childPrice = CHILD_PRICE;
    let infantPrice = INFANT_PRICE;

    let packageId = PACKAGE_ID;

    // 팝업창 크기 설정
    const popupWidth = 600;
    const popupHeight = 700;
    const popupLeft = (window.screen.width - popupWidth) / 2;
    const popupTop = (window.screen.height - popupHeight) / 2;

    // 결제 팝업창 열기
    let paymentPopup = window.open('', 'PayPalPopup', `width=${popupWidth},height=${popupHeight},left=${popupLeft},top=${popupTop}`);

    // 팝업창에서 AJAX 요청을 처리하는 페이지 호출 (createPayment)
    fetch(CONTEXT_PATH + '/pakage/createPayment.do', {
        method: 'POST',
        headers: {'Content-Type':'application/x-www-form-urlencoded'},
        body: `adult=${adultCount}&child=${childCount}&infant=${infantCount}&adultPrice=${adultPrice}&childPrice=${childPrice}&infantPrice=${infantPrice}&package_id=${packageId}`
    })
    .then(res => {
	    if (!res.ok) {
	        throw new Error("서버에서 처리 중 오류가 발생했습니다.");
	    }
	    return res.json();
	})
    .then(data => {
        if(data.approvalLink){
            paymentPopup.location.href = data.approvalLink;
        } else {
            paymentPopup.close();
            alert("결제 링크 생성 실패");
        }
    })
    .catch(err => {
        paymentPopup.close();
		alert("오류가 발생했습니다: " + err.message);
    });
});
