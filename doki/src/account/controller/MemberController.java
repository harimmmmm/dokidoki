package account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/login/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberController() {
		super();
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getPathInfo();
		System.out.println("Action: " + action);
		String page = null;

		switch (action) {
		case "/signin.do":	// 로그인
			page = "/account/signin.jsp";
			break;
		case "/signup.do":	// 회원가입
			page = "/account/signup.jsp";
			break;
		case "/idfind.do":	// 아이디 찾기
			page = "/account/idfind.jsp";
			break;
		case "/pwfind.do":	// 비번 찾기
			page = "/account/pwfind.jsp";
			break;
		}
		if (page != null)
			request.getRequestDispatcher(page).forward(request, response);
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}
}
