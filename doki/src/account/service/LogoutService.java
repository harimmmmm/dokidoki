package account.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import travelService.Command;

public class LogoutService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession(false);
		// 기존 세션이 있으면 가져오고(user), 없으면 null 반환
		// 세션을 생성하지 않고 기존 세션만 가져온다
		if (session != null) {
			session.invalidate(); // 세션 삭제
		}

	}

}
