package account.service;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import account.dao.LoginDao;
import travelService.Command;
import util.PasswordUtil;
import vo.AccountVo;

public class PwResultService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String userId = request.getParameter("user_id");
		String userName = request.getParameter("name_kanji");
		String email = request.getParameter("email");

		LoginDao dao = new LoginDao();
		AccountVo vo = dao.getUserByToken(userId, userName);

		if (vo != null) {
			String temporaryPassword = generateTemporaryPassword();
			String hashedPassword = BCrypt.hashpw(temporaryPassword, BCrypt.gensalt());
			dao.updatePassword(hashedPassword, userId);
			try {
				sendEmail(email, temporaryPassword);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			response.setContentType("text/html; charset=utf-8");
			response.getWriter()
					.write("<script type='text/javascript'>" + "alert('仮パスワードがメールで送信されました。');"
							+ "window.location.href = '/member/login.do';" 
							+ "</script>");
		} else {
			response.setContentType("text/html; charset=utf-8");
			response.getWriter()
					.write("<script type='text/javascript'>" + "alert('IDまたは名前が一致しません。');"
							+ "window.location.href = '/member/pwfind.do';" 
							+ "</script>");
		}
	}

	// 임시 비밀번호 생성
	private String generateTemporaryPassword() {
		String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		Random random = new Random();
		StringBuilder tempPassword = new StringBuilder();

		for (int i = 0; i < 8; i++) {
			int index = random.nextInt(characters.length());
			tempPassword.append(characters.charAt(index));
		}

		return tempPassword.toString();
	}

	// 이메일 발송
	private void sendEmail(String recipientEmail, String temporaryPassword) throws MessagingException {
		final String senderEmail = "awdzs8251@gmail.com"; // 발신자 이메일
		final String senderPassword = "cwue rszw gakj stpp"; // 발신자 이메일 비밀번호

		Properties properties = System.getProperties();
		properties.put("mail.smtp.host", "smtp.gmail.com"); // Gmail SMTP 서버
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.ssl.protocols", "TLSv1.2"); // TLS 1.2 강제 설정
		properties.put("mail.smtp.ssl.trust", "smtp.gmail.com"); // SSL 인증 문제 방지

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(senderEmail, senderPassword);
			}
		});

		String subject = "【どきどきKorea】仮パスワード発行";
		String content = "<div style='font-family: Arial, sans-serif; padding: 20px; border: 1px solid #ddd; border-radius: 10px;'>"
				+ "<h2>どきどきKorea 仮パスワード発行</h2>" + "<p>パスワード探しを要請されて新しいパスワードを発行させていただきました。</p>"
				+ "<p>以下の仮パスワードを使用してログインした後、必ず新しいパスワードに変更してください。</p>"
				+ "<div style='background-color: #f8f8f8; padding: 10px; text-align: center; font-size: 18px; font-weight: bold; border-radius: 5px;'>"
				+ "<span style='color: #E74C3C; font-size: 22px;'>" + temporaryPassword + "</span>" + "</div>" + "<hr>"
				+ "<p style='font-size: 12px; color: #777;'>* セキュリティのため、ログイン後すぐに新しいパスワードに変更してください。</p>"
				+ "<p style='font-size: 12px; color: #777;'>* もしパスワードのリセットをリクエストされていない場合は、カスタマーサポートにお問い合わせください。</p>"
				+ "<p style='font-size: 12px; color: #777;'>ありがとうございます。<br>[どきどきKorea] 運営チーム </p>" + "</div>";

		MimeMessage message = new MimeMessage(session);
		message.setFrom(new InternetAddress(senderEmail));
		message.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
		message.setSubject(subject);
		message.setContent(content, "text/html; charset=utf-8");

		Transport.send(message);
	}

}
