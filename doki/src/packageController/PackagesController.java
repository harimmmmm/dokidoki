package packageController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import packageService.PackageSearchAll;
import packageService.PackagesList;
import packageService.PayPalCreatePayment;
import packageService.PayPalExecutePayment;
import packageService.SelectPackage;
import packageService.WishlistAdd;
import packageService.WishlistList;
import packageService.WishlistRemove;

@WebServlet("/pakage/*")
public class PackagesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PackagesController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getPathInfo();
		System.out.println("Action: " + action);
		String page = null;
		
		
		switch (action) {
		case "/packagesList.do": // 전체리스트
			new PackagesList().docommand(request, response);
			page ="/product/packagesList.jsp";
			break;
		case "/packageSelect.do": // 검색결과
			new PackageSearchAll().docommand(request, response);
			page ="/product/packageSelect.jsp";
			break;
		case "/packages.do": // 상세리스트
			new SelectPackage().docommand(request, response);
			page ="/product/packages.jsp";
			break;
		case "/createPayment.do":
		    new PayPalCreatePayment().docommand(request, response);
		    return; // AJAX 요청이므로 forward 필요 없음 (즉시 응답)
		    
		case "/executePayment.do":
		    new PayPalExecutePayment().docommand(request, response);
		    
		    // 결제 성공 후 간단히 메시지만 보여줄 JSP로 forward
		    RequestDispatcher rd = request.getRequestDispatcher("/product/paypalComplete.jsp");
		    rd.forward(request, response);
		    break;

		case "/cancel.do":
		    page = "/product/cancel.jsp";
		    break;
		    
		 // 관심 추가
        case "/wishlist/add.do":
            new WishlistAdd().docommand(request, response);
            return;

        // 관심 제거
        case "/wishlist/remove.do":
            new WishlistRemove().docommand(request, response);
            return;

        // 관심상품 리스트 조회
        case "/wishlist/list.do":
            new WishlistList().docommand(request, response);
            return;


		}
		
		if (page != null) {
			RequestDispatcher rd = request.getRequestDispatcher(page);
			rd.forward(request, response);
		}
	}

}
