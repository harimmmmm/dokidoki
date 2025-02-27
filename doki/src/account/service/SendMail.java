package account.service;

import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;

@SuppressWarnings("unchecked")
public class SendMail {
    public static String sendVerificationEmail(String recipientEmail, HttpServletRequest request) {
        final String username = "awdzs8251@gmail.com"; // 발신자 이메일
        final String password = "cwue rszw gakj stpp"; // 앱 비밀번호

        // SMTP 서버 설정
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(username, password);
            }
        });

        try {
            // 인증번호 생성
            String verificationCode = generateVerificationCode();

            // 이메일 메시지 작성
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(username));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(recipientEmail));
            message.setSubject("【どきどきKorea】会員登録の認証コード");

            String htmlContent = "<div style='font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd; border-radius: 10px;'>"
                    + "<h2 style='color: #4A90E2;'>どきどきKorea 会員登録 認証番号</h2>"
                    + "<p>こんにちは、<strong>どきどきKorea</strong>をご利用いただきありがとうございます！</p>"
                    + "<p>以下の認証番号を入力し、メール認証を完了してください。</p>"
                    + "<div style='background-color: #f8f8f8; padding: 10px; text-align: center; font-size: 18px; font-weight: bold; border-radius: 5px;'>"
                    + "<span style='color: #E74C3C; font-size: 22px;'>" + verificationCode + "</span>"
                    + "</div>"
                    + "<hr>"
                    + "<p style='font-size: 12px; color: #777;'>このメールは送信専用です。返信できませんのでご了承ください。</p>"
                    + "<p style='font-size: 12px; color: #777;'>お問い合わせは<a href='mailto:http://localhost:8021/doki' style='color: #4A90E2;'>カスタマーサポート</a>までご連絡ください。</p>"
                    + "</div>";


            message.setContent(htmlContent, "text/html; charset=utf-8");

            // 이메일 전송
            Transport.send(message);

            // 세션에 인증번호 저장
            HttpSession session1 = request.getSession();
            session1.setAttribute("verificationCode", verificationCode);

            // 이메일 전송 성공시 success: true 반환
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("success", true); // "success" key는 String 타입, value는 Boolean 타입
            jsonResponse.put("email", recipientEmail); // "email" key는 String 타입, value는 String 타입
            jsonResponse.put("verificationCode", verificationCode);  // "verificationCode" key는 String 타입, value는 String 타입

            return jsonResponse.toString();

        } catch (MessagingException e) {
            e.printStackTrace();

            // 이메일 전송 실패시 error 응답 반환
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("success", false); // 실패 시 success: false
            errorResponse.put("message", "이메일 전송 실패: " + e.getMessage());

            return errorResponse.toString();
        }
    }

    // 6자리 랜덤 인증번호 생성
    private static String generateVerificationCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }
}
