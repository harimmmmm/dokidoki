// 문의하기 모달 열기
const openInquiryModalBtn = document.getElementById("open-inquiry-modal");
const inquiryModal = document.getElementById("inquiry-modal"); 
const closeInquiryModalBtn = document.getElementById("close-inquiry-modal"); 

// 문의하기 모달 열기
openInquiryModalBtn.addEventListener("click", () => {
    inquiryModal.style.display = "block";
});

// 문의하기 모달 닫기
closeInquiryModalBtn.addEventListener("click", () => {
    inquiryModal.style.display = "none";
});

// 모달 외부 클릭 시 닫기
window.addEventListener("click", (event) => {
    if (event.target === inquiryModal) {
        inquiryModal.style.display = "none";
    }
});

// 상세보기
document.querySelectorAll(".showBoardDetailBtn").forEach(button => {
    button.addEventListener("click", function () {
        const bno = this.getAttribute("data-bno"); 
        showBoardDetail(bno);
    });
});

function showBoardDetail(bno) {
    console.log("조회할 bno:", bno);
    const boardList = window.boardListJson; // JSP에서 전달된 boardListJson 사용
    const boardDetail = boardList.find(board => board.bno === Number(bno)); // 해당 bno에 맞는 게시글 찾기

    if (boardDetail) {
        let content = `
            <h3>문의 제목: ${boardDetail.title}</h3>
            <p><strong>작성일:</strong> ${boardDetail.created_date}</p>
            <p><strong>문의 내용:</strong> ${boardDetail.content}</p>
        `;

        // 답변 상태 출력
        if (boardDetail.comments && boardDetail.comments.length > 0) {
            const comment = boardDetail.comments[0]; // 첫 번째 댓글만 표시
            content += `
                <hr>
                <p><strong>답변 날짜:</strong> ${comment.comment_date}</p>
                <p><strong>답변 내용:</strong> ${comment.comment_content}</p>
            `;
        } else {
            content += "<p class='waiting-status'>* 아직 답변이 등록되지 않았습니다. 잠시만 기다려 주세요.</p>";
        }

        const boardDetailContent = document.getElementById("board-detail-content");
        if (boardDetailContent) {
            boardDetailContent.innerHTML = content;
        } else {
            console.error('ID가 "board-detail-content"인 요소를 찾을 수 없습니다!');
        }

        // 모달 띄우기
        document.getElementById("detail-modal").style.display = "block";
    }
}

// 모달 닫기
document.getElementById("close-detail-modal").addEventListener("click", () => {
    document.getElementById("detail-modal").style.display = "none";
});
