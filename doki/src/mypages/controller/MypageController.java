package mypages.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypages.serivce.AccountListService;
import mypages.serivce.AccountUpdateService;
import mypages.serivce.ComingService;
import mypages.serivce.InquiriesInsertService;
import mypages.serivce.InquiriesListService;
import mypages.serivce.PastService;
import mypages.serivce.Reviewservice;
import mypages.serivce.WishlistService;
import packageService.WishlistAdd;
import packageService.WishlistList;
import packageService.WishlistRemove;

@WebServlet("/mypage/*")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
maxFileSize = 1024 * 1024 * 10, // 10MB
maxRequestSize = 1024 * 1024 * 50 // 50MB
)
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
		case "/home.do": // 마이페이지 홈
			new AccountListService().docommand(request, response);
			new ComingService().docommand(request, response);
			page = "/mypagee/home.jsp";
			break;
		case "/editform.do": // 개인정보수정
			new AccountListService().docommand(request, response);
			page = "/mypagee/editFormReadonly.jsp";
			break;
		case "/editformUpdate.do": // 개인정보수정
			new AccountListService().docommand(request, response);
			page = "/mypagee/editForm.jsp";
			break;
		case "/editformUpdatepro.do": // 개인정보수정 수정
			new AccountUpdateService().docommand(request, response);
			response.sendRedirect("/mypage/editform.do");
			return;
		case "/upcoming.do": // 예정된여행
			new ComingService().docommand(request, response);
			page = "/mypagee/upcoming.jsp";
			break;
		case "/past.do": // 지난여행
			new PastService().docommand(request, response);
			page = "/mypagee/past.jsp";
			break;
		case "/reviewpro.do": // 리뷰
			new Reviewservice().docommand(request, response);
			page = "/mypagee/past.jsp";
			break;
		case "/interest.do": // 관심상품
			new WishlistService().docommand(request, response);
			page = "/mypagee/interest.jsp";
			break;
        case "/wishlist/add.do":	// 관심 추가
            new WishlistAdd().docommand(request, response);
            return;
        case "/wishlist/remove.do":	// 관심 제거
            new WishlistRemove().docommand(request, response);
            return;
        case "/wishlist/list.do":	// 관심상품 리스트 조회
            new WishlistList().docommand(request, response);
            return;
		case "/inquiries.do": // 문의
			new InquiriesListService().docommand(request, response);
			page = "/mypagee/inquiries.jsp";
			break;
		case "/inquiriespro.do": // 문의등록
			new InquiriesInsertService().docommand(request, response);
			response.sendRedirect("");
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
