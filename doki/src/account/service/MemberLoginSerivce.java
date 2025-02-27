package account.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import account.dao.LoginDao;
import travelService.Command;
import util.PasswordUtil;
import vo.AccountVo;

public class MemberLoginSerivce implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; charset=UTF-8");

		String userid = request.getParameter("user_id");
		String password = request.getParameter("user_password");

		AccountVo vo = new LoginDao().searchIdPw(userid);
		
		System.out.println("아이디 ->>" + userid);
		System.out.println("비밀번호 ->>" + password);

		if (vo != null && PasswordUtil.checkPassword(password, vo.getUser_password())) {
			HttpSession session = request.getSession();
			session.setAttribute("user", vo);

			System.out.println("로그인 성공 - 세션에 저장됨: " + vo.getUser_id());
			System.out.println("세션에 user 저장됨: " + vo.getName());
			System.out.println("세션 ID: " + session.getId());

			response.sendRedirect("/doki");
		} else {
			request.setAttribute("loginError", "아이디 또는 비밀번호가 잘못되었습니다.");
			request.getRequestDispatcher("/account/login.jsp").forward(request, response);
		}

	}
}
