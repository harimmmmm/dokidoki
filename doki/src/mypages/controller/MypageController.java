package mypages.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mypage/*")
public class MypageController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MypageController() {
		super();
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getPathInfo();
		System.out.println("Action: " + action);
		String page = null;

		switch (action) {
		case "/home.do":	// 마이페이지 홈
			page = "/mypagee/home.jsp";
			break;
		case "/editform.do":	// 개인정보수정
			page = "/mypagee/editForm.jsp";
			break;
		case "/upcoming.do":	// 예정된여행
			page = "/mypagee/upcoming.jsp";
			break;
		case "/past.do":	// 지난여행
			page = "/mypagee/past.jsp";
			break;
		case "/canceled.do":	// 취소여행
			page = "/mypagee/canceled.jsp";
			break;
		case "/interest.do":	// 관심
			page = "/mypagee/interest.jsp";
			break;
		case "/inquiries.do":	// 문의
			page = "/mypagee/inquiries.jsp";
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
