package managerController;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/manager/*")
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
			page = "/managerpage/product_list.jsp";
			break;
		case "/product_add.do":
			page = "/managerpage/product_add.jsp";
			break;
		case "/reservation.do":
			page = "/managerpage/reservation.jsp";
			break;
		case "/payment.do":
			page = "/managerpage/payment.jsp";
			break;
		case "/notice_list.do":
			page = "/managerpage/notice_list.jsp";
			break;
		case "/notice_add.do":
			page = "/managerpage/notice_add.jsp";
			break;
		}
		
		if (page != null) {
		    request.getRequestDispatcher(page).forward(request, response);
		}

    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request, response);
	}

}
