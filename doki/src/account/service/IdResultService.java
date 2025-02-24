package account.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.dao.LoginDao;
import travelService.Command;
import vo.AccountVo;

public class IdResultService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String name = request.getParameter("name"); // 이름
		String email = request.getParameter("email"); // 이메일 또는 전화번호

		AccountVo vo = new LoginDao().idResult(name, email);
		if (vo != null) {
	        request.setAttribute("userId", vo);
	    } else {
	        request.setAttribute("error", "입력하신 정보에 해당하는 아이디가 없습니다.");
	    }
	}

}
