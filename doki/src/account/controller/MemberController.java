package account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import account.service.GoogleCallbackServlet;
import account.service.IdResultService;
import account.service.LogoutService;
import account.service.MemberInsertService;
import account.service.MemberLoginSerivce;
import account.service.MemberUserIdCheckService;
import account.service.PwResultService;
import account.service.SendVerificationEmailService;

@WebServlet("/member/*")
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
		case "/login.do":	// 로그인
			page = "/account/login.jsp";
			break;
		case "/loginpro.do":	// 로그인
			new MemberLoginSerivce().docommand(request, response);
			return;
		case "/callback":	// 구글 로그인
			new GoogleCallbackServlet().docommand(request, response);
			return;
		case "/logout.do":		// 로그아웃
			new LogoutService().docommand(request, response);
			response.sendRedirect("/doki");
			return;
		case "/signup.do":	// 회원가입
			page = "/account/signup.jsp";
			break;
		case "/signupInsertpro.do":	// 회원가입 저장
			new MemberInsertService().docommand(request, response);
			response.sendRedirect("/member/login.do");
			return;
		case "/signupro.do":	// 회원가입 아이디체크
			new MemberUserIdCheckService().docommand(request, response);
			break;
		case "/sendVerificationEmail.do":	// 회원가입 이메일
			new SendVerificationEmailService().docommand(request, response);
			break;
		case "/idfind.do":	// 아이디 찾기
			page = "/account/idfind.jsp";
			break;
		case "/idfindpro.do":	// 아이디 찾기
			new IdResultService().docommand(request, response);
			page = "/account/idfindResult.jsp";
			break;
		case "/pwfind.do":	// 비번 찾기
			page = "/account/pwfind.jsp";
			break;
		case "/pwfindpro.do":	// 비번 찾기
			new PwResultService().docommand(request, response);
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
