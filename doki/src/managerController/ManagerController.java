package managerController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import managerService.NoticeInsert;
import managerService.NoticeView;
import packageService.PackageAdd;

@WebServlet("/manager/*")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ManagerController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ManagerController() {
		super();
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getPathInfo();
		System.out.println("action = " + action);

		String page = null;

		switch (action) {
		case "/user.do":
			page = "/managerpage/user.jsp";
			break;
		case "/product_list.do":
			page = "/managerpage/product-list.jsp";
			break;
		case "/product_add.do":
			page = "/managerpage/product-add.jsp";
			break;
		case "/product_addpro.do":
			new PackageAdd().docommand(request, response);
			response.sendRedirect("/manager/product_list.do");
			return; // 아래 부분 실행 암함
		case "/reservation.do":
			page = "/managerpage/reservation.jsp";
			break;
		case "/payment.do":
			page = "/managerpage/payment.jsp";
			break;
		case "/notice_list.do": // 공지 리스트
			new NoticeView().docommand(request, response);
			page = "/managerpage/notice-list.jsp";
			break;
		case "/notice_add.do": // 공지등록 페이지
			page = "/managerpage/notice-add.jsp";
			break;
		case "/notice_addpro.do": // 공지 등록기능
			new NoticeInsert().docommand(request, response);
			response.sendRedirect("/manager/notice_list.do");
			return;
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
