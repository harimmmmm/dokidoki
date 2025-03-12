package mypages.serivce;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;

import mypages.dao.MyPageDao;
import travelService.Command;
import vo.AccountVo;

public class PasswordUpdateSerivce implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		AccountVo user = (AccountVo) session.getAttribute("user");

		if (user == null) {
			request.getRequestDispatcher("/account/login.jsp").forward(request, response);
			return;
		}
		String currentPassword = request.getParameter("user_password");
		String newPassword = request.getParameter("newPassword");
		String confirmPassword = request.getParameter("confirmPassword");

		// 비밀번호 확인
		if (BCrypt.checkpw(currentPassword, user.getUser_password())) {
			if (newPassword != null && newPassword.equals(confirmPassword)) {
				if (isValidPassword(newPassword)) {
					String hashedPassword = BCrypt.hashpw(newPassword, BCrypt.gensalt());

					MyPageDao dao = new MyPageDao();
					dao.passwordUpdate(user.getUser_id(), hashedPassword);

					// 세션에 성공 메시지 저장
					session.setAttribute("msg", "パスワードが正常に変更されました。");
					response.sendRedirect("/mypage/passwordEdit.do");
					return;
				} else {
					request.setAttribute("msg", "비밀번호는 10~16자, 영문, 숫자 및 특수문자(@, ., #, -, _, !)를 포함해야 합니다.");
				}
			} else {
				request.setAttribute("msg", "새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
			}
		} else {
			request.setAttribute("msg", "현재 비밀번호가 잘못되었습니다.");
		}

		request.getRequestDispatcher("/mypage/passwordEditForm.jsp").forward(request, response);
	}

	// 비밀번호 유효성 검사
	private boolean isValidPassword(String password) {
		String passwordRegex = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[!@#._\\-]).{10,16}$";
		return password.matches(passwordRegex);
	}
}
