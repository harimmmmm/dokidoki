package account.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject; // json-simple 라이브러리 사용

import travelService.Command;

public class SendVerificationEmailService implements Command {

	@SuppressWarnings("unchecked") // 컴파일러 경고를 무시
	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 클라이언트에서 보낸 이메일 주소 받기
		String recipientEmail = request.getParameter("email");
		JSONObject jsonResponse = new JSONObject();

		if (recipientEmail == null || recipientEmail.isEmpty()) {
			jsonResponse.put("success", false);
			jsonResponse.put("message", "이메일을 입력해주세요.");
		} else {
			// 이메일 인증 메소드 호출
			String result = SendMail.sendVerificationEmail(recipientEmail, request);

			// 이메일 전송 결과에 따른 응답 처리
			if (result.equals("success")) {
				jsonResponse.put("success", true);
				jsonResponse.put("message", "인증번호가 이메일로 발송되었습니다.");
			} else {
				jsonResponse.put("success", false);
				jsonResponse.put("message", "이메일 전송 실패: " + result);
			}
		}

		// JSON 형식으로 응답 보내기
		response.setContentType("application/json; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(jsonResponse.toString());
		out.flush();
	}
}