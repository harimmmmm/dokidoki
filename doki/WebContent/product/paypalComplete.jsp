<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script>
        // 원본(부모) 페이지에 결제 성공 메시지 전달
        window.opener.postMessage("payment_success", "*");
        
        // 결제 완료 후 팝업 닫기
        window.close();
    </script>
</head>
<body>
    결제가 완료되었습니다. 창이 자동으로 닫힙니다.
</body>
</html>