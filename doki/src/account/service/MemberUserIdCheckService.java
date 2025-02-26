package account.service;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.dao.SignDao;
import travelService.Command;

public class MemberUserIdCheckService implements Command {

	@Override
	public void docommand(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String userid = request.getParameter("userid");

		int result = new SignDao().memberFindUserid(userid);

		PrintWriter out = response.getWriter();
		if (result > 0) {
			out.write("fail"); // 중복된 아이디
		} else {
			out.write("success"); // 사용 가능한 아이디
		}
		out.flush();
	}

}
